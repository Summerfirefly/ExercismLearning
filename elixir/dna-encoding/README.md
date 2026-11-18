# DNA 编码

欢迎来到 Exercism Elixir 轨道中的 DNA 编码。
如果你在运行测试或提交代码时需要帮助，请查看`HELP.md`。
如果你在练习中卡住了，请查看`HINTS.md`，不过先试着自己解决，不要急着看提示 :)

## Introduction

## 尾调用递归

在通过可枚举对象（列表、位串、字符串）进行[递归][exercism-recursion]时，通常有两个需要关注的问题：

- 存储递归函数调用轨迹需要多少内存
- 如何高效地构建解答

为了处理这些问题，可以使用_累加器_。

累加器是在数据之外额外传递的一个变量。它用于在一次次函数调用之间传递函数执行的当前状态，直到到达_基本情况_。在基本情况中，使用累加器返回递归函数调用的最终值。

累加器应该由函数的编写者初始化，而不是由函数的用户初始化。为此，需要声明两个函数：一个公共函数，只接收必要的数据作为参数，并初始化累加器；另一个私有函数，还要接收一个累加器。在 Elixir 中，一种常见的做法是在私有函数名前面加上`do_`。

```elixir
# Count the length of a list without an accumulator
def count([]), do: 0
def count([_head | tail]), do: 1 + count(tail)

# Count the length of a list with an accumulator
def count(list), do: do_count(list, 0)

defp do_count([], count), do: count
defp do_count([_head | tail], count), do: do_count(tail, count + 1)
```

使用累加器让我们可以把递归函数变成_尾递归_函数。如果函数执行的_最后_一件事就是调用它自己，那么这个函数就是尾递归的。

[exercism-recursion]: https://exercism.org/tracks/elixir/concepts/recursion

## Instructions

在你的 DNA 研究实验室里，你一直在尝试各种方法来压缩研究数据，以节省存储空间。一位队友建议把 DNA 数据转换成二进制表示：

| 核酸 | 代码   |
| ------------ | ------ |
| 空格      | `0000` |
| A            | `0001` |
| C            | `0010` |
| G            | `0100` |
| T            | `1000` |

你仔细考虑了一下，这有可能把所需的存储成本减半，但代价是降低人类可读性。你决定写一个模块来编码和解码数据，以便衡量节省的效果。

## 1. 将核酸编码为二进制值

实现 `encode_nucleotide/1`，接收核酸的码点，返回编码后的整数值。

```elixir
DNA.encode_nucleotide(?A)
# => 1
# (which is equal to 0b0001)
```

## 2. 将二进制值解码为核酸

实现 `decode_nucleotide/1`，接收编码后的整数值，返回核酸的码点。

```elixir
DNA.decode_nucleotide(0b0001)
# => 65
# (which is equal to ?A)
```

## 3. 编码 DNA 字符列表

实现 `encode/1`，接收表示核酸和间隔的字符列表，返回编码后数据的位串。

```elixir
DNA.encode(~c"AC GT")
# => <<18, 4, 8::size(4)>>
```

## 4. 解码 DNA 位串

实现 `decode/1`，接收表示核酸和间隔的位串，以字符列表的形式返回解码后的数据。

```elixir
DNA.decode(<<132, 2, 1::size(4)>>)
# => ~c"TG CA"
```

## Source

### Created by

- @neenjaw

### Contributed to by

- @angelikatyborska
- @NobbZ