# 秘密

欢迎来到 Exercism Elixir 轨道中的 秘密。
如果你在运行测试或提交代码时需要帮助，请查看`HELP.md`。
如果你在练习中卡住了，请查看`HINTS.md`，不过先试着自己解决，不要急着看提示 :)

## Introduction

## 匿名函数

在 Elixir 中，函数是一等公民。这意味着：

- 具名函数和匿名函数都可以赋值给变量。
- 具名函数和匿名函数都可以像数据一样作为参数传递，也可以作为返回值。
- 匿名函数可以动态创建。

与具名函数不同，匿名函数没有可用的静态引用：只有把它赋值给变量，或者立即调用它，才能使用它。

我们可能会用匿名函数来：

- 通过词法作用域（也称为闭包）隐藏数据。
- 在运行时动态创建函数。

匿名函数以保留字 `fn` 开头，参数与函数体之间用 `->` 符号分隔，最后以 `end` 结束。与具名函数一样，函数中的最后一个表达式会_隐式返回_给调用方。

要调用一个函数引用，必须在引用变量和参数列表之间加上 `.`：

```elixir
function_variable = fn param ->
  param + 1
end

function_variable.(1)
# => 2
```

你甚至可以使用简写捕获语法让它更简洁：

```elixir
variable = &(&1 + 1)

variable.(1)
# => 2
```

## 位操作

Elixir 在 _Bitwise 模块_中提供了许多处理二进制位的函数。

- `band/2`：按位与
- `bsl/2`：按位左移
- `bsr/2`：按位右移
- `bxor/2`：按位异或
- `bor/2`：按位或
- `bnot/1`：按位取反

下面是一个使用位运算函数的例子：

```elixir
Bitwise.bsl(1, 3)
# => 8
```

所有位运算函数都只能处理整数。

如果你使用的是 Elixir 1.9 或更低的版本，需要在模块定义的开头调用 `require Bitwise`，才能使用 _Bitwise_ 模块。

## Instructions

在这个练习中，你的任务是为一台加密设备编写软件，它通过对数据执行变换来工作。你需要一种方式，把简单的函数组合起来，灵活地创建出复杂的函数。

每个任务都要求返回一个匿名函数，调用方可以在自己的作用域里调用它。

所有函数都应接收整数实参。在 Elixir 中，整数也适合用来做按位运算。

## 1. 创建一个加法器

实现 `Secrets.secret_add/1`。它应返回一个函数，这个函数接收一个实参，并把传给 `secret_add` 的实参加到它上面。

```elixir
adder = Secrets.secret_add(3)
adder.(2)
# => 5
```

## 2. 创建一个减法器

实现 `Secrets.secret_subtract/1`。它应返回一个函数，这个函数接收一个实参，并从该实参中减去传给 `secret_subtract` 的秘密值。

```elixir
subtractor = Secrets.secret_subtract(2)
subtractor.(3)
# => 1
```

## 3. 创建一个乘法器

实现 `Secrets.secret_multiply/1`。它应返回一个函数，这个函数接收一个实参，并把它乘以传给 `secret_multiply` 的秘密值。

```elixir
multiplier = Secrets.secret_multiply(7)
multiplier.(3)
# => 21
```

## 4. 创建一个除法器

实现 `Secrets.secret_divide/1`。它应返回一个函数，这个函数接收一个实参，并把它除以传给 `secret_divide` 的秘密值。

```elixir
divider = Secrets.secret_divide(3)
divider.(32)
# => 10
```

请使用整数除法，这样输出才能与其他函数期望的输入兼容。

## 5. 创建一个“与”运算器

实现 `Secrets.secret_and/1`。它应返回一个函数，这个函数接收一个实参，并对它和传给 `secret_and` 的秘密值执行按位与运算。

```elixir
ander = Secrets.secret_and(1)
ander.(2)
# => 0
```

## 6. 创建一个“异或”运算器

实现 `Secrets.secret_xor/1`。它应返回一个函数，这个函数接收一个实参，并对它和传给 `secret_xor` 的秘密值执行按位异或运算。

```elixir
xorer = Secrets.secret_xor(1)
xorer.(3)
# => 2
```

## 7. 创建一个函数组合器

实现 `Secrets.secret_combine/2`。它应返回一个函数，这个函数接收一个实参，并按顺序把传给 `secret_combine` 的两个函数应用到这个实参上。

```elixir
add_one = Secrets.secret_add(1)
multiply_by_2 = Secrets.secret_multiply(2)
combined = Secrets.secret_combine(add_one, multiply_by_2)

combined.(3)
# => 8
```

## Source

### Created by

- @neenjaw