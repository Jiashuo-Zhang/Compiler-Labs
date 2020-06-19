# 编译实习实验报告

**游凌云(1700012838), 张家硕(1700012848)**

## 概述

本实验实现了一个Minijava编译器，功能为将Minijava源程序转化为Mips程序。具体步骤为：对Minijava源程序进行语义检查(lab1), 将Minijava源程序翻译成Piglet程序(lab2)，将Piglet程序翻译成Spiglet程序(lab3)，将Spiglet程序转化成Kanga程序(lab4)，将Kanga程序转换成mips程序(lab5)。下面我们将详细介绍每个步骤的设计思路、方法和代码实现，其中，我们也介绍了实验中遇到的问题、错误与积累的经验。

## lab1：Type Checking

### 概述

语义检查主要检查的语义错误及其处理方法。在这一个lab中，我们使用javacc和JTB来进行词法分析和语法分析，获得minijava源程序的语法分析树，遍历语法分析树，获得符号表，之后通过在符号表内遍历和带表遍历语法分析树来完成各类语法错误的检查。除了检查有无语法错误外，我们提供了更加细粒度的报错信息，指出源程序错误的类型以及行列数，以帮助程序员更快的定位bug。

### 设计思路

#### 各类语义错误检查

**各类错误检查时机**

- 类、方法、变量的重复定义，建符号表时处理
- 类的循环继承，遍历符号表时处理
- 声明时类型的未定义错误，遍历符号表时处理
- 方法的重载错误，遍历符号表时处理
- 使用方法、变量时的未定义错误，遍历语法树时处理
- 类型匹配错误，遍历语法树时处理

#### 类、方法、变量的重复定义

在向符号表中插入相应元素时进行判断即可

#### 类的循环继承

在符号表中进行遍历，寻找循环继承的类

#### 声明时类型的未定义错误

检查范围包括
- 类继承的父类有没有定义
- 类的成员变量的类型有没有定义
- 方法的返回值的类型有没有定义
- 方法的参数类型有没有定义
- 方法的局部变量的类型有没有定义

#### 方法的重载错误

方法的重载指父类和子类有相同名字的方法，但基调（返回值类型，参数顺序、数量、类型）不同。此处的不同是严格的不同，不考虑继承的情况。据此，检查是否有重载。

#### 使用方法、变量时的未定义错误

检查语法树节点以及检查内容：

| 语法树节点  | 检查内容 |
| ------------- | ------------- |
| AssignmentStatement  | 被赋值的变量是否被定义  |
| ArrayAssignmentStatement | 被赋值的数组变量是否被定义  |
| MessageSend | 调用方法的变量是否被定义，变量调用的方法是否被定义  |
| PrimaryExpression | 当PrimaryExpression是Identifier时，说明PrimaryExpression是一个变量。变量是否被定义  |
| AllocationExpression | 类是否被定义  |

#### 类型匹配错误

检查语法树节点以及检查内容：

| 语法树节点  | 检查内容 |
| ------------- | ------------- |
| MethodDeclaration  | 方法返回值类型与定义是否匹配  |
| AssignmentStatement | 赋值左右值类型是否匹配  |
| ArrayAssignmentStatement | 右值类型是否是int，左值类型是否是int[]，下标类型是否是int  |
| IfStatement | 条件表达式类型是否是boolean  |
| WhileStatement | 条件表达式类型是否是boolean  |
| PrintStatement | 输出表达式类型是否是int  |
| AndExpression | 子表达式类型是否是boolean  |
| CompareExpression | 子表达式类型是否是int  |
| PlusExpression | 子表达式类型是否是int  |
| MinusExpression | 子表达式类型是否是int  |
| TimesExpression | 子表达式类型是否是int  |
| ArrayLookup | 变量类型是否是int[]，下标类型是否是int |
| ArrayLength | 变量类型是否是int[] |
| MessageSend | 变量是否是类类型，方法的传入参数是否和声明参数匹配 |
| ArrayAllocationExpression | 下标是否是int |
| NotExpression | 子表达式类型是否是boolean  |

### 代码实现

在建立符号表时，我们完成了类、方法、变量的重复定义的语义错误检查。具体原理为在每次向符号表中插入类、方法、变量前，都检查是否符号表中已有重复的内容，如果有则抛出异常，没有则正常插入。以插入变量为例，具体代码展示如下

```java
public void insertVar(MVar v) throws RedefinitionException {
		if (!this.varTable.containsKey(v.getName())) {
			varTable.put(v.getName(), v);
		} else
			throw new RedefinitionException("Variable", v.getName(), v.getRow(), v.getCol());
	}
```

在符号表建立后，我们通过符号表内遍历和带表语法树遍历完成了其他错误类型的检查

我们通过直接遍历符号表，完成了循环继承、未定义变量、重载错误的检查，大致流程为：

```java
public void checkSymbolTable() {
		try {
			traverse();
			checkOverload();
		} catch (InheritanceLoopException | UndefinedDeclarationException | OverloadException e) {
			Abort.abort(e);
		}
	}
```

我们通过带表遍历抽象语法树，完成了类型匹配等错误的检查（以对赋值语句的检查为例）：

```java
	public MType visit(AssignmentStatement n, MType argu) {
		MIdentifier id = (MIdentifier) n.f0.accept(this, argu);
		MVar newVar = ((MMethod) argu).getVar(id.getName());
		n.f1.accept(this, argu);
		MType exp = n.f2.accept(this, argu);
		if (!checkType(exp, newVar.getType()))
			Abort.abort(new MismatchException(newVar.getType(), exp.getType(), exp.getRow(), exp.getCol()));
		n.f3.accept(this, argu);
		return null;
	}
```

## lab2:  Minijava to Piglet

### 概述

Minijava与Piglet最大的不同在于Piglet是面向过程的语言，而minijava是面向对象的语言。因此，在本次lab中，最重要的工作为通过引入VD表来完成面向对象->面向过程的转化。相应的，函数调用等流程也需要进行转换。

### 设计思路

#### 从面向对象到面向过程
用VTable和DTable表示一个类的实例，然后把实例的地址也作为参数传入函数调用中。具体来说，地址放在第一个参数的位置，即`TEMP 0`。

在ClassList中调用buildVDTable，即可在java中显式地创建出VTable和DTable。注意到此处的VTable的第一项还没有指向DTable的指针，在AllocationExpression中需要进一步组装。

为了实现多态，具体的设计是，一个类的VTable就是其父类的VTable，再加上自己类的成员变量。一个类的DTable就是其父类的DTable，再加上自己类的方法，如果自己类的方法与父类方法有同名，就用自己类的方法覆盖掉父类的方法。偏移量容易算出。

#### 数组的处理
数组用地址来表示。长度为n的数组需要n+1个位置存储，第一个位置存放长度。

#### 函数参数大于等于20个的处理
设参数有n个（n>=20），那么前18个参数放在`TEMP 1`到`TEMP 18`，然后`MOVE TEMP 19 HALLOCATE TIMES 4 MINUS n 18`，假设现在要放第k个参数（k>=19），就`HSTORE TEMP 19 TIMES 4 MINUS k 19 第k个参数的值`。在翻译时遇到参变量需要考虑其位置。


#### 翻译
把所有的语法节点看成不同的函数。那么还需要考虑函数什么时候需要返回值，什么时候不需要。例如在赋值节点`a = b`，就可以看成这样一个函数：


	void assignmentStatement(a, b) {
		a = b;
	}

所以赋值语句不需要返回值。又如在ArrayLookup节点`a[i]`,就可以看成这样一个函数：

	int arrayLookup(a, i) {
		c = a[i];
		return c;
	}

所以在ArrayLookup节点需要返回值。又如在加法节点`a+b`,就可以看成这样一个函数：

	int plusExpression(a, b) {
		c = a + b;
		return c;
	}

但是piglet语言的`PLUS`语句自带返回值（不像汇编语句，即`PLUS a b`等价于`RETURN PLUS a b`），所以说虽然上面的翻译也对，但不需要，可以直接翻译成`PLUS a b`。以上的三种策略贯穿整个翻译过程。最后，遍历语法树生成piglet代码了。

### 代码实现

#### CodeManager

生成Piglet代码需要一些额外的格式控制，为了实现更简洁和自动的格式控制，我们实现了CodeManager类，以支持代码自动缩进等多种功能，在遍历语法树时，可以直接向CodeManager中写入翻译得到的piglet代码即可。

```java
class CodeManager {
  
	StringBuffer sb;
	int currentTemp, currentTab, currentLabel;
	boolean flag;

	public CodeManager() {
		sb = new StringBuffer();
		currentTemp = 0;
		currentTab = 0;
		currentLabel = 0;
		flag = false;
	}
	public CodeManager(int tmp) {
		sb = new StringBuffer();
		currentTemp = tmp;
		currentTab = 0;
		currentLabel = 0;
		flag = false;
	}
	public void write(Object... ar) {
		if (ar.length == 0)
			return;
		if (flag)
			sb.append(" ");
		else {
			for (int i = 0; i < currentTab; ++i)
				sb.append("	");
			flag = true;
		}
		sb.append(ar[0]);
		for (int i = 1; i < ar.length; ++i) {
			sb.append(" ");
			sb.append(ar[i].toString());
		}
	}
	public void writeLabel(String lbl) {
		sb.append(lbl);
		sb.append("\n");
	}
	public String getNewLabel() {
		return "label_" + (++currentLabel);
	}
	public String getNewTemp() {
		return "TEMP " + (currentTemp++);
	}
	public void writeEnd() {
		for (int i = 0; i < currentTab; ++i)
			sb.append("	");
		sb.append("END");
		currentTab = currentTab - 1;
		flag = true;
	}
	public void writeBegin() {
		sb.append("\n");
		currentTab = currentTab + 1;
		for (int i = 0; i < currentTab; ++i)
			sb.append("	");
		sb.append("BEGIN");
		flag = true;
	}

	public void newline() {
		sb.append("\n");
		flag = false;
	}

}
```

在MessageSend时，需要得知是何种类的实例在调用方法，此时由于缺少返回值，实现起来比较麻烦。实现中，我们在MessageSend节点new一个TraverseVisitor，用TraverseVisitor得知是何种类的实例。但是这体现了当前设计的弊端。后续我们在处理的时候考虑了这一问题，此后继承的都是有返回值的visitor。

#### 各节点处理

下面介绍遍历到各个节点时我们采取的处理流程

##### Goal

把主类和其他类的代码串起来就行。

##### MainClass

在翻译PrintStatement的基础上加外壳。

##### MethodDeclaration

翻译语句块Statement，翻译返回值表达式Expression，然后加外壳。

##### AssignmentStatement

把右值的表达式Expression赋给左值Identifier。用`HSTORE 左值Identifier 右值Expression`或者`MOVE 左值Identifier 右值Expression`。

具体来说，考虑左值的三种情况：
1. 是类（或者考虑继承，父类）的成员。此时左值的地址应该在`TEMP 0`加一个偏移量的地方寻找。此时使用`HSTORE`。例如`HSTORE TEMP 0 4 5`。
2. 是参变量。那么需要根据参变量在何处，用`MOVE`，或者用`HSTORE`。具体在后文Identifier中分析。
3. 是方法中的局部变量。此时左值应该在`TEMP 20`到`TEMP 9999`之间。使用`MOVE`。例如`MOVE TEMP 20 5`。

在考虑左值是地址还是值的时候要注意java语言是按值传递的。对于第一种情况，类的成员变量在堆上。对于后两种情况，参变量和局部变量在栈上。对于数组或者类的情况，数组或者类的地址是参变量或者局部变量，所以在栈上，而内容在堆上。

##### ArrayAssignmentStatement

由于这是`a[i] = b`的情况，所以不管a是上述三种情况中的哪一种，都可以先取一个寄存器，把a[0]的地址放到新的寄存器中。
然后再计算表达式Expression，进而算出偏移量。再组装得到a[i]的地址。再用`HSTORE a[i]的地址 右值Expression`。
对于`Identifier[IndexExpression] = RightExpression`，翻译如下：

	MOVE NEWTEMP 1 Identifier
	MOVE NEWTEMP 2 PLUS 4 TIMES 4 IndexExpression
	MOVE NEWTEMP 1 PLUS NEWTEMP 1 NEWTEMP 2
	HSTORE NEWTEMP 1 0 RightExpression

##### IfStatement

对于`if Expression then ThenStatement else ElseStatement`，翻译如下：

    	CJUMP Expression label_1
    	ThenStatement
    	JUMP label_2
    label_1
    	ElseStatement
    label_2
    	NOOP

##### WhileStatement

对于`while Expression BodyStatement`，翻译如下：

    label_1
    	CJUMP Expression label_2
    	BodyStatement
    	JUMP label_1
    label_2
    	NOOP

##### PrintStatement

对于`System.out.println(Expression)`，翻译如下：

    Print Expression

##### AndExpression

考虑到短路机制，所以这里要采取积极的求值策略。
对于`Expression1 && Expression2`，翻译如下：

		BEGIN
		MOVE NEWTEMP 1 Expression1
		CJUMP NEWTEMP 1 label_1
		MOVE NEWTEMP 2 Expression2
		CJUMP NEWTEMP 2 label_1
		MOVE NEWTEMP 3 1
		JUMP label_2
	label_1
		MOVE NEWTEMP 3 0
	label_2
		NOOP
		RETURN NEWTEMP 3
		END

##### CompareExpression

对于`Expression1 < Expression2`，翻译如下：

    LT Expression1 Expression2

##### PlusExpression

对于`Expression1 + Expression2`，翻译如下：

    PLUS Expression1 Expression2

##### MinusExpression

对于`Expression1 - Expression2`，翻译如下：

    Minus Expression1 Expression2

##### TimesExpression

对于`Expression1 * Expression2`，翻译如下：

    Times Expression1 Expression2

##### ArrayLookup

对于`PrimaryExpression[IndexExpression]`，翻译如下：

	BEGIN
	MOVE NEWTEMP 1 PrimaryExpression
	MOVE NEWTEMP 2 PLUS 4 TIMES 4 IndexExpression
	MOVE NEWTEMP 1 PLUS NEWTEMP 1 NEWTEMP 2
	HLOAD NEWTEMP 3 NEWTEMP 1 0
	RETURN NEWTEMP 3
	END

注意到这里数组是PrimaryExpression而不是Identifier。所以除了Identifier的上述三种情况外，还有一种情况是，PrimaryExpression是ArrayAllocationExpression的情形。显然ArrayAllocationExpression需要`RETURN`在堆上为数组创建的地址。后文会讨论Identifier和ArrayAllocationExpression的翻译。

##### ArrayLength

数组长度存放在第一个位置，因此偏移量为0。

对于`PrimaryExpression.length`，翻译如下：

	BEGIN
	MOVE NEWTEMP 1 PrimaryExpression
	HLOAD NEWTEMP 2 NEWTEMP 1 0
	RETURN NEWTEMP 2
	END

##### MessageSend

对于message send，翻译如下：(省略了Param的获取以及对于20个以上Params的处理)

```
CALL
BEGIN
MOVE NEWTEMP 1 IDENTIFIER
HLOAD NEWTEMP 2 NEWTEMP 1 0
HLOAD NEWTEMP 3 NEWTEMP 2 Method.offset
RETURN NEWTEMP 3
END
(NEWTEMP 1 [.PARAMS])
```

##### IntegerLiteral

数字本身即是代码。

##### TrueLiteral

翻译为数字1。

##### FalseLiteral

翻译为数字0。

##### Identifier

分类讨论：
1. Identifier是类（或者考虑继承，父类）的成员。对于`Identifier`，翻译如下：

		BEGIN
		HLOAD NEWTEMP 1 TEMP 0 OFFSET
		RETURN NEWTEMP 1
		END
2. 是参变量。首先要判断该参变量是不是在堆上。如果该参变量所在的方法的参数个数>=20个，且该参变量不是前18个，那么该参变量在堆上。
对于不在堆上的情形，`Identifier`的翻译应该在`TEMP 1`到`TEMP 19`之间。对于在堆上的情形，设该参变量是第k个，那么`Identifier`的翻译如下：

		BEGIN
		HLOAD NEWTEMP 1 TEMP 19 TIMES 4 MINUS k 19
		RETURN NEWTEMP 1
		END
3. 是方法中的局部变量。此时对于`Identifier`的翻译应该在`TEMP 20`到`TEMP 9999`之间。在ClassList中调用alloc即可为所有局部变量分配一个offset。

##### ThisExpression

对于`this`的翻译就是`TEMP 0`。

##### ArrayAllocationExpression

对于`new int[Expression]`，翻译如下：

    BEGIN
    MOVE NEWTEMP 1 Expression
    MOVE NEWTEMP 2 PLUS 4 TIMES 4 NEWTEMP 1
    MOVE NEWTEMP 3 HALLOCATE NEWTEMP 2
    HSTORE NEWTEMP 3 0 NEWTEMP 1
    RETURN NEWTEMP 3
    END

##### AllocationExpression

对于new identifier( ), 翻译如下：

```
BEGIN
MOVE NEWTEMP 1 HALLOCATE 4*ClassMethodNumber
for each method:
	HSTORE NEWTEMP 1 Method.offset Method.PigletName
MOVE NEWTEMP 2 HALLOCATE 4*ClassVarNumber+4
for each var:
	HSTORE NEWTEMP 2 var.offset 0
HSTORE NEWTEMP 2 0 NEWTEMP 1
RETURN NEWTEMP 2
END
```

##### NotExpression

对于`!Expression`，翻译如下：

    MINUS 1 Expression

#### 一个bug

在建立VD表的时候，子类应该首先复制父类的VD表，但是在复制过程中，我们错误的采用了直接的复制（浅拷贝），导致结果错误，将其改成深拷贝后bug解决（下面的代码为解决bug之后的版本）

```java
public void buildVDTable() {
		if (VTable == null && DTable == null) {
			HashMap<String, MMethod> newMethodTable = new HashMap<String, MMethod>();
			HashMap<String, MVar> newVarTable = new HashMap<String, MVar>();
			if (parentClass != null) {
				parentClass.buildVDTable();
				////////////bug begin////////////////
				VTable = new ArrayList<MVar> ();
				for (MVar v: parentClass.VTable)
				{
					VTable.add(v);
				}
				DTable = new ArrayList<MMethod>();
				for(MMethod m: parentClass.DTable)
				{
					DTable.add(m);
				}
				////////////bug end/////////////////
			} else {
				VTable = new ArrayList<MVar>();
				DTable = new ArrayList<MMethod>();
			}
			for (String key : varTable.keySet()) {
				MVar var = varTable.get(key);
				var.offset = 4 + 4 * VTable.size();
				newVarTable.put(var.getName(), var);
				VTable.add(var);
			}
			for (String key : methodTable.keySet()) {
				MMethod method = methodTable.get(key);
				String name = method.getName();
				for (int i = 0; i < DTable.size(); ++i) {
					if (name.equals(DTable.get(i).getName())) {
						DTable.set(i, method);
					}
				}
				method.offset = 4 * DTable.size();
				newMethodTable.put(name, method);
				DTable.add(method);
			}
			varTable = newVarTable;
			methodTable = newMethodTable;
		}
	}
```

#### 一个不足

在本次lab的开发过程中，我们继承了不带返回值的visitor，这导致，在后继需要向前传递信息时，缺乏简洁的返回信息。导致我们只能new了一个visitor来获取这个信息，引入了不必要的复杂度。在lab3及之后的lab中，我们吸取了经验，使用了带有返回值的visitor以及更加模块化的代码开发方式。

```java
public void visit(MessageSend n, MType argu) {
		document.write("CALL");	document.writeBegin();
    document.newline();

    String temp1 = document.getNewTemp(), temp2 = document.getNewTemp(), temp3 = document.getNewTemp();
    document.write("MOVE", temp1);
    n.f0.accept(this, argu);
    document.newline();

    TraverseVisitor tv = new TraverseVisitor();
    tv.allClassList = this.allClassList;
    MType m = (MType) n.f0.accept(tv, argu);/// get class type
    MClass callerclass = allClassList.getClass(m.getType());
    MMethod method = callerclass.getMethod(n.f2.f0.toString());

    document.write("HLOAD", temp2, temp1, 0);
    document.newline();

    document.write("HLOAD", temp3, temp2, method.offset);
    document.newline();

    document.write("RETURN", temp3);//// temp3 is the address of the method
    document.newline();

    document.writeEnd();
    document.write("(", temp1);
    if (method.getParamNum() <= 19) {
      n.f4.accept(this, argu);
      document.write(")");
    } else {
      ToPigletVisitor paramsvisitor = new ToPigletVisitor();
      paramsvisitor.document.currentTemp = this.document.currentTemp;
      paramsvisitor.document.currentTab = this.document.currentTab;
      paramsvisitor.document.currentLabel = this.document.currentLabel;
      paramsvisitor.allClassList = this.allClassList;
      paramsvisitor.isparamVistor = true;
      paramsvisitor.paramNumber = method.getParamNum();
      n.f4.accept(paramsvisitor, argu);

      this.document.currentTemp = paramsvisitor.document.currentTemp;
      this.document.currentLabel = paramsvisitor.document.currentLabel;
      this.document.currentTab = paramsvisitor.document.currentTab;
      this.document.write(paramsvisitor.document.sb);
      this.document.write(")");
    }

    return;
  }
```
## lab3 : Piglet to Spiglet

### 概述

Piglet与Spiglet的最大不同在于Spiglet限制了表达式的嵌套深度，以将类函数式式的语言范式转换为面向过程的语言范式。这一部分完成的主要工作就是消除除Move语句外的所有的表达式嵌套。

### 设计思路

这一部分的主要翻译思路是：对expression先求值，再new一个temp，把求出的值move到new temp中（同时输出代码），然后返回new temp。对statement，先遍历其中的expression，得到存放其值的temp，然后再按照语法规则翻译statement。如对于`op() exp1() exp2()`的翻译如下：

	String tmp1 = n.f1.accept(this);
	String tmp2 = n.f2.accept(this);
	String tmp3 = this.document.getNewTemp();
	document.write("MOVE", tmp3, op, tmp1, tmp2);

### 代码实现
输出代码同样需要一些额外的格式控制（CodeManager类）。由于spiglet嵌套求值几乎消失，所以输出代码时一行一行地输出，而不是像piglet中一样考虑生成statement代码才换行，生成expression代码不换行。

对于语法树节点Temp和Label需要特殊处理。Temp节点不应该用上述的翻译思路，new一个temp，然后把当前temp的值move到new temp中，而是应该直接返回当前temp。Label节点应该分情况讨论是函数的名字还是jump的标签，对于函数的名字，应该和数字常量同等对待，即new一个temp，把常量值move进new temp，然后再返回new temp。对于jump的标签，应该直接生成同样的代码。

具体的实现位于Piglet2SpigletVisitor.java。

我们对于每一个expr的外层都包装了Move语句，例如，对于call指令，我们处理完参数后执行call指令，并把结果Move到Temp寄存器中。

```java
public String visit(Call n) {
		String tmp1 = n.f1.accept(this);
		String tmp2 = this.document.getNewTemp();
		
		StringBuffer argList = new StringBuffer();
		if (n.f3.present()) {
			for (Enumeration<Node> e = n.f3.elements(); e.hasMoreElements();) {
				String arg = e.nextElement().accept(this);
				argList.append(arg + " ");
			}
		}

		this.document.write("MOVE", tmp2, "CALL", tmp1, "(", argList.toString().trim(), ")");
		this.document.newline();
		
		return tmp2;
	}
```

在本次lab中，我们改变了lab2中不带返回值的visitor模式，引入了返回值来规避各类传递信息上的复杂性，整个代码结构和简洁性有了很大的提高。

## lab4 : Spiglet to Kanga

### 概述

kanga与Spiglet最大的区别在于Kanga为每一个Temp分配了寄存器。Kanga中，寄存器的个数有限，共24个。用途有：传递参数，获得返回值，存放局部/临时值。这一部分的主要工作包括：为变量分配寄存器，使用寄存器分配信息进行代码翻译。

### 设计思路

#### 寄存器分配

**建立流图->活性分析->干涉图->图染色**

寄存器有限就意味着要设计一些方法，建立spiglet中的局部变量与寄存器的映射关系。当两个局部变量不冲突，他们就可以使用同一个寄存器。而如何建立这种映射关系就变成一种图染色问题。而如何求两个局部变量是否冲突则是活性分析的内容。活性分析的准备工作是建立流图，对流图中的基本块求出def和use集合。流图是以函数为单位的（有多少个函数，就有多少个流图），因此可以得到一个层次结构：整体环境/代码 -> 流图/函数 -> 基本块/statement（为了实现的简便，不求最大基本块，而是简单地把一条statement当作一个基本块）。所以最初步的目标是建立层次结构，求出基本块的def和use集合。再建立流图并进行活性分析，求出基本块的in和out集合。最后根据上述信息建立干涉图，做图染色进行寄存器分配。

#### 代码翻译

主要工作为根据寄存器分配信息，将Spiglet代码转化到Kanga代码。在每次遇到Temp时，都查询为其分配的寄存器，以将其替换。同时，遵循寄存器分配以及kanga语言的约定，完成参数传递、寄存器保存和恢复等功能。

### 代码实现

#### 寄存器分配

这一部分的大致流程如下：

```java
public static void main(String[] args) throws IOException {
		String s = fileRead(new File(args[0]));
		InputStream in = new ByteArrayInputStream(s.getBytes());
 		try {
			Node root = new SpigletParser(in).Goal();
			Environment env = new Environment();
			EnvironmentBuilder eb = new EnvironmentBuilder();
			root.accept(eb, env);
			env.buildFlowGraph();
			env.livenessAnalysis();
			env.allocReg();
			//env.debug();
			spiglet2kangaVisitor visitor=new spiglet2kangaVisitor();
			root.accept(visitor,env);
			System.out.println(env.document.sb);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
}
	
```

可以看到，在寄存器分配部分，首先我们带表遍历抽象语法树，建立层次结构，之后根据层次结构中的信息建立流图、进行活性分析、建立干涉图、图染色，来完成寄存器的分配。各步骤详细介绍如下：

##### 建立层次结构

遍历spiglet代码的语法树，建立层次结构。最基本的单位是statement（包括call和return），对于每个statement，求出def和use集合。对于`MOVE TEMP EXP`和`HLOAD TEMP TEMP2 INT`，`TEMP`都在def集中。其余的所有statement中用到的TEMP都在use集中。除了求statement的def和use集合外，还可以记录一下statement的类型，跳转的label等其他信息。

##### 建立流图

主要工作是求出执行每条statement后下一条执行什么语句（即后继，CJUMP有两条可能的语句）。建立了层次结构后，由于记录了一些额外的信息，所以可以比较容易地求出每个statement的后继。

除此以外，还可以求一些额外的信息，如记录该函数中所有用到的变量（所有statement的use和def集合的并集，为了方便后续的干涉图的建立），记录这些变量是否在循环中被用到（如果一条语句的后继在它的前面，说明从它的后继到自己这段代码很可能在循环中，这段代码中被用到的所有的局部变量（即use和def集合）就也可能循环中）。

##### 活性分析

由于我们已经求出每条statement的后继，use和def集合，所以直接应用数据流后向分析算法即可。

##### 建立干扰图

每个函数的第一条statement的in集合中任意两个变量是相互冲突的。每条语句的out集合并def集合中任意两个变量是相互冲突的。

把每个变量看成一个点（在流图中我们记录了所有的变量，因此建图是方便的），对于冲突的两个变量连边。最后就转化成一个图染色问题。注意要去重边。

另外一个问题是要根据变量的作用不同而不同地对待。对于参变量，由于只能用寄存器传递前4个参数，所以后面的参变量直接用PASSARG溢出到栈上。由于我们不愿意在外层的函数保存/恢复存放参数的寄存器，所以内层函数应该拿到参数后直接move到其他用于保存局部/临时变量的寄存器中。所以前4个参数不仅被分配到用于传递参数的4个寄存器，还应该为前4个参数分配用于保存局部/临时变量的寄存器。所以被当作干涉图中点的变量包含前4个参数和局部/临时变量，不包含后面的参数。并且，由于我们必须留几个（实现时，保留了4个）寄存器来存放从运行时栈中取出的值，所以实际上可供分配的寄存器一共有16个。

总结：对于参变量，前4个参变量只在参数传递时是a0-a3，在子函数中马上会被move到其他寄存器（或者是栈上），后续所有对该参变量的使用都映射到其他寄存器，而非a0-a3。后面的所有参变量都被溢出到栈上。所有的局部变量和前4个参变量一起参与寄存器分配（共16个）。剩余的4个寄存器（t8 t9 v0 v1）用于存放从栈中取出的值。v0还用来存放函数返回值。运行时栈的前一部分（0, paraCnt-4）用于存放溢出的参数，后一部分（paraCnt-4, spilledCnt)用于存放图染色算法决定的从前4个参数和局部/临时变量中溢出的变量。

##### 图的k染色

如果存在一个点的度数 < k，那么从图上把这个点删去，把这个点入栈。（实现中，如果有多个点的度数 < k，就选一个度数最大的）

如果所有的点的度数都 >= k，那么选一个点代表的变量溢出到栈上，从图上把这个点删去，不把这个点入栈。（实现中，优先溢出顺序：在循环中且度数大 > 在在循环中且度数小 > 不在循环中且度数大 > 不在循环中且度数小）

这样循环地进行，最终图会被删光。然后从栈顶开始向图中加点，加点时为这个点染色，注意不要染成和图中已有的邻接点一个颜色。

#### 代码翻译

主要工作为根据寄存器分配信息，将Spiglet代码转化到Kanga代码。在每次遇到Temp时，都查询为其分配的寄存器，以将其替换。同时，遵循寄存器分配以及kanga语言的约定，完成参数传递、寄存器保存和恢复等功能。

每次遇到Temp时，将会查询寄存器分配表中为该Temp分配的寄存器/溢出的位置。如果该Temp被溢出，则会生成相应的load指令，将其加载至预留的寄存器中，若未被溢出，则直接返回其对应的寄存器。同时，在这一步中，我们还处理了Temp作为参数的情形（通过argu.isParam判断），来处理传参时参数的预处理。

```java
 public String visit(Temp n, Environment argu) {
	      String _ret=null;
	      if(argu.isParam>=0)
	      {
	    	  int t=Integer.valueOf(n.f1.f0.tokenImage);
	    	  if(argu.isParam<4)
	    	  {
			      if(argu.currentFunc.isSpilled(t)==1)
			      {
			    	  argu.document.write("ALOAD","a"+argu.isParam,argu.currentFunc.queryReg(t));
			    	  argu.document.newline();
			    	  _ret="a"+argu.isParam;
			    	  argu.isParam += 1;
			      }
			      else if(argu.currentFunc.isSpilled(t)==0)
			      {
			    	  
			    	  argu.document.write("MOVE","a"+argu.isParam,argu.currentFunc.queryReg(t));
			    	  argu.document.newline();
			    	  _ret="a"+argu.isParam;
			    	  argu.isParam += 1;
			      }
	    	  }
	    	  else
	    	  {
	    		  if(argu.currentFunc.isSpilled(t)==1)
			      {
			    	  argu.document.write("ALOAD v0",argu.currentFunc.queryReg(t));
			    	  argu.document.newline();
			    	  argu.document.write("PASSARG",argu.isParam-3,"v0");
		    		  argu.isParam+=1;
		    		  argu.document.newline();
			      }
			      else if(argu.currentFunc.isSpilled(t)==0)
			      {
			    	  argu.document.write("PASSARG",argu.isParam-3,argu.currentFunc.queryReg(t));
		    		  argu.isParam+=1;
		    		  argu.document.newline();
			      }
	    		 
	    	  }
	      }
	      else {
		      int t=Integer.valueOf(n.f1.f0.tokenImage);
		      if(argu.currentFunc.isSpilled(t)==1)
		      {
		    	  argu.document.write("ALOAD","t8",argu.currentFunc.queryReg(t));
		    	  argu.document.newline();
		    	  _ret="t8";
		      }
		      else if(argu.currentFunc.isSpilled(t)==0)
		      {
		    	  _ret=argu.currentFunc.queryReg(t);
		      }
	      }
	      
	      return _ret;
	   }

```

在其他的语句翻译中，我们采用on-the-fly模式，直接visit对应的temp节点，获得依赖的寄存器信息和预处理语句后，再翻译该语句，如在Print语句中，我们先打印Temp的预处理语句，再将其print出来。

```java
  public String visit(PrintStmt n, Environment argu) {
	      String _ret=null;
	     // n.f0.accept(this, argu);
	      String tmp= n.f1.accept(this, argu);
	      argu.document.write("PRINT",tmp); 
	      argu.document.newline();
	      return _ret;
	   }
```

#### 一个bug：

在LitegerLiteral节点：

```java
 /**
	    * f0 -> <INTEGER_LITERAL>
	    */
	   public String visit(IntegerLiteral n, Environment argu) {
	      String _ret=n.f0.tokenImage;
	      argu.document.write("MOVE","a2",_ret);
	      argu.document.newline();
	      return "a2";
	   }
```

在这个节点，我们需要先将该integer Move进寄存器，在寄存器选择时，由于疏忽，我们使用了错误的寄存器，导致出现了一个操作中的两个操作数成为了同一个寄存器，即一个操作数被另一个操作数错误地覆盖，这造成了结果的错误，也显示出了我们在编写代码时的疏忽大意。

## lab5：Kanga to Mips

Mips和kanga相比，最大的区别是需要自己维护栈。这一部分的主要功能在于在代码中维护栈。

### 设计思路

#### 栈的维护
如图。其中SpilledArg 0到SpilledArg n-1是如何安排的参考作业4。具体来说，从SpilledArg 0到SpilledArg (paraCnt-5)放置溢出的参变量。从SpilledArg (paraCnt-4)到SpilledArg (n-17)放置溢出的其他变量。从SpilledArg n-16到SpilledArg n-1是保存/恢复用于寄存器分配的16个寄存器（s0-s7, t0-t7）。

![StackFrame](/Users/zhangjiashuo/Desktop/course/编译实习/面测/HW5_1700012838_1700012848/StackFrame.png)

#### 翻译思路
常用的抽象成函数（halloc, print, abort）。

对于stmt级别的直接翻译。

对于exp级别的，返回一个String，表示exp的内容。特别注意的是对于二元运算的翻译，直接翻译成四元式形式，对于四元式的dst先用一个"hole"占位，在外层的MOVE中再填这个hole。

### 代码实现
代码实现位于Kanga2MipsVisitor.java

