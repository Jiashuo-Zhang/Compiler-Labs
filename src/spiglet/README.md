## readme
### 入口
spiglet2kanga/Main.java

Main.java中env.debug();输出调试信息，可以注释掉。

### 约定
寄存器a0-a3只用于参数传递，子函数在接收到参数后应该马上把a0-a3 MOVE到其他地方（具体是什么地方可以用提供的接口查询），如MOVE env.queryReg(0) a0。后面对这些参数的使用都应该用MOVE后的寄存器而不是a0-a3（这种设计参考了ppt）。

运行时栈的安排：(0, paraCnt - 4)放置溢出的参变量（TEMP 4对应SPILLEDARG 0，TEMP 5对应SPILLEDARG 1），(paraCnt - 4, spilledCnt)放置溢出的其他变量。

只分配了16个寄存器（s0-s7, t0-t7）用于保存局部/临时变量，a0-a3用于参数传递，t8, t9, v0, v1用于存放从栈中取出的值和存放返回值。

子函数有保存/恢复这16个寄存器（s0-s7, t0-t7）的责任。由于运行时栈的前spilledCnt已经或者将要放东西，保存这16个寄存器应该放在运行时栈的更后面。

### 接口
env是环境，fun是环境下的函数，String env.fun.queryReg(int TEMPID)，输入是TEMP的ID，输出是寄存器的名字，如s0，t2，如果是溢出的变量会返回SPILLEDARG X（X是具体溢出的位置）。