class Test {
	public static void main (String [] a) {
		System.out.println(new Start().start());
	}
}
class Start {
	public int start() {
		A a;
		a = new B();
		return a.fun();
	}
}

class A {
	int aa;
	public int fun() {
		aa = 123;
		return aa;
	}
}

class B extends A {
	int aa;
	public int fun() {
		aa = 456;
		return aa;
	}
}