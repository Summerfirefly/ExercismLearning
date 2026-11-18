# All Your Base

欢迎来到 Exercism Elixir 轨道中的 All Your Base。
如果你在运行测试或提交代码时需要帮助，请查看`HELP.md`。

## Introduction

你刚刚被聘为数学教授。
第一周过得挺顺利，可到了第二周，事情有点不对劲。
问题是，学生们给出的每一个答案都是错的！
好在凭你的数学功底，你找出了症结所在：学生的答案*确实*是对的，只不过它们全都以 2 为底（也就是二进制）！
更奇妙的是，学生们每周用的进制都不一样。
为了帮你快速核对学生的答案，你要做一个在不同进制之间转换的工具。

## Instructions

把一个进制下表示某个数字的一串数位，转换成另一个进制下表示同一个数字的一串数位。

~~~~exercism/note
试着自己实现这个转换。
不要借助别的东西替你完成转换。
~~~~

## 关于[位值记数法][positional-notation]

在位值记数法中，**b**进制下的一个数字可以理解为**b**的各次幂的线性组合。

数字 42，_在 10 进制下_，表示：

`(4 × 10¹) + (2 × 10⁰)`

数字 101010，_在 2 进制下_，表示：

`(1 × 2⁵) + (0 × 2⁴) + (1 × 2³) + (0 × 2²) + (1 × 2¹) + (0 × 2⁰)`

数字 1120，_在 3 进制下_，表示：

`(1 × 3³) + (1 × 3²) + (2 × 3¹) + (0 × 3⁰)`

_没错。上面这三个数字完全一样。恭喜！_

[positional-notation]: https://en.wikipedia.org/wiki/Positional_notation

## Source

### Created by

- @ananthamapod

### Contributed to by

- @angelikatyborska
- @ChristianTovar
- @Cohen-Carlisle
- @devonestes
- @neenjaw
- @parkerl
- @sotojuan
- @ybod