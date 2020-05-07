class Test {
	public static void main (String [] a){
		System.out.println(new Start().start());
	}
}

class Start {
	public int start() {
		int[] a;
		A a1;
		int res;
		a = new int[5];
		a[0] = 0;
		a[1] = 1;
		a[2] = 2;
		a[3] = 3;
		a[4] = 4;
		System.out.println(a.length);
		a1 = new A();
		res = a1.rewrite(a);
		System.out.println(a.length);
		return 0;
	}
}

class A {
	int a;
	public int modify(int[] x) {
		x[4] = 999;
		return 0;
	}
	public int rewrite(int[] x) {
		x = new int[4];
		x[0] = 1;
		x[1] = 2;
		x[2] = 3;
		x[3] = 4;
		System.out.println(x.length);
		return 0;
	}
}