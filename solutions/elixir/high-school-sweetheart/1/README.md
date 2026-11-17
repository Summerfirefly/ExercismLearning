# 高中恋人

欢迎来到 Exercism Elixir 轨道中的 高中恋人。
如果你在运行测试或提交代码时需要帮助，请查看`HELP.md`。
如果你在练习中卡住了，请查看`HINTS.md`，不过先试着自己解决，不要急着看提示 :)

## Introduction

## 字符串

Elixir 中的字符串用双引号包围，采用 UTF-8 编码：

```elixir
"Hi!"
```

字符串可以用`<>/2`运算符拼接：

```elixir
"Welcome to" <> " " <> "New York"
# => "Welcome to New York"
```

Elixir 的字符串支持使用`#{}`语法进行插值：

```elixir
"6 * 7 = #{6 * 7}"
# => "6 * 7 = 42"
```

要在字符串里放入一个换行符，使用`\n`转义符：

```elixir
"1\n2\n3\n"
```

如果文本里有很多换行，用起来更方便的是三引号 heredoc 语法：

```elixir
"""
1
2
3
"""
```

Elixir 在`String`模块中提供了许多处理字符串的函数。

## 管道运算符

`|>`运算符叫做管道运算符。它可以把多个函数调用串联起来：前一个函数调用的返回值，会作为第一个实参传给下一个函数调用。

```elixir
"hello"
|> String.upcase()
|> Kernel.<>("?!")

# => "HELLO?!"
```

## Instructions

在这个练习中，你要帮助高中情侣在社交媒体上表达爱意：用他们的姓名缩写生成一个 ASCII 方框：

```
❤-------------------❤
|  J. K.  +  M. B.  |
❤-------------------❤
```

## 1. 获取名字的首字母

实现`HighSchoolSweetheart.first_letter/1`函数。它接收一个名字，并返回它的首字母。还要清理掉名字中多余的空白字符。

```elixir
HighSchoolSweetheart.first_letter("Jane")
# => "J"
```

## 2. 把首字母格式化为缩写

实现`HighSchoolSweetheart.initial/1`函数。它接收一个名字，返回它的大写首字母，后面跟一个点。记得复用你在上一步中定义的`HighSchoolSweetheart.first_letter/1`。

```elixir
HighSchoolSweetheart.initial("Robert")
# => "R."
```

## 3. 把全名拆分成名和姓

实现`HighSchoolSweetheart.initials/1`函数。它接收一个全名（由名和姓组成，中间用一个空格隔开），返回姓名缩写。记得复用你在上一步中定义的`HighSchoolSweetheart.initial/1`。

```elixir
HighSchoolSweetheart.initials("Lance Green")
# => "L. G."
```

## 4. 把缩写放进 ASCII 方框里

实现`HighSchoolSweetheart.pair/2`函数。它接收两个全名，返回装在 ASCII 方框里的姓名缩写。你不需要自己画方框，直接使用代码注释里给出的那个方框就行。记得复用你在上一步中定义的`HighSchoolSweetheart.initials/1`。

```elixir
HighSchoolSweetheart.pair("Blake Miller", "Riley Lewis")
# => """
# ❤-------------------❤
# |  B. M.  +  R. L.  |
# ❤-------------------❤
# """
```

## Source

### Created by

- @angelikatyborska

### Contributed to by

- @neenjaw