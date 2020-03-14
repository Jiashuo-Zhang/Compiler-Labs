package symboltable;

import java.util.HashMap;

import exception.RedefinitionException;

public class MClassList extends MType {
	private HashMap<String, MClass> classList = new HashMap<String, MClass>();

	public void insertClass(MClass c) throws RedefinitionException {
		if (this.classList.containsKey(c.getName()))
			throw new RedefinitionException("Class", c.getName(), c.getRow(), c.getCol());
		else
			classList.put(c.getName(), c);
	}

	public MClass getClass(String name) {
		if (classList.containsKey(name))
			return classList.get(name);
		return null;
	}

	public HashMap<String, MClass> getClassList() {
		return this.classList;
	}

	public boolean hasClass(String name) {
		return this.classList.containsKey(name);
	}
}