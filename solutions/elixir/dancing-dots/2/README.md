# 舞动的点

欢迎来到 Exercism Elixir 轨道中的 舞动的点。
如果你在运行测试或提交代码时需要帮助，请查看`HELP.md`。
如果你在练习中卡住了，请查看`HINTS.md`，不过先试着自己解决，不要急着看提示 :)

## Introduction

## 使用

`use`宏允许我们快速用另一个模块提供的功能来扩展自己的模块。当我们`use`一个模块时，那个模块可以向我们的模块中注入代码，例如它可以定义函数、`import`或`alias`其他模块，或者设置模块属性。

如果你曾经看过 Exercism 上某些 Elixir 练习的测试文件，很可能注意到它们都以`use ExUnit.Case`开头。正是这一行代码让`test`和`assert`宏在测试模块中可用。

```elixir
defmodule LasagnaTest do
  use ExUnit.Case

  test "expected minutes in oven" do
    assert Lasagna.expected_minutes_in_oven() === 40
  end
end
```

### `__using__/1`宏

当你`use`一个模块时，究竟会发生什么，取决于该模块的`__using__/1`宏。它接收一个实参，即一个带选项的关键字列表，并返回一个[引用表达式][concept-ast]。调用`use`时，这个引用表达式中的代码会被插入到我们的模块中。

```elixir
defmodule ExUnit.Case do
  defmacro __using__(opts) do
    # some real-life ExUnit code omitted here
    quote do
      import ExUnit.Assertions
      import ExUnit.Case, only: [describe: 2, test: 1, test: 2, test: 3]
    end
  end
end
```

选项可以在调用`use`时作为第二个实参传入，例如`use ExUnit.Case, async: true`。如果没有显式给出，它们默认为空列表。

## 行为

行为允许我们在一个_行为模块_中定义接口（函数和宏的集合），之后可以由不同的_回调模块_来实现。得益于共享的接口，这些回调模块可以互换使用。

~~~~exercism/note
注意 “behaviours” 是英式拼写。
~~~~

### 定义行为

要定义一个行为，我们需要创建一个新模块，并指定该接口所包含的函数列表。每个函数都需要使用`@callback`模块属性来定义。语法与[函数类型规格][concept-typespecs]（`@spec`）完全相同。我们需要指定函数名、实参类型列表以及所有可能的返回类型。

```elixir
defmodule Countable do
  @callback count(collection :: any) :: pos_integer
end
```

### 实现行为

要为一个模块添加已有的行为（创建一个回调模块），我们使用`@behaviour`模块属性。它的值应该是我们要添加的行为模块名。

然后，我们需要定义该行为模块要求的所有函数（回调）。如果要实现别人的行为，比如 Elixir 内置的`Access`或`GenServer`行为，就可以在 [hexdocs.pm][hexdocs] 上的文档中找到该行为的全部回调列表。

回调模块并不局限于只实现其行为所包含的函数。单个模块也可以实现多个行为。

为了标明某个函数来自哪个行为，我们应该在每个函数前使用`@impl`模块属性。它的值应该是定义该回调的行为模块名。

```elixir
defmodule BookCollection do
  @behaviour Countable

  defstruct [:list, :owner]

  @impl Countable
  def count(collection) do
    Enum.count(collection.list)
  end

  def mark_as_read(collection, book) do
    # other function unrelated to the Countable behaviour
  end
end
```

### 默认回调实现

在定义行为时，可以为一个回调提供默认实现。这个实现应该定义在`__using__/1`宏的引用表达式中。为了让行为模块的使用者能够覆盖默认实现，请在函数实现之后调用`defoverridable/1`宏。它接收一个关键字列表，其中键是函数名，值是函数的参数个数。

```elixir
defmodule Countable do
  @callback count(collection :: any) :: pos_integer

  defmacro __using__(_) do
    quote do
      @behaviour Countable
      def count(collection), do: Enum.count(collection)
      defoverridable count: 1
    end
  end
end
```

注意，除了定义默认回调实现之外，不建议在`__using__/1`内部定义函数，但你始终可以在另一个模块中定义函数，然后在`__using__/1`宏中导入它们。

[concept-ast]: https://exercism.org/tracks/elixir/concepts/ast
[concept-typespecs]: https://exercism.org/tracks/elixir/concepts/typespecs
[hexdocs]: https://hexdocs.pm

## Instructions

你的朋友是一位有抱负的艺术家，他带着一个项目想法来找你。让我们把他的视觉创意和你的技术专长结合起来吧。是时候玩玩[生成艺术][generative-art]了！

约束有助于激发创意，也能缩短项目截止日期，所以你们俩一致同意，把你们的杰作限制在单一形状上：圆形。不过，会有很多圆形。而且它们还能四处移动！你就叫它……dancing dots。

你的朋友肯定会想为这些点设计出各种新奇复杂的运动，所以你会从搭建一套架构开始写代码，好让之后能轻松定义新的动画。

## 1. 定义动画行为

每个动画模块都需要实现两个回调：`init/1` 和 `handle_frame/3`。请在 `Animation` 模块中定义它们。

定义 `init/1` 回调。它应该接受一个类型为`opts`的实参，并返回 `{:ok, opts}` 元组或 `{:error, error}` 元组。该回调的实现会检查传入的选项对这种特定类型的动画是否有效。

定义 `handle_frame/3` 回调。它应该接受三个实参：点、帧编号和选项。它应始终返回一个点。该回调的实现会根据当前帧编号和动画的选项来修改点的属性。

## 2. 为 `init/1` 回调提供默认实现

只要调用 `use DancingDots.Animation`，就应该能轻松把 `Animation` 行为引入其他模块。

为此，请在 `Animation` 模块中实现 `__using__` 宏，让它把 `Animation` 模块设为其他模块的行为。它还应提供 `init/1` 回调的默认实现。`init/1` 的默认实现应原样返回传入的选项。

```elixir
defmodule MyCustomAnimation do
  use DancingDots.Animation
end

MyCustomAnimation.init(some_option: true)
# => {:ok, [some_option: true]}
```

## 3. 实现 `Flicker` 动画

使用 `Animation` 行为来实现一个闪烁动画。

它应使用默认的 `init/1` 回调，因为它不接受任何选项。

实现 `handle_frame/3` 回调，它负责处理单帧。如果帧编号是 4 的倍数，函数应返回一个不透明度为原来一半的点。在其他帧中，它应原样返回该点。

帧从`1`开始计数。传给`handle_frame/3`的点始终是处于初始状态的点，而不是上一帧之后的状态。

```elixir
dot = %DancingDots.Dot{x: 100, y: 100, radius: 24, opacity: 1}

DancingDots.Flicker.handle_frame(dot, 1, [])
# => %DancingDots.Dot{opacity: 1, radius: 24, x: 100, y: 100}

DancingDots.Flicker.handle_frame(dot, 4, [])
# => %DancingDots.Dot{opacity: 0.5, radius: 24, x: 100, y: 100}
```

## 4. 实现 `Zoom` 动画

使用 `Animation` 行为来实现一个缩放动画。

这个动画接受一个选项：速度。速度可以是任意数字。如果它是负数，点就会被缩小，而不是放大。

实现 `init/1` 回调。它应验证传入的选项是一个带`:velocity`键的关键字列表。速度的值必须是数字。如果它不是数字，就返回错误 `"The :velocity option is required, and its value must be a number. Got: #{inspect(velocity)}"`。

实现 `handle_frame/3` 回调。它应返回一个点，其半径增加的值等于当前帧编号减一，再乘以速度。

帧从`1`开始计数。传给`handle_frame/3`的点始终是处于初始状态的点，而不是上一帧之后的状态。

```elixir
DancingDots.Zoom.init(velocity: nil)
# => {:error, "The :velocity option is required, and its value must be a number. Got: nil"}

dot = %DancingDots.Dot{x: 100, y: 100, radius: 24, opacity: 1}

DancingDots.Zoom.handle_frame(dot, 1, velocity: 10)
# => %DancingDots.Dot{radius: 24, opacity: 1, x: 100, y: 100}

DancingDots.Zoom.handle_frame(dot, 2, velocity: 10)
# => %DancingDots.Dot{radius: 34, opacity: 1, x: 100, y: 100}
```

[generative-art]: https://en.wikipedia.org/wiki/Generative_art

## Source

### Created by

- @angelikatyborska

### Contributed to by

- @jiegillet