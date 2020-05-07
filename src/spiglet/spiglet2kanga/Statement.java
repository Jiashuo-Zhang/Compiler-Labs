package spiglet2kanga;

import java.util.HashSet;
import java.util.Set;

public class Statement {
	public Set<Integer> in, out, use;
	public String type, label;
	public Statement nextStmt1, nextStmt2;
	public Integer def, nextID1, nextID2, ID;

	public Statement(String _type) {
		this.type = _type;
		use = new HashSet<Integer>();
		in = new HashSet<Integer>();
		out = new HashSet<Integer>();
	}

	public void setType(String type) {
		this.type = type;
	}

	public void addUsedTemp(int t) {
		use.add(t);
	}

	public void addUsedTemp(String t) {
		use.add(Integer.valueOf(t));
	}

	public void debug() {
		System.out.println(
				"id: " + ID + ", stmt type: " + type + ", {" + "use: " + use + ", label: " + label + ", def: " + def
						+ ", nextID1: " + nextID1 + ", nextID2: " + nextID2 + ", in: " + in + ", out: " + out + "}");
	}
}
