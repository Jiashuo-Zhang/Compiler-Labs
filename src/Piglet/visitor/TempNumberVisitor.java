package visitor;

import syntaxtree.*;

public class TempNumberVisitor extends DepthFirstVisitor {
	private int num = 19;

	public int getNumber() {
		return num;
	}

	public void visit(Temp n) {
		n.f0.accept(this);
		n.f1.accept(this);
		int now = Integer.valueOf(n.f1.f0.tokenImage);
		num = Math.max(now, num);
	}

}