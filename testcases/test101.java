class test100 {
    public static void main(String[] a) {
		System.out.println(new Test().start());
    }
}

class Test {
    public int start() {
		(new int [3])[2] = 5;
		return 0;
    }
}