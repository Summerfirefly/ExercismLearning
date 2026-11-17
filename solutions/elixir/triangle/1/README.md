# 三角形

欢迎来到 Exercism Elixir 轨道中的 三角形。
如果你在运行测试或提交代码时需要帮助，请查看`HELP.md`。

## Instructions

判断一个三角形是 _equilateral_、_isosceles_ 还是 _scalene_。

_equilateral_ 三角形的三条边长度相同。

_isosceles_ 三角形至少有两条边长度相同。
（有时会规定为恰好有两条边长度相同，但在本练习中，我们认为至少有两条。）

_scalene_ 三角形的三条边长度各不相同。

## 注意

一个图形要成为三角形，所有边的长度都必须大于 0，且任意两条边的长度之和必须大于或等于第三条边的长度。

~~~~exercism/note
_退化三角形_ 是指两条边的长度之和**等于**第三条边长度的三角形，例如 `1, 1, 2`。
本练习选择不为退化三角形加入测试。
如果你愿意，可以处理这些情况，也可以放心地忽略它们。
~~~~

用等式表示：

设 `a`、`b`、`c` 为三角形的三条边。
那么下面三个表达式都必须成立：

```text
a + b ≥ c
b + c ≥ a
a + c ≥ b
```

参见[三角不等式][triangle-inequality]

[triangle-inequality]: https://en.wikipedia.org/wiki/Triangle_inequality

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
- @ryanzidago
- @sotojuan
- @Teapane
- @waiting-for-dev

### Based on

The Ruby Koans triangle project, parts 1 & 2 - https://www.rubykoans.com/