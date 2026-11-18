# 二分查找

欢迎来到 Exercism Elixir 轨道中的 二分查找。
如果你在运行测试或提交代码时需要帮助，请查看`HELP.md`。

## Introduction

你偶然遇到了一群数学家，他们同时也是创作歌手。
他们为自己最喜欢的每个数字都写了一首歌。可想而知，他们最喜欢的数字有很多（比如 [0][zero]、[73][seventy-three] 或 [6174][kaprekars-constant]）。

你很好奇，想听听为你最喜欢的数字写的那首歌，但要听的歌实在太多，找到对的那首可能要花些时间。
好在他们把这些歌整理成了一个播放列表，并按标题排序，而标题就是这首歌所唱的那个数字。

你意识到，可以用二分查找算法根据标题快速找到一首歌。

[zero]: https://en.wikipedia.org/wiki/0
[seventy-three]: https://en.wikipedia.org/wiki/73_(number)
[kaprekars-constant]: https://en.wikipedia.org/wiki/6174_(number)

## Instructions

你的任务是实现一个二分查找算法。

二分查找算法通过在数组中反复对半拆分来查找某一项，每次都只保留包含目标项的那一半。它能让我们快速缩小目标项可能所在的位置，直到找到它，或者排除掉所有可能的位置。

~~~~exercism/caution
二分查找只有在数组已经排好序时才能正常工作。
~~~~

算法的过程如下：

- 找到_有序_数组的中间元素，并把它和我们要找的目标项作比较。
- 如果中间元素就是目标项，那就完成了！
- 如果中间元素大于目标项，就可以排除该元素以及它**之后**的所有元素。
- 如果中间元素小于目标项，就可以排除该元素以及它**之前**的所有元素。
- 如果数组中的每个元素都被排除了，说明目标项不在数组中。
- 否则，对数组中还没有被排除的部分重复这个过程。

下面是一个例子：

假设我们要在下面这个有序数组中查找数字 23：`[4, 8, 12, 16, 23, 28, 32]`。

- 首先，我们把 23 和中间元素 16 作比较。
- 因为 23 大于 16，我们可以排除数组的左半部分，只剩下 `[23, 28, 32]`。
- 接着，我们把 23 和新的中间元素 28 作比较。
- 因为 23 小于 28，我们可以排除数组的右半部分：`[23]`。
- 我们找到了目标项。

## Source

### Created by

- @bernardoamc

### Contributed to by

- @angelikatyborska
- @Cohen-Carlisle
- @devonestes
- @lpil
- @martinsvalin
- @neenjaw
- @parkerl
- @screamingjungle
- @sotojuan
- @waiting-for-dev

### Based on

Wikipedia - https://en.wikipedia.org/wiki/Binary_search_algorithm