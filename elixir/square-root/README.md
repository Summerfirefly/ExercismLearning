# 平方根

欢迎来到 Exercism Elixir 轨道中的 平方根。
如果你在运行测试或提交代码时需要帮助，请查看`HELP.md`。

## Introduction

我们正在发射一枚深空探索火箭，需要一种方法来确保导航系统始终对准目标。

计算的第一步，我们取一个目标数字，求出它的平方根（也就是一个数，它乘以自身等于目标数字）。

这段旅程会非常漫长。
为了让电池尽可能持久，我们不得不让火箭上的计算机非常省电。
遗憾的是，这意味着我们不能依赖高级的数学库和函数，因为它们更耗电。
我们要自己实现平方根计算。

## Instructions

你的任务是计算给定数字的平方根。

- 尽量避免使用所用编程语言中已有的数学库。
- 输入会是一个正整数，例如 1、2、3、4……
- 你只需要处理结果为正整数的情况。

一些可能的方法：

- 线性搜索或二分搜索，找出平方后等于输入数字的数。
- 使用牛顿法或海伦法进行逐次逼近。
- 一次计算一位数字，或一次计算一个二进制位。

你可以查看维基百科上关于[整数平方根][integer-square-root]和[计算平方根的方法][computing-square-roots]的页面，以帮助选择计算方法。

[integer-square-root]: https://en.wikipedia.org/wiki/Integer_square_root
[computing-square-roots]: https://en.wikipedia.org/wiki/Methods_of_computing_square_roots

## Elixir 特有改动

确保你的算法实现不依赖`:math.sqrt/1`或`Float.pow/2`这类内置函数。

## Source

### Created by

- @jiegillet

### Based on

wolf99 - https://github.com/exercism/problem-specifications/pull/1582