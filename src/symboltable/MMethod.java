package symboltable;

import java.util.ArrayList;
import java.util.HashMap;

import exception.RedefinitionException;
import exception.UndefinedDeclarationException;

public class MMethod extends MIdentifier {
	protected String returnType = null;
	protected ArrayList<MVar> paramList = new ArrayList<MVar>();
	protected HashMap<String, MVar> varTable = new HashMap<String, MVar>();
	
	int offset = 0;

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
		if (!this.varTable.containsKey(v.getName())) {
			v.isLocal = !v.isParam;
			varTable.put(v.getName(), v);
			System.out.println("MethodName: " + this.name + ", VarName: " + v.getName() + ", VarType: " + v.getType());
		} else
			throw new RedefinitionException("Variable", v.getName(), v.getRow(), v.getCol());
	}

	public void insertParam(MVar p) throws RedefinitionException {
		p.isParam = true;
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

	public void checkUndefinedDeclaration(MClassList classList) throws UndefinedDeclarationException {
		checkTypeDeclared(returnType, classList, getRow(), getCol());
		for (String key : varTable.keySet()) {
			MVar var = varTable.get(key);
			checkTypeDeclared(var.getType(), classList, var.getRow(), var.getCol());
		}
	}

	public String getPigletName() {
		return this.parent.getName() + "_" + getName();
	}

	public String getPigletDefineName() {
		return getPigletName() + " [ " + (paramList.size() + 1) + " ]";
	}

	public int alloc(int p) {
		int s = 0;
		HashMap<String, MVar> newVarTable = new HashMap<String, MVar>();
		for (String key : varTable.keySet()) {
			MVar var = varTable.get(key);
			if (var.isParam)
				var.offset = ++s;
			else
				var.offset = p++;
			newVarTable.put(var.getName(), var);
		}
		varTable = newVarTable;
		return p;
	}
}