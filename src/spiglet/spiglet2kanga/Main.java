package spiglet2kanga;
import visitor.*;
import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;

import spiglet.SpigletParser;
import syntaxtree.Node;
import visitor.EnvironmentBuilder;

public class Main {
	public static void main(String[] args) throws IOException {
		String s = fileRead(new File(args[0]));
		InputStream in = new ByteArrayInputStream(s.getBytes());
 		try {
			Node root = new SpigletParser(in).Goal();
			Environment env = new Environment();
			EnvironmentBuilder eb = new EnvironmentBuilder();
			root.accept(eb, env);
			env.buildFlowGraph();
			env.livenessAnalysis();
			env.allocReg();
			//env.debug();
			spiglet2kangaVisitor visitor=new spiglet2kangaVisitor();
			root.accept(visitor,env);
			System.out.println(env.document.sb);
			
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
