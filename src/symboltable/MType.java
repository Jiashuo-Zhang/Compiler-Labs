package symboltable;

public class MType {
	protected String type;
	protected int row = 0;
	protected int col = -0;

	public MType() {

	}

	public MType(String s) {
		type = s;
	}

	public MType(String s, int r, int c) {
		type = s;
		row = r;
		col = c;
	}

	public String getType() {
		return type;
	}

	public void setType(String s) {
		type = s;
	}

	public int getRow() {
		return row;
	}

	public void setRow(int i) {
		row = i;
	}

	public int getCol() {
		return col;
	}

	public void setCol(int i) {
		col = i;
	}
}
