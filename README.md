# Compiler-Labs
## 作业1：语义检查
语义检查主要检查的语义错误分类及其处理方法：
- 类、方法、变量的重复定义，建符号表时处理
- 类的循环继承，遍历符号表时处理
- 声明时类型的未定义错误，遍历符号表时处理
- 方法的重载错误，遍历符号表时处理
- 使用方法、变量时的未定义错误，遍历语法树时处理
- 类型匹配错误，遍历语法树时处理

### 类、方法、变量的重复定义
只看当前作用域。很简单就不给出样例了。

### 类的循环继承
注意自环`class A extends A`也是循环继承。很简单就不给出样例了。

### 声明时类型的未定义错误
检查范围包括
- 类继承的父类有没有定义
- 类的成员变量的类型有没有定义
- 方法的返回值的类型有没有定义
- 方法的参数类型有没有定义
- 方法的局部变量的类型有没有定义

可以根据以上几种检查范围给出样例。
注意以下几种样例是对的。

	class A {A a;}
或者

	class A {B a;}
	class B {A b;}
或者

	class A extends B {A a;B b;}
	class B {A a;B b;}

### 方法的重载错误
方法的重载指父类和子类有相同名字的方法，但基调（返回值类型，参数顺序、数量、类型）不同。此处的不同是严格的不同，不考虑继承的情况。
据此，检查是否有重载。

### 使用方法、变量时的未定义错误
检查语法树节点以及检查内容：

| 语法树节点  | 检查内容 |
| ------------- | ------------- |
| AssignmentStatement  | 被赋值的变量是否被定义  |
| ArrayAssignmentStatement | 被赋值的数组变量是否被定义  |
| MessageSend | 调用方法的变量是否被定义，变量调用的方法是否被定义  |
| PrimaryExpression | 当PrimaryExpression是Identifier时，说明PrimaryExpression是一个变量。变量是否被定义  |
| AllocationExpression | 类是否被定义  |

### 类型匹配错误
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

## 作业2：把minijava代码翻译成piglet代码

### 设计

#### 从面向对象的语言到面向过程的语言
用VTable和DTable表示一个类的实例，然后把实例的地址也作为参数传入函数调用中。具体来说，地址放在第一个参数的位置，即`TEMP 0`。

在ClassList中调用buildVDTable，即可在java中显式地创建出VTable和DTable。注意到此处的VTable的第一项还没有指向DTable的指针，在AllocationExpression中需要进一步组装。

为了实现多态，具体的设计是，一个类的VTable就是其父类的VTable，再加上自己类的成员变量。一个类的DTable就是其父类的DTable，再加上自己类的方法，如果自己类的方法与父类方法有同名，就用自己类的方法覆盖掉父类的方法。偏移量容易算出。

#### 数组的处理
数组用地址来表示。长度为n的数组需要n+1个位置存储，第一个位置存放长度。

#### 函数参数大于等于20个的处理
根据Piglet Interpreter的实现，好像不需要处理。但考虑到后续寄存器分配的可能的方便，还是假设需要处理。

设参数有n个（n>=20），那么前18个参数放在`TEMP 1`到`TEMP 18`，然后`MOVE TEMP 19 HALLOCATE TIMES 4 MINUS n 18`，然后设现在要放第k个参数（k>=19），就`HSTORE TEMP 19 TIMES 4 MINUS k 19 第k个参数的值`。在翻译时遇到参变量需要考虑其位置。

#### 为符号表添加功能
符号表需要额外支持：
1. 查询某个变量的位置（成员变量？参变量？局部变量？）
2. 查询某个变量的偏移量（第几个成员变量？参变量？局部变量？）
3. 为方法重命名

这里没有考虑语法树节点AllocationExpression和MessageSend。在这两个节点，符号表可能需要额外支持查询某个类的实例的size，查询某个方法的偏移量等等。


#### 翻译思路
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

但是piglet语言的`PLUS`语句自带返回值（不像汇编语句，即`PLUS a b`等价于`RETURN PLUS a b`），所以说虽然上面的翻译也对，但不需要，可以直接翻译成`PLUS a b`。以上的三种策略会贯穿整个翻译过程。

然后就是遍历语法树生成piglet代码了。

### 实现
生成代码需要一些额外的格式控制。参见ToPigletVisitor.java下的CodeManager类。

CodeManager类就是StringBuffer的封装，可以把它看成一个文档。在遍历语法树的时候向CodeManager中写入代码即可。

由于写入代码是过程而不需要返回值，所以ToPigletVistor继承自GJVoidDepthFirst。

在MessageSend时，需要得知是何种类的实例在调用方法，此时由于缺少返回值，实现起来比较麻烦。初步设想是可以在MessageSend节点new一个TraverseVisitor，用TraverseVisitor得知是何种类的实例。如果不行，也可以让ToPigletVistor继承自GJDepthFirst。

以下列出所有需要考虑的语法树节点。

#### Goal
把主类和其他类的代码串起来就行。

#### MainClass
在翻译PrintStatement的基础上加外壳。

#### MethodDeclaration
翻译语句块Statement，翻译返回值表达式Expression，然后加外壳。

#### AssignmentStatement
把右值的表达式Expression赋给左值Identifier。用`HSTORE 左值Identifier 右值Expression`或者`MOVE 左值Identifier 右值Expression`。

具体来说，考虑左值的三种情况：
1. 是类（或者考虑继承，父类）的成员。此时左值的地址应该在`TEMP 0`加一个偏移量的地方寻找。此时使用`HSTORE`。例如`HSTORE TEMP 0 4 5`。
2. 是参变量。那么需要根据参变量在何处，用`MOVE`，或者用`HSTORE`。具体在后文Identifier中分析。
3. 是方法中的局部变量。此时左值应该在`TEMP 20`到`TEMP 9999`之间。使用`MOVE`。例如`MOVE TEMP 20 5`。

在考虑左值是地址还是值的时候要注意java语言是按值传递的。对于第一种情况，类的成员变量在堆上。对于后两种情况，参变量和局部变量在栈上。对于数组或者类的情况，数组或者类的地址是参变量或者局部变量，所以在栈上，而内容在堆上。

#### ArrayAssignmentStatement
由于这是`a[i] = b`的情况，所以不管a是上述三种情况中的哪一种，都可以先取一个寄存器，把a[0]的地址放到新的寄存器中。
然后再计算表达式Expression，进而算出偏移量。再组装得到a[i]的地址。再用`HSTORE a[i]的地址 右值Expression`。
对于`Identifier[IndexExpression] = RightExpression`，翻译如下：

	MOVE NEWTEMP 1 Identifier
	MOVE NEWTEMP 2 PLUS 4 TIMES 4 IndexExpression
	MOVE NEWTEMP 1 PLUS NEWTEMP 1 NEWTEMP 2
	HSTORE NEWTEMP 1 0 RightExpression

#### IfStatement
对于`if Expression then ThenStatement else ElseStatement`，翻译如下：

    	CJUMP Expression label_1
    	ThenStatement
    	JUMP label_2
    label_1
    	ElseStatement
    label_2
    	NOOP

#### WhileStatement
对于`while Expression BodyStatement`，翻译如下：

    label_1
    	CJUMP Expression label_2
    	BodyStatement
    	JUMP label_1
    label_2
    	NOOP

#### PrintStatement
对于`System.out.println(Expression)`，翻译如下：

    Print Expression

#### AndExpression
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

#### CompareExpression
对于`Expression1 < Expression2`，翻译如下：

    LT Expression1 Expression2

#### PlusExpression
对于`Expression1 + Expression2`，翻译如下：

    PLUS Expression1 Expression2

#### MinusExpression
对于`Expression1 - Expression2`，翻译如下：

    Minus Expression1 Expression2

#### TimesExpression
对于`Expression1 * Expression2`，翻译如下：

    Times Expression1 Expression2

#### ArrayLookup
对于`PrimaryExpression[IndexExpression]`，翻译如下：

	BEGIN
	MOVE NEWTEMP 1 PrimaryExpression
	MOVE NEWTEMP 2 PLUS 4 TIMES 4 IndexExpression
	MOVE NEWTEMP 1 PLUS NEWTEMP 1 NEWTEMP 2
	HLOAD NEWTEMP 3 NEWTEMP 1 0
	RETURN NEWTEMP 3
	END

注意到这里数组是PrimaryExpression而不是Identifier。所以除了Identifier的上述三种情况外，还有一种情况是，PrimaryExpression是ArrayAllocationExpression的情形。显然ArrayAllocationExpression需要`RETURN`在堆上为数组创建的地址。后文会讨论Identifier和ArrayAllocationExpression的翻译。

#### ArrayLength
数组长度存放在第一个位置，因此偏移量为0。

对于`PrimaryExpression.length`，翻译如下：

	BEGIN
	MOVE NEWTEMP 1 PrimaryExpression
	HLOAD NEWTEMP 2 NEWTEMP 1 0
	RETURN NEWTEMP 2
	END

#### MessageSend
待补充。特别是在这个节点会处理传入参数超过20个的情形，如何处理上文已作介绍。

#### IntegerLiteral
数字本身即是代码。

#### TrueLiteral
翻译为数字1。

#### FalseLiteral
翻译为数字0。

#### Identifier
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

#### ThisExpression
对于`this`的翻译就是`TEMP 0`。

#### ArrayAllocationExpression
对于`new int[Expression]`，翻译如下：

    BEGIN
    MOVE NEWTEMP 1 Expression
    MOVE NEWTEMP 2 PLUS 4 TIMES 4 NEWTEMP 1
    MOVE NEWTEMP 3 HALLOCATE NEWTEMP 2
    HSTORE NEWTEMP 3 0 NEWTEMP 1
    RETURN NEWTEMP 3
    END

#### AllocationExpression
待补充。

#### NotExpression
对于`!Expression`，翻译如下：

    MINUS 1 Expression
