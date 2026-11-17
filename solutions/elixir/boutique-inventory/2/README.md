# 精品店库存

欢迎来到 Exercism Elixir 轨道中的 精品店库存。
如果你在运行测试或提交代码时需要帮助，请查看`HELP.md`。
如果你在练习中卡住了，请查看`HINTS.md`，不过先试着自己解决，不要急着看提示 :)

## Introduction

## Enum

`Enum` 是一个非常有用的模块，它提供了一组用于处理可枚举对象的算法。它支持排序、过滤、分组、计数、搜索、查找最小值和最大值等等。

一般来说，_可枚举对象_ 就是可以被迭代的任何数据，也就是一个集合。在 Elixir 中，可枚举对象就是任何实现了`Enumerable`协议的数据类型。其中最常见的是[列表][exercism-lists]和[映射][exercism-maps]。

许多`Enum`函数都接受一个函数作为实参。

```elixir
Enum.all?([1, 2, 3, 4, 5], fn x -> x > 3 end)
# => false
```

最常见的`Enum`函数是`map`和`reduce`。

### `map/2`

`Enum.map/2` 允许你把可枚举对象中的每个元素替换成另一个元素。`Enum.map/2` 的第二个实参是一个函数，它接收原始元素，并返回替换后的元素。

### `reduce/3`

`Enum.reduce/3` 允许你把整个可枚举对象_归约_为一个值。为此，需要用到一个叫做_累加器_的特殊变量。累加器在每次迭代之间携带着归约的中间状态。

`Enum.reduce/3` 的第二个实参是累加器的初始值。第三个实参是一个函数，它接收一个元素和一个累加器，并返回累加器的新值。

### 处理映射

当把映射与`Enum`函数一起使用时，映射会自动转换成一个由 2 个`{key, value}`元组组成的列表。

要把它变回映射，请使用`Enum.into/2`。`Enum.into/2` 是一个把可枚举对象转换成可收集类型的函数，可收集类型就是任何实现了`Collectable`协议的数据结构。可以把它理解为`Enum.reduce/3`的逆过程。

`Enum` 还有`Enum.into/3`。`Enum.into/3` 是`Enum.into/2`的一个变体，它接受一个转换函数，在把可枚举对象转换成可收集类型的过程中应用。

#### 对映射进行映射

除了使用`Enum.into/3`，或者`Enum.map/2`加上`Enum.into/2`来对映射应用转换（映射），我们还可以使用专用的`Map.new/2`函数。它的工作方式和`Enum.into/3`完全一样，都接受一个可枚举对象和一个转换函数，但它总是返回一个新的映射，而不是让我们自己选择可收集类型。

[exercism-protocols]: https://exercism.org/tracks/elixir/concepts/protocols
[exercism-lists]: https://exercism.org/tracks/elixir/concepts/lists
[exercism-maps]: https://exercism.org/tracks/elixir/concepts/maps

## Instructions

你正在经营一家线上时装精品店。一年一度的大促销就要到了，你需要盘点库存，确保自己做好准备。

库存中的每件商品用一个映射表示，整个库存则是这些映射组成的数组。

```elixir
%{
  name: "White Shirt",
  price: 40,
  quantity_by_size: %{s: 3, m: 7, l: 8, xl: 4}
}
```

## 1. 按价格排序商品

实现`sort_by_price/1`函数。它接收库存，并返回按商品价格升序排序后的库存。

```elixir
BoutiqueInventory.sort_by_price([
  %{price: 65, name: "Maxi Brown Dress", quantity_by_size: %{}},
  %{price: 50, name: "Red Short Skirt", quantity_by_size: %{}},
  %{price: 50, name: "Black Short Skirt", quantity_by_size: %{}},
  %{price: 20, name: "Bamboo Socks Cats", quantity_by_size: %{}}
])

# => [
#      %{price: 20, name: "Bamboo Socks Cats", quantity_by_size: %{}},
#      %{price: 50, name: "Red Short Skirt", quantity_by_size: %{}},
#      %{price: 50, name: "Black Short Skirt", quantity_by_size: %{}},
#      %{price: 65, name: "Maxi Brown Dress", price: 65, quantity_by_size: %{}}
#    ]
```

## 2. 找出所有缺少价格的商品

按价格给库存排序之后，你发现自己盘点时肯定出了错，有几件商品忘了填价格。

实现`with_missing_price/1`函数。它接收库存，并返回没有价格的商品组成的数组。

```elixir
BoutiqueInventory.with_missing_price([
  %{price: 40, name: "Black T-shirt", quantity_by_size: %{}},
  %{price: nil, name: "Denim Pants", quantity_by_size: %{}},
  %{price: nil, name: "Denim Skirt", quantity_by_size: %{}},
  %{price: 40, name: "Orange T-shirt", quantity_by_size: %{}}
])

# => [
#      %{price: nil, name: "Denim Pants", quantity_by_size: %{}},
#      %{price: nil, name: "Denim Skirt", quantity_by_size: %{}}
#    ]
```

## 3. 更新商品名称

你注意到有些商品名称里有一个你不想再用的词。现在你需要更新所有含有这个词的商品名称。

实现`update_names/3`函数。它接收库存、你想去掉的旧词，以及你想换用的新词。它应返回名称已更新的商品数组。

```elixir
BoutiqueInventory.update_names(
  [
    %{price: 40, name: "Black T-shirt", quantity_by_size: %{}},
    %{price: 70, name: "Denim Pants", quantity_by_size: %{}},
    %{price: 65, name: "Denim Skirt", quantity_by_size: %{}},
    %{price: 40, name: "Orange T-shirt", quantity_by_size: %{}}
  ],
  "T-shirt",
  "Tee"
)

# => [
#      %{price: 40, name: "Black Tee", quantity_by_size: %{}},
#      %{price: 70, name: "Denim Pants", quantity_by_size: %{}},
#      %{price: 65, name: "Denim Skirt", quantity_by_size: %{}},
#      %{price: 40, name: "Orange Tee", quantity_by_size: %{}}
#    ]
```


## 4. 增加商品的数量

有些商品卖得特别好，于是你补了货，各种尺码都进了。

实现`increase_quantity/2`函数。它接收一件商品和一个数字`n`，并返回该商品，把每个尺码的数量都增加`n`。

```elixir
BoutiqueInventory.increase_quantity(
  %{
    name: "Polka Dot Skirt",
    price: 68,
    quantity_by_size: %{s: 3, m: 5, l: 3, xl: 4}
  },
  6
)

# => %{
#      name: "Polka Dot Skirt",
#      price: 68,
#      quantity_by_size: %{l: 9, m: 11, s: 9, xl: 10}
#    }
```

## 5. 计算商品的总数量

要弄清楚仓库需要多大空间，你需要知道每种商品总共有多少件。

实现`total_quantity/1`函数。它接收一件商品，并返回这件商品各种尺码加在一起总共有多少件。

```elixir
BoutiqueInventory.total_quantity(%{
  name: "Red Shirt",
  price: 62,
  quantity_by_size: %{s: 3, m: 6, l: 5, xl: 2}
})

# => 16
```

## Source

### Created by

- @angelikatyborska

### Contributed to by

- @neenjaw
- @fmmatheus