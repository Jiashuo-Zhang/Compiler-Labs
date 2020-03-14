package exception;

public class UndefinedIdentifierException extends Exception {
	public UndefinedIdentifierException() {
		super("Undefined Identifiers.");
	}

	public UndefinedIdentifierException(String type, String name, int row, int col) {
		super("Undefined " + type + ": " + name + " at row " + row + " col " + col + ".");
	}
}
