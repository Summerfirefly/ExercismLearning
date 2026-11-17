# 自由职业者费率

欢迎来到 Exercism Elixir 轨道中的 自由职业者费率。
如果你在运行测试或提交代码时需要帮助，请查看`HELP.md`。
如果你在练习中卡住了，请查看`HINTS.md`，不过先试着自己解决，不要急着看提示 :)

## Introduction

## 整数

Elixir 中有两种不同的数字：整数和浮点数。

整数就是没有小数部分的数字。

```elixir
integer = 3
# => 3
```

## 浮点数

浮点数的小数点后面有一位或多位数字。它们采用 64 位双精度浮点格式。

```elixir
float = 3.45
# => 3.45
```

### 处理数字

在[`Integer`][integer-functions]和[`Float`][float-functions]模块中，你可以找到一些用于处理这些类型的有用函数。基本算术运算符定义在[`Kernel`][kernel-arithmetic-operators]模块中。

### 转换

整数和浮点数可以混合在同一个算术表达式中使用。在表达式中使用浮点数，可以确保结果也是浮点数。

```elixir
2 * 3
# => 6

2 * 3.0
# => 6.0
```

不过，做除法时，结果始终是浮点数，即使只用整数也是这样。

```elixir
6 / 2
# => 3.0
```

要把浮点数转换为整数，可以用[`trunc/1`][trunc-1]舍去小数部分。

[integer-functions]: https://hexdocs.pm/elixir/Integer.html#functions
[float-functions]: https://hexdocs.pm/elixir/Float.html#functions
[kernel-arithmetic-operators]: https://hexdocs.pm/elixir/Kernel.html#*/2
[trunc-1]: https://hexdocs.pm/elixir/Kernel.html#trunc/1

## Instructions

在这个练习中，你将编写代码，帮助自由职业者与项目经理沟通。
你的任务是提供几个实用工具函数，用来快速计算日费率和月费率，也可以按给定的折扣计算。

我们先约定自由职业者和项目经理之间的几条规则：

- 日费率是小时费率的 8 倍。
- 一个月有 22 个可计费工作日。

有时，自由职业者会对日费率提供折扣（例如给最忠实的客户或非营利客户）。

折扣用表示百分比的小数来建模，例如`25.0`（25%）。

## 1. 根据小时费率计算日费率

实现一个名为`daily_rate`的函数，根据作为实参传入的小时费率计算日费率。
约定规定，一天有 8 个可计费小时。

```elixir
FreelancerRates.daily_rate(60)
# => 480.0
```

返回的日费率应为浮点数。

## 2. 计算折扣后的价格

实现一个`apply_discount`函数，计算应用折扣后的价格。

```elixir
FreelancerRates.apply_discount(150, 10)
# => 135.0
```

返回的值应始终是浮点数，不做任何舍入。

## 3. 根据小时费率和折扣计算月费率

实现一个`monthly_rate`函数，计算折扣后的月费率。
它接收两个实参：小时费率和折扣百分比。

```elixir
FreelancerRates.monthly_rate(77, 10.5)
# => 12130
```

返回的月费率应向上取整（取上限）为最接近的整数。

## 4. 根据预算、小时费率和折扣计算完整工作日数

实现一个`days_in_budget`函数，接收预算、小时费率和折扣，计算这些预算能覆盖多少个完整工作日。

```elixir
FreelancerRates.days_in_budget(20000, 80, 11.0)
# => 35.1
```

返回的天数应向下取整（取下限）到一位小数。

## Source

### Created by

- @angelikatyborska

### Contributed to by

- @neenjaw