package piglet2spiglet;

import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;

import Piglet.PigletParser;
import syntaxtree.Node;
import visitor.Piglet2SpigletVisitor;
import visitor.TempNumberVisitor;

public class Main {
	public static void main(String[] args) throws IOException {
		String s = fileRead(new File(args[0]));
		InputStream in = new ByteArrayInputStream(s.getBytes());
 		try {
			Node root = new PigletParser(in).Goal();
			TempNumberVisitor tnv = new TempNumberVisitor();
			root.accept(tnv);
			Piglet2SpigletVisitor visitor = new Piglet2SpigletVisitor();
			visitor.setDocumentCurrentTemp(tnv.getNumber() + 1);
			root.accept(visitor);
			
			System.out.println(visitor.getCode());
		} catch (Exception e) {
			e.printStackTrace();
		}
    }
	
	public static String fileRead(File file) throws IOException {
		BufferedReader br = new BufferedReader(new FileReader(file));
		StringBuilder sb = new StringBuilder();
		String s = null;
		while ((s = br.readLine()) != null) {
			sb.append(s + "\n");
		}
		br.close();
		return sb.toString();
	}
}
