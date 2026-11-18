# 厨房计算器

欢迎来到 Exercism Elixir 轨道中的 厨房计算器。
如果你在运行测试或提交代码时需要帮助，请查看`HELP.md`。
如果你在练习中卡住了，请查看`HINTS.md`，不过先试着自己解决，不要急着看提示 :)

## Introduction

## 元组

在 Elixir 中，元组是一种数据结构，用来组织数据。它可以容纳固定数量、任意类型的元素，但每个元素没有明确的名称。元组在 Elixir 中常用于对内存读取比较密集的操作，因为读取元素是一种常数时间的操作。当元素需要动态增删时通常不会使用元组，因为元组不会被修改，而是会创建一个新元组，这需要预先分配内存。

实际使用中，元组在 Elixir 里通过花括号创建。元组中的元素可以通过`elem/2`函数单独访问，下标从 0 开始：

```elixir
empty_tuple = {}
one_element_tuple = {1}
multiple_element_tuple = {1, :a, "hello"}

elem(multiple_element_tuple, 2)
# => "hello"
```

### 用元组表示成组的信息

实践中，元组常用来表示成组的信息。

```elixir
Float.ratio(0.25)
# => {1, 4} indicating the numerator and denominator of the fraction ¼
```

## 模式匹配

在断言式的、地道的 Elixir 代码中，模式匹配的使用非常普遍。你可能还记得，`=/2`被描述为匹配运算符，而不是赋值运算符。使用匹配运算符时，如果左边的模式与右边匹配，左边的变量就会被绑定，并返回右边的值。如果没有匹配，就会抛出`MatchError`。

```elixir
2 = 2
# => 2
# Literals can be matched if they are the same

2 = 3
# => ** (MatchError) no match of right hand side value: 3

{_, denominator} = Float.ratio(0.25)
# => {1, 4}
# the variable `denominator` is bound to the value 4
```

记住，匹配是从右边向左边进行的。

在上一个例子中，如果模式匹配里不需要某个变量，我们可以用`_`来丢弃它。任何以`_`开头的变量都不会被运行时跟踪。

### 具名函数中的模式匹配

模式匹配也是创建多个函数子句时的有用工具。模式匹配可以用在函数的实参上，从而决定调用哪个函数子句，从文件顶部开始往下，直到遇到第一个匹配。变量可以在函数头中绑定，并在函数体中使用。

```elixir
defmodule Example do
  def named_function(:a = variable_a) do
    {variable_a, 1}
  end

  def named_function(:b = variable_b) do
    {variable_b, 2}
  end
end

Example.named_function(:a)
# => {:a, 1}

Example.named_function(:b)
# => {:b, 2}

Example.named_function(:c)
# => ** (FunctionClauseError) no function clause matching in Example.named_function/1
```

## Instructions

在准备给朋友烤饼干时，你发现食谱里的一些计量单位需要换算。你只熟悉公制，因此需要想个办法，把常见的美制烘焙计量换算成毫升（mL），让自己用起来更方便。

解答时请使用下面这张换算表：

| 要换算的单位 | 体积 | 以毫升（mL）计 |
| --------------- | ------ | ------------------- |
| mL              | 1      | 1                   |
| 美制杯          | 1      | 240                 |
| 美制液量盎司    | 1      | 30                  |
| 美制茶匙        | 1      | 5                   |
| 美制汤匙        | 1      | 15                  |

作为一名正在学习的天才程序员，你决定用毫升作为中间单位，方便把表中任意一种单位换算成另一种（甚至是它自己）。

## 1. 从体积对中取出数值部分

实现`KitchenCalculator.get_volume/1`函数。给定一个体积对元组，它应只返回其中的数值部分。

```elixir
KitchenCalculator.get_volume({:cup, 2.0})
# => 2.0
```

## 2. 把体积对换算成毫升

实现`KitchenCalculator.to_milliliter/1`函数。给定一个体积对元组，它应使用换算表把体积换算成毫升。

使用多个函数子句和模式匹配，为每种单位编写对应的函数。用来表示各单位的原子是：`:cup`、`:fluid_ounce`、`:teaspoon`、`:tablespoon`、`:milliliter`。把换算结果包在元组里返回。

```elixir
KitchenCalculator.to_milliliter({:cup, 2.5})
# => {:milliliter, 600.0}
```

## 3. 把毫升体积对换算成其他单位

实现`KitchenCalculator.from_milliliter/2`函数。给定一个体积对元组和目标单位，它应使用换算表把体积换算成目标单位。

使用多个函数子句和模式匹配，为每种单位编写对应的函数。用来表示各单位的原子是：`:cup`、`:fluid_ounce`、`:teaspoon`、`:tablespoon`、`:milliliter`

```elixir
KitchenCalculator.from_milliliter({:milliliter, 1320.0}, :cup)
# => {:cup, 5.5}
```

## 4. 从任意单位换算到任意单位

实现`KitchenCalculator.convert/2`函数。给定一个体积对元组和目标单位，它应把给定的体积换算成目标单位。

```elixir
KitchenCalculator.convert({:teaspoon, 9.0}, :tablespoon)
# => {:tablespoon, 3.0}
```

## Source

### Created by

- @neenjaw

### Contributed to by

- @angelikatyborska