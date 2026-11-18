# 游乐园改进

欢迎来到 Exercism Ruby 轨道中的 游乐园改进。
如果你在运行测试或提交代码时需要帮助，请查看`HELP.md`。
如果你在练习中卡住了，请查看`HINTS.md`，不过先试着自己解决，不要急着看提示 :)

## Introduction

## 真与假

在 Ruby 中，真与假这两种逻辑状态分别用 `true` 和 `false` 表示。

```ruby
happy = true
sad = false
```

## 相等与比较

Ruby 允许你使用常见的比较符号来相互比较对象：
- 使用 `==` 判断两个对象是否相等
- 使用 `>` 判断左边的对象是否**大于**右边的对象
- 使用 `<` 判断左边的对象是否**小于**右边的对象。
- 使用 `>=` 或 `<=` 分别判断“大于或等于”和“小于或等于”。

你还可以使用常规运算符进行布尔逻辑运算：
- 使用 `&&` 或 `and` 检查 `x and y` 是否为 true
- 使用 `||` 或 `or` 检查 `x or y` 是否为 true。
- 使用 `!` 或 `not` 反转相等性，例如 `x != y`（x 不等于 y）

以下是一些示例：
```ruby
# Is "true equal to false"? 
true == false # false

# Is "true not equal to false"
true != false # true

# Is 5 greater than 4?
5 > 4 # true

# Is 3 less than or equal to 2?
3 <= 2 # false
```

[nil-dictionary]: https://www.merriam-webster.com/dictionary/nil

## Instructions

继续你在游乐园的工作，这次你的任务是编写一些工具方法，用来检查游客能否乘坐某个游乐设施。

## 1. 检查游客是否持有游乐设施通行证

实现 `Attendee#has_pass?` 方法，根据是否持有游乐设施通行证，返回一个布尔值（`true`/`false`）。

```ruby
Attendee.new(100).has_pass?
# => false
```

## 2. 检查游客是否符合乘坐游乐设施的条件

实现 `Attendee#fits_ride?` 方法，根据身高判断游客能否乘坐某个游乐设施。
游乐设施要求的最低身高会作为实参传入。
游客的身高必须大于或等于游乐设施要求的最低身高。

```ruby
Attendee.new(140).fits_ride?(100)
# => true
```

## 3. 检查游客是否可以乘坐游乐设施

实现 `Attendee#allowed_to_ride?` 方法，判断游客是否可以乘坐某个游乐设施。游乐设施要求的最低身高会作为实参传入。游客必须持有游乐设施通行证，并且符合乘坐的身高要求。

```ruby
attendee = Attendee.new(100)
attendee.issue_pass!(42)
attendee.allowed_to_ride?(120)
# => false
```

## Source

### Created by

- @neenjaw

### Contributed to by

- @kotp
- @iHiD
- @kayn1