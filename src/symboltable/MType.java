package symboltable;
public class MType {
	protected String type;
	protected int row=0;
	protected int col=-0;
	public MType()
	{
		
	}
	public MType(String s)
	{
		type=s;
	}
	public MType(String s, int r,int c)
	{
		type=s;
		row=r;
		col=c;
	}
	
	public String GetType()
	{
		return type;
	}
	public void SetType(String s)
	{
		type=s;
	}
	public int GetRow()
	{
		return row;
	}
	public void SetRow(int i)
	{
		row=i;
	}public int GetCol()
	{
		return col;
	}
	public void SetCol(int i)
	{
		col=i;
	}
	
	
}
