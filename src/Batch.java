import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.InputStream;
import java.io.InputStreamReader;

public class Batch {
	public static void main(String args[]) {
		for (int i = 0; i < 100; ++i) {
			String in = "testcases/test" + String.format("%02d", i) + ".java";
			String to = "results/test" + String.format("%02d", i) + ".txt";
			File file = new File(to);
			try {
				file.createNewFile();
				BufferedWriter out = new BufferedWriter(new FileWriter(file));
				out.write(run(in));
				out.flush();
				out.close();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	public static String run(String path) throws Exception {
		Process process = Runtime.getRuntime().exec(new String[] { "java", "-jar", "main.jar", path });
		process.getOutputStream().close();
		InputStream fis = process.getInputStream();
		BufferedReader br = new BufferedReader(new InputStreamReader(fis));
		String line = null;
		String buffer = "";
		while ((line = br.readLine()) != null) {
			buffer = buffer + line + '\n';
		}
		return buffer;
	}
}
