package visitor;
import spiglet2kanga.*;
import syntaxtree.BinOp;
import syntaxtree.CJumpStmt;
import syntaxtree.Call;
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
import syntaxtree.Operator;
import syntaxtree.PrintStmt;
import syntaxtree.Procedure;
import syntaxtree.SimpleExp;
import syntaxtree.Stmt;
import syntaxtree.StmtExp;
import syntaxtree.StmtList;
import syntaxtree.Temp;
public class spiglet2kangaVisitor extends GJDepthFirst<String, Environment>
{
	//
	   // User-generated visitor methods below
	   //

	   /**
	    * f0 -> "MAIN"
	    * f1 -> StmtList()
	    * f2 -> "END"
	    * f3 -> ( Procedure() )*
	    * f4 -> <EOF>
	    */
	   public String visit(Goal n, Environment argu) {
	      String _ret=null;
	      argu.setFunc("MAIN");
	      String decl="MAIN[0]["+argu.currentFunc.spilledCnt+"]"+"[20]";
	      argu.document.write(decl);
	      argu.document.newline();
	      n.f1.accept(this, argu);
	      argu.document.writeEnd();
	      argu.document.newline();
	      n.f3.accept(this, argu);
	      return _ret;
	   }

	   /**
	    * f0 -> ( ( Label() )? Stmt() )*
	    */
	   public String visit(StmtList n, Environment argu) {
	      String _ret=null;
	      n.f0.accept(this, argu);
	      return _ret;
	   }

	   /**
	    * f0 -> Label()
	    * f1 -> "["
	    * f2 -> IntegerLiteral()
	    * f3 -> "]"
	    * f4 -> StmtExp()
	    */
	   public String visit(Procedure n, Environment argu) {
	      String _ret=null;
	      argu.setFunc(n.f0.f0.tokenImage);///TODO:spilledCnt? 
	      String decl=n.f0.f0.tokenImage+"["+argu.currentFunc.paraCnt+"]"+"["+(argu.currentFunc.spilledCnt+16)+"]";
	      decl += "[20]";
	      argu.document.write(decl);
	      argu.document.newline();
	      int para=Math.max(0,argu.currentFunc.paraCnt-4);
	      for(int i=0;i<16;i++)
	      {
	    	  argu.document.write("ASTORE SPILLEDARG "+(argu.currentFunc.spilledCnt+i)+" "+argu.currentFunc.getRegName(i));
	    	  argu.document.newline();
	      }
	      for (int i = 0; i < argu.currentFunc.paraCnt; i++) 
	      {
			  if (i < 4) 
			  {
		    	  if(argu.currentFunc.isSpilled(i)==1)
		    	  {
		    		  argu.document.write("ASTORE",argu.currentFunc.queryReg(i),"a"+i);
		    		  argu.document.newline();
		    	  }
		    	  else if(argu.currentFunc.isSpilled(i)==0)
		    	  {
		    		  argu.document.write("MOVE",argu.currentFunc.queryReg(i),"a"+i);
		    		  argu.document.newline();
		    	  }
			  }
			  /*else 
			  {
				  if(argu.currentFunc.isSpilled(i)==1)
		    	  {
					  argu.document.write("ALOAD","v0","SPILLEDARG "+(i-4));
					  argu.document.newline();
		    		  argu.document.write("ASTORE",argu.currentFunc.queryReg(i),"v0");
		    		  argu.document.newline();
		    	  }
		    	  else if(argu.currentFunc.isSpilled(i)==0)
		    	  {
		    		  argu.document.write("ALOAD",argu.currentFunc.queryReg(i),"SPILLEDARG "+(i-4));
		    		  argu.document.newline();
		    	  }
			  }*/
		  }
	      n.f4.accept(this, argu);
	      
	      for(int i=0;i<16;i++)//TODO:18?
	      {
	    	  argu.document.write("ALOAD",argu.currentFunc.getRegName(i),"SPILLEDARG",(para+i));
	    	  argu.document.newline();
	      }
	      argu.document.writeEnd();
	      argu.document.newline();
	      return _ret;
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
	   public String visit(Stmt n, Environment argu) {
	      String _ret=null;
	      argu.isInStmt=true;
	      argu.isParam=-1;
	      n.f0.accept(this, argu);
	      argu.isInStmt=false;
	      return _ret;
	   }

	   /**
	    * f0 -> "NOOP"
	    */
	   public String visit(NoOpStmt n, Environment argu) {
	      String _ret=null;
	      argu.document.write("NOOP");
	      argu.document.newline();
	      return _ret;
	   }

	   /**
	    * f0 -> "ERROR"
	    */
	   public String visit(ErrorStmt n, Environment argu) {
	      String _ret=null;
	      argu.document.write("ERROR");
	      argu.document.newline();
	      return _ret;
	   }

	   /**
	    * f0 -> "CJUMP"
	    * f1 -> Temp()
	    * f2 -> Label()
	    */
	   public String visit(CJumpStmt n, Environment argu) {
	      String _ret=null;
	      String tmp =n.f1.accept(this, argu);
	      argu.document.write("CJUMP",tmp,n.f2.f0.tokenImage);
	      argu.document.newline();
	      return _ret;
	   }

	   /**
	    * f0 -> "JUMP"
	    * f1 -> Label()
	    */
	   public String visit(JumpStmt n, Environment argu) {
	      String _ret=null;
	      argu.document.write("JUMP",n.f1.f0.tokenImage);
	      argu.document.newline();
	      return _ret;
	   }

	   /**
	    * f0 -> "HSTORE"
	    * f1 -> Temp()
	    * f2 -> IntegerLiteral()
	    * f3 -> Temp()
	    */
	   public String visit(HStoreStmt n, Environment argu) {
	      String _ret=null;
	      String tmp1=n.f1.accept(this,argu);
	      argu.document.write("MOVE","v1",tmp1);
	      argu.document.newline();
	      String tmp2=n.f3.accept(this, argu);//////TODO
	      argu.document.write("HSTORE","v1",n.f2.f0.tokenImage,tmp2);
	      argu.document.newline();
	      return _ret;
	   }

	   /**
	    * f0 -> "HLOAD"
	    * f1 -> Temp()
	    * f2 -> Temp()
	    * f3 -> IntegerLiteral()
	    */
	   public String visit(HLoadStmt n, Environment argu) {
	      String _ret=null;
	     
	      String tmp2=n.f2.accept(this, argu);
	      int num1=Integer.valueOf(n.f1.f1.f0.tokenImage);
	      if(argu.currentFunc.isSpilled(num1)==1)//spilled
	      {
	    	  String tmp;
	    	  if(tmp2=="t9")
	    	  {
	    		  tmp="v0";
	    	  }
	    	  else
	    	  {
	    		  tmp="t9";
	    	  }
	    	  argu.document.write("HLOAD",tmp,tmp2,n.f3.f0.tokenImage);
	    	  argu.document.newline();
	    	  argu.document.write("ASTORE",argu.currentFunc.queryReg(num1),tmp);
	    	  argu.document.newline();
	      }
	      else 	if(argu.currentFunc.isSpilled(num1)==0)
	      {
	    	 argu.document.write("HLOAD",argu.currentFunc.queryReg(num1),tmp2,n.f3.f0.tokenImage);
	    	 argu.document.newline();
	      }
	      return _ret;
	   }

	   /**
	    * f0 -> "MOVE"
	    * f1 -> Temp()
	    * f2 -> Exp()
	    */
	   public String visit(MoveStmt n, Environment argu) {
	      String _ret=null;
	      int num1=Integer.valueOf(n.f1.f1.f0.tokenImage);
	      //default: Move t8 Expr;
	      String tmp=n.f2.accept(this,argu);
	      //argu.document.write("MOVE");
	     // argu.document.newline();
	      
	      if(argu.currentFunc.isSpilled(num1)==1)//spilled
	      {
	    	  argu.document.write("ASTORE",argu.currentFunc.queryReg(num1),tmp);
	      }
	      else 	 if(argu.currentFunc.isSpilled(num1)==0)
	      {
	    	 argu.document.write("MOVE",argu.currentFunc.queryReg(num1),tmp);
	      }
	      argu.document.newline();
	      
	      return _ret;
	   }

	   /**
	    * f0 -> "PRINT"
	    * f1 -> SimpleExp()
	    */
	   public String visit(PrintStmt n, Environment argu) {
	      String _ret=null;
	     // n.f0.accept(this, argu);
	      String tmp= n.f1.accept(this, argu);
	      argu.document.write("PRINT",tmp); 
	      argu.document.newline();
	      return _ret;
	   }

	   /**
	    * f0 -> Call()
	    *       | HAllocate()
	    *       | BinOp()
	    *       | SimpleExp()
	    */
	   public String visit(Exp n, Environment argu) {
	     
	      return  n.f0.accept(this, argu);
	   }

	   /**
	    * f0 -> "BEGIN"
	    * f1 -> StmtList()
	    * f2 -> "RETURN"
	    * f3 -> SimpleExp()
	    * f4 -> "END"
	    */
	   public String visit(StmtExp n, Environment argu) {
	      String _ret=null;
	     // n.f0.accept(this, argu);
	      n.f1.accept(this, argu);
	     // n.f2.accept(this, argu);
	      String tmp=n.f3.accept(this, argu);
	      argu.document.write("MOVE","v0",tmp);
	      argu.document.newline();
	      _ret="v0";
	      //n.f4.accept(this, argu);
	      return _ret;
	   }

	   /**
	    * f0 -> "CALL"
	    * f1 -> SimpleExp()
	    * f2 -> "("
	    * f3 -> ( Temp() )*
	    * f4 -> ")"
	    */
	   public String visit(Call n, Environment argu) {
	      String _ret=null;
	      argu.isParam=0;/////-1 is not 
	      n.f3.accept(this, argu);  
	      argu.isParam=-1;
	      String tmp=n.f1.accept(this, argu);
	      argu.document.write("CALL",tmp);//TODO Move r1 Label?
	      argu.document.newline();
	    
	      //argu.document.write("MOVE","t8","v0");///TODO: 2 return value?
	     // argu.document.newline();
	      _ret="v0";
	    
	      return _ret;
	   }

	   /**
	    * f0 -> "HALLOCATE"
	    * f1 -> SimpleExp()
	    */
	   public String visit(HAllocate n, Environment argu) {
	      String _ret=null;
	    //  n.f0.accept(this, argu);
	      String tmp=n.f1.accept(this, argu);
	      argu.document.write("MOVE","t8","HALLOCATE",tmp);
	      argu.document.newline();
	      _ret="t8";
	      return _ret;
	   }

	   /**
	    * f0 -> Operator()
	    * f1 -> Temp()
	    * f2 -> SimpleExp()
	    */
	   public String visit(BinOp n, Environment argu) {
	      String _ret=null;
	      String tmp1=n.f1.accept(this,argu);
	      argu.document.write("MOVE","v1",tmp1);
	      argu.document.newline();
	      String tmp2=n.f2.accept(this, argu);
	      String op=n.f0.accept(this,argu);
	      argu.document.write("MOVE","t8",op,"v1",tmp2);
	      argu.document.newline();
	      _ret="t8";
	      return _ret;
	   }

	   /**
	    * f0 -> "LT"
	    *       | "PLUS"
	    *       | "MINUS"
	    *       | "TIMES"
	    */
	   public String visit(Operator n, Environment argu) {
	      String _ret=null;
	      _ret=n.f0.choice.toString();
	      return _ret;
	   }

	   /**
	    * f0 -> Temp()
	    *       | IntegerLiteral()
	    *       | Label()
	    */
	   public String visit(SimpleExp n, Environment argu) {
	      
	      return  n.f0.accept(this, argu);
	   }

	   /**
	    * f0 -> "TEMP"
	    * f1 -> IntegerLiteral()
	    */
	   public String visit(Temp n, Environment argu) {
	      String _ret=null;
	      if(argu.isParam>=0)
	      {
	    	  int t=Integer.valueOf(n.f1.f0.tokenImage);
	    	  if(argu.isParam<4)
	    	  {
			      if(argu.currentFunc.isSpilled(t)==1)
			      {
			    	  argu.document.write("ALOAD","a"+argu.isParam,argu.currentFunc.queryReg(t));
			    	  argu.document.newline();
			    	  _ret="a"+argu.isParam;
			    	  argu.isParam += 1;
			      }
			      else if(argu.currentFunc.isSpilled(t)==0)
			      {
			    	  
			    	  argu.document.write("MOVE","a"+argu.isParam,argu.currentFunc.queryReg(t));
			    	  argu.document.newline();
			    	  _ret="a"+argu.isParam;
			    	  argu.isParam += 1;
			      }
	    	  }
	    	  else
	    	  {
	    		  if(argu.currentFunc.isSpilled(t)==1)
			      {
			    	  argu.document.write("ALOAD v0",argu.currentFunc.queryReg(t));
			    	  argu.document.newline();
			    	  argu.document.write("PASSARG",argu.isParam-3,"v0");
		    		  argu.isParam+=1;
		    		  argu.document.newline();
			      }
			      else if(argu.currentFunc.isSpilled(t)==0)
			      {
			    	  argu.document.write("PASSARG",argu.isParam-3,argu.currentFunc.queryReg(t));
		    		  argu.isParam+=1;
		    		  argu.document.newline();
			      }
	    		 
	    	  }
	      }
	      else {
		      int t=Integer.valueOf(n.f1.f0.tokenImage);
		      if(argu.currentFunc.isSpilled(t)==1)
		      {
		    	  argu.document.write("ALOAD","t8",argu.currentFunc.queryReg(t));
		    	  argu.document.newline();
		    	  _ret="t8";
		      }
		      else if(argu.currentFunc.isSpilled(t)==0)
		      {
		    	  _ret=argu.currentFunc.queryReg(t);
		      }
	      }
	      
	      return _ret;
	   }

	   /**
	    * f0 -> <INTEGER_LITERAL>
	    */
	   public String visit(IntegerLiteral n, Environment argu) {
	      String _ret=n.f0.tokenImage;
	      argu.document.write("MOVE","v1",_ret);
	      argu.document.newline();
	      return "v1";
	   }

	   /**
	    * f0 -> <IDENTIFIER>
	    */
	   public String visit(Label n, Environment argu) {
	      String _ret=n.f0.tokenImage;
	      //n.f0.accept(this, argu);
	      argu.document.write("MOVE","v0",_ret);
	      argu.document.newline();
	      if(argu.isInStmt==false)
	      {
	    	  argu.document.writeLabel(_ret);
	      }
	      return _ret;
	   }
}