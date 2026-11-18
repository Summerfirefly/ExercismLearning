# 按数字涂色

欢迎来到 Exercism Elixir 轨道中的 按数字涂色。
如果你在运行测试或提交代码时需要帮助，请查看`HELP.md`。
如果你在练习中卡住了，请查看`HINTS.md`，不过先试着自己解决，不要急着看提示 :)

## Introduction

## 位串

处理二进制数据是任何一门编程语言中的重要概念，Elixir 提供了优雅的语法来编写、匹配和构造二进制数据。

在 Elixir 中，二进制数据被称为位串类型。二进制数据_类型_（不要与一般意义上的二进制数据混淆）是位串的一种特定形式，我们会在后面的练习中讨论。

位串字面量使用位串特殊形式`<<>>`来定义。定义位串字面量时，是以段为单位定义的。每个段都有一个值和一个类型，两者用`::`运算符分隔。类型指定编码该值要使用多少位。类型可以完全省略，此时默认是 8 位整数。

```elixir
# This defines a bitstring with three segments of a single bit each
<<0::1, 1::1, 0::1>>
```

把类型指定为`::1`，是`::size(1)`的简写。如果位大小来自变量，就需要使用更长的写法。

### 二进制

编写二进制整数字面量时，可以直接用二进制记法，在字面量前面加上`0b`。注意，在测试结果中打印或使用 iex 时，它们都会以十进制数字显示。

```elixir
<<0b1011::4>> == <<11::4>>
# => true
```

### 截断

如果段的值超出了该段类型的容量，就会从左边被截断。

```elixir
<<0b1011::3>> == <<0b0011::3>>
# => true
```

### 在前面添加和在后面添加

使用特殊形式，既可以在已有位串的前面添加，也可以在其后面添加。如果已有位串的大小未知，就必须对它使用`::bitstring`类型。

```elixir
value = <<0b110::3, 0b001::3>>
new_value = <<0b011::3, value::bitstring, 0b000::3>>
# => <<120, 8::size(4)>>
```

### 拼接

我们可以使用特殊形式，拼接保存在变量中的位串。拼接两个大小未知的位串时，必须使用`::bitstring`类型。

```elixir
first = <<0b110::3>>
second = <<0b001::3>>
concatenated = <<first::bitstring, second::bitstring>>
# => <<49::size(6)>>
```

### 模式匹配

也可以用模式匹配从特殊形式中获取值。你必须知道每个想要捕获的片段有多少位，只有一个例外：可以用`::bitstring`类型对大小未知的位串进行模式匹配，但它只能用于最后一个片段。

```elixir
<<value::4, rest::bitstring>> = <<0b01101001::8>>
value == 0b0110
# => true
```

### 查看位串

~~~~exercism/note
位串被打印出来时（由测试运行器打印，或在 iex 中打印），格式可能跟创建它时所用的格式不同。初学位串时，这常常会造成困惑。
~~~~

默认情况下，位串以 8 位（一个字节）为单位显示，即使创建它时使用的片段大小不同。

```elixir
<<2011::11>>
# => <<251, 3::size(3)>>
```

如果你创建的位串表示一个可打印的 UTF-8 编码字符串，它就会显示为字符串。

```elixir
<<>>
# => ""

<<65, 66, 67>>
# => "ABC"
```

## Instructions

[数字涂色][paint-by-number]（又称_按数字填色_）是一类供涂色的黑白图片。
图片的不同区域标注了不同的数字，这些数字对应预定义调色板中的特定颜色。
目标是用正确的颜色填充这些区域，最终呈现出一幅美丽的彩色图片。
这是一项适合大人和小孩的放松活动。

你的任务是使用 Elixir 编写一个数字涂色应用。
你希望这个应用能够以自定义的数据格式导入和导出图片。
你决定使用[二进制文件][binary-file]来存储图片数据。

~~~~exercism/note
本练习假设你已经熟悉[二进制数](https://en.wikipedia.org/wiki/Binary_number)，
并理解二进制数与十进制数相互转换的原理。
~~~~

我们来想象一幅笑脸图片，就像下面这样。
图片的背景是白色的。笑脸有黑色的轮廓和黄色的填充色。

这幅图片使用了 3 种颜色。
假设我们为这些颜色分配下标：
- `0`（二进制：`0b00`）表示白色，
- `1`（二进制：`0b01`）表示黑色，
- `2`（二进制：`0b10`）表示黄色。

现在我们可以用这些颜色下标来表示每个像素的颜色。

| 笑脸                                                                                                | 带颜色下标的笑脸                                                                                     |
|-------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------|
| ![](https://assets.exercism.org/images/exercises/paint-by-number/smiley.png) | ![](https://assets.exercism.org/images/exercises/paint-by-number/smiley-numbers.png) |

## 1. 计算调色板的位大小

实现 `PaintByNumber.palette_bit_size/1` 函数。它接收调色板中颜色的数量，返回用二进制数表示这么多颜色下标所需的位数。颜色下标始终从 0 开始，并且是连续递增的整数。

例如，表示 13 种不同的颜色需要 4 位。4 位最多可以存储 16 个颜色下标（2^4）。3 位则不够，因为 3 位最多只能存储 8 个颜色下标（2^3）。

```elixir
PaintByNumber.palette_bit_size(13)
# => 4
```

注意：Elixir 标准库中没有 `log2` 函数。稍后你会学到如何在 Elixir 中使用 [Erlang 库][erlang-libraries]，你可以在那里找到这个函数。现在，请改用递归和[幂运算符 `**`][power-operator]来解决这个任务。

## 2. 创建一幅空图片

实现 `PaintByNumber.empty_picture/0` 函数。它应返回一个空位串。

## 3. 创建一幅测试图片

一幅预定义的测试图片将用于手动测试应用的基本功能。
这幅测试图片由 4 个像素组成，使用了 4 种不同的颜色。

实现 `PaintByNumber.test_picture/0` 函数。它应返回一个由 4 个片段组成的位串。
每个片段的位大小应为 2。这些片段的值应分别为 0、1、2 和 3。

## 4. 在图片前面添加一个像素

实现 `PaintByNumber.prepend_pixel/3` 函数。它接收三个实参：要在其前面添加像素的图片位串、调色板中颜色的数量，以及新像素颜色的下标。它应返回一个位串，其中新像素被添加到了图片的开头。

```elixir
picture = <<2::4, 0::4>>
color_count = 13
pixel_color_index = 11

PaintByNumber.prepend_pixel(picture, color_count, pixel_color_index)
# => <<178, 0::size(4)>>
# (which is equal to <<11::4, 2::4, 0::4>>)
```

## 5. 从图片中获取第一个像素

实现 `PaintByNumber.get_first_pixel/2` 函数。它接收两个实参：要读取的图片位串，以及调色板中颜色的数量。它应返回给定图片中第一个像素的颜色下标。当传入空图片时，它应返回 `nil`。

```elixir
picture = <<19::5, 2::5, 18::5>>
color_count = 20

PaintByNumber.get_first_pixel(picture, color_count)
# => 19
```

## 6. 从图片中移除第一个像素

实现 `PaintByNumber.drop_first_pixel/2` 函数。它接收两个实参：要移除像素的图片位串，以及调色板中颜色的数量。它应返回移除第一个像素后的图片。当传入空图片时，它应返回一个空图片。

```elixir
picture = <<2::3, 5::3, 5::3, 0::3>>
color_count = 6

PaintByNumber.drop_first_pixel(picture, color_count)
# => <<180, 0::size(1)>>
# (which is equal to <<5::3, 5::3, 0::3>>)
```

## 7. 拼接两幅图片

实现 `PaintByNumber.concat_pictures/2` 函数。它接收两个实参，即两个位串。它应返回将第一个实参前置到第二个实参所得的结果位串。

```elixir
picture1 = <<52::6, 51::6>>
picture2 = <<0::6, 34::6, 12::6>>

PaintByNumber.concat_pictures(picture1, picture2)
# => <<211, 48, 34, 12::size(6)>>
# (which is equal to <<52::6, 51::6, 0::6, 34::6, 12::6>>)
```

[paint-by-number]: https://en.wikipedia.org/wiki/Paint_by_number
[binary-file]: https://en.wikipedia.org/wiki/Binary_file
[erlang-libraries]: https://exercism.org/tracks/elixir/concepts/erlang-libraries
[power-operator]: https://hexdocs.pm/elixir/Kernel.html#**/2

## Source

### Created by

- @angelikatyborska

### Contributed to by

- @neenjaw
- @meatball133
- @vaeng
- @glennj