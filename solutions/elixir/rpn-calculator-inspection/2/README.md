# RPN 计算器检查

欢迎来到 Exercism Elixir 轨道中的 RPN 计算器检查。
如果你在运行测试或提交代码时需要帮助，请查看`HELP.md`。
如果你在练习中卡住了，请查看`HINTS.md`，不过先试着自己解决，不要急着看提示 :)

## Introduction

## 链接

Elixir 的[进程][exercism-processes]是相互隔离的，默认不共享任何内容。当一个没有链接的子进程崩溃时，它的父进程不会受到影响。

可以通过把进程相互_链接_来改变这种行为。如果两个进程相互链接，其中一个进程的故障会传播到另一个进程。链接是**双向的**。

可以使用`spawn_link/1`创建进程时就将其与调用进程链接起来，这是一个原子操作；也可以稍后用`Process.link/1`将它们链接起来。

在进行并行化工作时，如果某一块工作在其他块未能完成的情况下不应该继续，那么链接进程会很有用。

### 捕获退出

链接也可以用于_监督_进程。如果一个进程_捕获退出_，那么当与它链接的进程崩溃时，它不会崩溃，而是会收到一条关于该崩溃的消息。这使它能够优雅地处理崩溃，例如重启崩溃的进程。

通过调用`Process.flag(:trap_exit, true)`，可以把进程配置为捕获退出。注意，`Process.flag/2`返回的是该标志的_旧_值，而不是新值。

当链接的进程崩溃时，发送给该进程的消息会匹配模式`{:EXIT, from, reason}`，其中`from`是一个进程标识符（PID）。如果`reason`不是原子`:normal`，就说明该进程崩溃了，或者被强制杀死了。

## 任务

任务是一种[进程][exercism-processes]，用来执行某一特定操作。
它们通常不与其他进程通信，但可以把结果返回给启动该任务的进程。

任务通常用于并行化工作。

### `async`/`await`

要启动一个任务，使用`Task.async/1`。它接收一个匿名函数作为实参，并在一个与调用者进程链接的新进程中执行它。它返回一个`%Task{}`结构体。

要获取执行结果，把`%Task{}`结构体传给`Task.await/2`。它会等待任务完成并返回其结果。第二个实参是超时时间，单位为毫秒，默认为 5000。

注意，在启动任务之后、等待任务之前，启动该任务的进程不会被阻塞，可以执行其他操作。

用`Task.async/1`启动的任何任务都应该被等待，因为它会向调用进程发送一条消息。每个任务只能调用一次`Task.await/2`。

### `start`/`start_link`

如果你只想为了副作用而启动任务，可以使用`Task.start/1`或`Task.start_link/1`。`Task.start/1`启动的任务不与调用进程链接，而`Task.start_link/1`启动的任务与调用进程链接。这两个函数都返回`{:ok, pid}`元组。

[exercism-processes]: https://exercism.org/tracks/elixir/concepts/processes

## Instructions

你在 _Instruments of Texas_ 从事实验性 RPN 计算器的工作还在继续。你的团队已经做出了几个原型，它们需要接受一次全面检查，以便挑选出最适合量产的那一个。

你想进行两类检查。

首先是可靠性检查，用来找出那些会让受检计算器崩溃、或响应不够快的输入。为了隔离故障，每个输入的计算都必须在单独的进程中运行。可以在调用进程中建立链接并捕获退出信号，来检测计算是正常完成还是崩溃了。

其次是正确性检查，用来检验对于给定输入，计算器返回的结果是否符合预期。只有已经通过可靠性检查的计算器才会接受正确性检查，所以不必担心崩溃。不过，为了加快速度，这些操作应当并发运行，这使它成为异步任务的完美用例。

## 1. 为单个输入启动可靠性检查

实现 `RPNCalculatorInspection.start_reliability_check/2` 函数。它接收 2 个实参：一个函数（即计算器）和计算器的一个输入。它应返回一个映射，其中包含输入以及新创建进程的 PID。

新创建的进程应当用给定的输入调用给定的计算器函数。该进程应与调用进程建立链接。

```elixir
RPNCalculatorInspection.start_reliability_check(fn _ -> 0 end, "2 3 +")
# => %{input: "2 3 +", pid: #PID<0.169.0>}
```

## 2. 解读可靠性检查的结果

实现 `RPNCalculatorInspection.await_reliability_check_result/2` 函数。它接收两个实参。第一个实参是一个映射，包含可靠性检查的输入以及为此输入运行可靠性检查的进程的 PID，其形式与 `RPNCalculatorInspection.start_reliability_check/2` 返回的一致。第二个实参是一个映射，用作不同输入下可靠性检查结果的累加器。

该函数应等待一条退出消息。

如果它从运行可靠性检查的同一个进程收到一条原因为 `:normal` 的退出消息（`{:EXIT, from, reason}`），则应返回结果映射，并在键 `input` 下添加值 `:ok`。

如果它从运行可靠性检查的同一个进程收到一条原因不同的退出消息，则应返回结果映射，并在键 `input` 下添加值 `:error`。

如果在 100 毫秒内没有收到符合这些条件的消息，则应返回结果映射，并在键 `input` 下添加值 `:timeout`。

```elixir
# when an exit message is waiting for the process in its inbox
send(self(), {:EXIT, pid, :normal})

RPNCalculatorInspection.await_reliability_check_result(
  %{input: "5 7 -", pid: pid},
  %{}
)

# => %{"5 7 -" => :ok}

# when there are no messages in the process inbox
RPNCalculatorInspection.await_reliability_check_result(
  %{input: "3 2 *", pid: pid},
  %{"5 7 -" => :ok}
)

# => %{"5 7 -" => :ok, "3 2 *" => :timeout}
```

## 3. 为多个输入并发运行可靠性检查

实现 `RPNCalculatorInspection.reliability_check/2` 函数。它接收 2 个实参：一个函数（即计算器）和计算器的一组输入列表。

对于列表中的每个输入，它都应使用 `start_reliability_check/2` 在一个新的链接进程中启动可靠性检查。然后，对于以这种方式启动的每个进程，都应使用 `await_reliability_check_result/2` 等待其结果。

在启动任何进程之前，该函数需要先为当前进程设置“捕获退出”标志，以便能够接收退出消息。之后，它应将该标志恢复为原来的值。

该函数应返回一个映射，其中包含所有输入的可靠性检查结果。

```elixir
fake_broken_calculator = fn input ->
  if String.ends_with?(input, "*"), do: raise("oops")
end

inputs = ["2 3 +", "10 3 *", "20 2 /"]

RPNCalculatorInspection.reliability_check(fake_broken_calculator, inputs)
# => %{
#       "2 3 +" => :ok,
#       "10 3 *" => :error,
#       "20 2 /" => :ok
#     }
```

## 4. 为多个输入并发运行正确性检查

实现 `RPNCalculatorInspection.correctness_check/2` 函数。它接收 2 个实参：一个函数（即计算器）和计算器的一组输入列表。

对于列表中的每个输入，它都应启动一个异步任务，用给定的输入调用计算器。然后，对于以这种方式启动的每个任务，都应等待其结果，最长等待 100 毫秒。

```elixir
fast_cheating_calculator = fn input -> 14 end
inputs = ["13 1 +", "50 2 *", "1000 2 /"]
RPNCalculatorInspection.correctness_check(fast_cheating_calculator, inputs)
# => [14, 14, 14]
```

## Source

### Created by

- @angelikatyborska

### Contributed to by

- @neenjaw