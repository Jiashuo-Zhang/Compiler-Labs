package Minijava;
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
			String s = fileRead(new File(args[0]));
			if (s.indexOf("TE") == -1)
				System.out.println("No error in source code!");
			else
				System.out.println("Error in source code!");
			System.out.println("###################### Source Code ###################### ");
			System.out.println(s);
			InputStream in = new FileInputStream(args[0]);
			Node root = new MiniJavaParser(in).Goal();
			//System.out.println("########### Begin to build the Symbol Table! ############ ");
			MClassList classList = new MClassList();
			root.accept(new SymbolTableBuilder(), classList);
			//System.out.println("################# Symbol Table is Built! ################ ");
			classList.checkSymbolTable();
			root.accept(new UndefinedIdentifierVisitor(), classList);
			root.accept(new TypeCheckVisitor(), classList);
		} catch (ParseException e) {
			e.printStackTrace();
		} catch (TokenMgrError e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static String fileRead(File file) throws IOException {
		BufferedReader br = new BufferedReader(new FileReader(file));// newһ��BufferedReader���󣬽��ļ����ݶ�ȡ������
		StringBuilder sb = new StringBuilder();// ����һ���ַ������棬���ַ�����Ż�����
		String s = null;
		while ((s = br.readLine()) != null) {// ���ж�ȡ�ļ����ݣ�����ȡ���з���ĩβ�Ŀո�
			sb.append(s + "\n");// ����ȡ���ַ�����ӻ��з����ۼӴ���ڻ�����
		}
		br.close();
		return sb.toString();
	}

}
