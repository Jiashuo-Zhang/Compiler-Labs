## 入口

入口为Main.java 

具体使用同Minijava部分的使用:  **java Main JavaSourceFilePath**

## 输出

* Minijava code
* Piglet code

## 测试用例

位于testcases/Piglet

## 一个已知bug

1. 对于测试用例1.java, Begin与End不匹配。
2. 对于测试用例2.java ToPigletVistor中Primary Expression语句翻译出现问题（第一个Hallocate为0）
3. Begin 这个lable之后都没换行？

## TODO

未加入Piglet Interpreter对于我们生成的Piglet程序的运行结果，因为我不熟悉java开shell进程操作，准备用python包装一下。

