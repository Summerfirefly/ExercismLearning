# 游乐园

欢迎来到 Exercism Ruby 轨道中的 游乐园。
如果你在运行测试或提交代码时需要帮助，请查看`HELP.md`。
如果你在练习中卡住了，请查看`HINTS.md`，不过先试着自己解决，不要急着看提示 :)

## Introduction

## 实例变量

对象可以通过设置_实例变量_来保存自己的状态。
这些变量存在于对象内部，通常用来存储一些内部状态。

实例变量总是以`@`开头。
只要设置一个以`@`开头的变量，就能创建一个新的实例变量。
例如：

```ruby
class Repeater
  def hear(something)
    # Save what's been heard into a new instance variable called @heard
    @heard = something
  end

  def repeat
    # Return the value of the instance variable
    @heard
  end
end

repeater = Repeater.new
repeater.hear("Hello, friend!")
print repeater.repeat # Prints "Hello, friend!"
```

对象通常会在`initialize`方法里设置自己的初始状态，当对类调用`new`时，这个方法会被自动调用。

```ruby
class Airplane
  def initialize
    @wings = 2
  end

  def wings
    @wings
  end
end

plane = Airplane.new
plane.wings # returns 2
```

`initialize`方法也可以接收实参，这样每个实例都能以自定义的状态开始：

```ruby
class Suitcase
  def initialize(locked)
    @locked = locked
  end
end
```

良好的做法是把_实例_变量看作对外部读写私有。
我们改为定义方法来获取和设置它们的值。
例如：

```ruby
class Suitcase
  def initialize
    @locked = false
  end

  def locked? # Query methods should be named with a trailing `?`
    @locked
  end

  def lock! # Methods which mutate state should have trailing `!`
    @locked = true
  end
end

suitcase = Suitcase.new
suitcase.locked? # false
suitcase.lock!
suitcase.locked? # true
```

## Nil

[Nil][nil-dictionary] 是一个英语单词，意思是“无”或“零”。
在 Ruby 中，`nil`用来表示一个对象_不存在_。
在其他编程语言里，`null`或`none`值也可能起到类似的作用。

```ruby
# I do not have a favorite color
favorite_color = nil
```

任何实例变量在第一次出现时，Ruby 都会赋予它默认值`nil`，直到它被赋予其他值为止。

```ruby
print @favourite_color # prints nil
@favourite_color = "blue"
print @favourite_color # prints "blue"
```

[nil-dictionary]: https://www.merriam-webster.com/dictionary/nil

## Instructions

你在一家游乐园工作，有人交给你一份需求说明，要你设计一套系统来管理游客入园和游乐项目。你的任务是为 Attendee（来游乐园游玩的人）建模。

## 1. 创建新的游客

实现`Attendee`类的`Attendee#initialize`方法，它应接收一个身高值（以厘米为单位），并将其存为实例变量。

```ruby
Attendee.new(106)
# => #<Attendee:0x000055c33e6c7e18 @height=106>
```

## 2. 这位游客有多高

实现`Attendee`类的`Attendee#height` getter，它应返回该实例的身高。

```ruby
Attendee.new(106).height
# => 106
```

## 3. 通行证 id 是什么

并非所有游客都购买了通行证，但我们需要知道他们有没有通行证。实现`Attendee`类的`Attendee#pass_id` getter，它应返回该实例的 pass_id；如果这位游客没有通行证，则返回`nil`。

```ruby
Attendee.new(106).pass_id
# => nil
```

## 4. 允许游客购买通行证

实现`Attendee#issue_pass!`，以修改实例的状态，并把 pass id 实例变量设为传入的实参。它应返回 pass id。

```ruby
attendee = Attendee.new(106)
attendee.issue_pass!(42)
attendee.pass_id
# => 42
```

## 5. 吊销通行证

有些游客会做出不安全的行为，违反规定，所以游乐园希望能吊销通行证。实现`Attendee#revoke_pass!`，以修改实例的状态，并把 pass id 设为`nil`。

```ruby
attendee = Attendee.new(106)
attendee.issue_pass!(42)
attendee.revoke_pass!
attendee.pass_id
# => nil
```

## Source

### Created by

- @neenjaw
- @iHiD

### Contributed to by

- @kotp