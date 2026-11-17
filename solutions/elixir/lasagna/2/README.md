# 千层面

欢迎来到 Exercism Elixir 轨道中的 千层面。
如果你在运行测试或提交代码时需要帮助，请查看`HELP.md`。
如果你在练习中卡住了，请查看`HINTS.md`，不过先试着自己解决，不要急着看提示 :)

## Introduction

## 基础

### 变量

Elixir 是一门动态类型语言，这意味着变量的类型只在运行时检查。使用匹配运算符 `=`，我们可以把任意类型的值绑定到变量名上：

```elixir
# Bound an integer value of 1
count = 1
# You may re-bind variables
count = 2

# You may re-bind any type to a variable
count = false

# Strings can be created by enclosing characters within double quotes
message = "Success!"
```

### 模块

Elixir 是一门[函数式编程语言][functional-programming]，它要求所有具名函数都定义在_模块_中。`defmodule` 关键字用来定义模块。所有模块在运行时都对其他模块可用，不需要_访问修饰符_就能让程序的其他部分看到它们。_模块_类似于其他编程语言中的_类_。

```elixir
defmodule Calculator do
  # ...
end
```

### 具名函数

_具名函数_必须定义在模块中。`def` 关键字用来定义_公开_的具名函数。

每个函数可以有零个或多个实参。函数中最后一个表达式的值总是被_隐式返回_。

```elixir
defmodule Calculator do
  def add(x, y) do
    x + y
  end
end
```

调用函数时，要指定它的模块名和函数名，并为函数的每个实参传入值。

```elixir
sum = Calculator.add(1, 2)
# => 3
```

`defp` 关键字可以代替 `def` 来定义_私有_函数。私有函数只能在定义它们的同一个模块内部使用。

调用同一个模块中定义的函数时，可以省略模块名。

你也可以用单行语法编写简短的函数（注意关键字 `do` 前后的逗号 `,` 和冒号 `:`）。

```elixir
defmodule Calculator do
  def subtract(x, y) do
    private_subtract(x, y)
  end

  defp private_subtract(x, y), do: x - y
end

difference = Calculator.subtract(7, 2)
# => 5

difference = Calculator.private_subtract(7, 2)
# => ** (UndefinedFunctionError) function Calculator.private_subtract/2 is undefined or private
#       Calculator.private_subtract(7, 2)
```

### 函数的元数

人们常用元数来指代函数。一个函数的元数是它接受的实参个数。

```elixir
# add/3 because this function has three arguments, thus an arity of 3
def add(x, y, z) do
  x + y + z
end
```

### 命名约定

模块名应使用 `PascalCase`。模块名必须以大写字母 `A-Z` 开头，可以包含字母 `a-zA-Z`、数字 `0-9` 和下划线 `_`。

变量名和函数名应使用 `snake_case`。变量名或函数名必须以小写字母 `a-z` 或下划线 `_` 开头，可以包含字母 `a-zA-Z`、数字 `0-9` 和下划线 `_`，并且可以以问号 `?` 或感叹号 `!` 结尾。

### 标准库

Elixir 拥有非常丰富、文档完善的标准库。文档可以在网上找到：[hexdocs.pm/elixir][docs]。把这个链接收藏起来，你会经常用到它！

大多数内置数据类型都有对应的模块，提供处理该数据类型的函数，例如整数有 `Integer` 模块，字符串有 `String` 模块，数组有 `List` 模块，等等。

有一个值得注意的模块是 `Kernel` 模块。它提供了构建标准库其余部分所依赖的基础能力，比如算术运算符、控制流宏，等等。`Kernel` 模块中的函数会被自动导入，因此你无需加 `Kernel.` 前缀就能使用它们。

### 代码注释

注释可以用来给阅读源代码的其他开发者留言。Elixir 中的单行注释以 `#` 开头。

[functional-programming]: https://en.wikipedia.org/wiki/Functional_programming
[docs]: https://hexdocs.pm/elixir/Kernel.html#content

## Instructions

在这个练习中，你将编写一些代码，帮你按照自己最喜欢的食谱做出一道美味的千层面。

你有 5 个任务，全都与做千层面花费的时间有关。

## 1. 定义预期的烤箱时间（分钟）

定义`Lasagna.expected_minutes_in_oven/0`函数，该函数不接受任何实参，返回千层面需要在烤箱中烤多少分钟。根据食谱，预期的烤箱时间是 40 分钟：

```elixir
Lasagna.expected_minutes_in_oven()
# => 40
```

## 2. 计算剩余的烤箱时间（分钟）

定义`Lasagna.remaining_minutes_in_oven/1`函数，该函数接受千层面已经在烤箱中烤的实际分钟数作为实参，并根据上一个任务中预期的烤箱时间，返回千层面还需要在烤箱中烤多少分钟。

```elixir
Lasagna.remaining_minutes_in_oven(30)
# => 10
```

## 3. 计算准备时间（分钟）

定义`Lasagna.preparation_time_in_minutes/1`函数，该函数接受你往千层面里加的层数作为实参，返回你准备千层面所花的分钟数，假设准备每层需要 2 分钟。

```elixir
Lasagna.preparation_time_in_minutes(2)
# => 4
```

## 4. 计算总工作时间（分钟）

定义`Lasagna.total_time_in_minutes/2`函数，该函数接受 2 个实参：第 1 个实参是你往千层面里加的层数，第 2 个实参是千层面已经在烤箱中烤的分钟数。该函数应返回你烹饪千层面总共花了多少分钟，也就是准备时间的分钟数加上千层面此刻已经在烤箱中烤的分钟数。

```elixir
Lasagna.total_time_in_minutes(3, 20)
# => 26
```

## 5. 创建千层面已做好的通知

定义`Lasagna.alarm/0`函数，该函数不接受任何实参，返回一条消息，表示千层面已经可以吃了。

```elixir
Lasagna.alarm()
# => "Ding!"
```

## Source

### Created by

- @neenjaw

### Contributed to by

- @angelikatyborska