package symboltable;
public class MVar extends MIdentifier
{
	MVar()
	{
	}
	MVar(MIdentifier p,String name,String Type,int r,int c)
	{
		super(p,name,Type,r,c);
	}
	MVar(String name,String Type,int r,int c)
	{
		super(name,Type,r,c);
		this.SetParent(null);
	}
}