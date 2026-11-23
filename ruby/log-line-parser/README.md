# 日志行解析器

欢迎来到 Exercism Ruby 轨道中的 日志行解析器。
如果你在运行测试或提交代码时需要帮助，请查看`HELP.md`。
如果你在练习中卡住了，请查看`HINTS.md`，不过先试着自己解决，不要急着看提示 :)

## Introduction

和 Ruby 中的一切一样，`String` 也是一个对象。
字符串由任意字节序列（通常是字符）组成，像其他任何对象一样被初始化和操作。
事实上，Ruby 最有用的特点之一，就是可以对字符串（以及其他对象）调用大量方法，帮你省下大量写代码的时间。
在本次练习中，我们将探索并使用其中一些辅助方法。

## 创建字符串

虽然可以用 `String.new(...)` 创建字符串，但更常见的做法是使用字面量。
可以使用的字面量有很多种，它们分成两类：允许插值的和不允许插值的。

最常见的字面量是单引号和双引号（`'...'` 和 `"..."`）。
单引号不允许插值，而双引号允许。
插值是指用 `#{}` 语法把一个字符串包含到另一个字符串中。

```
# Use single quotes when not interpolated
location = 'World'

# And double quotes when interpolated
puts "Hello, #{location}!"   #=> "Hello, World!"
```

你也可以使用其他字面量，例如用 `%{... }` 表示可插值字符串，用 `%q{...}` 表示不可插值字符串。
如果你的字符串中包含 `'` 或 `"` 这些字符，它们会很有用。

_注意：并没有绝对的规则要求你在字符串不包含插值时，必须使用不可插值字符串。_

## 与字符串交互

把 Ruby 中的字符串想象成和数组类似的东西，会很有帮助。
它们有大小，字符也可以按下标访问（第一个下标是 `0`）：

```ruby
my_string = "Some string"

my_string.size   #=> 11

my_string[0]    #=> 'S'
my_string[1]    #=> 'o'
my_string[-1]   #=> 'g'

# Find the first index of a character
my_string.index('m')   #=> 2
```

可以用下标或 `slice` 提取字符串的一部分：
```ruby
my_string = "Some string"

# Find three characters starting with the second character (index 1)
my_string[1, 3]         #=> "ome"
my_string.slice(1, 3)   #=> "ome"
```

字符串的语义值也可以被操作。
值得去看看 [Ruby 文档][docs-string] 了解所有方法，这里先举几个常用的例子：
```
"hello".capitalize   #=> "Hello"
"HELLO".downcase     #=> "hello"
"hello".center(9)    #=> "  hello  "
"  hello  ".strip    #=> "hello"

"hello world".split(" ")   #=> ["hello", "world"]
```

你也可以用 `gsub` 这样的方法来替换字符：
```
# Replace one character with another
"noob".gsub("o","0")   #=> "n00b"

# (Advanced) Replace a regular expression
"Ruby really rocks".gsub(/[aieou]/,'')   #=> "Rby rlly rcks"
```

在上面的所有例子中，返回的都是一个新的 `String`。
不过，很多方法都有以 `!` 结尾的对应版本，它们会真正修改字符串本身。

```
# Use normal methods to return new strings
my_string = "hello"
my_string.capitalize   #=> "Hello"
puts my_string         #=> "hello"

# And bang-methods (...!) to modify the object
my_string = "hello"
my_string.capitalize!  #=> "Hello"
puts my_string         #=> "Hello"
```

[docs-string]: https://docs.ruby-lang.org/en/master/String.html

## Instructions

在这个练习中，你将处理日志行。

每一行日志都是一个字符串，格式如下：`"[<LEVEL>]: <MESSAGE>"`。

日志共有三种级别：

- `INFO`
- `WARNING`
- `ERROR`

你有三个任务，每个任务都会接收一行日志，并要求你对其做些处理。解决这些任务的方法有很多，你可以从上面的示例中挑选自己喜欢的方法，看看能写出什么。

## 1. 从日志行中获取消息

实现`LogLineParser#message`方法，返回日志行的消息：

```ruby
LogLineParser.new('[ERROR]: Invalid operation').message
# => "Invalid operation"
```

开头和结尾的空白字符都应去掉：

```ruby
LogLineParser.new("[WARNING]:  Disk almost full\r\n").message
# => "Disk almost full"
```

## 2. 从日志行中获取日志级别

实现`LogLineParser#log_level`方法，返回日志行的日志级别，返回值应为小写：

```ruby
LogLineParser.new('[ERROR]: Invalid operation').log_level
# => "error"
```

## 3. 重新格式化日志行

实现`LogLineParser#reformat`方法，重新格式化日志行：把消息放在前面，日志级别放在后面并用括号括起来：

```ruby
LogLineParser.new('[INFO]: Operation completed').reformat
# => "Operation completed (info)"
```

## Source

### Created by

- @pvcarrera