package tw.brad.utils;

public class MyCalc {
	private int x, y, op;
	public MyCalc(String x, String y, String op) throws Exception {
		this.x = Integer.parseInt(x);
		this.y = Integer.parseInt(y);
		this.op = Integer.parseInt(op);
	}
	public String result() {
		switch(op) {
			case 0: return plus() + "";
			case 1: return minu() + "";
			case 2: return mult() + "";
			case 3: return div();
			default : return "";
		}
	}
	public int plus() {
		return x + y;
	}
	public int minu() {
		return x - y;
	}
	public int mult() {
		return x * y;
	}
	public String div() {
		int v1 = x / y;
		int v2 = x % y;
		return String.format("%d ...... %d", v1, v2);
	}
	public int getX() {
		return x;
	}
	public int getY() {
		return y;
	}
	public int getOp() {return op;}
}
