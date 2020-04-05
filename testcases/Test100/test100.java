class test100{
    public static void main(String[] a){
		System.out.println(new Test().start());
    }
}

class Test extends test100 {
    int i;
    public int start(){
		return 0;
    }
}

class C {C C;}

class B {
	public B fun() {
		return new A();
	}
}

class A extends B {
	public B fun(){
		return new A();
	}
}

