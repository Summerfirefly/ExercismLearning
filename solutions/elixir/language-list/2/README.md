# 语言列表

欢迎来到 Exercism Elixir 轨道中的 语言列表。
如果你在运行测试或提交代码时需要帮助，请查看`HELP.md`。
如果你在练习中卡住了，请查看`HINTS.md`，不过先试着自己解决，不要急着看提示 :)

## Introduction

## 数组

数组是 Elixir 语言内置的。它被视为一种基本类型，用方括号表示。数组可以为空，也可以包含任意数量、任意类型的元素。例如：

```elixir
empty_list = []
one_item_list = [1]
two_item_list = [1, 2]
multiple_type_list = [1, :pi, 3.14, "four"]
```

Elixir 把数组实现为链表，每个节点存储两个值：第一个元素，以及包含其余所有元素的另一个数组。数组中的第一个元素称为_头_，其余元素组成的数组称为_尾_。我们可以在代码中使用这种表示法：

```elixir
# [1] represented in [head | tail] notation
[1 | []]

# [1, 2, 3] represented in [head | tail] notation
[1 | [2 | [3 | []]]]
```

我们可以用 _`[head | tail]`_ 表示法在数组开头添加元素：

```elixir
# Suppose
list = [2, 1]

[3, 2, 1] == [3 | list]
# => true
```

`Kernel`模块中有好几个用于处理数组的函数，此外还有整个`List`模块。

```elixir
# Check if 1 is a member of the list
1 in [1, 2, 3, 4]
# => true
```

## Instructions

在本练习中，你需要实现一些函数来操作一个编程语言列表。

## 1. 定义一个返回空语言列表的函数

定义`new/0`函数，它不接受任何实参，并返回一个空列表。

```elixir
LanguageList.new()
# => []
```

## 2. 定义一个向列表中添加语言的函数

定义`add/2`函数，它接受 2 个实参（一个_语言列表_和一个_语言的_字符串字面量）。它应返回结果列表，其中新语言被添加到给定列表的最前面。

```elixir
language_list = LanguageList.new()
# => []
language_list = LanguageList.add(language_list, "Clojure")
# => ["Clojure"]
language_list = LanguageList.add(language_list, "Haskell")
# => ["Haskell", "Clojure"]
```

## 3. 定义一个从列表中移除语言的函数

定义`remove/1`函数，它接受 1 个实参（一个_语言列表_）。它应返回去掉第一个元素后的列表。假设列表中始终至少有一个元素。

```elixir
language_list = LanguageList.new()
# => []
language_list = LanguageList.add(language_list, "Clojure")
# => ["Clojure"]
language_list = LanguageList.add(language_list, "Haskell")
# => ["Haskell", "Clojure"]
language_list = LanguageList.remove(language_list)
# => ["Clojure"]
```

## 4. 定义一个返回列表中第一个元素的函数

定义`first/1`函数，它接受 1 个实参（一个_语言列表_）。它应返回列表中的第一个语言。假设列表中始终至少有一个元素。

```elixir
language_list = LanguageList.new()
# => []
language_list = LanguageList.add(language_list, "Elm")
# => ["Elm"]
language_list = LanguageList.add(language_list, "Prolog")
# => ["Prolog", "Elm"]
LanguageList.first(language_list)
# => "Prolog"
```

## 5. 定义一个返回列表中语言数量的函数

定义`count/1`函数，它接受 1 个实参（一个_语言列表_）。它应返回列表中语言的数量。

```elixir
language_list = LanguageList.new()
# => []
language_list = LanguageList.add(language_list, "Elm")
# => ["Elm"]
language_list = LanguageList.add(language_list, "Prolog")
# => ["Prolog", "Elm"]
LanguageList.count(language_list)
# => 2
```

## 6. 定义一个判断列表中是否包含函数式语言的函数

定义`functional_list?/1`函数，它接受 1 个实参（一个_语言列表_）。它应返回一个布尔值。如果_"Elixir"_是列表中的语言之一，它应返回 true。

```elixir
language_list = LanguageList.new()
# => []
language_list = LanguageList.add(language_list, "Elixir")
# => ["Elixir"]
LanguageList.functional_list?(language_list)
# => true
```

## Source

### Created by

- @neenjaw

### Contributed to by

- @fireproofsocks