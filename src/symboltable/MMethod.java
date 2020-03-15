package symboltable;

import java.util.ArrayList;
import java.util.HashMap;

import exception.RedefinitionException;

public class MMethod extends MIdentifier {
	protected String returnType = null;
	protected ArrayList<MVar> paramList = new ArrayList<MVar>();
	protected HashMap<String, MVar> varTable = new HashMap<String, MVar>();

	public MMethod(String _returnType, MIdentifier parent, String name, int row, int col) {
		super(parent, name, "method", row, col);
		returnType = _returnType;
	}

	public String getReturnType() {
		return returnType;
	}

	public void setReturnType(String i) {
		returnType = i;
	}

	public void insertVar(MVar v) throws RedefinitionException {
		if (!this.varTable.containsKey(v.getName()))
		{
			varTable.put(v.getName(), v);
			System.out.println("MethodName: " + this.name+", VarName: "+v.getName()+", VarType: "+v.getType());
		}
		else
			throw new RedefinitionException("Variable", v.getName(), v.getRow(), v.getCol());
	}

	public void insertParam(MVar p) throws RedefinitionException {
		paramList.add(p);
		System.out.print("(IsParam) ");
		insertVar(p);
	}

	public int getParamNum() {
		return paramList.size();
	}

	public ArrayList<MVar> getParamList() {
		return paramList;
	}

	public HashMap<String, MVar> getVarTable() {
		return varTable;
	}

	public MVar getParam(int n) { // start from zero
		if (paramList.size() <= n)
			return null;
		else
			return paramList.get(n);
	}

	public MVar getVar(String name) { // if not found, search from the parent class
		if (varTable.containsKey(name))
			return varTable.get(name);
		return ((MClass) this.parent).getVar(name);
	}
}