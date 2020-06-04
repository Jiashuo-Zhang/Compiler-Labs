package kanga2mips;

public class Environment {
	public CodeManager document;
	public boolean isInStmt;

	public Environment(Integer t) {
		document = new CodeManager(t);
		isInStmt = false;
	}
}
