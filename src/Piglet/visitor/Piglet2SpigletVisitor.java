package visitor;
import java.util.ArrayList;
import syntaxtree.*;

public class Piglet2SpigletVisitor extends DepthFirstVisitor
{
 CodeManager document = null;
 Piglet2SpigletVisitor()
 {
	 this.document=new CodeManager();
 }
 public void setDocumentCurrentTemp(int a)
 {
	 this.document.currentTemp=a;
	 return;
 }
 public int  getDocumentCurrentTemp()
 {
	 return this.document.currentTemp;
 }
 public CodeManager getDocument()
 {
	 return this.document;
 }
 
 
 /**
  * f0 -> "MAIN"
  * f1 -> StmtList()
  * f2 -> "END"
  * f3 -> ( Procedure() )*
  * f4 -> <EOF>
  */
 public void visit(Goal n) {
   // n.f0.accept(this);
	this.document.write("MAIN ");
	document.newline();
    n.f1.accept(this);
    document.writeEnd();
  //  n.f2.accept(this);
    n.f3.accept(this);
    //n.f4.accept(this);
 }

 /**
  * f0 -> ( ( Label() )? Stmt() )*
  */
 public void visit(StmtList n) {
    n.f0.accept(this);
 }

 /**
  * f0 -> Label()
  * f1 -> "["
  * f2 -> IntegerLiteral()
  * f3 -> "]"
  * f4 -> StmtExp()
  */
 public void visit(Procedure n) {
  //  n.f0.accept(this);
	document.write(n.f0.f0.tokenImage+"["+n.f2.f0.tokenImage+"]");
    n.f4.accept(this);
 }

 /**
  * f0 -> NoOpStmt()
  *       | ErrorStmt()
  *       | CJumpStmt()
  *       | JumpStmt()
  *       | HStoreStmt()
  *       | HLoadStmt()
  *       | MoveStmt()
  *       | PrintStmt()
  */
 public void visit(Stmt n) {
    n.f0.accept(this);
 }

 /**
  * f0 -> "NOOP"
  */
 public void visit(NoOpStmt n) {
   // n.f0.accept(this);
	 this.document.write("NOOP");
	 this.document.newline();
	 
 }

 /**
  * f0 -> "ERROR"
  */
 public void visit(ErrorStmt n) {
	this.document.write("ERROR");
	this.document.newline();
    //n.f0.accept(this);
 }

 /**
  * f0 -> "CJUMP"
  * f1 -> Exp()
  * f2 -> Label()
  */
 public void visit(CJumpStmt n) {
	
  //  n.f0.accept(this);
	 
    n.f1.accept(this);
    document.write("CJUMP ",this.document.lastTemp," ",n.f2.f0.tokenImage);
   /// n.f2.accept(this);
   // this.document.newline();
 }

 /**
  * f0 -> "JUMP"
  * f1 -> Label()
  */
 public void visit(JumpStmt n) {
	 
   // n.f0.accept(this);
	this.document.write("JUMP ",n.f1.f0.tokenImage);
	this.document.newline();
    //n.f1.accept(this);
 }

 /**
  * f0 -> "HSTORE"
  * f1 -> Exp()
  * f2 -> IntegerLiteral()
  * f3 -> Exp()
  */
 public void visit(HStoreStmt n) {
	
   // n.f0.accept(this);
    n.f1.accept(this);
    String tmp1=this.document.lastTemp;
   // n.f2.accept(this);
    n.f3.accept(this);
    String tmp2=this.document.lastTemp;
    this.document.write("HSTORE ",tmp1," ",n.f2.f0.tokenImage," ",tmp2);
    this.document.newline();
 }

 /**
  * f0 -> "HLOAD"
  * f1 -> Temp()
  * f2 -> Exp()
  * f3 -> IntegerLiteral()
  */
 public void visit(HLoadStmt n) {
	n.f2.accept(this);
	String tmp=this.document.lastTemp;
   // n.f0.accept(this);
	this.document.write("HLOAD ",tmp," ",n.f3.f0.tokenImage);
    //n.f1.accept(this);
   // n.f2.accept(this);
   // n.f3.accept(this);
 }

 /**
  * f0 -> "MOVE"
  * f1 -> Temp()
  * f2 -> Exp()
  */
 public void visit(MoveStmt n) {
	n.f2.accept(this);
	String tmp=this.document.lastTemp;
	document.write("MOVE ");
    n.f0.accept(this);
    this.document.write(" ", tmp);
    this.document.newline();
    
  //  n.f1.accept(this);
   // n.f2.accept(this);
 }

 /**
  * f0 -> "PRINT"
  * f1 -> Exp()
  */
 public void visit(PrintStmt n) {
  //  n.f0.accept(this);
    n.f1.accept(this);
    String tmp=document.lastTemp;
    document.write("PRINT ",tmp);
    this.document.newline();
 }

 /**
  * f0 -> StmtExp()
  *       | Call()
  *       | HAllocate()
  *       | BinOp()
  *       | Temp()
  *       | IntegerLiteral()
  *       | Label()
  */
 public void visit(Exp n) {
	document.write("MOVE ");
	String tmp=this.document.getNewTemp();
	document.write(tmp," ");
	Piglet2SpigletVisitor now =new Piglet2SpigletVisitor();
	now.setDocumentCurrentTemp(this.document.currentTemp);
	n.f0.accept(now);
	this.setDocumentCurrentTemp(now.getDocumentCurrentTemp());
	this.document.write(now.document.sb);
	this.document.lastTemp=tmp;
	this.document.tempList.add(tmp);
    n.f0.accept(this);
 }

 /**
  * f0 -> "BEGIN"
  * f1 -> StmtList()
  * f2 -> "RETURN"
  * f3 -> Exp()
  * f4 -> "END"
  */
 public void visit(StmtExp n) {
    this.document.writeBegin();
    n.f1.accept(this);
   // n.f2.accept(this);
    n.f3.accept(this);
    document.write("RETURN ", this.document.lastTemp);
    document.writeEnd();
    
   // n.f4.accept(this);
 }

 /**
  * f0 -> "CALL"
  * f1 -> Exp()
  * f2 -> "("
  * f3 -> ( Exp() )*
  * f4 -> ")"
  */
 public void visit(Call n) {
  //  n.f0.accept(this);
    n.f1.accept(this);
    this.document.write("CALL ",this.document.lastTemp," ","(");
    this.document.ClearTempList();
  //  n.f2.accept(this);
    n.f3.accept(this);
    for (String temp: this.document.tempList)
    {
    	document.write(temp,' ');
    }
    document.write(")");
    this.document.ClearTempList();
   // n.f4.accept(this);
 }

 /**
  * f0 -> "HALLOCATE"
  * f1 -> Exp()
  */
 public void visit(HAllocate n) {
    //n.f0.accept(this);
	 
    n.f1.accept(this);
    document.write("HALLOCATE ",this.document.lastTemp);
 }

 /**
  * f0 -> Operator()
  * f1 -> Exp()
  * f2 -> Exp()
  */
 public void visit(BinOp n) {
  //  n.f0.accept(this);
    n.f1.accept(this);
    String tmp1=this.document.lastTemp;
    n.f2.accept(this);
    String tmp2=this.document.lastTemp;
    String op=new String();
    if(n.f0.f0.which==0)
    {
    	op="LT";
    }
    else if(n.f0.f0.which==1)
    {
    	op="PLUS";
    }
    else if(n.f0.f0.which==2)
    {
    	op="MINUS";
    }
    else 
    {
    	op="TIMES";
    }
    document.write(op,' ',tmp1,' ',tmp2,' ');
    document.newline();
   // n.f2.accept(this);
 }

 /**
  * f0 -> "LT"
  *       | "PLUS"
  *       | "MINUS"
  *       | "TIMES"
  */
 public void visit(Operator n) {
    n.f0.accept(this);
 }

 /**
  * f0 -> "TEMP"
  * f1 -> IntegerLiteral()
  */
 public void visit(Temp n) {
    //n.f0.accept(this);
   // n.f1.accept(this);
	 this.document.write("TEMP ",n.f1.f0.tokenImage);
 }

 /**
  * f0 -> <INTEGER_LITERAL>
  */
 public void visit(IntegerLiteral n) {
	this.document.write(" ",n.f0.tokenImage," ");
    //n.f0.accept(this);
 }

 /**
  * f0 -> <IDENTIFIER>
  */
 public void visit(Label n) {
  //  n.f0.accept(this);
	 this.document.write(" ",n.f0.tokenImage,' ');
 }

 
 
 
 
 
 
 
 
 
 
 
 
}

class CodeManager {

 StringBuffer sb;
 int currentTemp, currentTab, currentLabel;
 boolean flag;
 
 ArrayList<String> tempList=new ArrayList<String>();
 String lastTemp=null;
 // boolean breakpoint=false;

 public CodeManager() {
  sb = new StringBuffer();
  currentTemp = 0;
  currentTab = 0;
  currentLabel = 0;
  flag = false;
 }
 public void ClearTempList()
 {
	 this.tempList=new ArrayList<String>();
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
    sb.append(" ");
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
   sb.append(" ");
  sb.append("END");
  currentTab = currentTab - 1;
  flag = true;
 }

 public void writeBegin() {
  sb.append("\n");
  currentTab = currentTab + 1;
  for (int i = 0; i < currentTab; ++i)
   sb.append(" ");
  sb.append("BEGIN");
  flag = true;
 }

 public void newline() {
  sb.append("\n");
  flag = false;
 }

}