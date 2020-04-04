class Test{
	public static void main (String [] a)
	{
		System.out.println(new Start().start());
	}
}
class Test1 extends Test{

}
class A{
	public Test start()
	{
		Test a;
		return a;
	}
}
class B extends A{
	public Test1 start()///TE:overloading
	{
		Test1 b;
		return b;
	}
}
