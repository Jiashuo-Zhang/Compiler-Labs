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
