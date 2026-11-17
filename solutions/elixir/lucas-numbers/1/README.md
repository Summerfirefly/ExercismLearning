# 卢卡斯数

欢迎来到 Exercism Elixir 轨道中的 卢卡斯数。
如果你在运行测试或提交代码时需要帮助，请查看`HELP.md`。
如果你在练习中卡住了，请查看`HINTS.md`，不过先试着自己解决，不要急着看提示 :)

## Introduction

## 流

`Enum` 模块中的所有函数都是_立即求值_的。用 `Enum` 模块对可枚举对象执行多个操作时，每个操作都会生成一个中间结果。

`Stream` 模块是_立即求值_的 `Enum` 模块的_惰性_替代品。它提供了许多与 `Enum` 相同的函数，但它不会生成中间结果，而是构建一系列计算；只有当流被传给 `Enum` 模块中的某个函数时，这些计算才会执行。

流实现了 _Enumerable [协议][exercism-protocols]_，并且可以组合使用：你可以把它们串联起来，实现更复杂的功能。

[exercism-enum]: https://exercism.org/tracks/elixir/concepts/enum
[exercism-protocols]: https://exercism.org/tracks/elixir/concepts/protocols

## Instructions

你是 [Numberphile Youtube 频道](https://www.youtube.com/watch?v=PeUbRXnbmms)的忠实粉丝，刚刚看了一个关于_卢卡斯数列_的精彩视频。你想用 Elixir 生成这个数列。

在设计函数时，你想利用_惰性求值_，这样可以生成任意多个数字，但只在需要时才生成。所以你决定使用流。

## 1. 捕获错误参数

添加一个守卫子句，当用来生成数列的不是整数，或者整数小于 1 时抛出错误。把它作为第一步，可以避免后续步骤中出现无限递归的 bug。

```elixir
LucasNumbers.generate("Hello World")
# => ** (ArgumentError) count must be specified as an integer >= 1
```

## 2. 生成基本情况

你知道这个数列有两个初始数字，它们并不遵循同一条规则。写两个基本情况子句来返回这两个数字：

```elixir
LucasNumbers.generate(1)
# => [2]

LucasNumbers.generate(2)
# => [2, 1]
```

## 3. 编写通用情况

对于任何长度超过 2 的数列，你需要把前两个数字相加得到下一个数字，依此类推。编写这个通用情况。

```elixir
LucasNumbers.generate(3)
# => [2, 1, 3]

LucasNumbers.generate(4)
# => [2, 1, 3, 4]
```

## Source

### Created by

- @neenjaw

### Contributed to by

- @angelikatyborska