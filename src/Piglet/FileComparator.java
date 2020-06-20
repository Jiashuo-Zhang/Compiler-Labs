// ####
import java.io.File;
import java.io.FileWriter;
import java.io.FileReader;
import java.io.IOException;
import java.util.Vector;
import java.util.Scanner;
import java.security.MessageDigest;

// ####
public class FileComparator
{
	// ####
	public static void main(String args[]) {
		try {
			FileReader ra = new FileReader(args[0]);
			FileReader rb = new FileReader(args[1]);
			int a, b;
			do {
				a = ra.read();
				b = rb.read();
			} while (a == b && a != -1);
			System.out.println(a == -1 && b == -1);
		} catch (Exception e) {
		}
	}

}
