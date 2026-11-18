# RPG 角色卡

欢迎来到 Exercism Elixir 轨道中的 RPG 角色卡。
如果你在运行测试或提交代码时需要帮助，请查看`HELP.md`。
如果你在练习中卡住了，请查看`HINTS.md`，不过先试着自己解决，不要急着看提示 :)

## Introduction

## IO

处理输入和输出的函数由`IO`模块提供。

### 输出

要把字符串写到标准输出，可以使用`IO.puts`。`IO.puts`总会在字符串末尾添加一个换行符。如果你不想要这种行为，可以改用`IO.write`。如果执行成功，这两个函数都会返回原子`:ok`。

```elixir
IO.puts("Hi!")
# > Hi!
# => :ok
```

`IO.puts`适合写字符串，但除此之外用途不大。如果你需要一个能把任意值写到标准输出的调试工具，可以改用`IO.inspect`。`IO.inspect`会原样返回传给它的值，因此可以插入到代码中的任何位置。它还接受许多选项，例如`:label`，可以让你把它和其他`IO.inspect`调用区分开。

### 输入

要从标准输入读取一行，可以使用`IO.gets`。`IO.gets`接受一个实参：一个字符串，它会把它作为输入提示打印出来。`IO.gets`不会在提示后添加换行符，如果需要，就自己加上。

```elixir
IO.gets("What's your name?\n")
# > What's your name?
# < Mary
# => "Mary\n"
```

## Instructions

你和朋友们都很喜欢玩纸笔角色扮演游戏，但你发现很难有新玩家加入你们的队伍。他们常常卡在创建角色这一步，不知道从哪儿开始。为了帮新玩家一把，你决定写一个小程序，带他们走完整个过程。

## 1. 欢迎新玩家

实现`RPG.CharacterSheet.welcome/0`函数。它应该输出一条欢迎信息，并返回`:ok`。

```elixir
RPG.CharacterSheet.welcome()
# > Welcome! Let's fill out your character sheet together.
# => :ok
```

## 2. 询问角色的名字

实现`RPG.CharacterSheet.ask_name/0`函数。它应该输出一个问题，等待回答，并返回去掉首尾空白后的答案。

```elixir
RPG.CharacterSheet.ask_name()
# > What is your character's name?
# < Mathilde
# => "Mathilde"
```

## 3. 询问角色的职业

实现`RPG.CharacterSheet.ask_class/0`函数。它应该输出一个问题，等待回答，并返回去掉首尾空白后的答案。

```elixir
RPG.CharacterSheet.ask_class()
# > What is your character's class?
# < healer
# => "healer"
```

## 4. 询问角色的等级

实现`RPG.CharacterSheet.ask_level/0`函数。它应该输出一个问题，等待回答，并把答案以整数的形式返回。

```elixir
RPG.CharacterSheet.ask_level()
# > What is your character's level?
# < 2
# => 2
```

## 5. 把前面的步骤组合起来

实现`RPG.CharacterSheet.run/0`函数。它应该欢迎新玩家，询问角色的名字、职业和等级，并以映射的形式返回角色卡。它还应该以“Your character”为标签输出这个映射。

```elixir
RPG.CharacterSheet.run()
# > Welcome! Let's fill out your character sheet together.
# > What is your character's name?
# < Mathilde
# > What is your character's class?
# < healer
# > What is your character's level?
# < 2
# > Your character: %{class: "healer", level: 2, name: "Mathilde"}
# => %{class: "healer", level: 2, name: "Mathilde"}
```

## Source

### Created by

- @angelikatyborska

### Contributed to by

- @neenjaw