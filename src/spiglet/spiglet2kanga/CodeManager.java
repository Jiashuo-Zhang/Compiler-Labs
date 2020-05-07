package spiglet2kanga;

public class CodeManager {
	StringBuffer sb;
	int currentTemp, currentTab, currentLabel;
	boolean flag;

	public CodeManager() {
		sb = new StringBuffer();
		currentTemp = 0;
		currentTab = 0;
		currentLabel = 0;
		flag = false;
	}

	public CodeManager(int tmp) {
		sb = new StringBuffer();
		currentTemp = tmp;
		currentTab = 0;
		currentLabel = 0;
		flag = false;
	}

	public void write(Object... ar) {
		if (ar.length == 0)
			return;
		if (flag)
			sb.append(" ");
		else {
			for (int i = 0; i < currentTab; ++i)
				sb.append("\t");
			flag = true;
		}
		sb.append(ar[0]);
		for (int i = 1; i < ar.length; ++i) {
			sb.append(" ");
			sb.append(ar[i].toString());
		}

	}

	public void writeLabel(String lbl) {
		sb.append(lbl);
		sb.append("\n");
	}

	public String getNewLabel() {
		return "label_" + (++currentLabel);
	}

	public String getNewTemp() {
		return "TEMP " + (currentTemp++);
	}

	public void writeEnd() {
		for (int i = 0; i < currentTab; ++i)
			sb.append("\t");
		sb.append("END");
		currentTab = currentTab - 1;
		flag = true;
	}

	public void writeBegin() {
		sb.append("\n");
		currentTab = currentTab + 1;
		for (int i = 0; i < currentTab; ++i)
			sb.append("\t");
		sb.append("BEGIN");
		flag = true;
	}

	public void newline() {
		sb.append("\n");
		flag = false;
	}
}
