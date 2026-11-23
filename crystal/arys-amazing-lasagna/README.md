# Ary 的绝妙千层面

欢迎来到 Exercism Crystal 轨道中的 Ary 的绝妙千层面。
如果你在运行测试或提交代码时需要帮助，请查看`HELP.md`。
如果你在练习中卡住了，请查看`HINTS.md`，不过先试着自己解决，不要急着看提示 :)

## Introduction

## 入门

### 变量

要声明一个[变量][variables]，请使用`=`赋值运算符。
在 Crystal 中，变量应使用`snake_case`格式。

```crystal
number = 1
puts number # => 1

number = 2
puts number # => 2
```

### 常量

[常量][constants]使用相同的`=`赋值运算符声明，但名称要使用全大写字母，即 SCREAMING_SNAKE_CASE。

```crystal
NUMBER = 1
puts NUMBER # => 1
```

给已定义的常量赋值会导致编译期错误。

```crystal
NUMBER = 1

NUMBER = 2
# Error: already initialized constant NUMBER
```

### 类型

Crystal 是一门编译型语言，这意味着每个变量或方法实参都会在编译期被赋予一个类型。
编译器能够推断变量或方法实参的类型。
不过，有些情况下必须显式指定类型。
需要指定类型的情况会在后面的概念中讲解。

### 方法

[方法][methods]是一种把一组指令组合起来以便复用的方式。
在 Crystal 中，方法通常定义在类、模块或结构体中。
不过，方法也可以定义在类、模块或结构体之外。
方法使用`def`关键字声明，后面跟方法名。
在 Crystal 中，方法应使用 snake_case 编写。
当方法没有任何实参时，可以省略括号。
要声明方法的结束，必须使用`end`关键字。

```crystal
def hello
  puts "Hello World!"
end
```

对某个变量或方法实参的类型使用一个不存在的方法，会导致编译期错误。

```crystal
number = 1
number + "1"
# Error: no overload matches 'Int32#+' with type String
```

### 实参

方法可以有[实参][arguments]。
实参是传递给方法的数据。
要给方法提供实参，必须指定实参的名称。
在 Crystal 中，实参应使用 snake_case 编写。
一个方法可以有多个实参，但实参之间必须用逗号分隔。

```crystal
def hello(name)
  puts "Hello #{name}!"
end
```

方法也可以有多个实参。
这时，实参之间必须用逗号分隔。

```crystal
def hello(name, language)
  puts "Hello #{name}! You are learning #{language}."
end
```

### 调用方法

调用属于类、模块或结构体的方法时，必须使用点运算符（`.`）。
格式应为：`<ClassName>.<method_name>`。
当方法不属于类、模块或结构体时，直接写出它的名字即可调用。
方法总是隐式返回最后一个表达式的值。

当方法有实参时，在方法调用和方法定义中指定实参可以使用括号，如下所示：`<method_name>(<argument_1>, <argument_2>, ...)`。
当方法没有实参时，应省略括号。

```crystal
def hello(name)
  "Hello #{name}!"
end

hello("Crystal")
# => Hello Crystal!
```

调用带有多个实参的方法时，实参之间应用逗号分隔。
实参的顺序必须与方法定义的实参顺序一致。

```crystal
def hello_language(name, language)
  "Hello #{name}! You are learning #{language}."
end

hello_language("World", "Crystal")
# => Hello World! You are learning Crystal.
```

调用方法时实参数量不对，会导致编译期错误。

```crystal
hello_language("Crystal")
# wrong number of arguments for 'hello_language' (given 1, expected 2)
```

### 加法、减法与乘法

在 Crystal 中，可以使用`+`运算符将两个数字相加。
也可以使用`-`运算符将两个数字相减。
还可以使用`*`运算符将两个数字相乘。

```crystal
1 + 1
# => 2

2 - 1
# => 1

2 * 2
# => 4
```

### 注释

在 Crystal 中，[注释][comments]使用`#`字符书写，后面跟一个空格，然后是注释内容。
注释用于为代码编写文档。
编译器不会执行注释。

```crystal
# This is a comment
```

[arguments]: https://crystal-lang.org/reference/latest/tutorials/basics/60_methods.html#arguments
[comments]: https://crystal-lang.org/reference/latest/syntax_and_semantics/comments.html
[constants]: https://crystal-lang.org/reference/latest/syntax_and_semantics/constants.html
[methods]: https://crystal-lang.org/reference/latest/tutorials/basics/60_methods.html#methods
[return]: https://crystal-lang.org/reference/latest/tutorials/basics/60_methods.html#returning-a-value
[snake-case]: https://en.wikipedia.org/wiki/Snake_case
[type]: https://crystal-lang.org/reference/latest/tutorials/basics/20_variables.html#type
[variables]: https://crystal-lang.org/reference/latest/tutorials/basics/20_variables.html

## Instructions

在这个练习中，你将编写代码，帮助你照着最喜欢的食谱做出一份美味的千层面。

你有四个任务，都与烹制千层面所花的时间有关。

## 1. 定义预期的烤箱时间（分钟）

在 `Lasagna` 类中定义 `EXPECTED_MINUTES_IN_OVEN` 常量，用来存储千层面应该在烤箱中烤多少分钟。
根据这本食谱，预期的烤箱时间是 40 分钟：

```Crystal
Lasagna::EXPECTED_MINUTES_IN_OVEN
# => 40
```

## 2. 计算烤箱中剩余的时间（分钟）

定义 `Lasagna#remaining_minutes_in_oven` 方法，它接收千层面已经在烤箱中烤制的实际分钟数作为形参，并根据上一个任务中预期的烤箱时间（分钟）返回千层面还需要在烤箱中烤多少分钟。

```Crystal
Lasagna.new.remaining_minutes_in_oven(30)
# => 10
```

## 3. 计算准备时间（分钟）

定义 `Lasagna#preparation_time_in_minutes` 方法，它接收你为千层面添加的层数作为形参，并返回你准备它所花的分钟数，假设每层需要 2 分钟来准备。

```Crystal
Lasagna.new.preparation_time_in_minutes(2)
# => 4
```

## 4. 计算总工作时间（分钟）

定义 `Lasagna#total_time_in_minutes` 方法，它接收两个具名形参：`number_of_layers` 形参是你为千层面添加的层数，`actual_minutes_in_oven` 形参是千层面已经在烤箱中烤制的分钟数。
该方法应返回你制作千层面所花费的总分钟数，也就是准备时间（分钟）与千层面此刻已经在烤箱中度过的时间之和。

```Crystal
number_of_layers = 3
actual_minutes_in_oven = 20
Lasagna.new.total_time_in_minutes(number_of_layers, actual_minutes_in_oven)
# => 26
```

## Source

### Created by

- @meatball133

### Contributed to by

- @ErikSchierboom
- @angelikatyborska