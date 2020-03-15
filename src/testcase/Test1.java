package testcase;
public class Test1 {
	int n;
	static int n() {
		return 1;
	}
	public static void main(String args[]){
		System.out.println(n());
	}
}

class TestE extends Test1 {
	boolean n;
}
