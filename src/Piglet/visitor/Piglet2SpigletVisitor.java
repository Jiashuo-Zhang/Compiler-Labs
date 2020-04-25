package visitor;

import java.util.Enumeration;

import syntaxtree.*;

public class Piglet2SpigletVisitor extends GJNoArguDepthFirst<String> {
	CodeManager document = null;

	public Piglet2SpigletVisitor() {
		this.document = new CodeManager();
	}

	public void setDocumentCurrentTemp(int a) {
		this.document.currentTemp = a;
		return;
	}

	public int getDocumentCurrentTemp() {
		return this.document.currentTemp;
	}

	public String getCode() {
		return this.document.sb.toString();
	}

	/**
	 * f0 -> "MAIN" f1 -> StmtList() f2 -> "END" f3 -> ( Procedure() )* f4 -> <EOF>
	 */
	public String visit(Goal n) {
		this.document.write("MAIN");
		document.newline();
		n.f1.accept(this);
		document.writeEnd();
		document.newline();
		n.f3.accept(this);
		return null;
	}

	/**
	 * f0 -> ( ( Label() )? Stmt() )*
	 */
	public String visit(StmtList n) {
		n.f0.accept(this);
		return null;
	}

	/**
	 * f0 -> Label() f1 -> "[" f2 -> IntegerLiteral() f3 -> "]" f4 -> StmtExp()
	 */
	public String visit(Procedure n) {
		// n.f0.accept(this);
		document.write(n.f0.f0.tokenImage, "[", n.f2.f0.tokenImage, "]");
		document.writeBegin();
		document.newline();
		String tmp1=n.f4.accept(this);
		document.newline();
		document.write("RETURN",tmp1);
		this.document.newline();
		document.writeEnd();
		this.document.newline();
		
		
		return null;
	}

	/**
	 * f0 -> NoOpStmt() | ErrorStmt() | CJumpStmt() | JumpStmt() | HStoreStmt() |
	 * HLoadStmt() | MoveStmt() | PrintStmt()
	 */
	public String visit(Stmt n) {
		n.f0.accept(this);
		return null;
	}

	/**
	 * f0 -> "NOOP"
	 */
	public String visit(NoOpStmt n) {
		this.document.write("NOOP");
		this.document.newline();
		return null;
	}

	/**
	 * f0 -> "ERROR"
	 */
	public String visit(ErrorStmt n) {
		this.document.write("ERROR");
		this.document.newline();
		return null;
	}

	/**
	 * f0 -> "CJUMP" f1 -> Exp() f2 -> Label()
	 */
	public String visit(CJumpStmt n) {
		String tmp1 = n.f1.accept(this);
		this.document.newline();

		document.write("CJUMP", tmp1, n.f2.f0.tokenImage);
		this.document.newline();
		return null;
	}

	/**
	 * f0 -> "JUMP" f1 -> Label()
	 */
	public String visit(JumpStmt n) {
		this.document.write("JUMP", n.f1.f0.tokenImage);
		this.document.newline();
		return null;
	}

	/**
	 * f0 -> "HSTORE" f1 -> Exp() f2 -> IntegerLiteral() f3 -> Exp()
	 */
	public String visit(HStoreStmt n) {
		String tmp1 = n.f1.accept(this);
		document.newline();
		String tmp2 = n.f3.accept(this);
		document.newline();

		this.document.write("HSTORE", tmp1, n.f2.f0.tokenImage, tmp2);
		this.document.newline();
		return null;
	}

	/**
	 * f0 -> "HLOAD" f1 -> Temp() f2 -> Exp() f3 -> IntegerLiteral()
	 */
	public String visit(HLoadStmt n) {
		String tmp1=n.f1.accept(this);
		document.newline();
		String tmp2 = n.f2.accept(this);
		document.newline();

		this.document.write("HLOAD");
		this.document.write(tmp1,tmp2, n.f3.f0.tokenImage);
		document.newline();
		return null;
	}

	/**
	 * f0 -> "MOVE" f1 -> Temp() f2 -> Exp()
	 */
	public String visit(MoveStmt n) {
		String tmp1 = n.f1.accept(this);
		document.newline();
		String tmp2=n.f2.accept(this);
		this.document.newline();
		this.document.write("MOVE",tmp1,tmp2);
		this.document.newline();
		
		return null;
	}

	/**
	 * f0 -> "PRINT" f1 -> Exp()
	 */
	public String visit(PrintStmt n) {
		String tmp1 = n.f1.accept(this);
		this.document.newline();

		this.document.write("PRINT", tmp1);
		this.document.newline();
		return null;
	}

	/**
	 * f0 -> StmtExp() | Call() | HAllocate() | BinOp() | Temp() | IntegerLiteral()
	 * | Label()
	 */
	public String visit(Exp n) {
		return n.f0.accept(this);
	}

	/**
	 * f0 -> "BEGIN" f1 -> StmtList() f2 -> "RETURN" f3 -> Exp() f4 -> "END"
	 */
	public String visit(StmtExp n) {
		//this.document.writeBegin();
		n.f1.accept(this);
		String tmp1 = n.f3.accept(this);
		//this.document.newline();

		//document.write("RETURN", tmp1);
		//document.writeEnd();
		return tmp1;
	}

	/**
	 * f0 -> "CALL" f1 -> Exp() f2 -> "(" f3 -> ( Exp() )* f4 -> ")"
	 */
	public String visit(Call n) {
		String tmp1 = n.f1.accept(this);
		String tmp2 = this.document.getNewTemp();
		this.document.newline();
		StringBuffer argList = new StringBuffer();

		if (n.f3.present()) {
			for (Enumeration<Node> e = n.f3.elements(); e.hasMoreElements();) {
				String arg = e.nextElement().accept(this);
				this.document.newline();
				argList.append(arg + " ");
			}
		}
		
		this.document.write("MOVE", tmp2, "CALL", tmp1, "(", argList.toString().trim(), ")");
		
		return tmp2;
	}

	/**
	 * f0 -> "HALLOCATE" f1 -> Exp()
	 */
	public String visit(HAllocate n) {
		String tmp1 = n.f1.accept(this);
		String tmp2 = this.document.getNewTemp();
		this.document.newline();
		
		document.write("MOVE", tmp2, "HALLOCATE", tmp1);
		return tmp2;
	}

	/**
	 * f0 -> Operator() f1 -> Exp() f2 -> Exp()
	 */
	public String visit(BinOp n) {
		// n.f0.accept(this);
		String tmp1 = n.f1.accept(this);
		this.document.newline();
		String tmp2 = n.f2.accept(this);
		this.document.newline();
		String tmp3 = this.document.getNewTemp();
		
		String op = new String();
		if (n.f0.f0.which == 0) {
			op = "LT";
		} else if (n.f0.f0.which == 1) {
			op = "PLUS";
		} else if (n.f0.f0.which == 2) {
			op = "MINUS";
		} else {
			op = "TIMES";
		}
		
		document.write("MOVE", tmp3, op, tmp1, tmp2);
		return tmp3;
	}

	/**
	 * f0 -> "TEMP" f1 -> IntegerLiteral()
	 */
	public String visit(Temp n) {
		String res = "TEMP " + n.f1.f0.tokenImage;
	//	String tmp =this.document.getNewTemp();
		
	//	this.document.write("MOVE",tmp,res);
		return res;
	}

	/**
	 * f0 -> <INTEGER_LITERAL>
	 */
	public String visit(IntegerLiteral n) {
		
		String tmp=this.document.getNewTemp();
		this.document.write("MOVE",tmp,n.f0.tokenImage);
		return tmp;
	}

	/**
	 * f0 -> <IDENTIFIER>
	 */
	public String visit(Label n) {
		//String tmp=this.document.getNewTemp();
		this.document.write(n.f0.tokenImage);
		//this.document.write("MOVE",tmp,n.f0.tokenImage);
		return n.f0.tokenImage;
	}

}

class CodeManager {

	StringBuffer sb;
	int currentTemp, currentTab, currentLabel;
	boolean flag;

	public CodeManager() {
		sb = new StringBuffer();
		currentTemp = 0;
		currentTab = 0;
		currentLabel = 0;
		flag = false;
	}

	public CodeManager(int tmp) {
		sb = new StringBuffer();
		currentTemp = tmp;
		currentTab = 0;
		currentLabel = 0;
		flag = false;
	}

	public void write(Object... ar) {
		if (ar.length == 0)
			return;
		if (flag)
			sb.append(" ");
		else {
			for (int i = 0; i < currentTab; ++i)
				sb.append("\t");
			flag = true;
		}
		sb.append(ar[0]);
		for (int i = 1; i < ar.length; ++i) {
			sb.append(" ");
			sb.append(ar[i].toString());
		}

	}

	public void writeLabel(String lbl) {
		sb.append(lbl);
		sb.append("\n");
	}

	public String getNewLabel() {
		return "label_" + (++currentLabel);
	}

	public String getNewTemp() {
		return "TEMP " + (currentTemp++);
	}

	public void writeEnd() {
		for (int i = 0; i < currentTab; ++i)
			sb.append("\t");
		sb.append("END");
		currentTab = currentTab - 1;
		flag = true;
	}

	public void writeBegin() {
		sb.append("\n");
		currentTab = currentTab + 1;
		for (int i = 0; i < currentTab; ++i)
			sb.append("\t");
		sb.append("BEGIN");
		flag = true;
	}

	public void newline() {
		sb.append("\n");
		flag = false;
	}

}