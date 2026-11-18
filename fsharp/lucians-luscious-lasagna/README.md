# Lucian 的美味千层面

欢迎来到 Exercism F# 轨道中的 Lucian 的美味千层面。
如果你在运行测试或提交代码时需要帮助，请查看`HELP.md`。
如果你在练习中卡住了，请查看`HINTS.md`，不过先试着自己解决，不要急着看提示 :)

## Introduction

## 基础

在 F# 中，把一个值赋给一个名称叫做_绑定_。绑定是不可变的，因此它们和其他语言中的常量类似。由于 F# 是静态类型语言，每个绑定在编译时都有一个类型。

绑定使用`let`关键字定义。对大多数绑定来说，指定绑定的类型是可选的，因为 F# 的_类型推断_通常可以根据绑定的值推断出类型。一个绑定看起来像这样：

```fsharp
// Automatically inferred type
let fingers = 10
```

函数也是普通的绑定，只不过带有一个或多个参数。函数会自动返回它的最后一个表达式。类型推断对大多数函数同样适用，它会分析函数被调用时传入了哪些值，以及函数返回什么值。

```fsharp
// Automatically inferred types for parameters and return type
let add x y = x + y
```

调用函数的方法是写出函数名，并为函数的每个形参传入实参。

```fsharp
let five = add 2 3
```

如果无法推断出某个绑定的类型，编译器就会报错。要解决这个问题，就给该绑定加上显式的类型标注。

```fsharp
// Explicit type annotation
let fingers: int = 10

// Explicit type annotation (also for parameters)
let add (x: int) (y: int): int = x + y
```

F# 中的绑定只能在定义_之后_使用。在绑定被定义之前使用它，会导致编译错误。

```fsharp
// Compile error as the add binding has not yet been defined
// let seven = add 3 4

let add x y = x + y
```

F# 依靠有意义的空白来定义作用域。也就是说，作用域是通过用空格缩进代码来定义的，缩进相对于声明绑定的那一行。默认约定是使用 4 个空格进行缩进：

```fsharp
let toes =
    let left = 5
    let right = 5
    left + right

let multiplyPlusTwo x y =
    let product = x * y
    product + 2

// Trying to access the left, right or product bindings
// here would result in a compile error
```

F# 的绑定（其中也包括函数）通常组织在模块里。模块把相关的功能归为一组，用`module`关键字定义。模块定义必须写在它的绑定之前：

```fsharp
module Calculator

let pi = 3.14

let add x y = x + y
```

F# 支持两种注释。单行注释以`//`开头，多行注释则写在`(*`和`*)`之间。

## Instructions

在这个练习中，你将编写一些代码，帮助你按照最喜欢的烹饪书做出一份美味的千层面。

你有 4 个任务，它们都与烹饪千层面所花的时间有关。

~~~~exercism/note
你既可以使用类型推断，不指定任何类型；也可以使用显式类型，明确写出类型。
如果你选择后者，请使用`int`作为类型。
~~~~

## 1. 定义预期的烤箱时间（分钟）

定义`expectedMinutesInOven`绑定，用来查看千层面应该在烤箱里待多少分钟。根据烹饪书，预期的烤箱时间是 40 分钟：

```fsharp
expectedMinutesInOven
// => 40
```

## 2. 计算烤箱内剩余的分钟数

定义`remainingMinutesInOven`函数，它接受千层面在烤箱中已经待的实际分钟数作为形参，并根据上一个任务中预期的烤箱时间（分钟），返回千层面还需要在烤箱中待多少分钟。

```fsharp
remainingMinutesInOven 30
// => 10
```

## 3. 计算准备时间（分钟）

定义`preparationTimeInMinutes`函数，它接受你加到千层面中的层数作为形参，并返回你准备千层面花了多少分钟，假设每层需要 2 分钟准备。

```fsharp
preparationTimeInMinutes 2
// => 4
```

## 4. 计算已耗费的时间（分钟）

定义`elapsedTimeInMinutes`函数，它接受 2 个形参：第一个形参是你加到千层面中的层数，第二个形参是千层面在烤箱中已经待的分钟数。该函数应返回你烹饪千层面所花的时间，也就是准备时间的分钟数，加上千层面此刻已在烤箱中待的分钟数。

```fsharp
elapsedTimeInMinutes 3 20
// => 26
```

## Source

### Created by

- @ErikSchierboom