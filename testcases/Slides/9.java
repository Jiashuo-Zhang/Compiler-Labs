class Test{
	public static void main (String [] a)
	{
		System.out.println(new Start().start());
	}
}

class A{

}
class B extends A{

}

class Start{
	public int start(){
		A a;
		B b;
		a = new B();//right
		b = new A();//false
		return 0;
	}
}