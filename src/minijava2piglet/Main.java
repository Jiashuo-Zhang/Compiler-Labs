package minijava2piglet;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.util.Scanner;

import Minijava.ParseException;
import Minijava.TokenMgrError;


public class Main { 
 
    public static void main(String[] args) throws IOException 
    {
  
 
			String s = fileRead(new File(args[0]));
			if (s.indexOf("TE") == -1)
				System.out.println("No error in source code!");
			else
				System.out.println("Error in source code!");
			System.out.println("###################### Minijava Source Code ###################### ");
			System.out.println(s);
			String Pigletcode = Minijava2Piglet.translate(s);
			System.out.println("###################### Piglet Source Code ###################### ");
			System.out.println(Pigletcode);
			
		
    }

	public static String fileRead(File file) throws IOException {
		BufferedReader br = new BufferedReader(new FileReader(file));// newÒ»¸öBufferedReader¶ÔÏó£¬½«ÎÄ¼þÄÚÈÝ¶ÁÈ¡µ½»º´æ
		StringBuilder sb = new StringBuilder();// ¶¨ÒåÒ»¸ö×Ö·û´®»º´æ£¬½«×Ö·û´®´æ·Å»º´æÖÐ
		String s = null;
		while ((s = br.readLine()) != null) {// ÖðÐÐ¶ÁÈ¡ÎÄ¼þÄÚÈÝ£¬²»¶ÁÈ¡»»ÐÐ·ûºÍÄ©Î²µÄ¿Õ¸ñ
			sb.append(s + "\n");// ½«¶ÁÈ¡µÄ×Ö·û´®Ìí¼Ó»»ÐÐ·ûºóÀÛ¼Ó´æ·ÅÔÚ»º´æÖÐ
		}
		br.close();
		return sb.toString();
	}
}