package visitor;

import symboltable.MClass;
import symboltable.MClassList;
import symboltable.MMethod;
import symboltable.MType;
import symboltable.MVar;
import syntaxtree.AndExpression;
import syntaxtree.ArrayAllocationExpression;
import syntaxtree.ArrayAssignmentStatement;
import syntaxtree.ArrayLength;
import syntaxtree.ArrayLookup;
import syntaxtree.AssignmentStatement;
import syntaxtree.ClassDeclaration;
import syntaxtree.ClassExtendsDeclaration;
import syntaxtree.CompareExpression;
import syntaxtree.FalseLiteral;
import syntaxtree.Goal;
import syntaxtree.Identifier;
import syntaxtree.IfStatement;
import syntaxtree.IntegerLiteral;
import syntaxtree.MainClass;
import syntaxtree.MethodDeclaration;
import syntaxtree.MinusExpression;
import syntaxtree.NotExpression;
import syntaxtree.PlusExpression;
import syntaxtree.PrintStatement;
import syntaxtree.ThisExpression;
import syntaxtree.TimesExpression;
import syntaxtree.TrueLiteral;
import syntaxtree.WhileStatement;

public class ToPigletVisitor extends GJVoidDepthFirst<MType> {

	MClassList allClassList = null;

	CodeManager document = null;

	public ToPigletVisitor() {
		document = new CodeManager();
	}

	/**
	 * f0 -> MainClass() f1 -> ( TypeDeclaration() )* f2 -> <EOF>
	 */
	public void visit(Goal n, MType argu) {
		allClassList = (MClassList) argu;
		n.f0.accept(this, argu);
		n.f1.accept(this, argu);
	}

	/**
	 * f0 -> "class" f1 -> Identifier() f2 -> "{" f3 -> "public" f4 -> "static" f5
	 * -> "void" f6 -> "main" f7 -> "(" f8 -> "String" f9 -> "[" f10 -> "]" f11 ->
	 * Identifier() f12 -> ")" f13 -> "{" f14 -> ( VarDeclaration() )* f15 -> (
	 * Statement() )* f16 -> "}" f17 -> "}"
	 */
	public void visit(MainClass n, MType argu) {
		document.write("MAIN");
		document.newline();

		MClass mclass = allClassList.getClass(n.f1.f0.toString());
		MMethod mmethod = mclass.getMethod("main");

		n.f15.accept(this, mmethod);

		document.write("END");
		document.newline();
	}

	/**
	 * f0 -> "class" f1 -> Identifier() f2 -> "{" f3 -> ( VarDeclaration() )* f4 ->
	 * ( MethodDeclaration() )* f5 -> "}"
	 */
	public void visit(ClassDeclaration n, MType argu) {
		MClass mclass = allClassList.getClass(n.f1.f0.toString());
		n.f4.accept(this, mclass);
	}

	/**
	 * f0 -> "class" f1 -> Identifier() f2 -> "extends" f3 -> Identifier() f4 -> "{"
	 * f5 -> ( VarDeclaration() )* f6 -> ( MethodDeclaration() )* f7 -> "}"
	 */
	public void visit(ClassExtendsDeclaration n, MType argu) {
		MClass mclass = allClassList.getClass(n.f1.f0.toString());
		n.f6.accept(this, mclass);
	}

	/**
	 * f0 -> "public" f1 -> Type() f2 -> Identifier() f3 -> "(" f4 -> (
	 * FormalParameterList() )? f5 -> ")" f6 -> "{" f7 -> ( VarDeclaration() )* f8
	 * -> ( Statement() )* f9 -> "return" f10 -> Expression() f11 -> ";" f12 -> "}"
	 */
	public void visit(MethodDeclaration n, MType argu) {
		MMethod mmethod = ((MClass) argu).getMethod(n.f2.f0.toString());

		document.newline();

		document.write(mmethod.getPigletDefineName());

		document.writeBegin();
		document.newline();

		n.f8.accept(this, mmethod);

		document.write("RETURN");
		n.f10.accept(this, mmethod);
		document.newline();

		document.writeEnd();
		document.newline();
	}

	/**
	 * f0 -> Identifier() f1 -> "=" f2 -> Expression() f3 -> ";"
	 */
	public void visit(AssignmentStatement n, MType argu) {
		MVar mvar = ((MMethod) argu).getVar(n.f0.f0.toString());
		if (mvar.isMember()) {
			document.write("HSTORE TEMP 0", mvar.getOffset());
		} else if (mvar.isParam()) {
			if (((MMethod) argu).getParamList().size() >= 20 && mvar.getOffset() >= 19) {
				document.write("HSTORE TEMP 19", 4 * (mvar.getOffset() - 19));
			} else {
				document.write("MOVE");
				n.f0.accept(this, argu);
			}
		} else if (mvar.isLocal()) {
			document.write("MOVE");
			n.f0.accept(this, argu);
		}
		n.f2.accept(this, argu);
		document.newline();
	}

	/**
	 * f0 -> Identifier() f1 -> "[" f2 -> Expression() f3 -> "]" f4 -> "=" f5 ->
	 * Expression() f6 -> ";"
	 */
	public void visit(ArrayAssignmentStatement n, MType argu) {
		String tmp1 = document.getNewTemp();
		document.write("MOVE", tmp1);
		n.f0.accept(this, argu);
		document.newline();

		String tmp2 = document.getNewTemp();
		document.write("MOVE", tmp2, "PLUS 4 TIMES 4");
		n.f2.accept(this, argu);
		document.newline();

		document.write("MOVE", tmp1, "PLUS", tmp1, tmp2);
		document.newline();

		document.write("HSTORE", tmp1, 0);
		n.f5.accept(this, argu);
		document.newline();
	}

	/**
	 * f0 -> "if" f1 -> "(" f2 -> Expression() f3 -> ")" f4 -> Statement() f5 ->
	 * "else" f6 -> Statement()
	 */
	public void visit(IfStatement n, MType argu) {
		document.write("CJUMP");
		n.f2.accept(this, argu);
		String lbl1 = document.getNewLabel();
		document.write(lbl1);
		document.newline();

		n.f4.accept(this, argu);

		String lbl2 = document.getNewLabel();
		document.write("JUMP", lbl2);
		document.newline();

		document.writeLabel(lbl1);

		n.f6.accept(this, argu);

		document.writeLabel(lbl2);

		document.write("NOOP");
		document.newline();
	}

	/**
	 * f0 -> "while" f1 -> "(" f2 -> Expression() f3 -> ")" f4 -> Statement()
	 */
	public void visit(WhileStatement n, MType argu) {
		String lbl1 = document.getNewLabel();
		document.writeLabel(lbl1);

		document.write("CJUMP");
		n.f2.accept(this, argu);
		String lbl2 = document.getNewLabel();
		document.write(lbl2);
		document.newline();

		n.f4.accept(this, argu);

		document.write("JUMP", lbl1);
		document.newline();

		document.writeLabel(lbl2);

		document.write("NOOP");
		document.newline();
	}

	/**
	 * f0 -> "System.out.println" f1 -> "(" f2 -> Expression() f3 -> ")" f4 -> ";"
	 */
	public void visit(PrintStatement n, MType argu) {
		document.write("PRINT");
		n.f2.accept(this, argu);
		document.newline();
	}

	/**
	 * f0 -> PrimaryExpression() f1 -> "&&" f2 -> PrimaryExpression()
	 */
	public void visit(AndExpression n, MType argu) {
		document.writeBegin();
		document.newline();

		String tmp1 = document.getNewTemp();
		document.write("MOVE", tmp1);
		n.f0.accept(this, argu);
		document.newline();

		String lbl1 = document.getNewLabel();
		document.write("CJUMP", tmp1, lbl1);
		document.newline();

		String tmp2 = document.getNewTemp();
		document.write("MOVE", tmp2);
		n.f2.accept(this, argu);
		document.newline();

		document.write("CJUMP", tmp2, lbl1);
		document.newline();

		String tmp3 = document.getNewTemp();
		document.write("MOVE", tmp3, 1);
		document.newline();

		String lbl2 = document.getNewLabel();
		document.write("JUMP", lbl2);
		document.newline();

		document.writeLabel(lbl1);

		document.write("MOVE", tmp3, 0);
		document.newline();

		document.writeLabel(lbl2);

		document.write("NOOP");
		document.newline();

		document.write("RETURN", tmp3);
		document.newline();

		document.writeEnd();
	}

	/**
	 * f0 -> PrimaryExpression() f1 -> "<" f2 -> PrimaryExpression()
	 */
	public void visit(CompareExpression n, MType argu) {
		document.write("LT");
		n.f0.accept(this, argu);
		n.f2.accept(this, argu);
	}

	/**
	 * f0 -> PrimaryExpression() f1 -> "+" f2 -> PrimaryExpression()
	 */
	public void visit(PlusExpression n, MType argu) {
		document.write("PLUS");
		n.f0.accept(this, argu);
		n.f2.accept(this, argu);
	}

	/**
	 * f0 -> PrimaryExpression() f1 -> "-" f2 -> PrimaryExpression()
	 */
	public void visit(MinusExpression n, MType argu) {
		document.write("MINUS");
		n.f0.accept(this, argu);
		n.f2.accept(this, argu);
	}

	/**
	 * f0 -> PrimaryExpression() f1 -> "*" f2 -> PrimaryExpression()
	 */
	public void visit(TimesExpression n, MType argu) {
		document.write("TIMES");
		n.f0.accept(this, argu);
		n.f2.accept(this, argu);
	}

	/**
	 * f0 -> PrimaryExpression() f1 -> "[" f2 -> PrimaryExpression() f3 -> "]"
	 */
	public void visit(ArrayLookup n, MType argu) {
		document.writeBegin();
		document.newline();

		String tmp1 = document.getNewTemp();
		document.write("MOVE", tmp1);
		n.f0.accept(this, argu);
		document.newline();

		String tmp2 = document.getNewTemp();
		document.write("MOVE", tmp2, "PLUS 4 TIMES 4");
		n.f2.accept(this, argu);
		document.newline();

		document.write("MOVE", tmp1, "PLUS", tmp1, tmp2);
		document.newline();

		String tmp3 = document.getNewTemp();
		document.write("HLOAD", tmp3, tmp1, 0);
		document.newline();

		document.write("RETURN", tmp3);
		document.newline();

		document.writeEnd();
	}

	/**
	 * f0 -> PrimaryExpression() f1 -> "." f2 -> "length"
	 */
	public void visit(ArrayLength n, MType argu) {
		document.writeBegin();
		document.newline();

		String tmp1 = document.getNewTemp();
		document.write("MOVE", tmp1);
		n.f0.accept(this, argu);
		document.newline();

		String tmp2 = document.getNewTemp();
		document.write("HLOAD", tmp2, tmp1, 0);
		document.newline();

		document.write("RETURN", tmp2);
		document.newline();

		document.writeEnd();
	}

	/**
	 * f0 -> <INTEGER_LITERAL>
	 */
	public void visit(IntegerLiteral n, MType argu) {
		document.write(n.f0.toString());
	}

	/**
	 * f0 -> "true"
	 */
	public void visit(TrueLiteral n, MType argu) {
		document.write(1);
	}

	/**
	 * f0 -> "false"
	 */
	public void visit(FalseLiteral n, MType argu) {
		document.write(0);
	}

	/**
	 * f0 -> <IDENTIFIER>
	 */
	public void visit(Identifier n, MType argu) {
		MVar mvar = ((MMethod) argu).getVar(n.f0.toString());
		if (mvar.isMember()) {
			document.writeBegin();
			document.newline();

			String tmp1 = document.getNewTemp();
			document.write("HLOAD", tmp1, "TEMP 0", mvar.getOffset());
			document.newline();

			document.write("RETURN", tmp1);
			document.newline();

			document.writeEnd();
		} else if (mvar.isParam()) {
			if (((MMethod) argu).getParamList().size() >= 20 && mvar.getOffset() >= 19) {
				document.writeBegin();
				document.newline();

				String tmp1 = document.getNewTemp();
				document.write("HLOAD", tmp1, "TEMP 19", 4 * (mvar.getOffset() - 19));
				document.newline();

				document.write("RETURN", tmp1);
				document.newline();

				document.writeEnd();
			} else {
				document.write("TEMP", mvar.getOffset());
			}
		} else if (mvar.isLocal()) {
			document.write("TEMP", mvar.getOffset());
		}
	}

	/**
	 * f0 -> "this"
	 */
	public void visit(ThisExpression n, MType argu) {
		document.write("TEMP 0");
	}

	/**
	 * f0 -> "new" f1 -> "int" f2 -> "[" f3 -> Expression() f4 -> "]"
	 */
	public void visit(ArrayAllocationExpression n, MType argu) {
		document.writeBegin();
		document.newline();

		String tmp1 = document.getNewTemp();
		document.write("MOVE", tmp1);
		n.f3.accept(this, argu);
		document.newline();

		String tmp2 = document.getNewTemp();
		document.write("MOVE", tmp2, "PLUS 4 TIMES 4", tmp1);
		document.newline();

		String tmp3 = document.getNewTemp();
		document.write("MOVE", tmp3, "HALLOCATE", tmp2);
		document.newline();

		document.write("HSTORE", tmp3, 0, tmp1);
		document.newline();

		document.write("RETURN", tmp3);
		document.newline();

		document.writeEnd();
	}

	/**
	 * f0 -> "!" f1 -> Expression()
	 */
	public void visit(NotExpression n, MType argu) {
		document.write("MINUS 1");
		n.f1.accept(this, argu);
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
				sb.append("	");
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
			sb.append("	");
		sb.append("END");
		currentTab = currentTab - 1;
	}

	public void writeBegin() {
		sb.append("\n");
		currentTab = currentTab + 1;
		for (int i = 0; i < currentTab; ++i)
			sb.append("	");
		sb.append("BEGIN");
	}

	public void newline() {
		sb.append("\n");
		flag = false;
	}

}