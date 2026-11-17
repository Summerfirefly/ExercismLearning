# 社区花园

欢迎来到 Exercism Elixir 轨道中的 社区花园。
如果你在运行测试或提交代码时需要帮助，请查看`HELP.md`。
如果你在练习中卡住了，请查看`HINTS.md`，不过先试着自己解决，不要急着看提示 :)

## Introduction

## Agent

`Agent`模块提供了一层抽象，用于创建[进程和_接收-发送循环_][exercism-processes]。从现在起，我们把使用`Agent`模块启动的进程称为_“代理进程”_。_代理进程_可以用来表示一个集中式共享状态。

要启动一个_代理进程_，`Agent`提供了`start/2`函数。调用`start`启动_代理进程_时，传入的函数会返回该进程的初始状态：

```elixir
# Start an agent process with an initial value of an empty list
{:ok, agent_pid} = Agent.start(fn -> [] end)
```

就像`Map`或`List`一样，`Agent`提供了许多用于操作_代理进程_的函数。

通常的做法是把所有与`Agent`相关的功能组织并封装到一个模块中，用于所建模的领域。

[exercism-processes]: https://exercism.org/tracks/elixir/concepts/processes

## Instructions

你的社区协会请你实现一个简单的登记应用，用来管理社区花园的地块登记。`Plot` 结构体已经为你准备好了。

## 1. 开启花园

实现`CommunityGarden.start/1`函数，它应接收一个可选的关键字列表，其中的选项会继续传给 _agent 进程_。花园的初始状态应被初始化为一个空的地块集合。它应返回一个包含花园 pid 的`:ok`元组。

```elixir
{:ok, pid} = CommunityGarden.start()
# => {:ok, #PID<0.112.0>}
```

## 2. 列出登记信息

实现`CommunityGarden.list_registrations/1`函数。它应接收社区花园的`pid`。它应返回一个列表，包含所有已登记的地块。

```elixir
CommunityGarden.list_registrations(pid)
# => []
```

> 目前我们还没有添加登记地块的功能，所以这个列表应该是空的

## 3. 把地块登记到某个人的名下

实现`CommunityGarden.register/2`函数。它应接收社区花园的`pid`和一个用于登记地块的姓名。成功时，它应返回`Plot`结构体，其中包含该地块的 id 和登记人。

id 应该是递增且唯一的。你可以在 agent 的状态中保存一个 id 计数器。

```elixir
CommunityGarden.register(pid, "Emma Balan")
# => %Plot{plot_id: 1, registered_to: "Emma Balan"}
CommunityGarden.list_registrations(pid)
# => [%Plot{plot_id: 1, registered_to: "Emma Balan"}]
```

## 4. 释放地块

实现`CommunityGarden.release/2`函数。它应接收待释放地块的`pid`和`id`。成功时应返回`:ok`。地块被释放后，它的 id 不会被重新使用，id 只用作唯一标识符。

```elixir
CommunityGarden.release(pid, 1)
# => :ok
CommunityGarden.list_registrations(pid)
# => []
```

## 5. 获取已登记的地块

实现`CommunityGarden.get_registration/2`函数。它应接收待检查地块的`pid`和`id`。如果该地块已登记，就返回它；如果未登记，则返回`:not_found`。

```elixir
CommunityGarden.get_registration(pid, 1)
# => %Plot{plot_id: 1, registered_to: "Emma Balan"}
CommunityGarden.get_registration(pid, 7)
# => {:not_found, "plot is unregistered"}
```

## Source

### Created by

- @neenjaw

### Contributed to by

- @angelikatyborska
- @jrr
- @efx
- @justin-m-morgan
- @cr0t