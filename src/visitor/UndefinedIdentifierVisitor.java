package visitor;

import exception.*;
import symboltable.*;
import syntaxtree.*;

public class UndefinedIdentifierVisitor extends TraverseVisitor {
	/**
	 * f0 -> Identifier() f1 -> "=" f2 -> Expression() f3 -> ";"
	 */
	public MType visit(AssignmentStatement n, MType argu) {
		MIdentifier id = (MIdentifier) n.f0.accept(this, argu);
		MVar newVar = ((MMethod) argu).getVar(id.getName());
		if (newVar == null)
			Abort.abort(new UndefinedIdentifierException("Variable", id.getName(), id.getRow(), id.getCol()));
		n.f1.accept(this, argu);
		n.f2.accept(this, argu);
		n.f3.accept(this, argu);
		return null;
	}

	/**
	 * f0 -> Identifier() f1 -> "[" f2 -> Expression() f3 -> "]" f4 -> "=" f5 ->
	 * Expression() f6 -> ";"
	 */
	public MType visit(ArrayAssignmentStatement n, MType argu) {
		MIdentifier id = (MIdentifier) n.f0.accept(this, argu);
		MVar newVar = ((MMethod) argu).getVar(id.getName());
		if (newVar == null)
			Abort.abort(new UndefinedIdentifierException("Array", id.getName(), id.getRow(), id.getCol()));
		n.f2.accept(this, argu);
		n.f3.accept(this, argu);
		n.f4.accept(this, argu);
		n.f5.accept(this, argu);
		n.f6.accept(this, argu);
		return null;
	}

	/**
	 * f0 -> PrimaryExpression() f1 -> "." f2 -> Identifier() f3 -> "(" f4 -> (
	 * ExpressionList() )? f5 -> ")"
	 */
	public MType visit(MessageSend n, MType argu) {
		MType newType = n.f0.accept(this, argu);
		String name = null;
		if (newType instanceof MIdentifier) {
			MVar newVar = ((MMethod) argu).getVar(((MIdentifier) newType).getName());
			if (newVar == null)
				Abort.abort(new UndefinedIdentifierException("Variable", ((MIdentifier) newType).getName(),
						newType.getRow(), newType.getCol()));
			name = newVar.getType();
		} else {
			name = newType.getType();
		}
		MClass newClass = allClassList.getClass(name);

		if (newClass == null)
			Abort.abort(new UndefinedIdentifierException("Class", name, newType.getRow(), newType.getCol()));

		n.f1.accept(this, argu);
		MIdentifier id = (MIdentifier) n.f2.accept(this, argu);
		MMethod newMethod = newClass.getMethod(id.getName());
		if (newMethod == null)
			Abort.abort(new UndefinedIdentifierException("Method", id.getName(), id.getRow(), id.getCol()));

		n.f3.accept(this, argu);
		n.f4.accept(this, argu);
		n.f5.accept(this, argu);

		return new MType(newMethod.getReturnType(), newType.getRow(), newType.getCol());
	}

	/**
	 * f0 -> IntegerLiteral() | TrueLiteral() | FalseLiteral() | Identifier() |
	 * ThisExpression() | ArrayAllocationExpression() | AllocationExpression() |
	 * NotExpression() | BracketExpression()
	 */
	public MType visit(PrimaryExpression n, MType argu) {
		MType _ret = n.f0.accept(this, argu);
		if (_ret instanceof MIdentifier) {
			MVar newVar = ((MMethod) argu).getVar(((MIdentifier) _ret).getName());
			if (newVar == null)
				Abort.abort(new UndefinedIdentifierException("Variable", ((MIdentifier) _ret).getName(), _ret.getRow(),
						_ret.getCol()));
			((MIdentifier) _ret).setType(newVar.getType());
		}
		return _ret;
	}

	/**
	 * f0 -> "new" f1 -> Identifier() f2 -> "(" f3 -> ")"
	 */
	public MType visit(AllocationExpression n, MType argu) {
		n.f0.accept(this, argu);

		MIdentifier id = (MIdentifier) n.f1.accept(this, argu);
		if (!allClassList.hasClass(id.getName()))
			Abort.abort(new UndefinedIdentifierException("Class", id.getName(), id.getRow(), id.getCol()));
		
		n.f2.accept(this, argu);
		n.f3.accept(this, argu);
		return new MType(id.getName(), n.f0.beginLine, n.f0.beginColumn);
	}
}
