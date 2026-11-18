# 德语系统管理员

欢迎来到 Exercism Elixir 轨道中的 德语系统管理员。
如果你在运行测试或提交代码时需要帮助，请查看`HELP.md`。
如果你在练习中卡住了，请查看`HINTS.md`，不过先试着自己解决，不要急着看提示 :)

## Introduction

## 字符列表

字符列表使用 `~c` Sigil 创建。

```elixir
~c"hello"
```

~~~~exercism/note
注意，在旧版 Elixir 中，字符列表用单引号表示为 `'hello'`。
~~~~

虽然字符列表和字符串看起来非常相似，但这两种数据类型其实差别很大。字符列表是一个整数数组，其中的整数表示某个字符的 Unicode 值，也就是码点。

```elixir
[65, 66, 67]
# => ~c"ABC"
```

在字符前面加上 `?`，就能得到它的码点。

```elixir
?A
# => 65

[?:, ?)]
# => ~c":)"
```

因为字符列表本身就是数组，所以你可以像处理其他数组一样处理它，比如使用递归和模式匹配。

```elixir
[first_letter | _] = ~c"cat"
first_letter
# => 99
```

你可以用 `++` 拼接两个数组。

```elixir
~c"hi" ++ ~c"!"
# => ~c"hi!"
```

第一个数组越长，拼接就越慢，所以要避免反复向长度不定的数组追加元素。

## `case`

`case` 是一种控制流结构，可以让我们把一个值依次与多个模式进行比较。`case` 表达式中的子句会从上到下依次求值，直到找到匹配项为止。

```elixir
age = 15

case age do
  0 -> ~c"infant"
  age when age < 4 -> ~c"baby"
  age when age < 13 -> ~c"child"
  age when age < 18 -> ~c"teenager"
  _ -> ~c"adult"
end

# => ~c"teenager"
```

## Instructions

你在德国慕尼黑的一家大公司担任系统管理员。你的职责之一是管理电子邮件账户。

你不断听到有人抱怨说无法给 Müller 先生写邮件。你很快意识到，公司里大多数人用的都是老旧的邮件客户端，由于`müller@firma.de`含有非 ASCII 字符，它不认为这是一个合法的电子邮件地址。

劝大家放弃自己钟爱的老旧邮件客户端是徒劳的，于是你决定为所有电子邮件账户创建经过清理的别名。

## 1. 清理现有用户名，只保留小写字母

实现`sanitize/1`函数。它应接受一个以 charlist 表示的用户名，并返回移除了除小写字母之外所有字符的用户名。

```elixir
Username.sanitize(~c"schmidt1985")
# => ~c"schmidt"
```

## 2. 允许下划线

扩展`sanitize/1`函数，使它不删除用户名中的下划线。

```elixir
Username.sanitize(~c"mark_fischer$$$")
# => ~c"mark_fischer"
```

## 3. 替换德语字符

德语字母表中有 4 个非 ASCII 字符，它们都有公认的 ASCII 替代写法。

| 德语字符 | ASCII 替代 |
| ---------------- | ---------------- |
| ä                | ae               |
| ö                | oe               |
| ü                | ue               |
| ß                | ss               |

扩展`sanitize/1`函数，让它按照表格替换德语字符。你可以放心假设所有用户名都已经转为小写。

```elixir
Username.sanitize(~c"cäcilie_weiß")
# => ~c"caecilie_weiss"
```

## Source

### Created by

- @angelikatyborska

### Contributed to by

- @neenjaw