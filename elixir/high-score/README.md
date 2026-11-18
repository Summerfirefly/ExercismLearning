# 最高分

欢迎来到 Exercism Elixir 轨道中的 最高分。
如果你在运行测试或提交代码时需要帮助，请查看`HELP.md`。
如果你在练习中卡住了，请查看`HINTS.md`，不过先试着自己解决，不要急着看提示 :)

## Introduction

## 映射

Elixir 中的映射是用于以键值对存储信息的数据结构。在其他语言里，它也可能被称为关联数组（PHP）、哈希（Perl 5、Raku）或字典（Python）。

键和值可以是任何数据类型，但如果键是原子，就可以使用简写语法。访问或返回映射时，映射不保证各项的顺序。

### 字面量形式

声明一个空映射只需要`%{}`。如果想往映射字面量中添加项，可以用两种形式：

```elixir
# If the key is an atom:
%{atom_key: 1}

# If the key is a different type:
%{1 => :atom_value}

# You can even mix these if the atom form comes second:
%{"first_form" => :a, atom_form: :b}
```

虽然没有规定的格式，但要为键值对字面量选择一种一致的表示方式。

### 映射模块的函数

Elixir 在 _Map 模块_ 中提供了许多处理映射的函数。有些 _Map 模块_ 函数需要传入一个 _匿名_ 函数，来协助完成映射的转换。

## 模块属性作为常量

在 Elixir 中，我们可以定义模块属性，把它们当作函数里的常量使用。

```elixir
defmodule Example do
  # Defines the attribute as the value 1
  @constant_number 1

  def example_value() do
    # Returns the value 1
    @constant_number
  end
end
```

用来定义模块常量时，属性可以是任何能在编译时求值的表达式。编译完成后，模块属性就无法再访问了，因为它们会在编译期间展开，这类似 C 这类语言里定义的宏。

## Instructions

在这个练习中，你要实现一种方法，用来记录你当地街机厅里最受欢迎游戏的最高分。

## 1. 定义一个新的最高分映射

要创建一个新的最高分映射，定义`HighScore.new/0`函数，它不接收任何实参，返回一个新的、空的最高分映射。

```elixir
HighScore.new()
# => %{}
```

## 2. 向最高分映射中添加玩家

要往最高分映射里添加玩家，定义`HighScore.add_player/3`，它是一个接收 3 个实参的函数：

- 第一个实参是分数映射。
- 第二个实参是玩家的名字，类型为字符串。
- 第三个实参是分数，类型为整数。这个实参是可选的，实现第三个实参时给它一个默认值 0。

把默认的初始分数存到一个模块属性里，后面还会用到它。

```elixir
score_map = HighScore.new()
# => %{}
score_map = HighScore.add_player(score_map, "Dave Thomas")
# => %{"Dave Thomas" => 0}
score_map = HighScore.add_player(score_map, "José Valim", 486_373)
# => %{"Dave Thomas" => 0, "José Valim"=> 486_373}
```

## 3. 从分数映射中移除玩家

要从最高分映射中移除玩家，定义`HighScore.remove_player/2`，它接收 2 个实参：

- 第一个实参是分数映射。
- 第二个实参是玩家的名字，类型为字符串。

```elixir
score_map = HighScore.new()
# => %{}
score_map = HighScore.add_player(score_map, "Dave Thomas")
# => %{"Dave Thomas" => 0}
score_map = HighScore.remove_player(score_map, "Dave Thomas")
# => %{}
```

## 4. 重置玩家的分数

要重置玩家的分数，定义`HighScore.reset_score/2`，它接收 2 个实参：

- 第一个实参是分数映射。
- 第二个实参是玩家的名字，类型为字符串，你要重置的就是这位玩家的分数。

如果玩家没有分数，这个函数也应该能正常工作。

```elixir
score_map = HighScore.new()
# => %{}
score_map = HighScore.add_player(score_map, "José Valim", 486_373)
# => %{"José Valim"=> 486_373}
score_map = HighScore.reset_score(score_map, "José Valim")
# => %{"José Valim"=> 0}
```

## 5. 更新玩家的分数

要通过在之前的分数上累加来更新玩家的分数，定义`HighScore.update_score/3`，它接收 3 个实参：

- 第一个实参是分数映射。
- 第二个实参是玩家的名字，类型为字符串，你要更新的就是这位玩家的分数。
- 第三个实参是你希望**加到**已存最高分上的分数。

如果玩家之前没有分数，这个函数也应该能正常工作，假定之前的分数是 0。

```elixir
score_map = HighScore.new()
# => %{}
score_map = HighScore.add_player(score_map, "José Valim", 486_373)
# => %{"José Valim"=> 486_373}
score_map = HighScore.update_score(score_map, "José Valim", 5)
# => %{"José Valim"=> 486_378}
```

## 6. 获取玩家数组

要获取玩家数组，定义`HighScore.get_players/1`，它接收 1 个实参：

- 第一个实参是分数映射。

```elixir
score_map = HighScore.new()
# => %{}
score_map = HighScore.add_player(score_map, "Dave Thomas", 2_374)
# => %{"Dave Thomas" => 2_374}
score_map = HighScore.add_player(score_map, "José Valim", 486_373)
# => %{"Dave Thomas" => 2_374, "José Valim"=> 486_373}
HighScore.get_players(score_map)
# => ["Dave Thomas", "José Valim"]
```

## Source

### Created by

- @neenjaw