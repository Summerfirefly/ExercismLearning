# 日志级别

欢迎来到 Exercism Elixir 轨道中的 日志级别。
如果你在运行测试或提交代码时需要帮助，请查看`HELP.md`。
如果你在练习中卡住了，请查看`HINTS.md`，不过先试着自己解决，不要急着看提示 :)

## Introduction

## 原子

Elixir 的`atom`类型表示一个固定的常量。原子的值就是它自己的名字。这为我们提供了一种类型安全的方式来操作数据。可以这样定义原子：

```elixir
# All atoms are preceded with a ':' then follow with alphanumeric snake-cased characters
variable = :an_atom
```

_原子_在内部以整数形式存储在查找表中，这些整数是自动设置的。这个内部值无法更改。

## Cond

我们经常需要编写根据条件分支的代码。在 Elixir 中实现这一点有很多方式，但最简单的一种是使用`cond/1`。

最简单的情况下，`cond`会走第一个求值为`true`的路径，可以有一个或多个分支：

```elixir
cond do
  x > 10 -> :this_might_be_the_way
  y < 7 -> :or_that_might_be_the_way
  true -> :this_is_the_default_way
end
```

如果没有任何路径求值为`true`，运行时就会抛出错误。

## Instructions

你正在运行一个系统，它由若干个会产生大量日志的应用组成。你想写一个小程序，把这些日志汇总起来，并按严重程度给它们打上标签。系统中所有应用使用相同的日志代码，但一些旧版应用并不支持全部代码。

| 日志代码 | 日志标签 | 旧版应用是否支持？ |
|---------|---------|------------------|
| 0 | trace | 否 |
| 1 | debug | 是 |
| 2 | info | 是 |
| 3 | warning | 是 |
| 4 | error | 是 |
| 5 | fatal | 否 |
| 其他 / 不支持 | unknown | - |

## 1. 确定日志标签

实现`LogLevel.to_label/2`函数。它接收一个整数代码和一个布尔标志，用来表明该日志是否来自旧版应用，并以原子形式返回日志行的标签。

表中未列出的日志代码应返回 _unknown_ 标签。表中标注为旧版应用不支持的日志代码，如果日志来自旧版应用，也应返回 _unknown_ 标签。

```elixir
LogLevel.to_label(0, false)
# => :trace

LogLevel.to_label(0, true)
# => :unknown
```

## 2. 发送警报

发生意外情况时，总得有人收到通知。

实现`LogLevel.alert_recipient/2`函数，确定警报需要发送给谁。该函数接收一个整数代码和一个布尔标志，用来表明该日志是否来自旧版应用，并以原子形式返回接收者的名字。

使用上一个任务中的`LogLevel.to_label/2`函数。如果日志标签是 _error_ 或 _fatal_，就把警报发送给 _ops_ 团队。如果收到来自旧版系统、标签为 _unknown_ 的日志，就把警报发送给 _dev1_ 团队；其他 unknown 标签应发送给 _dev2_ 团队。其余所有日志标签都可以安全忽略，返回 _false_ 即可。

```elixir
LogLevel.alert_recipient(-1, true)
# => :dev1

LogLevel.alert_recipient(0, false)
# => false
```

## Source

### Created by

- @neenjaw