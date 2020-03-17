import java.io.*;
import visitor.*;
import syntaxtree.*;
import symboltable.*;

class MyVisitor extends DepthFirstVisitor {
	public void visit(VarDeclaration n) {
		Identifier id = (Identifier) n.f1;
		System.out.println("VarName: " + id.f0.toString());
		n.f0.accept(this);
		n.f1.accept(this);
		n.f2.accept(this);
	}
}

public class Main {
	public static void main(String args[]) {
		try {
			InputStream in = new FileInputStream(args[0]);
			Node root = new MiniJavaParser(in).Goal();
			System.out.println("########### Begin to build the Symbol Table! ############ ");
			MClassList classList = new MClassList();
			root.accept(new SymbolTableBuilder(), classList);
			System.out.println("################# Symbol Table is Built! ################ ");
			classList.checkSymbolTable();
			root.accept(new UndefinedIdentifierVisitor(), classList);
			root.accept(new TypeCheckVisitor(), classList);
			System.out.println("No Error!");
		} catch (ParseException e) {
			e.printStackTrace();
		} catch (TokenMgrError e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
