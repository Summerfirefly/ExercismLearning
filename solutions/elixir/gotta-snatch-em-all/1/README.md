# Gotta Snatch'Em All

欢迎来到 Exercism Elixir 轨道中的 Gotta Snatch'Em All。
如果你在运行测试或提交代码时需要帮助，请查看`HELP.md`。
如果你在练习中卡住了，请查看`HINTS.md`，不过先试着自己解决，不要急着看提示 :)

## Introduction

## MapSets

`MapSet`是唯一值的集合，在 Elixir 中用来表示集合。它可以包含任意类型的值，并且没有顺序的概念。

注意，`Set`模块也存在，但已废弃，推荐改用`MapSet`。

你可以使用`MapSet.new/0`、`MapSet.new/1`和`MapSet.new/2`创建集合，并使用`MapSet.to_list/1`将它们转换成数组。

```elixir
MapSet.new()
# => MapSet.new([])

MapSet.new([2, 3, 3, 3, 1, 1, 2, "hello"])
# => MapSet.new([1, 2, 3, "hello"])

MapSet.new([2, 3, 3, 3, 1, 1, 2], fn n -> 10 * n end)
# => MapSet.new([10, 20, 30])

[2, 3, 3, 3, 1, 1, 2] |> MapSet.new() |> MapSet.to_list()
# => [1, 2, 3]
```

注意，由于`MapSet`没有顺序的概念，`MapSet.to_list/1`不保证返回排好序的数组。

你可以使用`MapSet.put/2`和`MapSet.delete/2`添加或删除元素。

你可以使用`MapSet.size/1`、`MapSet.member?/2`这些函数查询集合的内容，并使用`MapSet.equal?/2`、`MapSet.subset?/2`和`MapSet.disjoint?/2`比较集合。

```elixir
a = MapSet.new([1, 10])
b = MapSet.new([1, 2, 3, 4, 5, 6, 7, 8, 9, 10])

MapSet.size(b)
# => 10

MapSet.member?(a, 10)
# => true

MapSet.subset?(a, b)
# => true

MapSet.disjoint?(a, b)
# => false
```

多个`MapSet`可以通过`MapSet.union/2`、`MapSet.intersection/2`、`MapSet.difference/2`和`MapSet.symmetric_difference/2`组合到一起。

```elixir
a = MapSet.new([1, 10, 100])
b = MapSet.new([1, 2, 3, 4, 5, 6, 7, 8, 9, 10])

MapSet.union(a, b)
# => MapSet.new([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 100])

MapSet.intersection(a, b)
# => MapSet.new([1, 10])

MapSet.difference(a, b)
# => MapSet.new([100])

MapSet.difference(b, a)
# => MapSet.new([2, 3, 4, 5, 6, 7, 8, 9])

MapSet.symmetric_difference(b, a)
# => MapSet.new([2, 3, 4, 5, 6, 7, 8, 9, 100])
```

你可以使用`MapSet.filter/2`、`MapSet.reject/2`和`MapSet.split_with/2`筛选和划分集合。

```elixir
a = MapSet.new([1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
even = fn n -> rem(n, 2) == 0 end

MapSet.filter(a, even)
# => MapSet.new([2, 4, 6, 8, 10])

MapSet.reject(a, even)
# => MapSet.new([1, 3, 5, 7, 9])

MapSet.split_with(a, even)
# => {MapSet.new([2, 4, 6, 8, 10]), MapSet.new([1, 3, 5, 7, 9])}
```

## Instructions

你对 Blorkemon™️ 卡牌的热情丝毫没有减退的迹象，你甚至又开始收集它们了，还在拉朋友们一起加入。

在本练习中，卡牌收藏用`MapSet`表示，因为当目标是集齐所有已存在的卡牌时，重复的卡牌并不重要。

## 1. 开始收藏

你非常希望朋友们也加入你的 Blorkemon™️ 狂热，最好的办法就是送他们一张卡牌，帮他们把收藏起步。

实现`GottaSnatchEmAll.new_collection`，它把一张卡牌变成一个收藏。

```elixir
GottaSnatchEmAll.new_collection("Newthree")
# => MapSet.new(["Newthree"])
```

## 2. 扩充收藏

一旦有了收藏，它就有了自己的生命力，必须不断壮大。

实现`GottaSnatchEmAll.add_card`，它接收一张卡牌和一个收藏，返回一个包含两个值的元组：一个布尔值，表示这张卡牌是否已经在收藏中；以及加入这张卡牌后的收藏。

```elixir
GottaSnatchEmAll.add_card("Scientuna", MapSet.new(["Newthree"]))
# => {false, MapSet.new(["Newthree", "Scientuna"])}
```

## 3. 开始交换

既然你的朋友们又对 Blorkemon™️ 痴迷了，你就可以借此通过交换卡牌来扩充自己的收藏。

并不是每笔交换都值得做，有的甚至根本做不了。
你没有的卡牌不能拿去换，也不该用一张卡牌去换你已经有的卡牌。

实现`GottaSnatchEmAll.trade_card`，它接收要交换的两张卡牌（你的和对方的）以及你当前的收藏。
返回值是一个包含两个值的元组：一个布尔值，说明这笔交换是否可行且值得做；以及如果完成这笔交换，你最终会得到的收藏（即使实际上并不可行）。

```elixir
GottaSnatchEmAll.trade_card("Scientuna", "Newthree", MapSet.new(["Scientuna"]))
# => {true, MapSet.new(["Newthree"])}
```

## 4. 每种只能有一张

你在跳蚤市场找到了一堆旧卡牌。
你需要把卡牌排序并去掉重复项，以便把这个数组和你的收藏作比较。

实现`GottaSnatchEmAll.remove_duplicates`，它会对一个卡牌数组排序，并返回一个排序好的、不含重复项的卡牌数组。

```elixir
GottaSnatchEmAll.remove_duplicates(["Newthree", "Newthree", "Newthree", "Scientuna"])
# => ["Newthree", "Scientuna"]
```

## 5. 对方没有的卡牌

是时候为自己的收藏小小得意一下了。

实现`GottaSnatchEmAll.extra_cards`，它接收你的收藏和另一个收藏，返回对方收藏中所缺少的卡牌数量。

```elixir
GottaSnatchEmAll.extra_cards(MapSet.new(["Scientuna"]), MapSet.new(["Newthree", "Scientuna"]))
# => 0
```

## 6. 所有人都有的卡牌

你和你的 Blorkemon™️ 爱好者朋友们聚在一起，想知道哪些卡牌最常见。

实现`GottaSnatchEmAll.boring_cards`，它接收一个收藏数组，返回一个所有收藏都有的、排序好的卡牌数组。

```elixir
GottaSnatchEmAll.boring_cards([MapSet.new(["Scientuna"]), MapSet.new(["Newthree", "Scientuna"])])
# => ["Scientuna"]
```

## 7. 所有的卡牌

你和你的朋友们加起来是否拥有所有的 Blorkemon™️ 卡牌？

实现`GottaSnatchEmAll.total_cards`，它接收一个收藏数组，返回所有收藏中不同卡牌的总数。

```elixir
GottaSnatchEmAll.total_cards([MapSet.new(["Scientuna"]), MapSet.new(["Newthree", "Scientuna"])])
# => 2
```

## 8. 闪卡必胜

你的侄子马上就要来看你了，你想给他留下深刻印象。
小孩子不都喜欢闪闪发亮的东西吗？
Blorkemon™️ 卡牌也可以是闪光的！

实现`GottaSnatchEmAll.split_shiny_cards`，它接收一个收藏，返回一个元组，里面是两个排序好的卡牌数组：一个是所有以`"Shiny"`开头的卡牌，另一个是其余的卡牌。

```elixir
GottaSnatchEmAll.split_shiny_cards(MapSet.new(["Newthree", "Scientuna", "Shiny Scientuna"]))
# => {["Shiny Scientuna"], ["Newthree", "Scientuna"]}
```

## Source

### Created by

- @jiegillet