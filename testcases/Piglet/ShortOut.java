class Test {
	public static void main (String [] a) {
		System.out.println(new Start().start());
	}
}
class Start {
	public int start() {
		if (false && (this.fun())){
			System.out.println(1);
		} else {
			System.out.println(2);
		}
		return 0;
	}
	public boolean fun() {
		System.out.println(999);
		return false;
	}
}