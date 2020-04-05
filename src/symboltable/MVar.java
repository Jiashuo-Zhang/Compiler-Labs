package symboltable;

public class MVar extends MIdentifier {
	
	boolean isMember, isParam, isLocal;
	
	int offset;
	
	public MVar() {
		isMember = false;
		isParam = false;
		isLocal = false;
		offset = 0;
	}

	public MVar(MIdentifier p, String name, String type, int r, int c) {
		super(p, name, type, r, c);
	}

	public MVar(String name, String type, int r, int c) {
		super(name, type, r, c);
		this.setParent(null);
	}

	public boolean isMember() {
		return isMember;
	}

	public boolean isParam() {
		return isParam;
	}

	public boolean isLocal() {
		return isLocal;
	}

	public int getOffset() {
		return offset;
	}
}