## 入口

入口为Main.java 

具体使用同Minijava部分的使用:  **java Main JavaSourceFilePath**

## 输出

* Minijava code
* Piglet code

## 测试用例

位于testcases/Piglet。

新加入了一些测试用例，加上之前的，目前所有测试用例全部通过。

测试用例简介：
1. 1-4.java：对翻译器有一个基本的了解。
2. 自己编的测试用例：Polymorphism.java（多态），ShortOut.java（逻辑运算符短路），Just19.java（刚好19个参数），MoreThan20.java（21个参数）。
3. 剩下的是从ucla拿来的测试用例。

## 一些已知bug

1. 对于测试用例1.java, Begin与End不匹配。（main函数这块不需要匹配，main stmt end）
2. 对于测试用例2.java ToPigletVistor中Primary Expression语句翻译出现问题（第一个Hallocate为0）（已修复）
3. Begin 这个lable之后都没换行？（已修复）
4. 其他一些bug的修复。比较杂乱，不详细说明了。

## TODO

1. 未加入Piglet Interpreter对于我们生成的Piglet程序的运行结果，因为我不熟悉java开shell进程操作，准备用python包装一下。（不知道有没有必要写批处理，因为没多少测试用例，并且输出并不多，目前这些样例我都是手工对比的）
2. 考虑还有什么方面我们的测试用例没有覆盖到？

