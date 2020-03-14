package visitor;

import syntaxtree.AllocationExpression;
import syntaxtree.ArrayAssignmentStatement;
import syntaxtree.AssignmentStatement;
import syntaxtree.MessageSend;
import syntaxtree.PrimaryExpression;

public class UndefinedIdentifierVisitor extends GJDepthFirst<MType, MType> {
	@Override
	/**
	 * AssignmentStatement: undefined variable (f0)
	 * f0 -> Identifier()
	 * f1 -> "="
	 * f2 -> Expression()
	 * f3 -> ";"
	 */
	public MType visit(AssignmentStatement n, MType argu) {
		MType _ret = null;
		n.f0.accept(this, argu);
		
		
		
		n.f1.accept(this, argu);
		n.f2.accept(this, argu);
		n.f3.accept(this, argu);
		return _ret;
	}
	
	@Override
	/**
	 * ArrayAssignmentStatement: undefined array variable (f0)
	 * f0 -> Identifier()
	 * f1 -> "["
	 * f2 -> Expression()
	 * f3 -> "]"
	 * f4 -> "="
	 * f5 -> Expression()
	 * f6 -> ";"
	 */
	public MType visit(ArrayAssignmentStatement n, MType argu) {
		MType _ret = null;
		n.f0.accept(this, argu);
		n.f1.accept(this, argu);
		n.f2.accept(this, argu);
		n.f3.accept(this, argu);
		n.f4.accept(this, argu);
		n.f5.accept(this, argu);
		n.f6.accept(this, argu);
		return _ret;
	}
	
	@Override
	/**
	 * MessageSend: undefined function (f2) and f0 must be MClassType 
	 * f0 -> PrimaryExpression()
	 * f1 -> "."
	 * f2 -> Identifier()
	 * f3 -> "("
	 * f4 -> ( ExpressionList() )?
	 * f5 -> ")"
	 */
	public MType visit(MessageSend n, MType argu) {
		MType _ret = null;
		n.f0.accept(this, argu);
		n.f1.accept(this, argu);
		n.f2.accept(this, argu);
		n.f3.accept(this, argu);
		n.f4.accept(this, argu);
		n.f5.accept(this, argu);
		return _ret;
	}
	
	@Override
	/**
	 * PrimaryExpression: undefined variable (when f0 is an identifier)
	 * f0 -> IntegerLiteral()
	 *       | TrueLiteral()
	 *       | FalseLiteral()
	 *       | Identifier()
	 *       | ThisExpression()
	 *       | ArrayAllocationExpression()
	 *       | AllocationExpression()
	 *       | NotExpression()
	 *       | BracketExpression()
	 */
	public MType visit(PrimaryExpression n, MType argu) {
		MType _ret = null;
		n.f0.accept(this, argu);
		return _ret;
	}
	
	@Override
	/**
	 * AllocationExpression: undefined class (f1)
	 * f0 -> "new"
	 * f1 -> Identifier()
	 * f2 -> "("
	 * f3 -> ")"
	 */
	public MType visit(AllocationExpression n, MType argu) {
		MType _ret = null;
		n.f0.accept(this, argu);
		n.f1.accept(this, argu);
		n.f2.accept(this, argu);
		n.f3.accept(this, argu);
		return _ret;
	}
}
