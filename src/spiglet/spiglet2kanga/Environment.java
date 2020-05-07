package spiglet2kanga;

import java.util.HashMap;

public class Environment {
	public HashMap<String, Function> funcTable;
	public Function currentFunc;
	public Statement currentStmt;
	public CodeManager document;
	public boolean isInStmt;

	public Environment() {
		funcTable = new HashMap<String, Function>();
		document = new CodeManager();
		isInStmt = false;
	}

	public void addFunc() {
		funcTable.put(currentFunc.name, currentFunc);
	}

	public void setFunc(String name) {
		currentFunc = funcTable.get(name);
	}

	public void debug() {
		for (Function method : funcTable.values()) {
			method.debug();
		}
	}
	
	public void buildFlowGraph() {
		for (Function method : funcTable.values()) {
			method.buildFlowGraph();
		}
	}

	public void livenessAnalysis() {
		for (Function method : funcTable.values()) {
			method.livenessAnalysis();
		}
	}

	public void allocReg() {
		for (Function method : funcTable.values()) {
			method.allocReg();
		}
	}
}
