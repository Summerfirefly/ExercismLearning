# 秘密握手

欢迎来到 Exercism Elixir 轨道中的 秘密握手。
如果你在运行测试或提交代码时需要帮助，请查看`HELP.md`。
如果你在练习中卡住了，请查看`HINTS.md`，不过先试着自己解决，不要急着看提示 :)

## Introduction

你正和几个朋友以及朋友的朋友一起创办一个秘密编程俱乐部。大家并非都认识彼此，于是你和朋友们决定设计一套秘密握手暗号，用来确认对方是俱乐部成员。你不想让任何不知情的人破解这套代码。

你们设计的方案是：一个人说出 1 到 31 之间的一个数字，另一个人把它转换成一系列动作。

## Instructions

你的任务是把 1 到 31 之间的一个数字转换成秘密握手中的一系列动作。

动作序列通过查看数字转换成二进制后最右边的五位来确定。从最右边的数字开始，向左逐位查看。

每个数位对应的动作是：

```plaintext
00001 = wink
00010 = double blink
00100 = close your eyes
01000 = jump
10000 = Reverse the order of the operations in the secret handshake.
```

我们以数字`9`为例：

- 9 的二进制是`1001`。
- 最右边的数字是 1，所以第一个动作是`wink`。
- 继续向左，下一个数字是 0，所以没有 double blink。
- 再向左，下一个数字是 0，所以眼睛保持睁开。
- 再向左，下一个数字是 1，所以执行 jump。

这是最后一位，所以最终的握手动作是：

```plaintext
wink, jump
```

给定数字 26（二进制为`11010`），我们得到以下动作：

- double blink
- jump
- 反转动作顺序

因此，26 的秘密握手是：

```plaintext
jump, double blink
```

~~~~exercism/note
如果你不确定二进制是什么或它是如何工作的，可以查看[这篇二进制教程][intro-to-binary]。

[intro-to-binary]: https://medium.com/basecs/bits-bytes-building-with-binary-13cb4289aafa
~~~~

## Source

### Created by

- @DoggettCK

### Contributed to by

- @angelikatyborska
- @Cohen-Carlisle
- @devonestes
- @mlopes
- @neenjaw
- @sotojuan

### Based on

Bert, in Mary Poppins - https://www.imdb.com/title/tt0058331/quotes/?item=qt0437047