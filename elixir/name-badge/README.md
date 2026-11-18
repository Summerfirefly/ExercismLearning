# 姓名牌

欢迎来到 Exercism Elixir 轨道中的 姓名牌。
如果你在运行测试或提交代码时需要帮助，请查看`HELP.md`。
如果你在练习中卡住了，请查看`HINTS.md`，不过先试着自己解决，不要急着看提示 :)

## Introduction

## Nil

[Nil][nil-dictionary] 是英文单词，意思是“没有”或“零”。在 Elixir 中，`nil` 是一个特殊的值，表示值的_缺失_。

```elixir
# I do not have a favorite color
favorite_color = nil
```

在其他编程语言中，`null` 或 `none` 这类值可能扮演类似的角色。

## If

除了 `cond`，Elixir 还提供了宏 [`if/2`][getting-started-if]，当你只需要检查一个条件时，它非常有用。

[`if/2`][kernel-if] 接受一个条件和两个选项。如果条件是 _truthy_，就返回第一个选项；如果条件是 _falsy_，就返回第二个选项。

```elixir
age = 15

if age >= 16 do
  "You are allowed to drink beer in Germany."
else
  "No beer for you!"
end

# => "No beer for you!"
```

也可以把 `if` 表达式写在一行里。注意条件后面的逗号。

```elixir
if age > 16, do: "beer", else: "no beer"
```

这种写法适合非常短的表达式，但如果表达式一行放不下，就应该避免使用。

### _Truthy_ 和 _falsy_

在 Elixir 中，所有数据类型在布尔上下文中（比如 `if` 表达式）都会被求值为 _truthy_ 或 _falsy_。除了 `false` 和 `nil`，其他所有数据都被视为 _truthy_。特别是，空字符串、整数 `0` 和空列表在 Elixir 中都被视为 _truthy_。

[nil-dictionary]: https://www.merriam-webster.com/dictionary/nil
[getting-started-if]: https://hexdocs.pm/elixir/case-cond-and-if.html#if
[kernel-if]: https://hexdocs.pm/elixir/Kernel.html#if/2

## Instructions

在这个练习中，你将编写代码，为工厂员工打印姓名牌。每名员工都有一个 ID、姓名和部门名称。员工姓名牌上的标签格式如下：`"[id] - name - DEPARTMENT"`。

## 1. 为员工打印姓名牌

实现 `NameBadge.print/3` 函数。它接收 id、姓名和部门，返回姓名牌标签，其中部门名称使用大写。

```elixir
NameBadge.print(67, "Katherine Williams", "Strategic Communication")
# => "[67] - Katherine Williams - STRATEGIC COMMUNICATION"
```

## 2. 为新员工打印姓名牌

由于计算机系统的一个小毛病，新员工刚开始在工厂工作时，有时还没有 ID。因为必须佩戴姓名牌，他们会拿到一个不带 ID 前缀的临时姓名牌。

扩展 `NameBadge.print/3` 函数：当 id 缺失时，打印一个不带 id 的姓名牌。

```elixir
NameBadge.print(nil, "Robert Johnson", "Procurement")
# => "Robert Johnson - PROCUREMENT"
```

## 3. 为老板打印姓名牌

就连工厂老板也必须时刻佩戴姓名牌。不过，老板没有部门。这时，标签上应该打印 `"OWNER"`，而不是部门名称。

扩展 `NameBadge.print/3` 函数：当部门缺失时，就认为这个姓名牌属于公司老板。

```elixir
NameBadge.print(204, "Rachel Miller", nil)
# => "[204] - Rachel Miller - OWNER"
```

注意，老板也可能是新员工。

```elixir
NameBadge.print(nil, "Rachel Miller", nil)
# => "Rachel Miller - OWNER"
```

## Source

### Created by

- @angelikatyborska

### Contributed to by

- @neenjaw