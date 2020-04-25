package minijava2piglet;

import java.io.ByteArrayInputStream;
import Minijava.*;
import java.io.InputStream;
import java.io.*;
import visitor.*;
import syntaxtree.*;
import symboltable.*;

public class Minijava2Piglet {
	public static String translate(String s) {
 		InputStream in = new ByteArrayInputStream(s.getBytes());
 		try {
			
			if (s.indexOf("TE") == -1)
				System.out.println("No error in source code!");
			else
				System.out.println("Error in source code!");
			System.out.println("###################### Source Code ###################### ");
			System.out.println(s);
			
			Node root = new MiniJavaParser(in).Goal();
			//System.out.println("########### Begin to build the Symbol Table! ############ ");
			MClassList classList = new MClassList();
			root.accept(new SymbolTableBuilder(), classList);
			//System.out.println("################# Symbol Table is Built! ################ ");
			classList.checkSymbolTable();
			root.accept(new UndefinedIdentifierVisitor(), classList);
			root.accept(new TypeCheckVisitor(), classList);

			ToPigletVisitor v = new ToPigletVisitor();
			classList.buildVDTable();
			//classList.alloc(20);
			int p=classList.alloc(20);
			v.setAllClassList(classList);
			v.setDocumentCurrentTemp(p);
			root.accept(v,classList);
			return v.GetPigletCode();

		} catch (ParseException e) {
			e.printStackTrace();
		} catch (TokenMgrError e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}

 		


		return null;
	}
}