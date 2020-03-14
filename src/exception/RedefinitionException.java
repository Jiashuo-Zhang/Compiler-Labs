package exception;

public class RedefinitionException extends Exception {
	public RedefinitionException() {
		super("Confilct Declarations.");
	}

	public RedefinitionException(String env, String name, int row, int col) {
		super("Confilct " + env + " Declarations: " + name + " at row " + row + " col " + col + ".");
	}
}
