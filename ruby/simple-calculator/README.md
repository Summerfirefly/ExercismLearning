# 简单计算器

欢迎来到 Exercism Ruby 轨道中的 简单计算器。
如果你在运行测试或提交代码时需要帮助，请查看`HELP.md`。
如果你在练习中卡住了，请查看`HINTS.md`，不过先试着自己解决，不要急着看提示 :)

## Introduction

与其他许多语言一样，Ruby 中的异常提供了一种处理意外事件的方式。想要防止程序崩溃，妥善处理异常就非常重要。

当异常被抛出时，无论是显式抛出的，还是由 Ruby 翻译抛出的，程序都会中断正常运行，并最终带着错误信息退出：

```ruby
raise ArgumentError.new("Something went wrong!")
=> Traceback (most recent call last):
.
.
ArgumentError (Something went wrong!)
```

```ruby
1/0
=> Traceback (most recent call last):
.
.
ZeroDivisionError (divided by 0)
```

如果我们想阻止这个关闭过程，就需要对异常做出反应。这被称为“捕获”异常：

```ruby
begin
  # ...any code that raises an exception
rescue
  puts 'Got an exception'
end
```

这个程序不会崩溃，并且会输出“Got an exception”。Ruby 不会退出，而是运行 rescue 块中的代码，打印出一条消息。

与 Ruby 中的一切事物一样，异常也是对象，而且通常会保存有关该异常的数据。我们可以这样获取异常对象：

```ruby
begin
  # ...any code that raises an exception
rescue => e
  puts "Exception class: #{ e.class.name }"
  puts "Exception Message:#{e.message}"
end
```

在 Ruby 中，你也可以抛出自己的异常。例如：

```ruby
begin
  raise ArgumentError.new("Invalid argument")
rescue ArgumentError => e
  puts e.message
end
```

前面那个异常是 Ruby 内置的异常之一，不过你也可以定义自定义异常并抛出它们：

```ruby
class CustomError < StandardError
end

raise CustomError.new("Something went wrong")
```

## Instructions

在这个练习中，你将为一个小型计算器构建错误处理。

目标是让计算器能够正常工作：在接收实参`16`、`51`和`+`时，返回一个符合以下模式的字符串：`16 + 51 = 67`。

```ruby
SimpleCalculator.calculate(16, 51, "+")
# => "16 + 51 = 67"
SimpleCalculator.calculate(32, 6, "*")
# => "32 * 6 = 192"
SimpleCalculator.calculate(512, 4, "/")
# => "512 / 4 = 128"
```

## 1. 处理方法`calculate`中可能引发错误的代码

本任务要实现的主要方法是类方法`SimpleCalculator.calculate()`。
它接收三个实参。
前两个实参是要进行运算的数字。
第三个实参的类型是字符串，在这个练习中，你需要实现以下运算：

- 使用`+`字符串的加法
- 使用`*`字符串的乘法
- 使用`/`字符串的除法

## 2. 处理非法运算

修改`SimpleCalculator.calculate()`方法，使其在遇到未知的运算符号时抛出`UnsupportedOperation`异常。

```ruby
SimpleCalculator.calculate(1, 2, '-')
# => Raises an UnsupportedOperation
```

~~~~exercism/note
在这个练习中，你需要在特定的作用域内定义`UnsupportedOperation`异常。
~~~~

## 3. 处理无效实参

修改`SimpleCalculator.calculate()`方法，使其在实参类型无效时抛出`ArgumentError`异常。

```ruby
SimpleCalculator.calculate(1, '2', '*')
# => Raises an ArgumentError
```

## 4. 处理 DivideByZero 异常

修改`SimpleCalculator.calculate()`，使其能够处理`ZeroDivisionError`异常。
处理代码应返回内容为`Division by zero is not allowed.`的字符串。
其他任何异常都不应由`SimpleCalculator.calculate()`方法处理。

```ruby
SimpleCalculator.calculate(512, 0, "/")
# => returns "Division by zero is not allowed."
```

## Source

### Created by

- @pvcarrera