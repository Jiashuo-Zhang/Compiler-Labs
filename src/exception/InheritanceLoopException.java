package exception;

public class InheritanceLoopException extends Exception {
	public InheritanceLoopException() {
		super("Inheritance Loop Detected.");
	}

	public InheritanceLoopException(String name, int row, int col) {
		super("Inheritance Loop Detected: Class " + name + " is in the loop at row " + row + " col " + col + ".");
	}
}
