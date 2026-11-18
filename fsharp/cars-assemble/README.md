# 汽车，组装！

欢迎来到 Exercism F# 轨道中的 汽车，组装！。
如果你在运行测试或提交代码时需要帮助，请查看`HELP.md`。
如果你在练习中卡住了，请查看`HINTS.md`，不过先试着自己解决，不要急着看提示 :)

## Introduction

## 数字

F# 中有两种不同类型的数字：

- 整数：小数点后没有数字的数（即整数）。例如`-6`、`0`、`1`、`25`、`976`和`500000`。
- 浮点数：小数点后可以带零个或多个数字的数。例如`-2.4`、`0.1`、`3.14`、`16.984025`和`1024.0`。

F# 中最常见的两种数值类型是`int`和`float`。`int`是 32 位整数，`float`是 64 位浮点数。

算术运算使用标准的算术运算符。数字可以使用标准的数值比较运算符，以及相等（`=`）和不等（`<>`）运算符来比较。

在不同数值类型之间转换，要通过内置的转换运算符来完成。这些转换运算符以它们将要转换到的类型命名。F# *不*支持数值类型之间的自动转换。

## 条件分支

在 F# 中，要根据条件执行代码，最常见的方式是使用`if/elif/else`表达式：

```fsharp
if x = 5 then
    printfn "Expression to evaluate when x equals 5"
elif x > 7 then
    printfn "Expression to evaluate when x greater than 7"
else
    printfn "Expression to evaluate in all other cases"
```

`if/elif/else`表达式中使用的条件必须是`bool`类型。F# 中没有*真值*这个概念。

## Instructions

在这个练习中，你将编写代码来分析汽车工厂里一条装配线的生产情况。装配线的速度可以从 `0`（关闭）到 `10`（最高）。

在最低速度（`1`）下，每小时生产 `221` 辆汽车。产量随速度线性增长。因此当速度设为 `4` 时，每小时应生产 `4 * 221 = 884` 辆汽车。不过，速度越高，生产出有缺陷汽车的可能性就越大，这些汽车随后必须被丢弃。下表展示了速度如何影响成功率：

- `0`：成功率 0%。
- `1`到`4`：成功率 100%。
- `5`到`8`：成功率 90%。
- `9`：成功率 80%。
- `10`：成功率 77%。

你有三个任务。

## 1. 计算成功率

实现 `successRate` 函数，根据生产速度计算成功率：

```fsharp
successRate 6
// => 0.9
```

## 2. 计算每小时生产率

实现 `productionRatePerHour` 函数，计算装配线每小时的生产率，并考虑其成功率：

```fsharp
productionRatePerHour 6
// => 1193.4
```

注意，返回的值是 `float`。

## 3. 计算每分钟生产的可用汽车数量

实现 `workingItemsPerMinute` 函数，计算每分钟生产多少辆可用汽车：

```fsharp
workingItemsPerMinute 6
// => 19
```

注意，返回的值是 `int`。

## Source

### Created by

- @ErikSchierboom

### Contributed to by

- @Grenkin1988