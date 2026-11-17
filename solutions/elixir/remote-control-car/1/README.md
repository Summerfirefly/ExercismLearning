# 遥控车

欢迎来到 Exercism Elixir 轨道中的 遥控车。
如果你在运行测试或提交代码时需要帮助，请查看`HELP.md`。
如果你在练习中卡住了，请查看`HINTS.md`，不过先试着自己解决，不要急着看提示 :)

## Introduction

## 结构体

结构体是建立在[映射][exercism-maps]之上的扩展，提供编译时检查和默认值。结构体以定义它的模块命名。要定义结构体，可以使用`defstruct`构造。这个构造通常紧接着模块定义出现。`defstruct`接受原子列表（用于`nil`默认值）或关键字列表（用于指定的默认值）。没有默认值的字段必须排在带默认值的字段前面。

```elixir
defmodule Plane do
  defstruct [:engine, wings: 2]
end

plane = %Plane{}
# => %Plane{engine: nil, wings: 2}
```

### 访问字段与更新

由于结构体建立在映射之上，我们可以使用大多数映射函数来获取和操作值。结构体**没有**实现 _Access Behaviour_。建议改用_静态访问运算符_`.`来访问结构体字段。

- 获取/读取字段值：

  ```elixir
  plane = %Plane{}
  plane.engine
  # => nil
  Map.fetch(plane, :wings)
  # => {:ok, 2}
  ```

- 更新字段值：

  ```elixir
  plane = %Plane{}
  %{plane | wings: 4}
  # => %Plane{engine: nil, wings: 4}
  ```

### 模式匹配

结构体可以在模式匹配中使用，无论是否带结构体名。

```elixir
plane = %Plane{}
%Plane{wings: wings} = plane
%{wings: wings} = plane
```

在模式中包含结构体名，可以确保左右两边都是同一类型的结构体。

```elixir
defmodule Helicopter do
  defstruct [:engine, rotors: 1]
end

%Plane{} = %Helicopter{}
# => (MatchError) no match of right hand side value: %Helicopter{engine: nil, rotors: 1}
```

### 强制初始化字段值

我们可以使用`@enforce_keys`模块属性，配合字段键列表，来确保创建结构体时这些值已初始化。如果某个键没有列出，其值将是`nil`，如上面的例子所示。如果强制要求的键没有初始化，就会抛出错误。

```elixir
defmodule User do
  @enforce_keys [:username]
  defstruct [:username]
end

%User{}
# => (ArgumentError) the following keys must also be given when building struct User: [:username]
```

[exercism-maps]: https://exercism.org/tracks/elixir/concepts/maps

## Instructions

在这个练习中，你将摆弄一辆遥控汽车，你终于攒够了钱把它买了下来。

汽车出厂时电池是满电的（100%）。每次你用遥控器操控汽车行驶，它都会前进 20 米，并消耗 1% 的电量。汽车的昵称要到创建之后才能知道。

这辆遥控汽车有一块炫酷的 LED 显示屏，会显示两项信息：

- 它行驶过的总距离，显示为：`"<METERS> meters"`。
- 剩余的电量，显示为：`"Battery at <PERCENTAGE>%"`。

如果电量为 0%，你就无法再驱动汽车，电量显示会显示 `"Battery empty"`。

## 1. 创建一辆全新的遥控汽车

实现 `RemoteControlCar.new/0` 函数，返回一辆全新的遥控汽车结构体：

```elixir
RemoteControlCar.new()
# => %RemoteControlCar{
#      battery_percentage: 100,
#      distance_driven_in_meters: 0,
#      nickname: "none"
#    }
```

昵称是结构体必需的字段，请确保在 `new` 函数中为它初始化一个值，而不是在结构体中。

## 2. 创建一辆带昵称的全新遥控汽车

实现 `RemoteControlCar.new/1` 函数，返回一辆带有所提供昵称的全新遥控汽车结构体：

```elixir
RemoteControlCar.new("Blue")
# => %RemoteControlCar{
#      battery_percentage: 100,
#      distance_driven_in_meters: 0,
#      nickname: "Blue"
#    }
```

## 3. 显示距离

实现 `RemoteControlCar.display_distance/1` 函数，返回显示在 LED 显示屏上的距离：

```elixir
car = RemoteControlCar.new()
RemoteControlCar.display_distance(car)
# => "0 meters"
```

确保该函数只接受 `RemoteControlCar` 结构体作为实参。

## 4. 显示电量百分比

实现 `RemoteControlCar.display_battery/1` 函数，返回显示在 LED 显示屏上的电量百分比：

```elixir
car = RemoteControlCar.new()
RemoteControlCar.display_battery(car)
# => "Battery at 100%"
```

确保该函数只接受 `RemoteControlCar` 结构体作为实参。如果电量为 0%，电量显示会显示 “Battery empty”。

## 5. 行驶会改变电量和已行驶距离

实现 `RemoteControlCar.drive/1` 函数，它会：

- 把已行驶的米数增加 20
- 消耗 1% 的电量

```elixir
RemoteControlCar.new("Red")
|> RemoteControlCar.drive()

# => %RemoteControlCar{
#      battery_percentage: 99,
#      distance_driven_in_meters: 20,
#      nickname: "Red"
#    }
```

确保该函数只接受 `RemoteControlCar` 结构体作为实参。

## 6. 处理电量耗尽时的行驶

更新 `RemoteControlCar.drive/1` 函数，让它在电量耗尽（为 0%）时既不增加已行驶的距离，也不降低电量百分比：

```elixir
%RemoteControlCar{
  battery_percentage: 0,
  distance_driven_in_meters: 1980,
  nickname: "Red"
}
|> RemoteControlCar.drive()

# => %RemoteControlCar{
#      battery_percentage: 0,
#      distance_driven_in_meters: 1980,
#      nickname: "Red"
#    }
```

## Source

### Created by

- @neenjaw

### Contributed to by

- @angelikatyborska