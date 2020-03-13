package symboltable;
public class MIdentifier extends MType
{
	protected MIdentifier parent=null;
	protected String name;
	MIdentifier(){
		
	}
	MIdentifier(MIdentifier p,String n,String Type,int r,int c)
	{
		super(Type,r,c);
		name=n;
		parent=p;
	}
	MIdentifier(String n,String Type,int row, int col)
	{
		super(Type,row,col);
		name=n;
	}
	MIdentifier(String n,int row,int col)
	{
		super(null,row,col);
		name=n;
	}
	public MIdentifier GetParent()
	{
		return parent;
	}
	public void SetParent(MIdentifier p)
	{
		parent=p;
	}
	public String GetName()
	{
		return name;
	}
	public void SetName(String n)
	{
		name=n;
	}
	
	
}