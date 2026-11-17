# 栈下溢

欢迎来到 Exercism Elixir 轨道中的 栈下溢。
如果你在运行测试或提交代码时需要帮助，请查看`HELP.md`。
如果你在练习中卡住了，请查看`HINTS.md`，不过先试着自己解决，不要急着看提示 :)

## Introduction

## 异常

Elixir 中所有的错误都实现了_异常行为_。就像_访问行为_一样，_异常行为_定义了一些回调函数，模块必须实现这些回调函数，才能满足该行为的软件契约。定义好一个错误之后，它就具有以下特性：

- 模块的名字决定了错误的名字。
- 模块定义了一个错误结构体。
- 该结构体带有`:message`字段。
- 模块可以配合`raise/1`和`raise/2`使用，抛出预期的错误。

_异常行为_还规定了两个回调函数：`message/1`和`exception/1`。如果没有实现它们，就会使用默认实现。用`raise`调用`message/1`时，它会把错误结构体转换成一条可读的消息。用`raise/2`调用`exception/1`时，可以为消息添加额外的上下文。

### 定义一个异常

要用错误模块定义一个异常，我们使用`defexception`宏：

```elixir
# Defines a minimal error, with the name `MyError`
defmodule MyError do
  defexception message: "error"
end

# Defines an error with a customized exception/1 function
defmodule MyCustomizedError do
  defexception message: "custom error"

  @impl true
  def exception(value) do
    case value do
      [] ->
        %MyCustomizedError{}

      _ ->
        %MyCustomizedError{message: "Alert: " <> value}
    end
  end
end
```

### 使用异常

定义好的错误可以像内置错误一样使用，用`raise/1`或`raise/2`抛出。

- `raise/1`通过模块名抛出特定的错误；如果参数是字符串，它会抛出一个`RuntimeError`，并以该字符串作为消息。
- `raise/2`通过模块名抛出特定的错误，并接受一个属性实参，用来取得带有合适消息的错误。

## Instructions

你继续在 _Instruments of Texas_ 工作期间，RPN 计算器的 Elixir 实现迎来了新的进展。你的团队希望能抛出比标准库提供的通用错误更具体的错误。你正在做一些研究，但已经决定实现两个新的错误，它们都实现 _Exception Behaviour_。

## 1. 除以零的错误

用一个数除以零会产生未定义的结果，团队决定最好用一个错误来表示它。

实现`DivisionByZeroError`模块，让它的错误消息为：`"division by zero occurred"`

```elixir
raise DivisionByZeroError
# => ** (DivisionByZeroError) division by zero occurred
```

## 2. 遇到栈下溢时的错误

RPN 计算器使用一个_栈_来记录尚未相加的数字。团队用一个数字数组（整数和浮点数）来表示这个_栈_，例如：`[3, 4.0]`。每个运算都需要栈上有特定数量的数字，才能完成计算。当栈上的数字不够时，就称为栈下溢错误。实现`StackUnderflowError`异常，它提供一个默认消息和可选的额外上下文

```elixir
raise StackUnderflowError
# => ** (StackUnderflowError) stack underflow occurred

raise StackUnderflowError, "when dividing"
# => ** (StackUnderflowError) stack underflow occurred, context: when dividing
```

## 3. 编写一个做除法的函数

实现`divide/1`函数，它接收一个栈_（两个数字的数组）_，并且：

- 当栈上的数字不够时抛出_栈下溢_
- 当除数为 0 时抛出_除以零_（注意数字栈是按相反顺序存储的）
- 没有错误抛出时执行除法

```elixir
RPNCalculator.Exception.divide([])
# => ** (StackUnderflowError) stack underflow occurred, context: when dividing

RPNCalculator.Exception.divide([0, 100])
# => ** (DivisionByZeroError) division by zero occurred

RPNCalculator.Exception.divide([4, 16])
# => 4
```

> 注意，数组的顺序是相反的！

## Source

### Created by

- @neenjaw

### Contributed to by

- @angelikatyborska