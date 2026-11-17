# 雨滴

欢迎来到 Exercism Elixir 轨道中的 雨滴。
如果你在运行测试或提交代码时需要帮助，请查看`HELP.md`。

## Introduction

雨滴是 FizzBuzz 挑战的稍微复杂一点的版本，这是一个经典的面试题。

## Instructions

你的任务是把一个数字转换成它对应的雨滴声。

如果给定的数字：

- 能被 3 整除，就在结果中加上 "Pling"。
- 能被 5 整除，就在结果中加上 "Plang"。
- 能被 7 整除，就在结果中加上 "Plong"。
- **不能**被 3、5 或 7 整除，结果就应该是这个数字的字符串形式。

## 示例

- 28 能被 7 整除，但不能被 3 或 5 整除，所以结果是 `"Plong"`。
- 30 能被 3 和 5 整除，但不能被 7 整除，所以结果是 `"PlingPlang"`。
- 34 不能被 3、5 或 7 整除，所以结果是 `"34"`。

~~~~exercism/note
判断一个数能否被另一个数整除，一种常见做法是比较[余数][remainder]或[模][modulo]是否为零。
大多数语言都为其中一种（或两种）提供了运算符或函数。

[remainder]: https://exercism.org/docs/programming/operators/remainder
[modulo]: https://en.wikipedia.org/wiki/Modulo_operation
~~~~

## Source

### Created by

- @rubysolo

### Contributed to by

- @andrewsardone
- @angelikatyborska
- @Cohen-Carlisle
- @dalexj
- @devonestes
- @jinyeow
- @lpil
- @neenjaw
- @parkerl
- @sotojuan
- @Teapane
- @waiting-for-dev

### Based on

A variation on FizzBuzz, a famous technical interview question that is intended to weed out potential candidates. That question is itself derived from Fizz Buzz, a popular children's game for teaching division. - https://en.wikipedia.org/wiki/Fizz_buzz