# 图书馆费用

欢迎来到 Exercism Elixir 轨道中的 图书馆费用。
如果你在运行测试或提交代码时需要帮助，请查看`HELP.md`。
如果你在练习中卡住了，请查看`HINTS.md`，不过先试着自己解决，不要急着看提示 :)

## Introduction

## 日期和时间

Elixir 的标准库提供了 4 个处理日期和时间的模块，每个模块都有自己的结构体。

- `Date`模块。使用`~D`符号可以创建`Date`结构体。

  ```elixir
  ~D[2021-01-01]
  ```

- `Time`模块。使用`~T`符号可以创建`Time`结构体。

  ```elixir
  ~T[12:00:00]
  ```

- `NaiveDateTime`模块，用于不带时区的日期时间。使用`~N`符号可以创建`NaiveDateTime`结构体。

  ```elixir
  ~N[2021-01-01 12:00:00]
  ```

- `DateTime`模块，用于带时区的日期时间。要用它处理 UTC 以外的时区，就需要一个外部依赖，也就是时区数据库。

### 比较

要比较两个日期或时间，可以在对应的模块里找`compare`或`diff`函数。像`==`、`>`、`<`这样的比较运算符_看上去_能用，但对于这些结构体，它们并不能给出正确的语义比较结果。

## Instructions

你有一位在图书馆工作的朋友，她请你扩展图书馆的软件，让它能自动计算逾期费用。
她当前的系统把图书借出时的确切日期和时间保存为 [ISO8601](https://en.wikipedia.org/wiki/ISO_8601) 日期时间字符串。
她在加纳一个小镇上经营一家当地图书馆，那里使用 GMT 时区（UTC +0），不使用夏令时，也不用考虑其他时区。

## 1. 解析存储的日期时间

实现 `LibraryFees.datetime_from_string/1` 函数。它接收一个 ISO8601 日期时间字符串作为实参，返回一个 `NaiveDateTime` 结构体。

```elixir
LibraryFees.datetime_from_string("2021-01-01T13:30:45Z")
# => ~N[2021-01-01 13:30:45]
```

## 2. 判断图书是否在中午之前借出

如果图书在中午之前借出，读者有 28 天时间归还。如果在中午或之后借出，则是 29 天。

实现 `LibraryFees.before_noon?/1` 函数。它接收一个 `NaiveDateTime` 结构体，返回一个布尔值。

```elixir
LibraryFees.before_noon?(~N[2021-01-12 08:23:03])
# => true
```

## 3. 计算归还日期

根据借出的日期时间，计算归还日期。

实现 `LibraryFees.return_date/1` 函数。它接收一个 `NaiveDateTime` 结构体，返回一个 `Date` 结构体，即 28 天或 29 天之后的日期。

```elixir
LibraryFees.return_date(~N[2020-11-28 15:55:33])
# => ~D[2020-12-27]
```

## 4. 判断图书逾期了多久

图书馆对逾期归还收取固定费用。要计算费用，我们需要知道图书实际归还时比应还日期晚了多少天。

实现 `LibraryFees.days_late/2` 函数。它接收两个实参：一个 `Date` 结构体，也就是计划归还日期；以及一个 `NaiveDateTime` 结构体，也就是实际归还的日期时间。

如果实际归还日期早于或等于计划归还日期，函数应返回 0。否则，函数应返回这两个日期相差的天数。

图书馆出于统计目的会记录图书实际归还的日期和时间，但在计算逾期费用时并不使用时间。

```elixir
LibraryFees.days_late(~D[2020-12-27], ~N[2021-01-03 09:23:36])
# => 7
```

## 5. 判断图书是否在周一归还

图书馆对在周一归还图书提供特别优惠。

实现 `LibraryFees.monday?/1` 函数。它接收一个 `NaiveDateTime` 结构体，返回一个布尔值。

```elixir
LibraryFees.monday?(~N[2021-01-03 13:30:45Z])
# => false
```

## 6. 计算逾期费用

实现 `LibraryFees.calculate_late_fee/3` 函数。它接收三个实参：两个 ISO8601 日期时间字符串，即借出日期时间和实际归还日期时间；以及一天的逾期费用。它应根据图书实际归还是逾期了多久，返回总的逾期费用。

要包含周一的特别优惠。如果你在周一归还图书，逾期费用打五折，向下取整。

```elixir
# Sunday, 7 days late
LibraryFees.calculate_late_fee("2020-11-28T15:55:33Z", "2021-01-03T13:30:45Z", 100)
# => 700

# one day later, Monday, 8 days late
LibraryFees.calculate_late_fee("2020-11-28T15:55:33Z", "2021-01-04T09:02:11Z", 100)
# => 400
```

## Source

### Created by

- @angelikatyborska

### Contributed to by

- @neenjaw