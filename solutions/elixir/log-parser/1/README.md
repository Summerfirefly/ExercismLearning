# 日志解析器

欢迎来到 Exercism Elixir 轨道中的 日志解析器。
如果你在运行测试或提交代码时需要帮助，请查看`HELP.md`。
如果你在练习中卡住了，请查看`HINTS.md`，不过先试着自己解决，不要急着看提示 :)

## Introduction

## 正则表达式

Elixir 中的正则表达式遵循 **PCRE** 规范（**P**erl **C**ompatible **R**egular **E**xpressions，即 Perl 兼容正则表达式），这一点与 Java、JavaScript 或 Ruby 等其他流行语言类似。

`Regex`模块提供了用于处理正则表达式的函数。`String`模块的部分函数也接受正则表达式作为实参。

~~~~exercism/note
本练习假设你已经了解正则表达式语法，包括字符类、量词、分组和捕获。

如果你想温习一下正则表达式的知识，可以看看下面这些资源：[Regular-Expressions.info](https://www.regular-expressions.info)、[Rex Egg](https://www.rexegg.com/)、[RegexOne](https://regexone.com/)、[Regular Expressions 101](https://regex101.com/)、[RegExr](https://regexr.com/)。
~~~~

### Sigil

创建正则表达式最常见的方式是使用`~r` sigil。

```elixir
~r/test/
```

注意，Elixir 的所有 sigil 都支持[不同种类的定界符][sigils]，而不仅仅是`/`。

### 匹配

可以用`=~/2`运算符执行正则匹配，返回`boolean`结果。此外，`Regex`模块和`String`模块中也有`match?/2`函数。

```elixir
"this is a test" =~ ~r/test/
# => true

String.match?("Alice has 7 apples", ~r/\d{2}/)
# => false
```

### 捕获

如果简单的布尔检查还不够，可以用`Regex.run/3`函数获取所有捕获的列表（如果没有匹配则为`nil`）。返回列表的第一个元素始终是整个正则表达式的匹配结果，后面的元素则是各个匹配的分组。

```elixir
Regex.run(~r/(\d) apples/, "Alice has 7 apples")
# => ["7 apples", "7"]
```

### 修饰符

在正则表达式后面附加特殊标志，可以改变它的行为。使用 sigil 创建正则表达式时，把修饰符加在第二个定界符之后。

常见的修饰符有：
- `i` - 让匹配不区分大小写。
- `u` - 启用`\p`之类的 Unicode 专用模式，并让`\w`、`\s`等字符类也能匹配 Unicode。

```elixir
"this is a TEST" =~ ~r/test/i
# => true
```

[sigils]: https://hexdocs.pm/elixir/syntax-reference.html#sigils

## Instructions

最近的一次安全审查之后，你被要求清理组织归档的日志文件。

## 1. 找出乱码日志行

你需要大致了解归档中有多少条日志行不符合当前的标准。
你认为用一个简单的测试就能判断一条日志行是否有效。
一条日志行要被视为有效，必须以以下字符串之一开头：

- [DEBUG]
- [INFO]
- [WARNING]
- [ERROR]

实现`valid_line?/1`函数，如果该日志行有效就返回`true`。

```elixir
LogParser.valid_line?("[ERROR] Network Failure")
# => true

LogParser.valid_line?("Network Failure")
# => false
```

## 2. 拆分日志行

开始日志解析项目后不久，你发现有一个应用的日志不像其他应用那样按行拆分。在这个项目里，本应分成多行的内容却出现在同一行上，由诸如`<--->`或`<*~*~>`这样的花式箭头连接。

事实上，任何以`<`开头、以`>`结尾，中间由`~`、`*`、`=`和`-`这些字符的任意组合构成的字符串，都可以作为这个项目日志中的分隔符。

实现`split_line/1`函数，它接受一行日志并返回一个字符串数组。

```elixir
LogParser.split_line("[INFO] Start.<*>[INFO] Processing...<~~~>[INFO] Success.")
# => ["[INFO] Start.", "[INFO] Processing...", "[INFO] Success."]
```

## 3. 移除日志中的残留内容

你发现日志的上游处理过程中，把 "end-of-line" 这段文本以及紧随其后的行号（中间没有空格）散布到了日志各处。

实现`remove_artifacts/1`函数，它接受一个字符串，移除所有出现的 end-of-line 文本（不区分大小写），并返回一条干净的日志行。

不包含 end-of-line 文本的日志行应原样返回。

只需移除 end-of-line 字符串，无需调整空白字符。

```elixir
LogParser.remove_artifacts("[WARNING] end-of-line23033 Network Failure end-of-line27")
# => "[WARNING]  Network Failure "
```

## 4. 为日志行标注用户名

你注意到有些日志行包含涉及用户的句子。
这些句子总是包含字符串`"User"`，后面跟着一个或多个空白字符，然后是一个用户名。
你决定给这类日志行打上标签。

实现一个函数`tag_with_user_name/1`，用于处理日志行：

- 不包含字符串`"User"`的日志行保持不变。
- 对于包含字符串`"User"`的日志行，在行首加上`[USER]`，后面跟上用户名。

```elixir
LogParser.tag_with_user_name("[INFO] User Alice created a new project")
# => "[USER] Alice [INFO] User Alice created a new project"
```

你可以假设：

- 字符串`"User"`的每次出现后面都跟着一个或多个空白字符以及用户名。
- 每一行最多出现一次字符串`"User"`。
- 用户名是非空字符串，且不包含空白字符。

## Source

### Created by

- @angelikatyborska