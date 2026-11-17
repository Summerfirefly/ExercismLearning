# 绝密

欢迎来到 Exercism Elixir 轨道中的 绝密。
如果你在运行测试或提交代码时需要帮助，请查看`HELP.md`。
如果你在练习中卡住了，请查看`HINTS.md`，不过先试着自己解决，不要急着看提示 :)

## Introduction

## AST

抽象语法树（AST），也叫_引用表达式_，是一种把代码表示成数据的方式。

AST 中的每个节点都是一个包含三个元素的元组。

```elixir
# AST representation of:
# 2 + 3
{:+, [], [2, 3]}
```

第一个元素是原子，代表运算。第二个元素是关键字列表，也就是元数据。第三个元素是实参列表，里面包含其他节点。像整数、原子和字符串这样的字面量，在 AST 中以自身的形式出现，而不是表示成包含三个元素的元组。

### 把代码转换成 AST

在 Elixir 中，把代码变成 AST、再把 AST 变回代码，都是标准库的一部分。你可以在`Code`模块（例如把包含代码的字符串转换成 AST）和`Macro`模块（例如遍历 AST 或把它转换成字符串）中找到处理 AST 的函数。

注意，标准库中的所有函数都用“quoted”这个名字来表示 AST（_quoted expression_的缩写）。

把代码转换成 AST 的特殊形式叫做`quote`。它接受一个代码块，并返回它的 AST。

```elixir
quote do
  2 + 3 - 1
end

# => {:-, [], [
#      {:+, [], [2, 3]},
#      1
#    ]}
```

### 使用场景

把代码表示为 AST 的能力，是 Elixir 元编程的核心。_宏_是一种编写能生成 Elixir 代码的 Elixir 代码的方式，它的工作原理就是把 AST 作为输出返回。

AST 的另一个使用场景是静态代码分析，比如 Exercism 自己的工具 Analyzer，你可能已经认识它了，它就是那个在你提交的解答下留言的小机器人。

## Instructions

你是一个打击企业间谍活动的特别行动小组成员。你在 Shady Company X 有一个秘密线人，你怀疑这家公司在窃取竞争对手的商业机密。

你的线人 Agent Ex 是一名 Elixir 开发者。她把秘密信息编码在自己的代码里。

要解码她的秘密信息：

- 按它们被定义的顺序取出所有函数（包括公有的和私有的）。
- 对每个函数，从它的名字中取出前`n`个字符，其中`n`是该函数的参数个数。

## 1. 把代码变成数据

实现`TopSecret.to_ast/1`函数。它接收一个包含 Elixir 代码的字符串，并返回它的 AST。

```elixir
TopSecret.to_ast("div(4, 3)")
# => {:div, [line: 1], [4, 3]}
```

## 2. 解析单个 AST 节点

实现`TopSecret.decode_secret_message_part/2`函数。它接收一个 AST 节点和用于秘密信息的累加器（一个数组）。它应返回一个元组，第一个元素是保持不变的 AST 节点，第二个元素是累加器。

如果 AST 节点的操作是定义函数（`def`或`defp`），就把函数名（转成字符串）添加到累加器的开头。如果操作是别的，就原样返回累加器。

```elixir
ast_node = TopSecret.to_ast("defp cat(a, b, c), do: nil")
TopSecret.decode_secret_message_part(ast_node, ["day"])
# => {ast_node, ["cat", "day"]}

ast_node = TopSecret.to_ast("10 + 3")
TopSecret.decode_secret_message_part(ast_node, ["day"])
# => {ast_node, ["day"]}
```

这个函数不需要做任何递归调用来检查整个 AST，只需要检查给定的节点。最后一步我们会用内置工具遍历整个 AST。

## 3. 从函数定义中解码秘密信息片段

扩展`TopSecret.decode_secret_message_part/2`函数。如果 AST 节点中的操作是定义函数，就不要返回整个函数名，而是检查函数的参数个数。然后只返回名字里的前`n`个字符，其中`n`是参数个数。

```elixir
ast_node = TopSecret.to_ast("defp cat(a, b), do: nil")
TopSecret.decode_secret_message_part(ast_node, ["day"])
# => {ast_node, ["ca", "day"]}

ast_node = TopSecret.to_ast("defp cat(), do: nil")
TopSecret.decode_secret_message_part(ast_node, ["day"])
# => {ast_node, ["", "day"]}
```

## 4. 修正带守卫的函数的解码

扩展`TopSecret.decode_secret_message_part/2`函数。对于使用守卫的函数定义，要确保能正确检测出函数的名称和参数个数。

```elixir
ast_node = TopSecret.to_ast("defp cat(a, b) when is_nil(a), do: nil")
TopSecret.decode_secret_message_part(ast_node, ["day"])
# => {ast_node, ["ca", "day"]}
```

## 5. 解码完整的秘密信息

实现`TopSecret.decode_secret_message/1`函数。它接收一个包含 Elixir 代码的字符串，返回由代码中所有函数定义解码得到的秘密信息，是一个字符串。务必复用前面步骤中定义的函数。

```elixir
code = """
defmodule MyCalendar do
  def busy?(date, time) do
    Date.day_of_week(date) != 7 and
      time.hour in 10..16
  end

  def yesterday?(date) do
    Date.diff(Date.utc_today, date)
  end
end
"""

TopSecret.decode_secret_message(code)
# => "buy"
```

## Source

### Created by

- @jiegillet
- @angelikatyborska