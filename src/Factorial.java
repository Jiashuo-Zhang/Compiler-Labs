import java.util.HashMap;

class test100 {
    public static void main(String[] a) {
	    HashMap<Integer, String> hm = new HashMap<Integer, String>();
	    hm.put(1, "abc");
	    String s = hm.get(1);
	    System.out.println(s);
	    s = "cd";
	    System.out.println(hm.get(1));
    }
}