# 鸟类计数

欢迎来到 Exercism Elixir 轨道中的 鸟类计数。
如果你在运行测试或提交代码时需要帮助，请查看`HELP.md`。
如果你在练习中卡住了，请查看`HINTS.md`，不过先试着自己解决，不要急着看提示 :)

## Introduction

## 递归

递归函数就是调用自身的函数。

一个递归函数至少需要一个_基准情形_，还至少需要一个_递归情形_。

_基准情形_不再调用函数，直接返回一个值。_递归情形_会再次调用函数，同时修改输入，让它在某个时刻满足基准情形。

很多时候，每种情形都分别写在自己的函数子句里。

```elixir
# base case
def count([]), do: 0

# recursive case
def count([_head | tail]), do: 1 + count(tail)
```

## Instructions

你是一位热情的观鸟爱好者，每天记录有多少只鸟造访你的花园。

你决定把观鸟提升到一个新的层次，实现几个工具来帮助你跟踪和处理这些数据。

你选择把数据存成一个整数数组。数组中第一个数字是今天造访花园的鸟的数量，第二个是昨天的，以此类推。

## 1. 检查今天有多少只鸟造访

实现`BirdCount.today/1`函数。它接收一个每日鸟数的数组，返回今天的鸟数。如果数组为空，则返回`nil`。

```elixir
BirdCount.today([2, 5, 1])
# => 2
```

## 2. 自增今天的计数

实现`BirdCount.increment_day_count/1`函数。它接收一个每日鸟数的数组，并把今天的鸟数自增 1。如果数组为空，返回`[1]`。

```elixir
BirdCount.increment_day_count([4, 0, 2])
# => [5, 0, 2]
```

## 3. 检查是否存在没有鸟造访的日子

实现`BirdCount.has_day_without_birds?/1`函数。它接收一个每日鸟数的数组。如果至少有一天没有鸟造访花园，就返回`true`，否则返回`false`。

```elixir
BirdCount.has_day_without_birds?([2, 0, 4])
# => true

BirdCount.has_day_without_birds?([3, 8, 1, 5])
# => false
```

## 4. 计算造访鸟的总数

实现`BirdCount.total/1`函数。它接收一个每日鸟数的数组，返回从你开始记录数据以来造访花园的鸟的总数。

```elixir
BirdCount.total([4, 0, 9, 0, 5])
# => 18
```

## 5. 计算忙碌日的数量

有些日子比其他日子更忙碌。忙碌的一天是指有 5 只或更多鸟造访花园的日子。

实现`BirdCount.busy_days/1`函数。它接收一个每日鸟数的数组，返回忙碌日的数量。

```elixir
BirdCount.busy_days([4, 5, 0, 0, 6])
# => 2
```

## Source

### Created by

- @angelikatyborska

### Contributed to by

- @neenjaw