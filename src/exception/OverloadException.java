package exception;

public class OverloadException extends Exception {
	public OverloadException() {
		super("Method Overload Detected.");
	}

	public OverloadException(String name, String class1, String class2, int row, int col) {
		super("Method Overload Detected: Method " + name + " in class " + class1 + " and class " + class2 + " at row "
				+ row + " col " + col + ".");
	}
}
