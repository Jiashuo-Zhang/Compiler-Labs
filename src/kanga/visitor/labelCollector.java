package visitor;

import syntaxtree.Label;

public class labelCollector extends DepthFirstVisitor {
	public Integer maxLength = 0;

	/**
	 * f0 -> <IDENTIFIER>
	 */
	public void visit(Label n) {
		String lbl = n.f0.tokenImage;
		if (maxLength < lbl.length() + 1)
			maxLength = lbl.length() + 1;
	}
}
