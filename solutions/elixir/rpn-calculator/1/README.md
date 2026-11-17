# RPN 计算器

欢迎来到 Exercism Elixir 轨道中的 RPN 计算器。
如果你在运行测试或提交代码时需要帮助，请查看`HELP.md`。
如果你在练习中卡住了，请查看`HINTS.md`，不过先试着自己解决，不要急着看提示 :)

## Introduction

## 错误

错误总会发生。在 Elixir 里，人们常说“让它崩溃”，但有时为了履行软件约定，我们需要把函数调用从错误中恢复到一个已知的良好状态。在某些语言中，错误被用作一种控制流的方法，但在 Elixir 中并不鼓励这种做法。通常只凭名字就能认出哪些函数可能会抛出错误：会抛出错误的函数，名字末尾都带`!`。与之相对的是返回`{:ok, value}`或`:error`的函数。看看下面这几个库函数的例子：

```elixir
Map.fetch(%{a: 1}, :b)
# => :error
Map.fetch!(%{a: 1}, :b)
# => raises KeyError
```

## Try/Rescue

Elixir 提供了`try .. rescue`这个结构，用来从错误中恢复。

```elixir
try do
  raise RuntimeError, "error"
rescue
  e in RuntimeError -> :error
end
```

我们来逐行看看这个结构：

- **第 1 行**，用`try`声明这个代码块。
- **第 2 行**，把可能出错的函数调用放在这里，本例中我们调用的是`raise/2`。
- **第 4 行**，在`rescue`段中，我们对所抛出错误的 _模块_ 名称做模式匹配
  - 在`->`的左侧：
    - `e`与错误结构体匹配。
    - `in`是关键字。
    - `RuntimeError`是我们想要捕获的错误。
      - 如果想捕获所有错误，可以用`_`代替模块名，或者干脆省略`in`关键字。
  - 在右侧：
    - 错误匹配时要执行的指令。

### 错误结构体

用这种方式捕获的错误（有时也叫“异常”）都是结构体。
在 Elixir 中，捕获错误是很少见的做法。
通常会把捕获到的错误记入日志，或发送到外部监控服务，然后再重新抛出。
这意味着我们通常不关心具体错误结构体的内部结构。

在[异常概念][exercism-exceptions]中，你会进一步了解错误结构体，包括如何定义自己的自定义错误。

[exercism-exceptions]: https://exercism.org/tracks/elixir/concepts/exceptions

## Instructions

在 _Instruments of Texas_ 工作期间，你接到的任务是开发一个用 Elixir 编写的实验性逆波兰表示法 [RPN] 计算器。你的团队遇到了一个问题：某些操作会抛出错误，导致进程崩溃。你接到的任务是编写一个函数来包装操作函数，以便用符合 Elixir 习惯的代码更优雅地处理这些错误。

## 1. 提醒团队

实现`calculate!/2`函数，让它调用操作函数，并把栈作为唯一的实参。操作函数定义在别处，但你知道它要么成功完成，要么抛出一个错误。

```elixir
stack = []
operation = fn _ -> :ok end
RPNCalculator.calculate!(stack, operation)
# => :ok

stack = []
operation = fn _ -> raise ArgumentError, "An error occurred" end
RPNCalculator.calculate!(stack, operation)
# => ** (ArgumentError) An error occurred
```

> 以`!`结尾的函数名是在提醒程序员，这个函数可能会抛出错误

## 2. 包装错误

在做更多调研时，你发现很多函数用原子和元组来表示成功或失败。用这种策略实现`calculate/2`。

```elixir
stack = []
operation = fn _ -> "operation completed" end
RPNCalculator.calculate(stack, operation)
# => {:ok, "operation completed"}

stack = []
operation = fn _ -> raise ArgumentError, "An error occurred" end
RPNCalculator.calculate(stack, operation)
# => :error
```

## 3. 传递消息

有些错误包含重要信息，你的同事需要这些信息来确保系统正常运行。实现`calculate_verbose/2`来传递错误消息。这个错误是一个结构体，其中有一个`:message`字段。

```elixir
stack = []
operation = fn _ -> "operation completed" end
RPNCalculator.calculate_verbose(stack, operation)
# => {:ok, "operation completed"}

stack = []
operation = fn _ -> raise ArgumentError, "An error occurred" end
RPNCalculator.calculate_verbose(stack, operation)
# => {:error, "An error occurred"}
```

## Source

### Created by

- @neenjaw

### Contributed to by

- @angelikatyborska
- @cjmaxik