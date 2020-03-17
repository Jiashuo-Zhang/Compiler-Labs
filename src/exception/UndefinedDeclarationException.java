package exception;

public class UndefinedDeclarationException extends Exception {
	public UndefinedDeclarationException() {
		super("Undefined Type Declarations.");
	}

	public UndefinedDeclarationException(String type, int row, int col) {
		super("Undefined Type Declaration: " + type + " at row " + row + " col " + col + ".");
	}
}
