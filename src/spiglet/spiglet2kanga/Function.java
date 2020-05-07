package spiglet2kanga;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Set;
import java.util.Stack;

public class Function {
	public String name;
	public ArrayList<Statement> stmtList;
	public int paraCnt, spilledCnt;
	public HashMap<Integer, Integer> tmp2reg;
	public Set<Integer> tmpNode;
	public HashMap<Integer, Boolean> isInLoop;
	public HashMap<Integer, Integer> deg;
	public HashMap<Integer, Set<Integer>> neighbor;
	static final int maxColor = 16;

	public Function(String name) {
		this.name = name;
		stmtList = new ArrayList<Statement>();
		spilledCnt = 0;
		tmp2reg = new HashMap<Integer, Integer>();
	}

	public void addStmt(Statement stmt) {
		stmtList.add(stmt);
	}

	public void debug() {
		System.out.println("Function " + name + ":");
		System.out.println("tmpNode :" + tmpNode);
		System.out.println("isInLoop :" + isInLoop);
		System.out.println("deg :" + deg);
		System.out.println("neighbor :" + neighbor);
		System.out.println("tmp2reg :" + tmp2reg);

		for (Statement stmt : stmtList) {
			stmt.debug();
		}
		System.out.println("");
	}

	public void buildFlowGraph() {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		for (int i = 0; i < stmtList.size(); i++) {
			Statement stmt = stmtList.get(i);
			stmt.ID = i;
			String label = stmt.label;
			if (label != null && stmt.type.equals("Label"))
				map.put(label, i);
		}

		for (int i = 0; i < stmtList.size(); i++) {
			Statement stmt = stmtList.get(i);
			if (stmt.type.equals("Exit"))
				continue;
			stmt.nextID1 = i + 1;
			Statement nextStmt = stmtList.get(stmt.nextID1);
			if (nextStmt.type.equals("Label"))
				stmt.nextID1 = stmt.nextID1 + 1;
			if (stmt.type.equals("JumpStmt"))
				stmt.nextID1 = map.get(stmt.label) + 1;
			if (stmt.type.equals("CJumpStmt"))
				stmt.nextID2 = map.get(stmt.label) + 1;
		}

		Set<Integer> tmp = new HashSet<Integer>();
		for (int i = 0; i < stmtList.size(); i++) {
			Statement stmt = stmtList.get(i);
			if (stmt.nextID1 != null)
				stmt.nextStmt1 = stmtList.get(stmt.nextID1);
			if (stmt.nextID2 != null)
				stmt.nextStmt2 = stmtList.get(stmt.nextID2);
			tmp.addAll(stmt.use);
			if (stmt.def != null)
				tmp.add(stmt.def);
		}

		tmpNode = new HashSet<Integer>();
		for (Integer t : tmp)
			if (t < 4 || t >= paraCnt)
				tmpNode.add(t);
		isInLoop = new HashMap<Integer, Boolean>();
		deg = new HashMap<Integer, Integer>();
		neighbor = new HashMap<Integer, Set<Integer>>();
		for (Integer node : tmpNode) {
			isInLoop.put(node, false);
			deg.put(node, 0);
			neighbor.put(node, new HashSet<Integer>());
		}

		for (int i = 0; i < stmtList.size(); i++) {
			Statement stmt = stmtList.get(i);
			if (stmt.type.equals("JumpStmt")) {
				if (stmt.nextID1 != null) {
					for (int j = stmt.nextID1; j < stmt.ID; j++) {
						Statement s = stmtList.get(j);
						if (s.def != null)
							isInLoop.put(s.def, true);
						for (Integer t : s.use)
							isInLoop.put(t, true);
					}
				}
			} else if (stmt.type.equals("CJumpStmt")) {
				if (stmt.nextID2 != null) {
					for (int j = stmt.nextID2; j < stmt.ID; j++) {
						Statement s = stmtList.get(j);
						if (s.def != null)
							isInLoop.put(s.def, true);
						for (Integer t : s.use)
							isInLoop.put(t, true);
					}
				}
			}
		}
	}

	public void livenessAnalysis() {
		boolean flag = true;
		while (flag) {
			flag = false;
			for (int i = 0; i < stmtList.size(); i++) {
				Statement stmt = stmtList.get(i);
				if (stmt.type.equals("Exit") || stmt.type.equals("Label"))
					continue;
				stmt.out.clear();
				if (stmt.nextStmt1 != null)
					stmt.out.addAll(stmt.nextStmt1.in);
				if (stmt.nextStmt2 != null)
					stmt.out.addAll(stmt.nextStmt2.in);
				Set<Integer> tmpIn = new HashSet<Integer>();
				tmpIn.addAll(stmt.out);
				tmpIn.remove(stmt.def);
				tmpIn.addAll(stmt.use);
				if (!isSetEqual(tmpIn, stmt.in)) {
					stmt.in = tmpIn;
					flag = true;
				}
			}
		}
	}

	private boolean isSetEqual(Set<Integer> sa, Set<Integer> sb) {
		int cnta = sa.size(), cntb = sb.size();
		if (cnta != cntb)
			return false;
		Set<Integer> tmp = new HashSet<Integer>();
		tmp.addAll(sa);
		tmp.addAll(sb);
		return tmp.size() == cnta;
	}

	public void allocReg() {
		for (int i = 4; i < Math.max(4, paraCnt); i++) {
			spilledCnt++;
			tmp2reg.put(i, -spilledCnt);
		}
		if (stmtList.size() > 0) {
			for (Integer u : stmtList.get(0).in)
				if (u < 4 || u >= paraCnt)
					for (Integer v : stmtList.get(0).in)
						if (u != v && (v < 4 || v >= paraCnt))
							addedge(u, v);
		}
		for (int i = 0; i < stmtList.size(); i++) {
			Statement stmt = stmtList.get(i);
			Set<Integer> s = new HashSet<Integer>(stmt.out);
			if (stmt.def != null)
				s.add(stmt.def);
			for (Integer u : s)
				if (u < 4 || u >= paraCnt)
					for (Integer v : s)
						if (u != v && (v < 4 || v >= paraCnt))
							addedge(u, v);

		}
		Set<Integer> tmp = new HashSet<Integer>(tmpNode);
		for (Integer node : tmp) {
			Set<Integer> s = neighbor.get(node);
			deg.put(node, s.size());
		}
		Stack<Integer> sta = new Stack<Integer>();
		while (tmp.size() > 0) {
			Integer del = null;
			for (Integer u : tmp) {
				int d = deg.get(u);
				if (d < maxColor) {
					if (del == null)
						del = u;
					else if (d > deg.get(del))
						del = u;
				}
			}
			if (del == null) {
				int minScore = 1919810;
				for (Integer u : tmp) {
					int tmpScore = -deg.get(u);
					if (isInLoop.get(u))
						tmpScore += 114514;
					if (minScore > tmpScore) {
						minScore = tmpScore;
						del = u;
					}
				}
				spilledCnt++;
				tmp2reg.put(del, -spilledCnt);
			} else {
				sta.push(del);
			}
			Set<Integer> s = neighbor.get(del);
			for (Integer v : s) {
				Integer d = deg.get(v);
				deg.put(v, d - 1);
			}
			tmp.remove(del);
		}
		while (!sta.empty()) {
			Set<Integer> color = new HashSet<Integer>();
			for (int i = 0; i < maxColor; i++)
				color.add(i);
			Integer u = sta.pop();
			Set<Integer> s = neighbor.get(u);
			for (Integer v : s) {
				if (tmp.contains(v))
					color.remove(tmp2reg.get(v));
			}
			tmp2reg.put(u, color.iterator().next());
			tmp.add(u);
		}
	}

	private void addedge(Integer u, Integer v) {
		Set<Integer> s = neighbor.get(u);
		s.add(v);
		neighbor.put(u, s);
	}

	public String queryReg(Integer id) {
		Integer reg = tmp2reg.get(id);
		String res = null;
		if (reg >= 0) {
			if (reg < 8)
				res = "s" + reg;
			else if (reg < 18)
				res = "t" + (reg - 8);
			else
				res = "v" + (reg - 18);
		} else
			res = "SPILLEDARG " + (-reg - 1);
		return res;
	}
}
