class Test {
	public static void main (String [] a){
		System.out.println(new Start().start());
	}
}

class Start {
	public int calc(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, int a9, int a10, int a11, int a12, int a13, int a14, int a15, int a16, int a17, int a18, int a19, int a20, int a21) {
		return a20 + a21;
	}
	public int start() {
		return this.calc(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,this.calc(21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41));
	}
}