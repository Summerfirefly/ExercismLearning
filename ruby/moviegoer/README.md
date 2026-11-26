# 电影观众

欢迎来到 Exercism Ruby 轨道中的 电影观众。
如果你在运行测试或提交代码时需要帮助，请查看`HELP.md`。
如果你在练习中卡住了，请查看`HINTS.md`，不过先试着自己解决，不要急着看提示 :)

## Introduction

## 三元运算符

三元条件是一种编写简单 `if/else` 语句的简写方式。如果一条 `if/else` 语句只包含两个分支，一个对应条件为真的情况，一个对应条件为假的情况，就可以把它改写成三元条件。

三元条件用`?`和`:`两个符号组合来拆分一个条件：

```ruby
condition ? true_branch : false_branch
```

`?`左边的代码是条件，右边的代码包含两个可能的分支，用`:`分隔。如果条件为_真_，就执行`:`_左_边的代码。如果条件为_假_，就执行`:`_右_边的代码。

例如：

```ruby
if traffic_light == 'green'
  cross_the_road
else
  wait
end
```

可以改写成：

```ruby
traffic_light == 'green' ? cross_the_road : wait
```

## Instructions

在本练习中，你将为一个电影院的网站制定规则。

## 1. 检查观影者是否有资格享受老年人折扣

电影院为“养老金”提供折扣。
60 岁及以上的人购票支付 10.00。
较年轻的人则支付全价 15.00。

使用三元运算符编写`Moviegoer#ticket_price`方法。

```ruby
Moviegoer.new(21).ticket_price
#=> 15

Moviegoer.new(65).ticket_price
#=> 10
```

## 2. 检查观影者是否可以观看恐怖片

电影院采用简化的年龄验证系统。
如果你年满 18 岁，就可以观看恐怖片。
如果未满 18 岁，则不能观看。

实现`Moviegoer#watch_scary_movie?`方法。
它应返回某人是否被允许观看该电影。

```ruby
Moviegoer.new(21).watch_scary_movie?
#=> true

Moviegoer.new(17).watch_scary_movie?
#=> false
```

## 3. 检查观影者是否有资格获得免费爆米花

电影院有一个电影俱乐部项目。
会员观看任何电影都能获得免费爆米花。

实现`Moviegoer.claim_free_popcorn!`方法。
如果观影者是电影俱乐部会员，就应获得免费爆米花。
如果不是，该方法应抛出代码顶部定义的`UnsupportedOperation`异常。

```ruby
Moviegoer.new(21, member: true).claim_free_popcorn!
#=> 🍿

Moviegoer.new(17, member: false).claim_free_popcorn!
#=> Exception was raised! (NotMovieClubMemberError)
```

~~~~exercism/note
在本练习中，你需要为特定作用域定义`UnsupportedOperation`异常。
~~~~

## Source

### Created by

- @lxmrc
- @iHiD