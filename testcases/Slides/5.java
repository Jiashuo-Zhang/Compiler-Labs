class Test{
	public static void main (String [] a)
	{
		System.out.println(new Start().start());
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
	public int test()
	{
		return 0;
	}
}