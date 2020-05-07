package visitor;

import spiglet2kanga.Environment;
import spiglet2kanga.Function;
import spiglet2kanga.Statement;
import syntaxtree.CJumpStmt;
import syntaxtree.Call;
import syntaxtree.ErrorStmt;
import syntaxtree.Goal;
import syntaxtree.HLoadStmt;
import syntaxtree.HStoreStmt;
import syntaxtree.JumpStmt;
import syntaxtree.Label;
import syntaxtree.MoveStmt;
import syntaxtree.NoOpStmt;
import syntaxtree.PrintStmt;
import syntaxtree.Procedure;
import syntaxtree.Stmt;
import syntaxtree.StmtExp;
import syntaxtree.Temp;

public class EnvironmentBuilder extends GJVoidDepthFirst<Environment> {
	/**
	 * f0 -> "MAIN" f1 -> StmtList() f2 -> "END" f3 -> ( Procedure() )* f4 -> <EOF>
	 */
	public void visit(Goal n, Environment argu) {
		argu.currentFunc = new Function("MAIN");
		argu.currentFunc.paraCnt = 0;
		n.f1.accept(this, argu);
		argu.currentFunc.addStmt(new Statement("Exit"));
		argu.addFunc();

		n.f3.accept(this, argu);
	}

	/**
	 * f0 -> Label() f1 -> "[" f2 -> IntegerLiteral() f3 -> "]" f4 -> StmtExp()
	 */
	public void visit(Procedure n, Environment argu) {
		argu.currentFunc = new Function(n.f0.f0.tokenImage);
		argu.currentFunc.paraCnt = Integer.valueOf(n.f2.f0.tokenImage);
		n.f4.accept(this, argu);
		argu.currentFunc.addStmt(new Statement("Exit"));
		argu.addFunc();
	}

	/**
	 * f0 -> NoOpStmt() | ErrorStmt() | CJumpStmt() | JumpStmt() | HStoreStmt() |
	 * HLoadStmt() | MoveStmt() | PrintStmt()
	 */
	public void visit(Stmt n, Environment argu) {
		argu.isInStmt = true;
		n.f0.accept(this, argu);
		argu.isInStmt = false;
	}

	/**
	 * f0 -> "NOOP"
	 */
	public void visit(NoOpStmt n, Environment argu) {
		Statement stmt = new Statement("NoOpStmt");
		argu.currentFunc.addStmt(stmt);
	}

	/**
	 * f0 -> "ERROR"
	 */
	public void visit(ErrorStmt n, Environment argu) {
		Statement stmt = new Statement("ErrorStmt");
		argu.currentFunc.addStmt(stmt);
	}

	/**
	 * f0 -> "CJUMP" f1 -> Temp() f2 -> Label()
	 */
	public void visit(CJumpStmt n, Environment argu) {
		Statement stmt = new Statement("CJumpStmt");
		stmt.label = n.f2.f0.tokenImage;
		stmt.addUsedTemp(n.f1.f1.f0.tokenImage);
		argu.currentFunc.addStmt(stmt);
	}

	/**
	 * f0 -> "JUMP" f1 -> Label()
	 */
	public void visit(JumpStmt n, Environment argu) {
		Statement stmt = new Statement("JumpStmt");
		stmt.label = n.f1.f0.tokenImage;
		argu.currentFunc.addStmt(stmt);
	}

	/**
	 * f0 -> "HSTORE" f1 -> Temp() f2 -> IntegerLiteral() f3 -> Temp()
	 */
	public void visit(HStoreStmt n, Environment argu) {
		Statement stmt = new Statement("HStoreStmt");
		stmt.addUsedTemp(n.f1.f1.f0.tokenImage);
		stmt.addUsedTemp(n.f3.f1.f0.tokenImage);
		argu.currentFunc.addStmt(stmt);
	}

	/**
	 * f0 -> "HLOAD" f1 -> Temp() f2 -> Temp() f3 -> IntegerLiteral()
	 */
	public void visit(HLoadStmt n, Environment argu) {
		Statement stmt = new Statement("HLoadStmt");
		stmt.def = Integer.valueOf(n.f1.f1.f0.tokenImage);
		stmt.addUsedTemp(n.f2.f1.f0.tokenImage);
		argu.currentFunc.addStmt(stmt);
	}

	/**
	 * f0 -> "MOVE" f1 -> Temp() f2 -> Exp()
	 */
	public void visit(MoveStmt n, Environment argu) {
		Statement tmpStmt = argu.currentStmt;
		argu.currentStmt = new Statement("MoveStmt");
		argu.currentStmt.def = Integer.valueOf(n.f1.f1.f0.tokenImage);
		n.f2.accept(this, argu);
		argu.currentFunc.addStmt(argu.currentStmt);
		argu.currentStmt = tmpStmt;
	}

	/**
	 * f0 -> "PRINT" f1 -> SimpleExp()
	 */
	public void visit(PrintStmt n, Environment argu) {
		Statement tmpStmt = argu.currentStmt;
		argu.currentStmt = new Statement("PrintStmt");
		n.f1.accept(this, argu);
		argu.currentFunc.addStmt(argu.currentStmt);
		argu.currentStmt = tmpStmt;
	}

	/**
	 * f0 -> "BEGIN" f1 -> StmtList() f2 -> "RETURN" f3 -> SimpleExp() f4 -> "END"
	 */
	public void visit(StmtExp n, Environment argu) {
		n.f1.accept(this, argu);

		Statement tmpStmt = argu.currentStmt;
		argu.currentStmt = new Statement("Return");
		n.f3.accept(this, argu);
		argu.currentFunc.addStmt(argu.currentStmt);
		argu.currentStmt = tmpStmt;
	}

	/**
	 * f0 -> "CALL" f1 -> SimpleExp() f2 -> "(" f3 -> ( Temp() )* f4 -> ")"
	 */
	public void visit(Call n, Environment argu) {
		Statement tmpStmt = argu.currentStmt;
		argu.currentStmt = new Statement("Call");
		n.f1.accept(this, argu);
		n.f3.accept(this, argu);
		argu.currentFunc.addStmt(argu.currentStmt);
		argu.currentStmt = tmpStmt;
	}

	/**
	 * f0 -> "TEMP" f1 -> IntegerLiteral()
	 */
	public void visit(Temp n, Environment argu) {
		argu.currentStmt.addUsedTemp(n.f1.f0.tokenImage);
	}

	/**
	 * f0 -> <IDENTIFIER>
	 */
	public void visit(Label n, Environment argu) {
		if (argu.isInStmt) {
			argu.currentStmt.label = n.f0.tokenImage;
		} else {
			Statement stmt = new Statement("Label");
			stmt.label = n.f0.tokenImage;
			argu.currentFunc.addStmt(stmt);
		}
	}
}
