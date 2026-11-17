# 面包与药水

欢迎来到 Exercism Elixir 轨道中的 面包与药水。
如果你在运行测试或提交代码时需要帮助，请查看`HELP.md`。
如果你在练习中卡住了，请查看`HINTS.md`，不过先试着自己解决，不要急着看提示 :)

## Introduction

## 协议

协议是 Elixir 中实现多态的一种机制，当你希望行为随数据类型而变化时，就可以使用它。

协议使用 `defprotocol` 定义，其中包含一个或多个函数头。

```elixir
defprotocol Reversible do
  def reverse(term)
end
```

协议可以使用 `defimpl` 来实现。

```elixir
defimpl Reversible, for: List do
  def reverse(term) do
    Enum.reverse(term)
  end
end
```

协议可以为任何已有的 Elixir 数据类型实现，也可以为结构体实现。

调用协议函数时，会根据第一个实参的类型自动选择合适的实现。

## Instructions

你在开发一款自己的角色扮演电子游戏。在你的游戏里，有_角色_和_物品_。你能对物品做的众多操作之一，就是让角色把它吃掉。

并非所有物品都能吃，也不是所有能吃的物品对角色都有相同的效果。有些物品被吃掉后会变成另一种物品（比如你吃掉一个苹果，就只剩下一个苹果核）。

为了留出所有这些灵活性，你决定创建一个 `Edible` 协议，让其中一些物品来实现它。

## 1. 定义可食用性

创建 `RPG.Edible` 协议。该协议有一个函数：`eat`。`eat` 函数接受一个物品和一个角色，返回一个副产物和一个角色。

## 2. 让面包可食用

为 `RPG.LoafOfBread` 物品实现 `RPG.Edible` 协议。面包被吃掉时，会给角色增加 5 点生命值，并且没有副产物。

```elixir
RPG.Edible.eat(%RPG.LoafOfBread{}, %RPG.Character{health: 31})
# => {nil, %RPG.Character{health: 36, mana: 0}}
```

## 3. 让法力药水可食用

为 `RPG.ManaPotion` 物品实现 `RPG.Edible` 协议。法力药水被吃掉时，会给角色增加等同于药水强度的法力值，并产生一个空瓶子。

```elixir
RPG.Edible.eat(%RPG.ManaPotion{strength: 13}, %RPG.Character{mana: 50})
# => {%RPG.EmptyBottle{}, %RPG.Character{health: 100, mana: 63}}
```

## 4. 让毒药可食用

为 `RPG.Poison` 物品实现 `RPG.Edible` 协议。毒药被吃掉时，会夺走角色的全部生命值，并产生一个空瓶子。

```elixir
RPG.Edible.eat(%RPG.Poison{}, %RPG.Character{health: 3000})
# => {%RPG.EmptyBottle{}, %RPG.Character{health: 0, mana: 0}}
```

## Source

### Created by

- @angelikatyborska

### Contributed to by

- @neenjaw