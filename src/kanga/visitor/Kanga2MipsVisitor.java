package visitor;

import kanga2mips.Environment;
import syntaxtree.ALoadStmt;
import syntaxtree.AStoreStmt;
import syntaxtree.BinOp;
import syntaxtree.CJumpStmt;
import syntaxtree.CallStmt;
import syntaxtree.ErrorStmt;
import syntaxtree.Exp;
import syntaxtree.Goal;
import syntaxtree.HAllocate;
import syntaxtree.HLoadStmt;
import syntaxtree.HStoreStmt;
import syntaxtree.IntegerLiteral;
import syntaxtree.JumpStmt;
import syntaxtree.Label;
import syntaxtree.MoveStmt;
import syntaxtree.NoOpStmt;
import syntaxtree.Node;
import syntaxtree.NodeToken;
import syntaxtree.Operator;
import syntaxtree.PassArgStmt;
import syntaxtree.PrintStmt;
import syntaxtree.Procedure;
import syntaxtree.Reg;
import syntaxtree.SimpleExp;
import syntaxtree.SpilledArg;
import syntaxtree.Stmt;

public class Kanga2MipsVisitor extends GJDepthFirst<String, Environment> {
	void init(Environment argu) {
		argu.document.writeln(".text");
		argu.document.writeln(".globl _halloc");
		argu.document.writeLabel("_halloc:");
		argu.document.writeln("li $v0 9");
		argu.document.writeln("syscall");
		argu.document.writeln("jr $ra");
		argu.document.newline();

		argu.document.writeln(".text");
		argu.document.writeln(".globl _print");
		argu.document.writeLabel("_print:");
		argu.document.writeln("li $v0 1");
		argu.document.writeln("syscall");
		argu.document.writeln("la $a0 newl");
		argu.document.writeln("li $v0 4");
		argu.document.writeln("syscall");
		argu.document.writeln("jr $ra");
		argu.document.newline();

		argu.document.writeln(".text");
		argu.document.writeln(".globl _abort");
		argu.document.writeLabel("_abort:");
		argu.document.writeln("la $a0 str_er");
		argu.document.writeln("li $v0 4");
		argu.document.writeln("syscall");
		argu.document.writeln("li $v0 10");
		argu.document.writeln("syscall");
		argu.document.newline();

		argu.document.writeln(".data");
		argu.document.writeln(".align 0");
		argu.document.writeLabel("newl:");
		argu.document.writeln(".asciiz \"\\n\"");
		argu.document.newline();

		argu.document.writeln(".data");
		argu.document.writeln(".align 0");
		argu.document.writeLabel("str_er:");
		argu.document.writeln(".asciiz \"ERROR: abnormal termination\\n\"");
		argu.document.newline();
	}

	void enterFunc(String name, int spilledCnt, Environment argu) {
		argu.document.writeln(".text");
		argu.document.writeln(".globl", name);
		argu.document.writeLabel(name + ":");
		argu.document.writeln("sw $fp -8($sp)");
		argu.document.writeln("sw $ra -4($sp)");
		argu.document.writeln("move $fp $sp");
		argu.document.writeln("subu $sp $sp", (spilledCnt + 2) * 4);
	}

	void exitFunc(int spilledCnt, Environment argu) {
		argu.document.writeln("lw $ra -4($fp)");
		argu.document.writeln("lw $fp -8($fp)");
		argu.document.writeln("addu $sp $sp", (spilledCnt + 2) * 4);
		argu.document.writeln("jr $ra");
		argu.document.newline();
	}

	/**
	 * f0 -> "MAIN" f1 -> "[" f2 -> IntegerLiteral() f3 -> "]" f4 -> "[" f5 ->
	 * IntegerLiteral() f6 -> "]" f7 -> "[" f8 -> IntegerLiteral() f9 -> "]" f10 ->
	 * StmtList() f11 -> "END" f12 -> ( Procedure() )* f13 -> <EOF>
	 */
	public String visit(Goal n, Environment argu) {
		init(argu);

		int spilledCnt = Integer.valueOf(n.f5.f0.tokenImage);
		enterFunc("main", spilledCnt, argu);
		n.f10.accept(this, argu);
		exitFunc(spilledCnt, argu);

		n.f12.accept(this, argu);
		return null;
	}

	/**
	 * f0 -> Label() f1 -> "[" f2 -> IntegerLiteral() f3 -> "]" f4 -> "[" f5 ->
	 * IntegerLiteral() f6 -> "]" f7 -> "[" f8 -> IntegerLiteral() f9 -> "]" f10 ->
	 * StmtList() f11 -> "END"
	 */
	public String visit(Procedure n, Environment argu) {
		String name = n.f0.f0.tokenImage;
		int spilledCnt = Integer.valueOf(n.f5.f0.tokenImage);
		enterFunc(name, spilledCnt, argu);
		n.f10.accept(this, argu);
		exitFunc(spilledCnt, argu);
		return null;
	}

	/**
	 * f0 -> NoOpStmt() | ErrorStmt() | CJumpStmt() | JumpStmt() | HStoreStmt() |
	 * HLoadStmt() | MoveStmt() | PrintStmt() | ALoadStmt() | AStoreStmt() |
	 * PassArgStmt() | CallStmt()
	 */
	public String visit(Stmt n, Environment argu) {
		argu.isInStmt = true;
		n.f0.accept(this, argu);
		argu.isInStmt = false;
		return null;
	}

	/**
	 * f0 -> "NOOP"
	 */
	public String visit(NoOpStmt n, Environment argu) {
		argu.document.writeln("nop");
		return null;
	}

	/**
	 * f0 -> "ERROR"
	 */
	public String visit(ErrorStmt n, Environment argu) {
		argu.document.writeln("jal _abort");
		return null;
	}

	/**
	 * f0 -> "CJUMP" f1 -> Reg() f2 -> Label()
	 */
	public String visit(CJumpStmt n, Environment argu) {
		String r1 = n.f1.accept(this, argu);
		String r2 = n.f2.accept(this, argu);
		argu.document.writeln("beqz", r1, r2);
		return null;
	}

	/**
	 * f0 -> "JUMP" f1 -> Label()
	 */
	public String visit(JumpStmt n, Environment argu) {
		String r1 = n.f1.accept(this, argu);
		argu.document.writeln("j", r1);
		return null;
	}

	/**
	 * f0 -> "HSTORE" f1 -> Reg() f2 -> IntegerLiteral() f3 -> Reg()
	 */
	public String visit(HStoreStmt n, Environment argu) {
		String r1 = n.f1.accept(this, argu);
		String r2 = n.f3.accept(this, argu);
		int offset = Integer.valueOf(n.f2.f0.tokenImage);
		argu.document.writeln("sw", r2, offset + "(" + r1 + ")");
		return null;
	}

	/**
	 * f0 -> "HLOAD" f1 -> Reg() f2 -> Reg() f3 -> IntegerLiteral()
	 */
	public String visit(HLoadStmt n, Environment argu) {
		String r1 = n.f1.accept(this, argu);
		String r2 = n.f2.accept(this, argu);
		int offset = Integer.valueOf(n.f3.f0.tokenImage);
		argu.document.writeln("lw", r1, offset + "(" + r2 + ")");
		return null;
	}

	/**
	 * f0 -> "MOVE" f1 -> Reg() f2 -> Exp()
	 */
	public String visit(MoveStmt n, Environment argu) {
		String r1 = n.f1.accept(this, argu);
		String exp = n.f2.accept(this, argu);
		Node choice = n.f2.f0.choice;
		if (choice instanceof SimpleExp) {
			Node choice2 = ((SimpleExp) n.f2.f0.choice).f0.choice;
			String op = null;
			if (choice2 instanceof IntegerLiteral) {
				op = "li";
			} else if (choice2 instanceof Label) {
				op = "la";
			} else {
				op = "move";
			}
			argu.document.writeln(op, r1, exp);
		} else if (choice instanceof HAllocate) {
			argu.document.writeln("move", r1, "$v0");
		} else {
			r1 = r1.replaceAll("\\$", "RDS_CHAR_DOLLAR");
			exp = exp.replaceFirst("hole", r1);
			exp = exp.replaceAll("RDS_CHAR_DOLLAR", "\\$");
			argu.document.writeln(exp);
		}
		return null;
	}

	/**
	 * f0 -> "PRINT" f1 -> SimpleExp()
	 */
	public String visit(PrintStmt n, Environment argu) {
		String r1 = n.f1.accept(this, argu);
		Node choice = n.f1.f0.choice;
		if (choice instanceof IntegerLiteral) {
			argu.document.writeln("li $a0", r1);
		} else if (choice instanceof Label) {
			argu.document.writeln("la $a0", r1);
		} else {
			argu.document.writeln("move $a0", r1);
		}
		argu.document.writeln("jal _print");
		return null;
	}

	/**
	 * f0 -> "ALOAD" f1 -> Reg() f2 -> SpilledArg()
	 */
	public String visit(ALoadStmt n, Environment argu) {
		String r1 = n.f1.accept(this, argu);
		String r2 = n.f2.accept(this, argu);
		argu.document.writeln("lw", r1, r2);
		return null;
	}

	/**
	 * f0 -> "ASTORE" f1 -> SpilledArg() f2 -> Reg()
	 */
	public String visit(AStoreStmt n, Environment argu) {
		String r1 = n.f1.accept(this, argu);
		String r2 = n.f2.accept(this, argu);
		argu.document.writeln("sw", r2, r1);
		return null;
	}

	/**
	 * f0 -> "PASSARG" f1 -> IntegerLiteral() f2 -> Reg()
	 */
	public String visit(PassArgStmt n, Environment argu) {
		String r1 = n.f2.accept(this, argu);
		int offset = -4 * (2 + Integer.valueOf(n.f1.f0.tokenImage));
		argu.document.writeln("sw", r1, offset + "($sp)");
		return null;
	}

	/**
	 * f0 -> "CALL" f1 -> SimpleExp()
	 */
	public String visit(CallStmt n, Environment argu) {
		String r1 = n.f1.accept(this, argu);
		Node choice = n.f1.f0.choice;
		if (choice instanceof IntegerLiteral) {
			argu.document.writeln("li $v0", r1);
			argu.document.writeln("jalr $v0");
		} else if (choice instanceof Label) {
			argu.document.writeln("jal", r1);
		} else {
			argu.document.writeln("jalr", r1);
		}
		return null;
	}

	/**
	 * f0 -> HAllocate() | BinOp() | SimpleExp()
	 */
	public String visit(Exp n, Environment argu) {
		return n.f0.accept(this, argu);
	}

	/**
	 * f0 -> "HALLOCATE" f1 -> SimpleExp()
	 */
	public String visit(HAllocate n, Environment argu) {
		String r1 = n.f1.accept(this, argu);
		Node choice = n.f1.f0.choice;
		if (choice instanceof IntegerLiteral) {
			argu.document.writeln("li $a0", r1);
		} else if (choice instanceof Label) {
			argu.document.writeln("la $a0", r1);
		} else {
			argu.document.writeln("move $a0", r1);
		}
		argu.document.writeln("jal _halloc");
		return "$v0";
	}

	/**
	 * f0 -> Operator() f1 -> Reg() f2 -> SimpleExp()
	 */
	public String visit(BinOp n, Environment argu) {
		String op = n.f0.accept(this, argu);
		String r1 = n.f1.accept(this, argu);
		String r2 = n.f2.accept(this, argu);
		Node choice = n.f2.f0.choice;
		if (choice instanceof IntegerLiteral) {
			argu.document.writeln("li $a0", r2);
		} else if (choice instanceof Label) {
			argu.document.writeln("la $a0", r2);
		} else {
			argu.document.writeln("move $a0", r2);
		}
		String _ret = op + " hole " + r1 + " $a0";
		return _ret;
	}

	/**
	 * f0 -> "LT" | "PLUS" | "MINUS" | "TIMES"
	 */
	public String visit(Operator n, Environment argu) {
		String op = ((NodeToken) n.f0.choice).tokenImage;
		if (op.equals("LT"))
			return "slt";
		if (op.equals("PLUS"))
			return "add";
		if (op.equals("MINUS"))
			return "sub";
		return "mul";
	}

	/**
	 * f0 -> "SPILLEDARG" f1 -> IntegerLiteral()
	 */
	public String visit(SpilledArg n, Environment argu) {
		int offset = -4 * (3 + Integer.valueOf(n.f1.f0.tokenImage));
		return offset + "($fp)";
	}

	/**
	 * f0 -> Reg() | IntegerLiteral() | Label()
	 */
	public String visit(SimpleExp n, Environment argu) {
		return n.f0.accept(this, argu);
	}

	/**
	 * f0 -> "a0" | "a1" | "a2" | "a3" | "t0" | "t1" | "t2" | "t3" | "t4" | "t5" |
	 * "t6" | "t7" | "s0" | "s1" | "s2" | "s3" | "s4" | "s5" | "s6" | "s7" | "t8" |
	 * "t9" | "v0" | "v1"
	 */
	public String visit(Reg n, Environment argu) {
		return "$" + ((NodeToken) n.f0.choice).tokenImage;
	}

	/**
	 * f0 -> <INTEGER_LITERAL>
	 */
	public String visit(IntegerLiteral n, Environment argu) {
		return n.f0.tokenImage;
	}

	/**
	 * f0 -> <IDENTIFIER>
	 */
	public String visit(Label n, Environment argu) {
		String lbl = n.f0.tokenImage;
		if (!argu.isInStmt) {
			argu.document.writeLabel(lbl + ":");
		}
		return lbl;
	}
}
