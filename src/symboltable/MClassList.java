package symboltable;
import java.util.HashMap;

public class MClassList extends MType
{
	private HashMap<String, MClass> ClassList = new HashMap<String, MClass>();
	
	public String InsertClass(MClass c) { 
		if (this.ClassList.containsKey(c.GetName()) )// 如已经定义过该类，返回错误信息
			return "Conflict Class declarations : "  + c.GetName();
		else
		{
			ClassList.put(c.GetName(), c);
		}
		return null;
	}
	public MClass GetClass(String name) {
		if (ClassList.containsKey(name)) {
			return ClassList.get(name);
		}
		return null;
	}
	public HashMap<String, MClass> GetClassList()
	{
		return this.ClassList;
	}
	public boolean hasClass(String name)
	{
		if(this.ClassList.containsKey(name))
		{
			return true;
		}
		else return false;
	}
	
	

}