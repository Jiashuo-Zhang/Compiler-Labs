class Test{
	public static void main (String [] a)
	{
		System.out.println(1);
	}
}
class Test1 extends Test{

}
class A{
	public Test start(int c,boolean b)
	{
		Test a;
		return a;
	}
}
class B extends A{
	public Test start(int a, boolean b)
	{
		Test1 c;
		return c;//TE
	}
}
