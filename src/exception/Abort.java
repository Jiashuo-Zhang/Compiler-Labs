package exception;

public class Abort {
	public static void abort(Exception e) {
		System.out.println(e.getMessage());
		System.exit(0);
	}
}
