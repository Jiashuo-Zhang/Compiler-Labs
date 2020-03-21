class Test{
	public static void main (String [] a)
	{
		System.out.println(1);
	}
}
class Start{
	public int start()
	{
		A a;
		int b;
		a=new A();
		b=a.test(1);//TE
		return 0;
	}
}
class A
{
	public boolean test()///TE
	{
		return true;
	}
}