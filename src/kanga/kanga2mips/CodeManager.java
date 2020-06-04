package kanga2mips;

public class CodeManager {
	StringBuffer sb;
	int tabCount;
	boolean flag;

	public CodeManager() {
		sb = new StringBuffer();
		tabCount = 0;
		flag = false;
	}

	public CodeManager(int t) {
		sb = new StringBuffer();
		tabCount = (t + 3) / 4;
		flag = false;
	}

	public void write(Object... ar) {
		if (ar.length == 0)
			return;
		if (flag)
			sb.append(" ");
		else {
			for (int i = 0; i < tabCount; ++i)
				sb.append("\t");
			flag = true;
		}
		sb.append(ar[0]);
		for (int i = 1; i < ar.length; ++i) {
			sb.append(" ");
			sb.append(ar[i].toString());
		}
	}
	
	public void writeln(Object... ar) {
		if (ar.length == 0) {
			this.newline();
			return;
		}
		if (flag)
			sb.append(" ");
		else {
			for (int i = 0; i < tabCount; ++i)
				sb.append("\t");
			flag = true;
		}
		sb.append(ar[0]);
		for (int i = 1; i < ar.length; ++i) {
			sb.append(" ");
			sb.append(ar[i].toString());
		}
		this.newline();
	}

	public void writeLabel(String lbl) {
		sb.append(lbl);
		sb.append("\n");
	}

	public void newline() {
		sb.append("\n");
		flag = false;
	}
}
