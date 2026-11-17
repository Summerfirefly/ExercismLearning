# 扁平化数组

欢迎来到 Exercism Elixir 轨道中的 扁平化数组。
如果你在运行测试或提交代码时需要帮助，请查看`HELP.md`。

## Introduction

一批应急物资已经送到，但有个问题。
为了防止损坏，物品（手电筒、急救包、毯子）都被装在箱子里，而其中一些箱子还嵌套在其他箱子里，足足有好几层！

为了应对紧急情况，所有东西都必须放在同一个箱子里，方便随时取用。你能把所有物资都取出来，装进一个箱子，让它们在最需要的时候随手就能拿到吗？

## Instructions

接收一个任意深度的嵌套数组，返回一个完全扁平化后的数组。

注意，某些语言轨道可能会在输入数组中包含类似 null 的值，而这些值的表示方式因轨道而异。
这些值应当从扁平化后的数组中排除。

此外，输入数据的类型可能不同，所包含的类型也可能不同，具体取决于轨道。

详情请查阅测试套件。

## 示例

输入：`[1, [2, 6, null], [[null, [4]], 5]]`

输出：`[1, 2, 6, 4, 5]`

## Elixir 专属改动

上面这段练习说明是 Exercism 所有 track 共用的。它说的是“数组”，但 Elixir 里没有这种数据类型。这个练习讲的是**列表**。

## Source

### Created by

- @bernardoamc

### Contributed to by

- @angelikatyborska
- @Cohen-Carlisle
- @devonestes
- @jwworth
- @lpil
- @neenjaw
- @parkerl
- @sotojuan

### Based on

Interview Question - https://reference.wolfram.com/language/ref/Flatten.html