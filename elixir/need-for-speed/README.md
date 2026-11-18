# 追求速度

欢迎来到 Exercism Elixir 轨道中的 追求速度。
如果你在运行测试或提交代码时需要帮助，请查看`HELP.md`。
如果你在练习中卡住了，请查看`HINTS.md`，不过先试着自己解决，不要急着看提示 :)

## Introduction

## Alias

要在同一个项目里的不同 Elixir 模块之间共享代码，你需要用完整名称来引用外部模块。但如果这个名字太长或者容易让人混淆，该怎么办呢？

特殊形式`alias`可以缩短或更改你引用外部模块时使用的名称。不带任何参数使用时，它会把模块名精简到最后一段，例如`MyApp.Logger.Settings`会变成`Settings`。可以用`:as`选项指定自定义名称。

别名通常添加在模块定义的开头。

```elixir
defmodule Square do
  alias Integer, as: I

  def area(a), do: I.pow(a, 2)
end
```

## Import

特殊形式`import`让你无需使用模块名，就能调用外部模块中的函数。

导入整个外部模块可能会与已有的本地函数产生冲突。为了避免这种情况，有两个选项可用：`:except`和`:only`。两者都接收一个关键字列表，其中键是函数名，值是函数的参数个数。

导入通常添加在模块定义的开头。

```elixir
defmodule Square do
  import Integer, only: [pow: 2]

  def area(a), do: pow(a, 2)
end
```

## Instructions

你最近买的那辆遥控车已经变成了一项全新的爱好。你一直在组织遥控车比赛。

你快要写完一个可以运行比赛模拟的程序了，这时你的猫扑到键盘上，删掉了几行代码。现在你的程序再也编译不过了……

## 1. 修复编译错误 `Race.__struct__/0 is undefined`

添加一个别名，使模块 `NeedForSpeed.Race` 可以用更短的名字 `Race` 来引用。

## 2. 修复编译错误 `Car.__struct__/0 is undefined`

添加一个别名，使模块 `NeedForSpeed.RemoteControlCar` 可以用更短的名字 `Car` 来引用。

## 3. 修复编译错误 `undefined function puts/1`

函数 `puts/1` 来自模块 `IO`。导入它，就能在不引用模块的情况下使用它。

## 4. 修复编译错误 `undefined function default_color/0`

函数 `default_color/0`、`red/0`、`cyan/0`和`green/0` 都来自模块 `IO.ANSI`。你打算支持其他颜色的车，所以想导入整个模块。可惜的是，`IO.ANSI` 模块中的函数 `color/1` 和你本地的一个函数冲突了。导入整个 `IO.ANSI` 模块，但排除那一个函数。

## Source

### Created by

- @angelikatyborska

### Contributed to by

- @neenjaw