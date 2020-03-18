package symboltable;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;

import exception.InheritanceLoopException;
import exception.OverloadException;
import exception.RedefinitionException;
import exception.UndefinedDeclarationException;

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
		if (!varTable.containsKey(v.getName())) {
			varTable.put(v.getName(), v);
			System.out.println("ClassName: " + this.name + ", VarName: " + v.getName() + ", VarType: " + v.getType());
		} else
			throw new RedefinitionException("Variable", v.getName(), v.getRow(), v.getCol());
	}

	public void insertMethod(MMethod m) throws RedefinitionException {
		if (!methodTable.containsKey(m.getName())) {
			methodTable.put(m.getName(), m);
			System.out.println(
					"ClassName: " + this.name + ", MethodName: " + m.getName() + ", ReturnType: " + m.getReturnType());
		} else
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

	private void checkUndefinedDeclaration(MClassList classList) throws UndefinedDeclarationException {
		for (String key : varTable.keySet()) {
			MVar var = varTable.get(key);
			checkTypeDeclared(var.getType(), classList, var.getRow(), var.getCol());
		}
		for (String key : methodTable.keySet()) {
			MMethod method = methodTable.get(key);
			method.checkUndefinedDeclaration(classList);
		}
	}

	public void traverse(String ori, HashSet<String> visited, MClassList classList)
			throws InheritanceLoopException, UndefinedDeclarationException {
		if (getName().equals(ori)) {
			if (visited.contains(getName()))
				throw new InheritanceLoopException(getName(), getRow(), getCol());
			else
				visited.add(getName());
		}
		if (getParentClassName() != null) {
			MClass c = classList.getClass(getParentClassName());
			if (c != null)
				setParentClass(c);
			else
				throw new UndefinedDeclarationException(getParentClassName(), getRow(), getCol());
		}
		MClass fa = getParentClass();
		if (fa != null)
			fa.traverse(ori, visited, classList);
		checkUndefinedDeclaration(classList);
	}

	public void checkOverload() throws OverloadException {
		MClass fa = getParentClass();
		while (fa != null) {
			for (String key : methodTable.keySet()) {
				MMethod method = methodTable.get(key);
				checkOverload(method, fa);
			}
			fa = fa.getParentClass();
		}
	}

	private void checkOverload(MMethod method, MClass fa) throws OverloadException {
		String name = method.getName();
		MMethod faMethod = fa.getMethodTable().get(name);
		if (faMethod != null) {
			if (!method.getReturnType().equals(faMethod.getReturnType()))
				throw new OverloadException(name, this.getName(), fa.getName(), method.getRow(), method.getCol());
			ArrayList<MVar> list = method.getParamList();
			ArrayList<MVar> faList = faMethod.getParamList();
			if (list.size() != faList.size())
				throw new OverloadException(name, this.getName(), fa.getName(), method.getRow(), method.getCol());
			int length = list.size();
			for (int i = 0; i < length; ++i) {
				MVar var = list.get(i);
				MVar faVar = faList.get(i);
				if (!var.getType().equals(faVar.getType()))
					throw new OverloadException(name, this.getName(), fa.getName(), method.getRow(), method.getCol());
			}
		}
	}
}