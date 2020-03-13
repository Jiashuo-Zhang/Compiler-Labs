package symboltable;
import java.util.ArrayList;
import java.util.HashMap;

public class MMethod extends MIdentifier
{
	protected MIdentifier ReturnType=null;
	protected ArrayList<MVar> paramList = new ArrayList<MVar>();
	protected HashMap<String, MVar> varTable = new HashMap<String, MVar>();

	
	public MMethod(MIdentifier _returnType, MIdentifier parent,String name, int row, int col) {
		super(parent,name, "method",row, col);
		ReturnType=_returnType;
	}
	
	public MIdentifier GetReturnType()
	{
		return ReturnType;
	}
	public void SetReturnType(MIdentifier i)
	{
		ReturnType=i;
	}
	
	public String InsertVar(MVar v)///return ERROR Msg
	{
		if(!this.varTable.containsKey(v.GetName()))
		{
			varTable.put(v.GetName(), v);
			return null;
		}
		else
		{
			return "Confilct Variables Declarations :" + v.GetName() ;
		}
	}
	public String InsertParam(MVar p)
	{
		paramList.add(p);
		return InsertVar(p);
	}
	public int GetParamNum()
	{
		return paramList.size();
	}
	public ArrayList<MVar> GetParamList()
	{ 
		return paramList;
	}
	public HashMap<String, MVar> GetVarTable()
	{
		return varTable;
	}
	public MVar GetParam(int n)//start from zero
	{
		if (paramList.size() <= n) 
			return null;
		else 
			return paramList.get(n);
	}
	public MVar GetVar(String name)////if not found, search from the parent class
	{
		if (varTable.containsKey(name)) {
			return varTable.get(name);
		}
		return ((MClass)this.parent).GetVar(name);
	}
	
	
	
}