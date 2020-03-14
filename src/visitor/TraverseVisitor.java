package visitor;

import syntaxtree.*;
import symboltable.*;

public class TraverseVisitor extends GJDepthFirst<MType, MType> {
	/**
	 * f0 -> "class" f1 -> Identifier() f2 -> "{" f3 -> "public" f4 -> "static" f5
	 * -> "void" f6 -> "main" f7 -> "(" f8 -> "String" f9 -> "[" f10 -> "]" f11 ->
	 * Identifier() f12 -> ")" f13 -> "{" f14 -> ( VarDeclaration() )* f15 -> (
	 * Statement() )* f16 -> "}" f17 -> "}"
	 */
	public MType visit(MainClass n, MType argu) {
		n.f0.accept(this, argu);

		MIdentifier id = (MIdentifier) n.f1.accept(this, argu);
		MClass newClass = allClassList.getClass(id.getName());

		n.f2.accept(this, newClass);
		n.f3.accept(this, newClass);
		n.f4.accept(this, newClass);
		n.f5.accept(this, newClass);
		n.f6.accept(this, newClass);

		MMethod newMethod = newClass.getMethod("main");

		n.f7.accept(this, newMethod);
		n.f8.accept(this, newMethod);
		n.f9.accept(this, newMethod);
		n.f10.accept(this, newMethod);
		n.f11.accept(this, newMethod);
		n.f12.accept(this, newMethod);
		n.f13.accept(this, newMethod);
		n.f14.accept(this, newMethod);
		n.f15.accept(this, newMethod);
		n.f16.accept(this, newMethod);
		n.f17.accept(this, newClass);

		return null;
	}

	/**
	 * f0 -> "class" f1 -> Identifier() f2 -> "{" f3 -> ( VarDeclaration() )* f4 ->
	 * ( MethodDeclaration() )* f5 -> "}"
	 */
	public MType visit(ClassDeclaration n, MType argu) {
		n.f0.accept(this, argu);

		MIdentifier id = (MIdentifier) n.f1.accept(this, argu);
		MClass newClass = argu.getMethod(id.getName());

		n.f2.accept(this, newClass);
		n.f3.accept(this, newClass);
		n.f4.accept(this, newClass);
		n.f5.accept(this, newClass);
		return null;
	}

	/**
	 * f0 -> "class" f1 -> Identifier() f2 -> "extends" f3 -> Identifier() f4 -> "{"
	 * f5 -> ( VarDeclaration() )* f6 -> ( MethodDeclaration() )* f7 -> "}"
	 */
	public MType visit(ClassExtendsDeclaration n, MType argu) {
		n.f0.accept(this, argu);

		MIdentifier id = (MIdentifier) n.f1.accept(this, argu);
		MClass newClass = argu.getMethod(id.getName());

		n.f2.accept(this, argu);
		n.f3.accept(this, argu);
		n.f4.accept(this, newClass);
		n.f5.accept(this, newClass);
		n.f6.accept(this, newClass);
		n.f7.accept(this, newClass);
		return null;
	}

	/**
	 * f0 -> "public" f1 -> Type() f2 -> Identifier() f3 -> "(" f4 -> (
	 * FormalParameterList() )? f5 -> ")" f6 -> "{" f7 -> ( VarDeclaration() )* f8
	 * -> ( Statement() )* f9 -> "return" f10 -> Expression() f11 -> ";" f12 -> "}"
	 */
	public MType visit(MethodDeclaration n, MType argu) {
		n.f0.accept(this, argu);
		n.f1.accept(this, argu);

		MIdentifier id = (MIdentifier) n.f2.accept(this, argu);
		MMethod newMethod = ((MClass) argu).getMethod(id.getName());

		n.f3.accept(this, newMethod);
		n.f4.accept(this, newMethod);
		n.f5.accept(this, newMethod);
		n.f6.accept(this, newMethod);
		n.f7.accept(this, newMethod);
		n.f8.accept(this, newMethod);
		n.f9.accept(this, newMethod);
		n.f10.accept(this, newMethod);
		n.f11.accept(this, newMethod);
		n.f12.accept(this, newMethod);
		return null;
	}

	/**
	 * f0 -> ArrayType() | BooleanType() | IntegerType() | Identifier()
	 */
	public MType visit(Type n, MType argu) {
		MType _ret = n.f0.accept(this, argu);
		if (_ret instanceof MIdentifier)
			_ret.setType(((MIdentifier) _ret).getName());
		return _ret;
	}

	/**
	 * f0 -> "int" f1 -> "[" f2 -> "]"
	 */
	public MType visit(ArrayType n, MType argu) {
		n.f0.accept(this, argu);
		n.f1.accept(this, argu);
		n.f2.accept(this, argu);
		return new MType("int[]", n.f0.beginLine, n.f0.beginColumn);
	}

	/**
	 * f0 -> "boolean"
	 */
	public MType visit(BooleanType n, MType argu) {
		n.f0.accept(this, argu);
		return new MType("boolean", n.f0.beginLine, n.f0.beginColumn);
	}

	/**
	 * f0 -> "int"
	 */
	public MType visit(IntegerType n, MType argu) {
		n.f0.accept(this, argu);
		return new MType("int", n.f0.beginLine, n.f0.beginColumn);
	}

	/**
	 * f0 -> AndExpression() | CompareExpression() | PlusExpression() |
	 * MinusExpression() | TimesExpression() | ArrayLookup() | ArrayLength() |
	 * MessageSend() | PrimaryExpression()
	 */
	public MType visit(Expression n, MType argu) {
		return n.f0.accept(this, argu);
	}

	/**
	 * f0 -> PrimaryExpression() f1 -> "&&" f2 -> PrimaryExpression()
	 */
	public MType visit(AndExpression n, MType argu) {
		MType _ret = n.f0.accept(this, argu);
		n.f1.accept(this, argu);
		n.f2.accept(this, argu);
		return new MType("boolean", _ret.getLine(), _ret.getColumn());
	}

	/**
	 * f0 -> PrimaryExpression() f1 -> "<" f2 -> PrimaryExpression()
	 */
	public MType visit(CompareExpression n, MType argu) {
		MType _ret = n.f0.accept(this, argu);
		n.f1.accept(this, argu);
		n.f2.accept(this, argu);
		return new MType("boolean", _ret.getLine(), _ret.getColumn());
	}

	/**
	 * f0 -> PrimaryExpression() f1 -> "+" f2 -> PrimaryExpression()
	 */
	public MType visit(PlusExpression n, MType argu) {
		MType _ret = n.f0.accept(this, argu);
		n.f1.accept(this, argu);
		n.f2.accept(this, argu);
		return new MType("int", _ret.getLine(), _ret.getColumn());
	}

	/**
	 * f0 -> PrimaryExpression() f1 -> "-" f2 -> PrimaryExpression()
	 */
	public MType visit(MinusExpression n, MType argu) {
		MType _ret = n.f0.accept(this, argu);
		n.f1.accept(this, argu);
		n.f2.accept(this, argu);
		return new MType("int", _ret.getLine(), _ret.getColumn());
	}

	/**
	 * f0 -> PrimaryExpression() f1 -> "*" f2 -> PrimaryExpression()
	 */
	public MType visit(TimesExpression n, MType argu) {
		MType _ret = n.f0.accept(this, argu);
		n.f1.accept(this, argu);
		n.f2.accept(this, argu);
		return new MType("int", _ret.getLine(), _ret.getColumn());
	}

	/**
	 * f0 -> PrimaryExpression() f1 -> "[" f2 -> PrimaryExpression() f3 -> "]"
	 */
	public MType visit(ArrayLookup n, MType argu) {
		MType _ret = n.f0.accept(this, argu);
		n.f1.accept(this, argu);
		n.f2.accept(this, argu);
		n.f3.accept(this, argu);
		return new MType("int", _ret.getLine(), _ret.getColumn());
	}

	/**
	 * f0 -> PrimaryExpression() f1 -> "." f2 -> "length"
	 */
	public MType visit(ArrayLength n, MType argu) {
		MType _ret = n.f0.accept(this, argu);
		n.f1.accept(this, argu);
		n.f2.accept(this, argu);
		return new MType("int", _ret.getLine(), _ret.getColumn());
	}

	/**
	 * f0 -> PrimaryExpression() f1 -> "." f2 -> Identifier() f3 -> "(" f4 -> (
	 * ExpressionList() )? f5 -> ")"
	 */
	public MType visit(MessageSend n, MType argu) {
		MType newType = n.f0.accept(this, argu);
		String name = null;
		if (newType instanceof MIdentifier) {
			MVar newVar = argu.getVar(((MIdentifier) newType).getName());
			name = newVar.getType();
		} else {
			name = newType.getType();
		}
		MClass newClass = allClassList.getClass(name);

		n.f1.accept(this, argu);
		MIdentifier id = (MIdentifier) n.f2.accept(this, argu);
		MMethod newMethod = newClass.getMethod(id.getName());

		n.f3.accept(this, argu);
		n.f4.accept(this, argu);
		n.f5.accept(this, argu);

		return new MType(newMethod.getReturnType(), newType.getLine(), newType.getColumn());
	}

	/**
	 * f0 -> IntegerLiteral() | TrueLiteral() | FalseLiteral() | Identifier() |
	 * ThisExpression() | ArrayAllocationExpression() | AllocationExpression() |
	 * NotExpression() | BracketExpression()
	 */
	public MType visit(PrimaryExpression n, MType argu) {
		MType _ret = n.f0.accept(this, argu);
		if (_ret instanceof MIdentifier) {
			MVar newVar = argu.getVar(((MIdentifier) _ret).getName());
			((MIdentifier) _ret).setType(newVar.getType());
		}
		return _ret;
	}

	/**
	 * f0 -> <INTEGER_LITERAL>
	 */
	public MType visit(IntegerLiteral n, MType argu) {
		n.f0.accept(this, argu);
		return new MType("int", n.f0.beginLine, n.f0.beginColumn);
	}

	/**
	 * f0 -> "true"
	 */
	public MType visit(TrueLiteral n, MType argu) {
		n.f0.accept(this, argu);
		return new MType("boolean", n.f0.beginLine, n.f0.beginColumn);
	}

	/**
	 * f0 -> "false"
	 */
	public MType visit(FalseLiteral n, MType argu) {
		n.f0.accept(this, argu);
		return new MType("boolean", n.f0.beginLine, n.f0.beginColumn);
	}

	/**
	 * f0 -> <IDENTIFIER>
	 */
	public MType visit(Identifier n, MType argu) {
		n.f0.accept(this, argu);
		return new MIdentifier(n.f0.toString(), null, n.f0.beginLine, n.f0.beginColumn);
	}

	/**
	 * f0 -> "this"
	 */
	public MType visit(ThisExpression n, MType argu) {
		n.f0.accept(this, argu);
		MClass newClass = ((MMethod) argu).getParentClass();
		return new MType(newClass.getName(), n.f0.beginLine, n.f0.beginColumn);
	}

	/**
	 * f0 -> "new" f1 -> "int" f2 -> "[" f3 -> Expression() f4 -> "]"
	 */
	public MType visit(ArrayAllocationExpression n, MType argu) {
		n.f0.accept(this, argu);
		n.f1.accept(this, argu);
		n.f2.accept(this, argu);
		n.f3.accept(this, argu);
		n.f4.accept(this, argu);
		return new MType("int[]", n.f0.beginLine, n.f0.beginColumn);
	}

	/**
	 * f0 -> "new" f1 -> Identifier() f2 -> "(" f3 -> ")"
	 */
	public MType visit(AllocationExpression n, MType argu) {
		n.f0.accept(this, argu);

		MIdentifier id = (MIdentifier) n.f1.accept(this, argu);

		n.f2.accept(this, argu);
		n.f3.accept(this, argu);
		return new MType(id.getName(), n.f0.beginLine, n.f0.beginColumn);
	}

	/**
	 * f0 -> "!" f1 -> Expression()
	 */
	public MType visit(NotExpression n, MType argu) {
		n.f0.accept(this, argu);
		n.f1.accept(this, argu);
		return new MType("boolean", n.f0.beginLine, n.f0.beginColumn);
	}

	/**
	 * f0 -> "(" f1 -> Expression() f2 -> ")"
	 */
	public MType visit(BracketExpression n, MType argu) {
		n.f0.accept(this, argu);
		MType _ret = n.f1.accept(this, argu);
		n.f2.accept(this, argu);
		return _ret;
	}
}
