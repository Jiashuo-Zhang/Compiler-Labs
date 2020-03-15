package exception;

public class MismatchException extends Exception {
	public MismatchException() {
		super("Type Mismatched.");
	}

	public MismatchException(String expect, String pass, int row, int col) {
		super("Type Mismatched: Expected type " + expect + ", but type " + pass + " passed at row " + row + " col "
				+ col + ".");
	}

	public MismatchException(int expect, int pass, int row, int col) {
		super("Parameter Mismatched: Expected " + expect + " parameter(s), but passed " + pass + " parameter(s) at row "
				+ row + " col " + col + ".");
	}
}
