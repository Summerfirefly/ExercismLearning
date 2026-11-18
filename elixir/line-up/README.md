# 排队

欢迎来到 Exercism Elixir 轨道中的 排队。
如果你在运行测试或提交代码时需要帮助，请查看`HELP.md`。

## Introduction

你的朋友 Yaʻqūb 在镇上的一家熟食店站柜台。他切肉、称重、打包，招呼着排队的饥饿顾客，而这条队伍一天比一天长。
排队的顾客渐渐搞不清下一个轮到谁了，所以他想要一些带编号的号码牌，让顾客用来记住自己到达的先后顺序。

为了让顾客觉得自己很特别，他不希望号码牌上只有一个数字。
他们应该拿到一句像样的英文句子，上面有他们的名字和数字。

## Instructions

给定一个名字和一个数字，你的任务是使用这个名字和数字造一个句子，其中数字要写成[序数词][ordinal-numeral]。
Yaʻqūb 期望使用的数字范围是 1 到 999。

规则：

- 以 1 结尾的数字（除非以 11 结尾） → `"st"`
- 以 2 结尾的数字（除非以 12 结尾） → `"nd"`
- 以 3 结尾的数字（除非以 13 结尾） → `"rd"`
- 所有其他数字 → `"th"`

示例：

- `"Mary", 1` → `"Mary, you are the 1st customer we serve today. Thank you!"`
- `"John", 12` → `"John, you are the 12th customer we serve today. Thank you!"`
- `"Dahir", 162` → `"Dahir, you are the 162nd customer we serve today. Thank you!"`

[ordinal-numeral]: https://en.wikipedia.org/wiki/Ordinal_numeral

## Source

### Created by

- @FraSanga

### Based on

mk-mxp, based on previous work from Exercism contributors codedge and neenjaw - https://forum.exercism.org/t/new-exercise-ordinal-numbers/19147