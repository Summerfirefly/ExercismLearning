# 篮球网站

欢迎来到 Exercism Elixir 轨道中的 篮球网站。
如果你在运行测试或提交代码时需要帮助，请查看`HELP.md`。
如果你在练习中卡住了，请查看`HINTS.md`，不过先试着自己解决，不要急着看提示 :)

## Introduction

## Access Behaviour

Elixir 用代码中的_Behaviour_来提供通用的接口，同时让实现它的每个模块都能有自己的具体实现。其中常见的例子就是 _Access Behaviour_。

_Access Behaviour_为从基于键的数据结构中取值提供了一套通用的接口。映射和关键字列表都实现了 _Access Behaviour_，不过我们先看看它在映射上的用法，找找感觉。_Access Behaviour_规定，当你有一个映射时，可以在它后面加上_方括号_，然后用键取出与该键关联的值。

```elixir
# Suppose we have these two maps defined (note the difference in the key type)
my_map = %{key: "my value"}
your_map = %{"key" => "your value"}

# Obtain the value using the Access Behaviour
my_map[:key] == "my value"
your_map[:key] == nil
your_map["key"] == "your value"
```

如果数据结构中不存在这个键，就会返回 `nil`。这可能会导致意料之外的行为，因为它不会抛出错误。注意，`nil`本身就实现了 Access Behaviour，对任何键都返回 `nil`。

## Instructions

你正在与一个网页开发团队合作，为当地的一支篮球队维护网站。这个网页开发团队对 Elixir 不太熟悉，他们希望有一个函数，能够从一系列嵌套映射中提取数据，以便快速开发。

## 1. 从嵌套的映射结构中提取数据

实现`extract_from_path/2`函数，让它接受两个实参：

- `data`：一个嵌套的映射结构，包含这支篮球队的相关数据。
- `path`：一个字符串，由以句点分隔的键组成，用于获取最后一个键所对应的值。

如果路径中的任何位置不存在该值或该键，则应返回`nil`。

```elixir
data = %{
  "team_mascot" => %{
    "animal" => "bear",
    "actor" => %{
      "first_name" => "Noel"
    }
  }
}

BasketballWebsite.extract_from_path(data, "team_mascot.animal")
# => "bear"
BasketballWebsite.extract_from_path(data, "team_mascot.colors")
# => nil
```

实现这个函数时，请使用 _Access Behaviour_。

不要使用任何`Map`或`Kernel`模块函数来处理嵌套映射数据结构。

## 2. 使用内置函数重构

你的同事在审查你的代码时，告诉你有一个`Kernel`模块函数，它的作用和你的实现非常相似。

实现`get_in_path/2`，让它使用这个`Kernel`模块函数。

它期望的实参与第 1 部分相同。

```elixir
BasketballWebsite.get_in_path(data, "team_mascot.actor.first_name")
# => "Noel"
```

## Source

### Created by

- @neenjaw

### Contributed to by

- @angelikatyborska
- @NobbZ