package symboltable;

import java.util.ArrayList;

public class MTypeList extends MType {
	private ArrayList<MType> typeList = new ArrayList<MType>();

	public void insertType(MType t) {
		if (t == null)
			return;
		if (typeList.isEmpty()) {
			this.setRow(t.getRow());
			this.setCol(t.getCol());
		}
		typeList.add(t);
	}

	public void insertTypeAll(MTypeList t) {
		if (t == null)
			return;
		if (typeList.isEmpty()) {
			this.setRow(t.getRow());
			this.setCol(t.getCol());
		}
		typeList.addAll(t.getTypeList());
	}

	public int getTypeNum() {
		return typeList.size();
	}

	public ArrayList<MType> getTypeList() {
		return typeList;
	}

	public MType getType(int n) { // start from zero
		if (typeList.size() <= n)
			return null;
		else
			return typeList.get(n);
	}
}
