class Test {
	public static void main (String [] a){
		System.out.println(new Start().start());
	}
}

class Start {
	public int start() {
		int res;
		A a1;
		A a2;
		a1 = new A();
		res = a1.modify(1);
		a2 = a1;
		res = a2.modify(2);
		return a1.get();
	}
}

class A {
	int a;
	public int modify(int x) {
		a = x;
		return x;
	}
	public int get() {
		return a;
	}
}