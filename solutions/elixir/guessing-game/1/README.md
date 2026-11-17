# 猜数字游戏

欢迎来到 Exercism Elixir 轨道中的 猜数字游戏。
如果你在运行测试或提交代码时需要帮助，请查看`HELP.md`。
如果你在练习中卡住了，请查看`HINTS.md`，不过先试着自己解决，不要急着看提示 :)

## Introduction

## 多子句函数

Elixir 允许函数拥有多个子句，以此践行**开闭原则**。这样就不必写冗长而写死的控制逻辑，而是可以写出目标明确的函数，轻松地增删行为。

Elixir 提供_多个函数子句_和_守卫_，可以这样写：

```elixir
def number(n) when n == 7 do
  "Awesome, that's my favorite"
end

def number(_n) do
  "That's not my favorite"
end
```

在运行时，Elixir 会从源文件的顶部到底部依次测试该调用哪个函数子句。

未使用的变量应加上下划线前缀。

## 守卫

守卫借助守卫函数对实参的求值，来阻止 Elixir 调用函数。守卫以 `when` 关键字开头，后面跟一个布尔表达式。守卫函数是一类特殊的函数，它们：

- 必须是纯函数，且不能改变任何全局状态。
- 必须返回严格的 `true` 或 `false` 值。

常见守卫的列表可以在 [Elixir 文档][kernel-guards] 中找到。其中包括类型检查、基本算术、比较，以及严格意义的布尔运算符。

## 默认实参

函数可以为一个或多个实参声明默认值。我们来看这个函数：

```elixir
def number(n \\ 13), do: "That's not my favorite"
```

编译时，Elixir 会为 `number/0`（无实参）和 `number/1`（一个实参）各创建一个函数定义。

如果有多个实参都有默认值，这些默认值会从左到右依次应用到函数上，用来补齐缺失的实参。

如果函数有多个子句，默认实参应定义在函数子句之前的函数头（没有函数体的函数）里：

```elixir
def number(n \\ 13)
def number(n) when n < 10, do: "Dream bigger!"
def number(n) when n > 100, do: "Not that big..."
```

[kernel-guards]: https://hexdocs.pm/elixir/Kernel.html#guards

## Instructions

你正在制作一个简单的在线游戏，让朋友来猜一个秘密数字。你想给出一些反馈，但又不能因为一次猜测就泄露答案。你需要设计一个函数，根据猜测与秘密数字的关系给出不同的回应。

| 条件                                                     | 回应       |
| ------------------------------------------------------------- | -------------- |
| 当猜测与秘密数字相同时                      | "Correct"      |
| 当猜测比秘密数字大 1 或小 1 时 | "So close"     |
| 当猜测大于秘密数字时              | "Too high"     |
| 当猜测小于秘密数字时              | "Too low"      |
| 当没有进行猜测时                                       | "Make a guess" |

所有猜测和秘密数字都是整数。

## 1. 当猜测与秘密数字相同时，给出回应

实现 `compare/2` 函数，它接受两个实参 `secret_number` 和 `guess`，两者都是整数。

```elixir
GuessingGame.compare(5, 5)
# => "Correct"
```

## 2. 当猜测大于秘密数字时，给出回应

修改 `compare` 函数，让它对高于秘密数字的猜测做出回应。

```elixir
GuessingGame.compare(5, 8)
# => "Too high"
```

## 3. 当猜测小于秘密数字时，给出回应

修改 `compare` 函数，让它对低于秘密数字的猜测做出回应。

```elixir
GuessingGame.compare(5, 2)
# => "Too low"
```

## 4. 当猜测比秘密数字大 1 或小 1 时，给出回应

修改 `compare` 函数，让它对接近秘密数字的猜测做出回应。

```elixir
GuessingGame.compare(5, 6)
# => "So close"
GuessingGame.compare(5, 4)
# => "So close"
```

## 5. 当没有猜测时，给出回应

修改 `compare` 函数，让它对没有猜测的情况做出回应。

```elixir
GuessingGame.compare(5)
# => "Make a guess"

GuessingGame.compare(5, :no_guess)
# => "Make a guess"
```

## Source

### Created by

- @neenjaw

### Contributed to by

- @angelikatyborska