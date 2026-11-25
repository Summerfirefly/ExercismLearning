# 储蓄账户

欢迎来到 Exercism Ruby 轨道中的 储蓄账户。
如果你在运行测试或提交代码时需要帮助，请查看`HELP.md`。
如果你在练习中卡住了，请查看`HINTS.md`，不过先试着自己解决，不要急着看提示 :)

## Introduction

## 模块

到目前为止，你见过的所有练习都用到了类。有时我们并不需要创建带状态对象的那份开销，于是改用`module`。

模块和类非常相似（事实上，在对象层级中，`Module`是`Class`的父级），主要区别在于：我们用的不是实例方法，而是类方法。类方法以`self.`开头，可以直接在模块上调用。

例如：

```ruby
module Speaker
  def self.echo(something)
    "#{something} ... #{something}"
  end
end

Speaker.echo("Hello")   #=> "Hello ... Hello"
```

## 循环

在 Ruby 中写循环有好几种方式，不过一般来说，我们更常使用枚举而不是循环，所以最常见的循环大概就是`while`循环：

```ruby
counter = 0

while counter < 5
  counter += 1
end
```

你也可以使用与之对应的`until`

```ruby
counter = 0

until counter == 5
  counter += 1
end
```

## Instructions

在本练习中，你将处理储蓄账户。每年，储蓄账户的余额都会根据利率更新。银行给出的利率取决于账户中的金额（即其余额）：

- 余额为非负数且小于`1000`美元时，利率为 0.5%。
- 余额为正数，且大于或等于`1000`美元、小于`5000`美元时，利率为 1.621%。
- 余额为正数且大于或等于`5000`美元时，利率为 2.475%。
- 余额为负数时，利率为 3.213%（会产生负利息）。

你有三个任务，每个任务都会涉及余额及其利率。

## 1. 计算利率

实现 `SavingsAccount.interest_rate` 方法，根据给定的余额计算利率：

```ruby
SavingsAccount.interest_rate(200.75)
#=> 0.5
```

注意，返回值是 `Float` 的实例。

## 2. 计算年度余额更新

实现 `SavingsAccount.annual_balance_update` 方法，在考虑利率的情况下计算年度余额更新：

```ruby
SavingsAccount.annual_balance_update(200.75)
#=> 201.75375
```

注意，返回值是 `Float` 的实例。

## 3. 计算达到目标余额所需的年数

实现 `SavingsAccount.years_before_desired_balance` 方法，计算达到目标余额所需的最少年数：

```ruby
SavingsAccount.years_before_desired_balance(200.75, 214.88)
#=> 14
```

注意，返回值是 `Integer` 的实例。

## Source

### Created by

- @TBD

### Contributed to by

- @dvik1950