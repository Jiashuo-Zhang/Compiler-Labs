package symboltable;

import exception.UndefinedDeclarationException;

public class MIdentifier extends MType {
	protected MIdentifier parent = null;
	protected String name;

	public MIdentifier() {

	}

	public MIdentifier(MIdentifier p, String n, String type, int r, int c) {
		super(type, r, c);
		name = n;
		parent = p;
	}

	public MIdentifier(String n, String type, int row, int col) {
		super(type, row, col);
		name = n;
	}

	public MIdentifier(String n, int row, int col) {
		super(null, row, col);
		name = n;
	}

	public MIdentifier getParent() {
		return parent;
	}

	public void setParent(MIdentifier p) {
		parent = p;
	}

	public String getName() {
		return name;
	}

	public void setName(String n) {
		name = n;
	}

	public void checkTypeDeclared(String type, MClassList classList, int row, int col)
			throws UndefinedDeclarationException {
		if (type.equals("int") || type.equals("int[]") || type.equals("boolean") || type.equals("void")
				|| type.equals("String[]"))
			return;
		if (!classList.hasClass(type))
			throw new UndefinedDeclarationException(type, row, col);
	}
}