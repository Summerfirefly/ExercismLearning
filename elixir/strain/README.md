# 筛选

欢迎来到 Exercism Elixir 轨道中的 筛选。
如果你在运行测试或提交代码时需要帮助，请查看`HELP.md`。
如果你在练习中卡住了，请查看`HINTS.md`，不过先试着自己解决，不要急着看提示 :)

## Instructions

在集合上实现 `keep` 和 `discard` 操作。
给定一个集合和作用于集合元素的谓词，`keep` 返回一个新集合，其中包含谓词为 true 的那些元素；而 `discard` 返回一个新集合，其中包含谓词为 false 的那些元素。

例如，给定这个数字集合：

- 1, 2, 3, 4, 5

以及这个谓词：

- 这个数字是偶数吗？

那么你的 keep 操作应该得到：

- 2, 4

而你的 discard 操作应该得到：

- 1, 3, 5

注意，keep 和 discard 的并集就是所有元素。

这两个函数可以命名为 `keep` 和 `discard`，也可能需要换个名字，以免与你的编程语言中已有的函数或概念冲突。

## 限制

别去碰标准库里提供的 filter/reject/管它叫什么 之类的功能！请改用其他基本工具，自己动手解决。

## Source

### Created by

- @petehuang

### Contributed to by

- @angelikatyborska
- @Cohen-Carlisle
- @devonestes
- @DoggettCK
- @fxn
- @kytrinyx
- @neenjaw
- @sotojuan

### Based on

Conversation with James Edward Gray II - http://graysoftinc.com/