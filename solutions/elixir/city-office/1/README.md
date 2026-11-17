# 市政办公室

欢迎来到 Exercism Elixir 轨道中的 市政办公室。
如果你在运行测试或提交代码时需要帮助，请查看`HELP.md`。
如果你在练习中卡住了，请查看`HINTS.md`，不过先试着自己解决，不要急着看提示 :)

## Introduction

## 文档

在 Elixir 中，文档是一等公民。

有两个模块属性常用于为代码编写文档：`@moduledoc` 用于为模块编写文档，`@doc` 用于为紧随该属性的函数编写文档。`@moduledoc` 属性通常出现在模块的第一行，`@doc` 属性通常出现在函数定义之前，如果函数有类型规格，则出现在类型规格之前。文档通常使用 heredoc 语法写成多行字符串。

Elixir 文档使用[**Markdown**][markdown]编写。

```elixir
defmodule String do
  @moduledoc """
  Strings in Elixir are UTF-8 encoded binaries.
  """

  @doc """
  Converts all characters in the given string to uppercase according to `mode`.

  ## Examples

      iex> String.upcase("abcd")
      "ABCD"

      iex> String.upcase("olá")
      "OLÁ"
  """
  def upcase(string, mode \\ :default)
end
```

## 类型规格

Elixir 是一种动态类型语言，这意味着它不提供编译时的类型检查。不过，类型规格仍可作为一种文档形式使用。

可以使用`@spec`模块属性把类型规格添加到函数上，放在函数定义之前。`@spec`后面跟着函数名，以及用括号括起来、以逗号分隔的所有参数类型的列表。返回值的类型与函数的参数之间用双冒号`::`分隔。

```elixir
@spec longer_than?(String.t(), non_neg_integer()) :: boolean()
def longer_than?(string, length), do: String.length(string) > length
```

### 类型

最常用的类型包括：

- 布尔值：`boolean()`
- 字符串：`String.t()`
- 数字：`integer()`、`non_neg_integer()`、`pos_integer()`、`float()`
- 列表：`list()`
- 任意类型的值：`any()`

有些类型还可以带参数，例如`list(integer)`是整数的列表。

字面量值也可以用作类型。

类型的联合可以使用管道符`|`来书写。例如，`integer() | :error`表示要么是整数，要么是原子字面量`:error`。

所有类型的完整列表可以在[官方文档的“Typespecs”部分][types]中找到。

### 为参数命名

类型规格中的参数也可以命名，这对区分多个同类型的参数很有用。参数名后面跟双冒号，放在参数的类型之前。

```elixir
@spec to_hex({hue :: integer, saturation :: integer, lightness :: integer}) :: String.t()
```

### 自定义类型

类型规格并不限于内置类型。可以使用`@type`模块属性定义自定义类型。自定义类型的定义以类型名开头，后面跟双冒号，然后是类型本身。

```elixir
@type color :: {hue :: integer, saturation :: integer, lightness :: integer}

@spec to_hex(color()) :: String.t()
```

自定义类型可以在定义它的同一个模块中使用，也可以在其他模块中使用。

[markdown]: https://docs.github.com/en/github/writing-on-github/basic-writing-and-formatting-syntax
[types]: https://hexdocs.pm/elixir/typespecs.html#types-and-their-syntax

## Instructions

你已经在市政办公室工作了一段时间，并且开发了一套工具来加快你的日常工作，比如填写表单。

现在，一位新同事加入了你们，你意识到你的工具可能并不那么一目了然。你的办公室里有很多奇怪的惯例，比如总是用大写字母填写表单，以及避免让字段留空。

你决定写一些文档，让你的新同事能更容易地上手并开始使用你的工具。

## 1. 为表单工具的用途编写文档

为`Form`模块添加文档，描述它的用途。内容应为：

```
A collection of loosely related functions helpful for filling out various forms at the city office.
```

## 2. 为用空白值填写字段编写文档

为`Form.blanks/1`函数添加文档和类型规格。文档内容应为：

```
Generates a string of a given length.

This string can be used to fill out a form field that is supposed to have no value.
Such fields cannot be left empty because a malicious third party could fill them out with false data.
```

类型规格应说明该函数接受一个实参，即一个非负整数，并返回一个字符串。

## 3. 为把值拆分成大写字母数组编写文档

为`Form.letters/1`函数添加文档和类型规格。文档内容应为：

```
Splits the string into a list of uppercase letters.

This is needed for form fields that don't offer a single input for the whole string,
but instead require splitting the string into a predefined number of single-letter inputs.
```

类型规格应说明该函数接受一个实参，即一个字符串，并返回一个字符串数组。

## 4. 为检查值是否符合字段的最大长度编写文档

为`Form.check_length/2`函数添加文档和类型规格。文档内容应为：

```
Checks if the value has no more than the maximum allowed number of letters.

This is needed to check that the values of fields do not exceed the maximum allowed length.
It also tells you by how much the value exceeds the maximum.
```

类型规格应说明该函数接受两个实参，一个字符串和一个非负整数，并返回两种可能值之一。它要么返回`:ok`原子，要么返回一个二元组，其中第一个元素是`:error`原子，第二个是一个正整数。

## 5. 为不同的地址格式编写文档

出于你未知的原因，市政办公室的内部系统使用两种不同的方式来表示地址：映射或元组。

通过定义三个自定义公开类型来记录这一事实：
- `address_map`：一个映射，包含键`:street`、`:postal_code`和`:city`。每个键都持有一个字符串类型的值。
- `address_tuple`：一个包含三个值的元组，即`street`、`postal_code`和`city`。每个值都是字符串类型。在类型规格中给这些值命名来区分它们。
- `address`：可以是`address_map`或`address_tuple`。

## 6. 为格式化地址编写文档

为`Form.format_address/1`函数添加文档和类型规格。文档内容应为：

```
Formats the address as an uppercase multiline string.
```

类型规格应说明该函数接受一个实参，即一个地址，并返回一个字符串。

## Source

### Created by

- @angelikatyborska

### Contributed to by

- @neenjaw
- @michallepicki