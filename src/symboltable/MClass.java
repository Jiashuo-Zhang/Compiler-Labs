package symboltable;

import java.util.HashMap;
import java.io.*;
import exception.RedefinitionException;

public class MClass extends MIdentifier {
	protected MClass parentClass = null;
	protected String parentClassName;
	private HashMap<String, MMethod> methodTable = new HashMap<String, MMethod>();
	private HashMap<String, MVar> varTable = new HashMap<String, MVar>();

	public MClass() {

	}

	public MClass(String name, int row, int col) {
		super(name, "class", row, col);
	}

	public MClass(MClass parent, String name, int row, int col) {
		super(name, "class", row, col);
		parentClass = parent;
	}
	public String getParentClassName() {
		return parentClassName;
	}

	public void setParentClassName(String p) {
		parentClassName = p;
	}
	public MClass getParentClass() {
		return parentClass;
	}

	public void setParentClass(MClass p) {
		parentClass = p;
	}

	public void insertVar(MVar v) throws RedefinitionException {
		if (!varTable.containsKey(v.getName()))
		{
			varTable.put(v.getName(), v);
			System.out.println("ClassName: " + this.name+", VarName: "+v.getName()+", VarType: "+v.getType());
		}
		else
			throw new RedefinitionException("Variable", v.getName(), v.getRow(), v.getCol());
	}

	public void insertMethod(MMethod m) throws RedefinitionException {
		if (!methodTable.containsKey(m.getName()))
		{
			methodTable.put(m.getName(), m);
			System.out.println("ClassName: " + this.name+", MethodName: "+m.getName()+", ReturnType: "+m.getReturnType());
		}
		else
			throw new RedefinitionException("Method", m.getName(), m.getRow(), m.getCol());
	}

	public MVar getVar(String name) {
		MVar v = varTable.get(name);
		if (v == null && this.parentClass != null) {
			v = this.parentClass.getVar(name);
		}
		return v;
	}

	public HashMap<String, MVar> getVarTable() {
		return varTable;
	}

	public MMethod getMethod(String name) {
		MMethod m = methodTable.get(name);
		if (m == null && this.parentClass != null) {
			m = this.parentClass.getMethod(name);
		}
		return m;
	}

	public HashMap<String, MMethod> getMethodTable() {
		return methodTable;
	}
}