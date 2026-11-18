# 千层面

欢迎来到 Exercism Ruby 轨道中的 千层面。
如果你在运行测试或提交代码时需要帮助，请查看`HELP.md`。
如果你在练习中卡住了，请查看`HINTS.md`，不过先试着自己解决，不要急着看提示 :)

## Introduction

这个练习将带你学习 Ruby 的基本构建块。
它涵盖的内容很多，但如果你觉得有些应接不暇，也不用担心，随着我们继续走完这条学习路径，我们会更深入地讲解每一个知识点。

理解 Ruby 的关键之一在于它是一种 [面向对象语言][object-oriented-programming]，并且**Ruby 中的一切都是[对象][object]**。数字、字符串、数组，它们全都是对象。

## 变量和常量

我们通常通过给对象起名字来使用它们，要么用变量，要么用常量。

变量一律采用[蛇形命名法][snake-case]。
一个变量在其生命周期内可以引用不同的对象。
例如，`my_first_variable`可以用`=`运算符定义，并多次重新定义：

```ruby
my_first_variable = 1
my_first_variable = "Some string"
my_first_variable = SomeComplexObject.new
```

而常量则只应赋值一次。
常量必须以大写字母开头，通常写成全大写形式，单词之间用下划线分隔。
例如：

```ruby
MY_FIRST_CONSTANT = 10

# Redefining not allowed
# MY_FIRST_CONSTANT = "Some String"
```

## 类

Ruby 通过类来组织代码。
类使用`class`关键字定义，后面跟上类的名字。
对象通常通过用`.new`方法实例化类来创建。
例如：

```ruby
# Define the class
class Calculator
  #...
end

# Create an instance of it and assign it to a variable
my_first_calc = Calculator.new
```

## 方法

功能单元被封装在方法中，类似于其他语言中的_函数_。

方法可以定义为带位置实参、带关键字实参（用`:`语法定义和调用），或者完全没有实参。

方法要么隐式返回最后一条被求值的语句的结果，要么可以通过`return`关键字显式返回一个对象。

```ruby
class Calculator

  # Positional arguments
  def add(num1, num2)
    return num1 + num2 # Explicit return
  end

  # Keyword arguments
  def multiply(num1:, num2:)
    num1 * num2 # Implicit return
  end
end
```

方法使用`.`语法调用：

```ruby
calc = Calculator.new
calc.add(1, 3)
calc.multiply(num1: 2, num2: 5)
```

[object-oriented-programming]: https://ruby-doc.org/docs/ruby-doc-bundle/UsersGuide/rg/oothinking.html
[object]: https://github.com/exercism/v3/blob/main/reference/concepts/objects.md
[snake-case]: https://en.wikipedia.org/wiki/Snake_case

## Instructions

在这个练习中，你要编写一些代码，帮助你按照最喜欢的烹饪书做出一份美味的千层面。

一共有四个任务，全都与烹饪千层面所花的时间有关。

## 1. 定义预计的烤箱时间（分钟）

定义常量 `Lasagna::EXPECTED_MINUTES_IN_OVEN`，它返回千层面应该在烤箱中烤多少分钟。根据烹饪书，预计的烤箱时间是 40 分钟：

```ruby
Lasagna::EXPECTED_MINUTES_IN_OVEN
# => 40
```

## 2. 计算剩余的烤箱时间（分钟）

定义 `Lasagna#remaining_minutes_in_oven` 方法，它接收千层面已经在烤箱中烤过的实际分钟数作为形参，并根据上一个任务中预计的烤箱时间，返回千层面还需要在烤箱中烤多少分钟。

```ruby
lasagna = Lasagna.new
lasagna.remaining_minutes_in_oven(30)
# => 10
```

## 3. 计算准备时间（分钟）

定义 `Lasagna#preparation_time_in_minutes` 方法，它接收你往千层面里加的层数作为形参，并返回你准备千层面花了多少分钟，假设准备每一层需要 2 分钟。

```ruby
lasagna = Lasagna.new
lasagna.preparation_time_in_minutes(2)
# => 4
```

## 4. 计算总工作时间（分钟）

定义 `Lasagna#total_time_in_minutes` 方法，它接收两个具名形参：`number_of_layers` 形参是你往千层面里加的层数，`actual_minutes_in_oven` 形参是千层面已经在烤箱中烤过的分钟数。该函数应返回你烹饪千层面总共工作了多少分钟，也就是准备时间的分钟数与千层面此刻已在烤箱中烤过的分钟数之和。

```ruby
lasagna = Lasagna.new
lasagna.total_time_in_minutes(number_of_layers: 3, actual_minutes_in_oven: 20)
# => 26
```

## Source

### Created by

- @iHiD
- @pvcarrera