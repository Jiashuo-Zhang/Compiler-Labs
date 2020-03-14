package symboltable;

public class MVar extends MIdentifier {
	public MVar() {

	}

	public MVar(MIdentifier p, String name, String type, int r, int c) {
		super(p, name, type, r, c);
	}

	public MVar(String name, String type, int r, int c) {
		super(name, type, r, c);
		this.setParent(null);
	}
}