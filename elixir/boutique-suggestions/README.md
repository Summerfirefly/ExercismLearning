# 精品店推荐

欢迎来到 Exercism Elixir 轨道中的 精品店推荐。
如果你在运行测试或提交代码时需要帮助，请查看`HELP.md`。
如果你在练习中卡住了，请查看`HINTS.md`，不过先试着自己解决，不要急着看提示 :)

## Introduction

## 列表推导式

推导式提供了一种简洁且声明式的方式来转换_可枚举对象_。

要声明一个最简单的推导式，可以使用`for`关键字，后面跟一个_生成器_和一个_do 块_，由它根据枚举出的值生成新的值。

```elixir
for n <- [0, 1, 2, 3], do: n + 1
# => [1, 2, 3, 4]
```

推导式还可以带有_过滤器_。没有通过过滤器的值会从最终列表中移除：

```elixir
for n <- [0, 1, 2, 3], n > 1, do: n + 1
# => [3, 4]
```

我们还可以写成多行，声明更复杂的推导式：

```elixir
for {atom, number} <- [a: 1, b: 2, c: 3, d: 4],
    rem(number, 2) == 0 do
  atom
end

# => [:b, :d]
```

使用多个生成器可以创建_笛卡尔积_。也就是说，第一个生成器生成的每个值都会与第二个生成器生成的每个值各配对一次：

```elixir
for x <- [0, 1],
    y <- [0, 1] do
  {x, y}
end

# => [{0, 0}, {0, 1}, {1, 0}, {1, 1}]
```

## Instructions

你在线上时尚精品店的工作还在继续。你想到了一个网站功能的主意：向用户推荐穿搭。你希望给出很多推荐，但又不希望给出糟糕的推荐，于是决定使用列表推导式，因为这样可以轻松_生成_穿搭组合，再按某些条件_筛选_它们。

衣物以映射的形式存储：

```elixir
%{
  item_name: "Descriptive Name",
  price: 99.00,
  color: "Ochre Red",
  base_color: "red"
}
```

## 1. 推荐一套搭配

实现`get_combinations/3`，接收上衣列表、下装列表和一个关键字选项列表。目前先让选项默认是一个空的关键字列表。该函数应返回这些列表的笛卡尔积。

```elixir
tops = [
  %{item_name: "Dress shirt"},
  %{item_name: "Casual shirt"}
]

bottoms = [
  %{item_name: "Jeans"},
  %{item_name: "Dress trousers"}
]

BoutiqueSuggestions.get_combinations(tops, bottoms)
# => [
#      {%{item_name: "Dress shirt"}, %{item_name: "Jeans"}},
#      {%{item_name: "Dress shirt"}, %{item_name: "Dress trousers"}},
#      {%{item_name: "Casual shirt"}, %{item_name: "Jeans"}},
#      {%{item_name: "Casual shirt"}, %{item_name: "Dress trousers"}}
#    ]
```

## 2. 筛掉撞色的穿搭

每件衣物都有一个`:base_color`字段，用它筛掉所有上衣与下装基础色相同的组合。

```elixir
tops = [
  %{item_name: "Dress shirt", base_color: "blue"},
  %{item_name: "Casual shirt", base_color: "black"}
]

bottoms = [
  %{item_name: "Jeans", base_color: "blue"},
  %{item_name: "Dress trousers", base_color: "black"}
]

BoutiqueSuggestions.get_combinations(tops, bottoms)
# => [
#      {%{item_name: "Dress shirt", base_color: "blue"},
#       %{item_name: "Dress trousers", base_color: "black"}},
#      {%{item_name: "Casual shirt", base_color: "black"},
#       %{item_name: "Jeans", base_color: "blue"}}
#    ]
```

## 3. 按搭配的价格筛选

每件衣物都关联着一个`:price`字段。你希望给出很多推荐，同时也希望让用户有机会选择符合自己预算的价格。从选项的关键字列表中，用`:maximum_price`筛掉上衣与下装价格之和超过最高价格的组合。

如果没有指定 maximum_price，默认值应为`100.00`

```elixir
tops = [
  %{item_name: "Dress shirt", base_color: "blue", price: 35},
  %{item_name: "Casual shirt", base_color: "black", price: 20}
]

bottoms = [
  %{item_name: "Jeans", base_color: "blue", price: 30},
  %{item_name: "Dress trousers", base_color: "black", price: 75}
]

BoutiqueSuggestions.get_combinations(tops, bottoms, maximum_price: 50)
# => [
#      {%{item_name: "Casual shirt", base_color: "black", price: 20},
#       %{item_name: "Jeans", base_color: "blue", price: 30}}
#    ]
```

## Source

### Created by

- @neenjaw

### Contributed to by

- @angelikatyborska
- @kevpo