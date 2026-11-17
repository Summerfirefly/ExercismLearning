# 取号

欢迎来到 Exercism Elixir 轨道中的 取号。
如果你在运行测试或提交代码时需要帮助，请查看`HELP.md`。
如果你在练习中卡住了，请查看`HINTS.md`，不过先试着自己解决，不要急着看提示 :)

## Introduction

## 进程

在 Elixir 中，所有代码都在进程内运行。

默认情况下，函数会在调用它的同一个进程中执行。如果需要在新进程中显式运行某个函数，可以使用`spawn/1`：

```elixir
spawn(fn -> 2 + 2 end)
# => #PID<0.125.0>
```

`spawn/1`会创建一个新进程，执行传入的零元函数，并返回一个_进程标识符_（PID）。新进程会在函数执行期间一直存活，然后静默退出。

不要将 Elixir 的进程与操作系统进程混淆。Elixir 的进程占用的内存和 CPU 要少得多。Elixir 应用同时运行数百个 Elixir 进程完全没有问题。

### 消息

进程之间不会直接共享信息。进程通过_发送和接收消息_来共享数据。

你可以用`send/2`向任何进程发送消息。`send/2`的第一个实参是接收者的 PID，第二个实参是消息。

消息可以是任何类型，通常由原子和元组组成。如果你想收到回复，就应该在消息中的某个位置包含发送者的 PID。你可以用`self()`获取当前进程的 PID。

`send/2`不会检查消息是否被接收者收到，也不会检查接收者是否仍然存活。消息会进入接收者的_信箱_，只有当接收者显式请求_接收消息_时才会被读取。

可以使用`receive/1`宏从信箱中读取消息。它接受一个`do`块，可以在消息上进行[模式匹配][exercism-pattern-matching]。

```elixir
receive do
  {:ping, sender_pid} -> send(sender_pid, :pong)
  :do_nothing -> nil
end
```

`receive/1`会从信箱中取出匹配任意给定模式的_一条消息_，并执行该模式对应的表达式。如果信箱中没有消息，或者信箱中没有消息匹配任何模式，`receive/1`就会等待消息到来。

### 接收循环

如果你想接收多条消息，就需要递归调用`receive/1`。一种常见的做法是实现一个递归函数，比如命名为`loop`，它调用`receive/1`，对消息做一些处理，然后调用自身来等待更多消息。如果需要在一次`receive/1`调用与另一次之间传递一些状态，可以通过给`loop`函数传入实参来实现。

## PID

进程标识符是一种独立的数据类型。它相当于_信箱地址_：只要拥有某个进程的 PID，就能向该进程发送消息。PID 通常是间接产生的，它是创建新进程的函数（如`spawn`）的返回值。

[exercism-pattern-matching]: https://exercism.org/tracks/elixir/concepts/pattern-matching

## Instructions

你正在为一台取号机编写嵌入式系统。这是非常简单的型号。它能发放连续的号码，并报告最后发放的是哪个号码。

## 1. 启动机器

实现`start/0`函数。它应该创建一个新进程，并返回该进程的 PID。新进程暂时什么都不用做。

```elixir
TakeANumber.start()
# => #PID<0.138.0>
```

注意，每次运行这段代码时，PID 都可能不一样。

## 2. 报告机器状态

修改机器，让新创建的进程准备好接收消息（启动一个_receive loop_），初始状态为`0`。它应该能够接收`{:report_state, sender_pid}`消息。收到这类消息后，它应该把当前状态（最后发放的号码）发送给`sender_pid`，然后继续等待更多消息。

```elixir
machine_pid = TakeANumber.start()

# a client sending a message to the machine
send(machine_pid, {:report_state, self()})

# a client receiving a message from the machine
receive do
  msg -> msg
end

# => 0
```

## 3. 发放号码

修改机器，让它能够接收`{:take_a_number, sender_pid}`消息。它应该把状态增加 1，把新状态发送给`sender_pid`，然后继续等待更多消息。

```elixir
machine_pid = TakeANumber.start()

# a client sending a message to the machine
send(machine_pid, {:take_a_number, self()})

# a client receiving a message from the machine
receive do
  msg -> msg
end

# => 1
```

## 4. 停止机器

修改机器，让它能够接收`:stop`消息。收到后，它应该停止等待更多消息。

## 5. 忽略意外消息

修改机器，让它收到意外消息时忽略该消息，并继续等待更多消息。

## Source

### Created by

- @angelikatyborska

### Contributed to by

- @neenjaw