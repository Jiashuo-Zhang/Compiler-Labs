class test100{
    public static void main(String[] a){
		System.out.println(new Test().start());
    }
}

class Test {
    int i;
    public int start(){
		Fun f;
		f = new Fun();
		
		i = f.next(f.next(f.next(0, true), false), true);
	
		return i;
    }
}

class Fun {
	public int next(int i, boolean b){
		if(b) i = i + 1;
		else i = i;
		return i;
    }
}

class B {
	public B fun() {
		return new A();
	}
}

class A extends B {
	public A fun(){
		return new A();
	}
}

