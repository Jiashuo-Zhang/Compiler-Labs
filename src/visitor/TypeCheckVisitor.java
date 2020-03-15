package visitor;

import java.util.Enumeration;

import exception.*;
import symboltable.*;
import syntaxtree.*;

public class TypeCheckVisitor extends TraverseVisitor {

	private boolean checkType(MType t, String s) {
		if (s == null || t == null)
			return false;
		if (s.equals("int") || s.equals("int[]") || s.equals("boolean"))
			return s.equals(t.getType());
		MClass newClass = allClassList.getClass(t.getType());
		while (newClass != null) {
			if (s.equals(newClass.getName()))
				return true;
			newClass = newClass.getParentClass();
		}
		return false;
	}

	/**
	 * f0 -> "public" f1 -> Type() f2 -> Identifier() f3 -> "(" f4 -> (
	 * FormalParameterList() )? f5 -> ")" f6 -> "{" f7 -> ( VarDeclaration() )* f8
	 * -> ( Statement() )* f9 -> "return" f10 -> Expression() f11 -> ";" f12 -> "}"
	 */
	public MType visit(MethodDeclaration n, MType argu) {
		n.f0.accept(this, argu);
		MType type = n.f1.accept(this, argu);

		MIdentifier id = (MIdentifier) n.f2.accept(this, argu);
		MMethod newMethod = ((MClass) argu).getMethod(id.getName());

		n.f3.accept(this, newMethod);
		n.f4.accept(this, newMethod);
		n.f5.accept(this, newMethod);
		n.f6.accept(this, newMethod);
		n.f7.accept(this, newMethod);
		n.f8.accept(this, newMethod);
		n.f9.accept(this, newMethod);

		MType exp = n.f10.accept(this, newMethod);
		if (!checkType(exp, type.getType()))
			Abort.abort(new MismatchException(type.getType(), exp.getType(), exp.getRow(), exp.getCol()));

		n.f11.accept(this, newMethod);
		n.f12.accept(this, newMethod);
		return null;
	}

	/**
	 * f0 -> Identifier() f1 -> "=" f2 -> Expression() f3 -> ";"
	 */
	public MType visit(AssignmentStatement n, MType argu) {
		MIdentifier id = (MIdentifier) n.f0.accept(this, argu);
		MVar newVar = ((MMethod) argu).getVar(id.getName());

		n.f1.accept(this, argu);

		MType exp = n.f2.accept(this, argu);
		if (!checkType(exp, newVar.getType()))
			Abort.abort(new MismatchException(newVar.getType(), exp.getType(), exp.getRow(), exp.getCol()));

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
		if (!checkType(newVar, "int[]"))
			Abort.abort(new MismatchException("int[]", newVar.getType(), newVar.getRow(), newVar.getCol()));

		n.f1.accept(this, argu);

		MType exp1 = n.f2.accept(this, argu);
		if (!checkType(exp1, "int"))
			Abort.abort(new MismatchException("int", exp1.getType(), exp1.getRow(), exp1.getCol()));

		n.f3.accept(this, argu);
		n.f4.accept(this, argu);

		MType exp2 = n.f5.accept(this, argu);
		if (!checkType(exp2, "int"))
			Abort.abort(new MismatchException("int", exp2.getType(), exp2.getRow(), exp2.getCol()));

		n.f6.accept(this, argu);
		return null;
	}

	/**
	 * f0 -> "if" f1 -> "(" f2 -> Expression() f3 -> ")" f4 -> Statement() f5 ->
	 * "else" f6 -> Statement()
	 */
	public MType visit(IfStatement n, MType argu) {
		n.f0.accept(this, argu);
		n.f1.accept(this, argu);

		MType exp = n.f2.accept(this, argu);
		if (!checkType(exp, "boolean"))
			Abort.abort(new MismatchException("boolean", exp.getType(), exp.getRow(), exp.getCol()));

		n.f3.accept(this, argu);
		n.f4.accept(this, argu);
		n.f5.accept(this, argu);
		n.f6.accept(this, argu);
		return null;
	}

	/**
	 * f0 -> "while" f1 -> "(" f2 -> Expression() f3 -> ")" f4 -> Statement()
	 */
	public MType visit(WhileStatement n, MType argu) {
		n.f0.accept(this, argu);
		n.f1.accept(this, argu);

		MType exp = n.f2.accept(this, argu);
		if (!checkType(exp, "boolean"))
			Abort.abort(new MismatchException("boolean", exp.getType(), exp.getRow(), exp.getCol()));

		n.f3.accept(this, argu);
		n.f4.accept(this, argu);
		return null;
	}

	/**
	 * f0 -> "System.out.println" f1 -> "(" f2 -> Expression() f3 -> ")" f4 -> ";"
	 */
	public MType visit(PrintStatement n, MType argu) {
		n.f0.accept(this, argu);
		n.f1.accept(this, argu);

		MType exp = n.f2.accept(this, argu);
		if (!checkType(exp, "int"))
			Abort.abort(new MismatchException("int", exp.getType(), exp.getRow(), exp.getCol()));

		n.f3.accept(this, argu);
		n.f4.accept(this, argu);
		return null;
	}

	/**
	 * f0 -> PrimaryExpression() f1 -> "&&" f2 -> PrimaryExpression()
	 */
	public MType visit(AndExpression n, MType argu) {
		MType exp1 = n.f0.accept(this, argu);
		if (!checkType(exp1, "boolean"))
			Abort.abort(new MismatchException("boolean", exp1.getType(), exp1.getRow(), exp1.getCol()));

		n.f1.accept(this, argu);

		MType exp2 = n.f2.accept(this, argu);
		if (!checkType(exp2, "boolean"))
			Abort.abort(new MismatchException("boolean", exp2.getType(), exp2.getRow(), exp2.getCol()));

		return new MType("boolean", exp1.getRow(), exp1.getCol());
	}

	/**
	 * f0 -> PrimaryExpression() f1 -> "<" f2 -> PrimaryExpression()
	 */
	public MType visit(CompareExpression n, MType argu) {
		MType exp1 = n.f0.accept(this, argu);
		if (!checkType(exp1, "int"))
			Abort.abort(new MismatchException("int", exp1.getType(), exp1.getRow(), exp1.getCol()));

		n.f1.accept(this, argu);

		MType exp2 = n.f2.accept(this, argu);
		if (!checkType(exp2, "int"))
			Abort.abort(new MismatchException("int", exp2.getType(), exp2.getRow(), exp2.getCol()));

		return new MType("boolean", exp1.getRow(), exp1.getCol());
	}

	/**
	 * f0 -> PrimaryExpression() f1 -> "+" f2 -> PrimaryExpression()
	 */
	public MType visit(PlusExpression n, MType argu) {
		MType exp1 = n.f0.accept(this, argu);
		if (!checkType(exp1, "int"))
			Abort.abort(new MismatchException("int", exp1.getType(), exp1.getRow(), exp1.getCol()));

		n.f1.accept(this, argu);

		MType exp2 = n.f2.accept(this, argu);
		if (!checkType(exp2, "int"))
			Abort.abort(new MismatchException("int", exp2.getType(), exp2.getRow(), exp2.getCol()));

		return new MType("int", exp1.getRow(), exp1.getCol());
	}

	/**
	 * f0 -> PrimaryExpression() f1 -> "-" f2 -> PrimaryExpression()
	 */
	public MType visit(MinusExpression n, MType argu) {
		MType exp1 = n.f0.accept(this, argu);
		if (!checkType(exp1, "int"))
			Abort.abort(new MismatchException("int", exp1.getType(), exp1.getRow(), exp1.getCol()));

		n.f1.accept(this, argu);

		MType exp2 = n.f2.accept(this, argu);
		if (!checkType(exp2, "int"))
			Abort.abort(new MismatchException("int", exp2.getType(), exp2.getRow(), exp2.getCol()));

		return new MType("int", exp1.getRow(), exp1.getCol());
	}

	/**
	 * f0 -> PrimaryExpression() f1 -> "*" f2 -> PrimaryExpression()
	 */
	public MType visit(TimesExpression n, MType argu) {
		MType exp1 = n.f0.accept(this, argu);
		if (!checkType(exp1, "int"))
			Abort.abort(new MismatchException("int", exp1.getType(), exp1.getRow(), exp1.getCol()));

		n.f1.accept(this, argu);

		MType exp2 = n.f2.accept(this, argu);
		if (!checkType(exp2, "int"))
			Abort.abort(new MismatchException("int", exp2.getType(), exp2.getRow(), exp2.getCol()));

		return new MType("int", exp1.getRow(), exp1.getCol());
	}

	/**
	 * f0 -> PrimaryExpression() f1 -> "[" f2 -> PrimaryExpression() f3 -> "]"
	 */
	public MType visit(ArrayLookup n, MType argu) {
		MType exp1 = n.f0.accept(this, argu);
		if (!checkType(exp1, "int[]"))
			Abort.abort(new MismatchException("int[]", exp1.getType(), exp1.getRow(), exp1.getCol()));

		n.f1.accept(this, argu);

		MType exp2 = n.f2.accept(this, argu);
		if (!checkType(exp2, "int"))
			Abort.abort(new MismatchException("int", exp2.getType(), exp2.getRow(), exp2.getCol()));

		n.f3.accept(this, argu);
		return new MType("int", exp1.getRow(), exp1.getCol());
	}

	/**
	 * f0 -> PrimaryExpression() f1 -> "." f2 -> "length"
	 */
	public MType visit(ArrayLength n, MType argu) {
		MType _ret = n.f0.accept(this, argu);
		if (!checkType(_ret, "int[]"))
			Abort.abort(new MismatchException("int[]", _ret.getType(), _ret.getRow(), _ret.getCol()));

		n.f1.accept(this, argu);
		n.f2.accept(this, argu);
		return new MType("int", _ret.getRow(), _ret.getCol());
	}

	public MType visit(NodeListOptional n, MType argu) {
		if (n.present()) {
			MTypeList typeList = new MTypeList();
			for (Enumeration<Node> e = n.elements(); e.hasMoreElements();) {
				MType type = e.nextElement().accept(this, argu);
				typeList.insertType(type);
			}
			return typeList;
		} else
			return null;
	}

	/**
	 * f0 -> Expression() f1 -> ( ExpressionRest() )*
	 */
	public MType visit(ExpressionList n, MType argu) {
		MTypeList typeList = new MTypeList();
		MType type = n.f0.accept(this, argu);
		MTypeList typeRest = (MTypeList) n.f1.accept(this, argu);
		typeList.insertType(type);
		typeList.insertTypeAll(typeRest);
		return typeList;
	}

	/**
	 * f0 -> "," f1 -> Expression()
	 */
	public MType visit(ExpressionRest n, MType argu) {
		n.f0.accept(this, argu);
		MType type = n.f1.accept(this, argu);
		return type;
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
			name = newVar.getType();
		} else {
			name = newType.getType();
		}
		MClass newClass = allClassList.getClass(name);

		n.f1.accept(this, argu);
		MIdentifier id = (MIdentifier) n.f2.accept(this, argu);
		MMethod newMethod = newClass.getMethod(id.getName());

		n.f3.accept(this, argu);

		MTypeList typeList = (MTypeList) n.f4.accept(this, argu);
		if (typeList == null)
			typeList = new MTypeList();

		if (newMethod.getParamNum() != typeList.getTypeNum())
			Abort.abort(new MismatchException(newMethod.getParamNum(), typeList.getTypeNum(), typeList.getRow(),
					typeList.getCol()));
		int length = typeList.getTypeNum();
		for (int i = 0; i < length; ++i) {
			MType type = typeList.getType(i);
			MVar var = newMethod.getParam(i);
			if (!checkType(type, var.getType()))
				Abort.abort(new MismatchException(var.getType(), type.getType(), type.getRow(), type.getCol()));
		}

		n.f5.accept(this, argu);

		return new MType(newMethod.getReturnType(), newType.getRow(), newType.getCol());
	}

	/**
	 * f0 -> "new" f1 -> "int" f2 -> "[" f3 -> Expression() f4 -> "]"
	 */
	public MType visit(ArrayAllocationExpression n, MType argu) {
		n.f0.accept(this, argu);
		n.f1.accept(this, argu);
		n.f2.accept(this, argu);

		MType exp = n.f3.accept(this, argu);
		if (!checkType(exp, "int"))
			Abort.abort(new MismatchException("int", exp.getType(), exp.getRow(), exp.getCol()));

		n.f4.accept(this, argu);
		return new MType("int[]", n.f0.beginLine, n.f0.beginColumn);
	}

	/**
	 * f0 -> "!" f1 -> Expression()
	 */
	public MType visit(NotExpression n, MType argu) {
		n.f0.accept(this, argu);

		MType exp = n.f1.accept(this, argu);
		if (!checkType(exp, "boolean"))
			Abort.abort(new MismatchException("boolean", exp.getType(), exp.getRow(), exp.getCol()));

		return new MType("boolean", n.f0.beginLine, n.f0.beginColumn);
	}
}
