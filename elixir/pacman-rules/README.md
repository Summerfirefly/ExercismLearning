# 吃豆人规则

欢迎来到 Exercism Elixir 轨道中的 吃豆人规则。
如果你在运行测试或提交代码时需要帮助，请查看`HELP.md`。
如果你在练习中卡住了，请查看`HINTS.md`，不过先试着自己解决，不要急着看提示 :)

## Introduction

## 布尔值

Elixir 用布尔类型表示 true 和 false 这两个值。布尔值只有两个：`true`和`false`。这些值可以绑定到变量上：

```elixir
true_variable = true
false_variable = false
```

使用`and/2`、`or/2`和`not/1`运算符，可以计算严格的布尔表达式。

```elixir
true_variable = true and true
false_variable = true and false

true_variable = false or true
false_variable = false or false

true_variable = not false
false_variable = not true
```

编写返回布尔值的函数时，按照惯例会在函数名末尾加上`?`。存储布尔值的变量也可以遵循同样的约定。

```elixir
def either_true?(a?, b?) do
  a? or b?
end
```

## Instructions

在这个练习中，你需要把经典游戏 Pac-Man 里的一些规则翻译成 Elixir 函数。

你需要翻译四条规则，它们都与游戏状态有关。

> 不用担心这些实参是怎么来的，只要专注于把它们组合起来，返回期望的结果就好。

## 1. 定义 Pac-Man 能否吃掉幽灵

定义`Rules.eat_ghost?/2`函数，它接收两个实参（_Pac-Man 的能量豆是否处于激活状态_和_Pac-Man 是否碰到幽灵_），并返回一个布尔值，表示 Pac-Man 能否吃掉幽灵。只有当 Pac-Man 的能量豆处于激活状态并且碰到了幽灵时，这个函数才应返回 true。

```elixir
Rules.eat_ghost?(false, true)
# => false
```

## 2. 定义 Pac-Man 是否得分

定义`Rules.score?/2`函数，它接收两个实参（_Pac-Man 是否碰到能量豆_和_Pac-Man 是否碰到豆子_），并返回一个布尔值，表示 Pac-Man 是否得分。只要 Pac-Man 碰到了能量豆或豆子，这个函数就应返回 true。

```elixir
Rules.score?(true, true)
# => true
```

## 3. 定义 Pac-Man 是否输掉游戏

定义`Rules.lose?/2`函数，它接收两个实参（_Pac-Man 的能量豆是否处于激活状态_和_Pac-Man 是否碰到幽灵_），并返回一个布尔值，表示 Pac-Man 是否输掉游戏。如果 Pac-Man 碰到了幽灵，而且能量豆没有处于激活状态，这个函数就应返回 true。

```elixir
Rules.lose?(false, true)
# => true
```

## 4. 定义 Pac-Man 是否获胜

定义`Rules.win?/3`函数，它接收三个实参（_Pac-Man 是否吃掉了所有豆子_、_Pac-Man 的能量豆是否处于激活状态_和_Pac-Man 是否碰到幽灵_），并返回一个布尔值，表示 Pac-Man 是否获胜。如果 Pac-Man 吃掉了所有豆子，并且根据第 3 部分中定义的实参没有输掉游戏，这个函数就应返回 true。

```elixir
Rules.win?(false, true, false)
# => false
```

## Source

### Created by

- @neenjaw

### Contributed to by

- @Cohen-Carlisle