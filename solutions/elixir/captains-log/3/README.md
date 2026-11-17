# 船长日志

欢迎来到 Exercism Elixir 轨道中的 船长日志。
如果你在运行测试或提交代码时需要帮助，请查看`HELP.md`。
如果你在练习中卡住了，请查看`HINTS.md`，不过先试着自己解决，不要急着看提示 :)

## Introduction

## 随机性

在 Elixir 中，要从一个可枚举的数据结构（例如数组、范围）里随机挑选一个元素，我们使用 `Enum.random`。这个函数会挑出一个元素，每个元素被选中的概率都相同。

Elixir 没有自己的函数来生成随机浮点数。要做到这一点，我们只能直接使用 Erlang。

## Erlang 库

Elixir 代码运行在 BEAM 虚拟机中。BEAM 是 Erlang 运行时系统的一部分。Elixir 受 Erlang 启发，又与它共用运行环境，因此和 Erlang 库有着极好的互操作性。这意味着 Elixir 开发者可以在自己的 Elixir 代码里使用 Erlang 库。事实上，为 Erlang 库已经提供的功能再写一个 Elixir 库，在 Elixir 社区里是不被鼓励的。

因此，某些功能，比如数学运算或定时器函数，在 Elixir 中只能通过 Erlang 使用。

Erlang 的标准库无需任何额外步骤，就可以直接用在我们的 Elixir 代码里。

调用 Erlang 函数的方式和我们调用 Elixir 函数一样，只有一个小区别。Erlang 的模块名是 `snake_case` 形式的原子。例如，要调用 `math` 模块里的 Erlang `pi/0` 函数，可以这样写：

```elixir
:math.pi()
# => 3.141592653589793
```

最常用、且没有 Elixir 对应版的 Erlang 函数有：

- `:timer.sleep/1`，把进程暂停指定的毫秒数。
- `:rand.uniform/0`，生成一个随机浮点数 `x`，其中 `0.0 <= x < 1.0`。
- `:io_lib.format/2`，提供 C 风格的字符串格式化（使用控制序列）。用这个函数，我们可以把整数按 2 到 36 之间的任意进制打印出来，也可以按想要的精度格式化浮点数。注意，这个函数和许多 Erlang 函数一样，返回的是一个 charlist。
- `math` 模块，提供 `sin/1`、`cos/1`、`log2/1`、`log10/1`、`pow/2` 等数学函数。

想进一步了解 Erlang 的标准库，可以查阅 [STDLIB 参考手册][erl-stdlib-ref]。

[erl-stdlib-ref]: https://www.erlang.org/doc/apps/stdlib/index.html

## Instructions

Mary 是电视剧 _Star Trek: The Next Generation_ 的忠实粉丝。她经常玩纸笔角色扮演游戏，在游戏里，她和朋友们假扮成 _Starship Enterprise_ 的船员。Mary 扮演的角色是 Picard 舰长，所以她得负责记舰长日志。她很喜欢游戏里需要发挥创意的那部分，却不喜欢临场编造随机数据。

来帮帮 Mary 吧：为舰长日志里常见的数据编写几个随机生成器。

## 1. 生成一个随机的行星

_Starship Enterprise_ 在航行途中会遇到许多行星。Star Trek 宇宙中的行星按照各自的属性分成不同类别。例如，地球就是一颗 M 级行星。所有可能的行星级别有：D、H、J、K、L、M、N、R、T 和 Y。

实现 `random_planet_class/0` 函数，让它随机返回其中一个行星级别。

```elixir
CaptainsLog.random_planet_class()
# => "K"
```

## 2. 生成一个随机的星舰注册号

Enterprise（注册号 NCC-1701）可不是唯一在宇宙中飞行的星舰！当它和另一艘星舰会合时，Mary 需要记下那艘星舰的注册号。

注册号以“NCC-”为前缀，后面是一个 1000 到 9999（含）之间的数字。

实现 `random_ship_registry_number/0` 函数，返回一个随机的星舰注册号。

```elixir
CaptainsLog.random_ship_registry_number()
# => "NCC-1947"
```

## 3. 生成一个随机的星历

日志里要是没有日期，还有什么用？

星历是一个浮点数。_Starship Enterprise_ 在 _The Next Generation_ 第一季里的冒险发生在星历 41000.0 和 42000.0 之间。开头的“4”代表 24 世纪，“1”代表第一季。

实现 `random_stardate/0` 函数，返回一个介于 41000.0（含）和 42000.0（不含）之间的浮点数。

实现时应该使用 Erlang 函数。

```elixir
CaptainsLog.random_stardate()
# => 41458.15721310934
```

## 4. 格式化星历

在舰长日志里，星历通常会四舍五入到一位小数。

实现 `format_stardate/1` 函数，它接收一个浮点数，返回一个字符串，其中的数字已四舍五入到一位小数。

实现时应该使用 Erlang 函数。

```elixir
CaptainsLog.format_stardate(41458.15721310934)
# => "41458.2"
```

## Source

### Created by

- @angelikatyborska

### Contributed to by

- @neenjaw