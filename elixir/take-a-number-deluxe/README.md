# 取号豪华版

欢迎来到 Exercism Elixir 轨道中的 取号豪华版。
如果你在运行测试或提交代码时需要帮助，请查看`HELP.md`。
如果你在练习中卡住了，请查看`HINTS.md`，不过先试着自己解决，不要急着看提示 :)

## Introduction

## GenServer

`GenServer`（通用服务器）是一种[行为][concept-behaviours]，它把 Elixir 进程之间常见的客户端与服务器交互抽象了出来。

还记得我们学习[进程][concept-processes]时讲过的接收循环吗？`GenServer`行为为编写这类循环、以及和运行这类循环的进程交换消息提供了抽象。它让保存状态和运行异步代码都变得更容易。

~~~~exercism/note
要注意，`GenServer`这个名字承载的含义有点多。它也被用来指代_使用_`GenServer`行为的_模块_，以及由_使用_`GenServer`行为的模块启动的_进程_。
~~~~

`GenServer`行为定义了一个必需的回调`init/1`，以及几个有意思的可选回调：`handle_call/3`、`handle_cast/2` 和 `handle_info/3`。使用`GenServer`的_客户端_不应该直接调用这些回调。相反，`GenServer`模块提供了一些函数，让客户端可以和`GenServer`进程通信。

通常，同一个模块既定义_客户端 API_（一组函数，供 Elixir 应用的其他部分调用，以便和这个`GenServer`进程通信），也定义_服务器回调的实现_，也就是这个`GenServer`的逻辑所在。

我们先来看一个简单的`GenServer`例子，然后再逐一了解每个回调的含义。

### 例子

下面这个示例服务器，可以在漫长的公路旅行中回应烦人乘客没完没了的追问，确切地说，是这个问题：“到了吗？”。它会记录这个问题被问了多少次，回答也越来越不耐烦。

```elixir
defmodule AnnoyingPassengerAutoresponder do
  use GenServer
  # Client API

  def start_link(init_arg) do
    GenServer.start_link(__MODULE__, init_arg)
  end

  def are_we_there_yet?(pid) do
    GenServer.call(pid, :are_we_there_yet?)
  end

  # Server callbacks

  @impl GenServer
  def init(_init_arg) do
    # the initial count of questions asked is always 0
    state = 0
    {:ok, state}
  end

  @impl GenServer
  def handle_call(:are_we_there_yet?, _from, state) do
    reply =
      cond do
        state <= 3 -> "No."
        state <= 10 -> "I told you #{state} times already. No."
        true -> "..."
      end

    # increase the count of questions asked
    new_state = state + 1
    # reply to the caller
    {:reply, reply, new_state}
  end
end
```

### 回调

#### `init/1`

可以通过调用`GenServer.start/3`或`GenServer.start_link/3`来启动服务器。我们在[链接概念][concept-links]中学过这两个函数的区别。

这两个函数：

- 接受的第一个实参是一个实现了`GenServer`行为的模块。
- 接受的第二个实参可以是任何东西，叫做`init_arg`。顾名思义，这个实参会被传给`init/1`回调。
- 接受一个可选的第三个实参，里面是运行进程用的高级选项，这里暂不涉及。

通过调用`GenServer.start/3`或`GenServer.start_link/3`启动服务器时，会以阻塞的方式调用`init/1`回调。`init/1`的返回值决定服务器能否成功启动。

`init/1`回调通常返回下面这些值之一：

- `{:ok, state}`。服务器会以`state`作为初始状态，开始自己的接收循环。`state`可以是任何类型。
- `{:stop, reason}`。`reason`可以是任何类型。服务器不会开始自己的接收循环。进程会以给定的原因退出。

还有一些更高级的用法，这里暂不涉及。

如果服务器的接收循环启动了，`GenServer.start/3`和`GenServer.start_link/3`会返回一个`{:ok, pid}`元组。否则返回`{:error, reason}`。

#### `handle_call/3`

用`GenServer.call/2`可以把需要回复的消息发送给服务器进程。这个函数把正在运行的服务器进程的`pid`作为第一个实参，把消息作为第二个实参。消息可以是任何类型。

`handle_call/3`回调负责处理和响应同步消息。它接收三个实参：

1. `message`，也就是作为第二个实参传给`GenServer.call/2`的值。
2. `from`，也就是调用`GenServer.call/2`的进程的`pid`。大多数情况下这个实参可以忽略。
3. `state`，也就是服务器的当前状态。记住，它的初始值是在`init/1`回调里设置的。

`handle_call/3`回调通常返回一个三元组`{:reply, reply, state}`。这意味着元组中的第二个元素，也就是可以是任何类型的`reply`，会被发回给调用方。元组中的第三个元素`state`，是服务器处理完这条消息之后的新状态。

还有一些更高级的用法，这里暂不涉及。

~~~~exercism/note
想通过名字记住这个回调的作用，
可以把它想成给某人“打电话”。

如果对方有空，你会立刻收到回复（同步地）。
~~~~

#### `handle_cast/2`

用`GenServer.cast/2`可以把不需要回复的消息发送给服务器进程。它的实参和`GenServer.call/2`的实参完全相同。

`handle_cast/2`回调负责处理这些消息。它接收两个实参，`message`和`state`，和`handle_call/3`回调里的实参相同（只是没有`from`）。

`handle_cast/2`回调通常返回一个二元组`{:noreply, state}`。

还有一些更高级的用法，这里暂不涉及。

~~~~exercism/note
想通过名字记住这个回调的作用，
记住“cast”也有“扔出去”的意思。

如果你把一封瓶中信扔进大海，
你不会指望马上收到回复，
也许永远都收不到。
~~~~

#### 该用`call`还是`cast`？

几乎总是应该用`call`，即使你的客户端代码并不需要服务器的回复。

使用`call`会等待回复，这起到背压机制的作用（防止客户端一次发送太多消息）。收到服务器的回复，也是确认服务器接收并处理了客户端消息的唯一方式。

#### `handle_info/2`

消息也可能通过`GenServer.call/2`或`GenServer.cast/2`之外的方式进入服务器的收件箱，比如调用普通的`send/2`函数。

要处理这类消息，请使用`handle_info/2`回调。这个回调的工作方式和`handle_cast/2`完全相同。

`GenServer`行为提供了一个兜底的`handle_info/2`实现，会记录关于意外消息的错误。如果你覆盖了那个默认实现，请务必始终加入自己的兜底实现。否则，服务器一旦收到意外消息就会崩溃。

### 超时

上面介绍的这四个回调，返回值都可以再扩展一个元组元素，即超时时间。例如，`init/1`可以不返回`{:ok, state}`，而是返回`{:ok, state, timeout}`。

超时可以用于检测邮箱中在一段特定时间内没有消息。如果服务器从某个回调返回了超时，并且在指定的毫秒数内没有任何消息到达，就会以`:timeout`作为第一个实参调用`handle_info/2`。

[concept-behaviours]: https://exercism.org/tracks/elixir/concepts/behaviours
[concept-processes]: https://exercism.org/tracks/elixir/concepts/processes
[concept-links]: https://exercism.org/tracks/elixir/concepts/links

## Instructions

基础版取号机卖得非常好，但一些用户抱怨说，与市场上其他在售机型相比，它缺少高级功能。

厂商听取了用户反馈，决定推出一款功能更多的豪华版机型，而你再次受命为这台机器编写软件。

豪华版新增的功能包括：
- 记录当前排队中的号码。
- 设置最小和最大号码。这样就能在同一场所使用多台豪华版取号机，为不同部门的客户排队，并通过号码范围区分不同部门。
- 允许某些号码跳过队列，为孕妇和老人提供优先服务。
- 自动关机，防止不小心让机器整个周末都开着，白白浪费能源。

机器的业务逻辑已经由你的同事实现，可以在`TakeANumberDeluxe.State`模块中找到。现在你的任务是把它包装进一个`GenServer`。

## 1. 启动机器

在`TakeANumberDeluxe`模块中使用`GenServer`行为。

实现`start_link/1`函数以及必要的`GenServer`回调。

传给`start_link/1`的实参是一个关键字列表。它包含`:min_number`和`:max_number`这两个键。这些键对应的值需要传给`TakeANumberDeluxe.State.new/2`函数。

如果`TakeANumberDeluxe.State.new/2`返回`{:ok, state}`元组，机器就应当启动，并把返回的状态作为自身的状态。如果它返回的是`{:error, error}`元组，机器则应当停止，并把返回的错误作为停止原因。

```elixir
TakeANumberDeluxe.start_link(min_number: 1, max_number: 9)
# => {:ok, #PID<0.174.0>}

TakeANumberDeluxe.start_link(min_number: 9, max_number: 1)
# => {:error, :invalid_configuration}
```

你可能已经注意到，`TakeANumberDeluxe.State.new/2`函数还接受一个可选的第三个实参`auto_shutdown_timeout`。我们会在本练习的最后一步用到它。

## 2. 报告机器状态

实现`report_state/1`函数以及必要的`GenServer`回调。机器应当把当前状态回复给调用方。

```elixir
{:ok, machine} = TakeANumberDeluxe.start_link(min_number: 1, max_number: 10)
TakeANumberDeluxe.report_state(machine)
# => %TakeANumberDeluxe.State{
#      max_number: 10,
#      min_number: 1,
#      queue: %TakeANumberDeluxe.Queue{in: [], out: []},
#      auto_shutdown_timeout: :infinity,
#    }
```

## 3. 将新号码加入队列

实现`queue_new_number/1`函数以及必要的`GenServer`回调。

它应当用机器的当前状态调用`TakeANumberDeluxe.State.queue_new_number/1`函数。

如果`TakeANumberDeluxe.State.queue_new_number/1`返回`{:ok, new_number, new_state}`元组，机器应当把新号码回复给调用方，并把新状态设为自身的状态。如果它返回的是`{:error, error}`元组，机器则应当把错误回复给调用方，并且不改变自身的状态。

```elixir
{:ok, machine} = TakeANumberDeluxe.start_link(min_number: 1, max_number: 2)
TakeANumberDeluxe.queue_new_number(machine)
# => {:ok, 1}

TakeANumberDeluxe.queue_new_number(machine)
# => {:ok, 2}

TakeANumberDeluxe.queue_new_number(machine)
# => {:error, :all_possible_numbers_are_in_use}
```

## 4. 叫下一个排队号码

实现`serve_next_queued_number/2`函数以及必要的`GenServer`回调。

它应当用机器的当前状态以及它的第二个可选实参`priority_number`调用`TakeANumberDeluxe.State.serve_next_queued_number/2`函数。

如果`TakeANumberDeluxe.State.serve_next_queued_number/2`返回`{:ok, next_number, new_state}`元组，机器应当把下一个号码回复给调用方，并把新状态设为自身的状态。如果它返回的是`{:error, error}`元组，机器则应当把错误回复给调用方，并且不改变自身的状态。

```elixir
{:ok, machine} = TakeANumberDeluxe.start_link(min_number: 1, max_number: 10)
TakeANumberDeluxe.queue_new_number(machine)
# => {:ok, 1}

TakeANumberDeluxe.serve_next_queued_number(machine)
# => {:ok, 1}

TakeANumberDeluxe.serve_next_queued_number(machine)
# => {:error, :empty_queue}
```

## 5. 重置状态

实现`reset_state/1`函数以及必要的`GenServer`回调。

它应当调用`TakeANumberDeluxe.State.new/2`函数，用当前状态的`min_number`和`max_number`创建一个新状态。机器应当把这个新状态设为自身的状态。它不应当回复调用方。

```elixir
{:ok, machine} = TakeANumberDeluxe.start_link(min_number: 1, max_number: 10)

TakeANumberDeluxe.reset_state(machine)
# => :ok
```

## 6. 实现自动关机

修改机器的启动过程。它应当读取作为`init_arg`传入的关键字列表中`:auto_shutdown_timeout`键对应的值，并把它作为第三个实参传给`TakeANumberDeluxe.State.new/3`。如果没有给出`:auto_shutdown_timeout`，就使用默认值`:infinity`。

修改重置机器状态的过程，让它也把`auto_shutdown_timeout`传给`TakeANumberDeluxe.State.new/3`。

修改所有已实现回调（`init/1`以及所有`handle_*`回调）的返回值，以设置超时。使用当前机器状态中`:auto_shutdown_timeout`键对应的值。不要给`init/1`的`{:stop, reason}`返回值加上超时，超时只在服务器启动接收循环之后才生效。

实现一个`GenServer`回调，用来处理`:timeout`消息：如果在给定超时时间内没有收到其他任何消息，这条消息就会被发送给机器。它应当以`:normal`为原因退出进程。

还要记得处理任何意外消息，直接忽略它们。

```elixir
{:ok, machine} =
  TakeANumberDeluxe.start_link(
    min_number: 1,
    max_number: 10,
    auto_shutdown_timeout: :timer.hours(2)
  )

# after 3 hours...

TakeANumberDeluxe.queue_new_number(machine)
# => ** (exit) exited in: GenServer.call(#PID<0.171.0>, :queue_new_number, 5000)
#        ** (EXIT) no process: the process is not alive or there's no process currently associated with the given name, possibly because its application isn't started
#       (elixir 1.13.0) lib/gen_server.ex:1030: GenServer.call/3
```

## Source

### Created by

- @angelikatyborska

### Contributed to by

- @jiegillet