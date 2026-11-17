# 文件嗅探器

欢迎来到 Exercism Elixir 轨道中的 文件嗅探器。
如果你在运行测试或提交代码时需要帮助，请查看`HELP.md`。
如果你在练习中卡住了，请查看`HINTS.md`，不过先试着自己解决，不要急着看提示 :)

## Introduction

## 二进制

Elixir 为处理二进制数据提供了优雅的语法，就像我们见过的、用于处理[位串][exercism-bitstrings]的特殊形式`<<>>`一样。

二进制类型是位串类型的一种特化。位串的长度可以是任意的（位的数量不限），而二进制数据的位数必须能被 8 整除。也就是说，处理二进制数据时，我们常常以[字节][wiki-byte]（8 位）为单位来思考。一个字节可以表示从`0`到`255`的整数。用[十六进制][wiki-hexadecimal]来表示字节值很常见，也就是`0x00 - 0xFF`。

二进制字面量使用位串特殊形式`<<>>`来定义。定义二进制字面量时，可以使用整数字面量和字符串字面量。大于 255 的整数值会溢出，只会用到该整数最后的 8 位。默认情况下，会为该值应用`::binary`修饰符。我们可以用`<>/2`运算符拼接二进制数据。

```elixir
<<255>> == <<0xFF>>
# Overflowing bits are truncated
<<256>> == <<0>>
<<2, 4, 6, 8, 10, 12, 14, 16>> == <<0x02, 0x04, 0x06, 0x08, 0x0A, 0x0C, 0x0E, 0x10>>
```

_空字节_ 是`<<0>>`的另一个名称。

### 对二进制数据进行模式匹配

[模式匹配][exercism-pattern-matching]甚至能用在二进制数据上，我们可以像处理数组那样，对二进制数据的一部分进行模式匹配。

```elixir
# Ignore the first 8 bytes, match and bind the remaining to `body`
<<_::binary-size(8), body::binary>>
```

和其他类型的模式匹配一样，我们可以在函数签名中使用它，在多个函数子句之间进行选择。

[wiki-bit]: https://en.wikipedia.org/wiki/Bit
[wiki-byte]: https://en.wikipedia.org/wiki/Byte
[wiki-hexadecimal]: https://en.wikipedia.org/wiki/Hexadecimal
[exercism-bitstrings]: https://exercism.org/tracks/elixir/concepts/bitstrings
[exercism-pattern-matching]: https://exercism.org/tracks/elixir/concepts/pattern-matching

## Instructions

你一直在做一个项目，它允许用户把文件上传到服务器，与其他用户分享。现在你的任务是编写一个函数，用来验证上传的文件是否与它的[媒体类型][mimetype]匹配。你查了一些资料，发现文件的前几个字节通常只有该文件类型才有，因此它就像是文件的一种签名。

可以参考下面的表格：

| 文件类型 | 常见扩展名 | 媒体类型                     | 二进制“签名”                                     |
| -------- | ---------- | ---------------------------- | ------------------------------------------------ |
| ELF      | `"exe"`    | `"application/octet-stream"` | `0x7F, 0x45, 0x4C, 0x46`                         |
| BMP      | `"bmp"`    | `"image/bmp"`                | `0x42, 0x4D`                                     |
| PNG      | `"png"`    | `"image/png"`                | `0x89, 0x50, 0x4E, 0x47, 0x0D, 0x0A, 0x1A, 0x0A` |
| JPG      | `"jpg"`    | `"image/jpg"`                | `0xFF, 0xD8, 0xFF`                               |
| GIF      | `"gif"`    | `"image/gif"`                | `0x47, 0x49, 0x46`                               |

## 1. 给定扩展名，返回预期的媒体类型

实现`type_from_extension/1`函数。它接收一个文件扩展名（字符串），返回对应的媒体类型（字符串）；如果该扩展名与预期的都不匹配，就返回 nil。

```elixir
FileSniffer.type_from_extension("exe")
# => "application/octet-stream"

FileSniffer.type_from_extension("txt")
# => nil
```

## 2. 给定二进制文件，返回预期的媒体类型

实现`type_from_binary/1`函数。它接收一个文件（二进制），返回对应的媒体类型（字符串）；如果该文件的签名与预期的都不匹配，就返回 nil。

```elixir
file = File.read!("application.exe")
FileSniffer.type_from_binary(file)
# => "application/octet-stream"

file = File.read!("example.txt")
FileSniffer.type_from_binary(file)
# => nil
```

不用操心如何把文件读取成二进制。可以认为这一步已经帮你做好了，测试会把它作为实参传进来。

## 3. 给定扩展名和二进制文件，验证文件是否与预期的类型匹配

实现`verify/2`函数。它接收一个文件（二进制）和一个扩展名（字符串），返回`:ok`或`:error`元组。

```elixir
file = File.read!("application.exe")

FileSniffer.verify(file, "exe")
# => {:ok, "application/octet-stream"}

FileSniffer.verify(file, "png")
# => {:error, "Warning, file format and file extension do not match."}
```

[mimetype]: https://en.wikipedia.org/wiki/Media_type

## Source

### Created by

- @neenjaw

### Contributed to by

- @angelikatyborska
- @cr0t