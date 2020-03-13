package symboltable;

import java.util.HashMap;

public class MClass extends MIdentifier
{
	protected MClass parentClass;
	private HashMap<String, MMethod> methodTable = new HashMap<String, MMethod>();
	private HashMap<String, MVar> varTable = new HashMap<String, MVar>();
	MClass()
	{
		
	}
	MClass(String name, int row, int col) {
		super(name, "class", row, col);
	}
	MClass(MClass parent,String name,int row,int col)
	{
		super(name,"class",row,col);
		parentClass=parent;
	}
	
	public MClass GetParentClass()
	{
		return parentClass;
	}
	public void SetParentClass(MClass p)
	{
		parentClass=p;
	}
	public String InsertVar(MVar v) {///return ERROR MSG
		if (!varTable.containsKey(v.GetName())) {
			varTable.put(v.GetName(), v);
			return null;
		} else {
			return "Confilct Variable Declarations :" + v.GetName() ;
		}
	}
	public String insertMethod(MMethod m) {
		if (!methodTable.containsKey(m.GetName())) {
			methodTable.put(m.GetName(), m);
			return null;
		} else {
			return "Conflict Method Declarations :" + m.GetName();
		}
	}
	public MVar GetVar(String name) {
		MVar v = varTable.get(name);
		if (v == null && this.parentClass != null) {
			v = this.parentClass.GetVar(name);
		}
		return v;
	}
	public HashMap<String, MVar> GetVarTable()
	{
		return varTable;
	}
	public MMethod GetMethod(String name)
	{
		MMethod m= methodTable.get(name);
		if (m == null && this.parentClass != null) {
			m = this.parentClass.GetMethod(name);
		}
		return m;
	}
	public HashMap<String, MMethod> GetMethodTable()
	{
		return methodTable;
	}
	
	
	
}