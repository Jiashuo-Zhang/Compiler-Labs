package symboltable;

import java.util.HashMap;
import java.util.HashSet;

import exception.Abort;
import exception.InheritanceLoopException;
import exception.OverloadException;
import exception.RedefinitionException;
import exception.UndefinedDeclarationException;

public class MClassList extends MType {
	private HashMap<String, MClass> classList = new HashMap<String, MClass>();

	public void insertClass(MClass c) throws RedefinitionException {
		if (this.classList.containsKey(c.getName()))
			throw new RedefinitionException("Class", c.getName(), c.getRow(), c.getCol());
		else {
			classList.put(c.getName(), c);
			System.out.println("Class: " + c.getName());
		}
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

	public void checkSymbolTable() {
		try {
			traverse();
			checkOverload();
		} catch (InheritanceLoopException | UndefinedDeclarationException | OverloadException e) {
			Abort.abort(e);
		}
	}

	private void checkOverload() throws OverloadException {
		for (String key : classList.keySet()) {
			MClass nowClass = classList.get(key);
			nowClass.checkOverload();
		}
	}

	private void traverse() throws InheritanceLoopException, UndefinedDeclarationException {
		HashSet<String> checked = new HashSet<String>();
		for (String key : classList.keySet()) {
			MClass nowClass = classList.get(key);
			nowClass.traverse(new HashSet<String>(), checked, this);
		}
	}
}