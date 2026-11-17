# 新闻简报

欢迎来到 Exercism Elixir 轨道中的 新闻简报。
如果你在运行测试或提交代码时需要帮助，请查看`HELP.md`。
如果你在练习中卡住了，请查看`HINTS.md`，不过先试着自己解决，不要急着看提示 :)

## Introduction

## 文件

`File`模块提供了处理文件的函数。

要读取整个文件，使用`File.read/1`。要写入文件，使用`File.write/2`。

每次使用`File.write/2`写入文件时，都会打开一个文件描述符，并生成一个新的 Elixir [进程][exercism-processes]。因此，应避免在循环中使用`File.write/2`写入文件。

而应使用`File.open/2`打开文件。`File.open/2`的第二个实参是一个模式数组，它让你可以指定是想以读取还是写入方式打开文件。

`File.open/2`返回处理该文件的进程的 PID。要读写这个文件，请使用`IO`模块中的函数，并将该 PID 作为 IO 设备传入。

处理完文件后，用`File.close/1`关闭它。

`File`模块中提到的所有函数都有一个`!`变体，它会抛出错误而不是返回错误元组（例如`File.read!/1`）。如果你不打算处理文件缺失或权限不足等错误，就使用这个变体。

[exercism-processes]: https://exercism.org/tracks/elixir/concepts/processes

## Instructions

你非常喜欢火车模型，决定创办一份通讯，把这份热爱分享给全世界。你首先要做的，是把通讯的第一期发送给同样有这一爱好的朋友和熟人。你有一个文本文件，里面列出了他们的电子邮件地址。

## 1. 从文件中读取电子邮件地址

实现 `Newsletter.read_emails/1` 函数。它接收一个文件路径。该文件是一个文本文件，其中包含以换行符分隔的电子邮件地址。函数应返回文件中这些电子邮件地址组成的数组。

```elixir
Newsletter.read_emails("/home/my_user/documents/model_train_friends_emails.txt")
# => ["rick@example.com", "choochoo42@example.com", "anna@example.com"]
```

## 2. 打开日志文件以便写入

发送电子邮件这项任务可能因为许多无法预料的原因而失败，比如电子邮件地址里有一个拼写错误，或者网络暂时出了问题。为了确保你能在不重复发送的前提下重试向所有朋友发送邮件，你需要记录下已经收到邮件的电子邮件地址。为此，你需要一个日志文件。

实现 `Newsletter.open_log/1` 函数。它接收一个文件路径，以写入模式打开该文件，并返回处理该文件的进程的 PID。

```elixir
Newsletter.open_log("/home/my_user/documents/newsletter_issue1_log.txt")
# => #PID<0.145.0>
```

## 3. 记录已发送的电子邮件

实现 `Newsletter.log_sent_email/2` 函数。它接收处理该文件的进程的 PID 和一个包含电子邮件地址的字符串。它应把该电子邮件地址写入文件，并在后面加上一个换行符。

```elixir
Newsletter.log_sent_email(pid, "joe@example.com")
# => :ok
```

## 4. 关闭日志文件

实现 `Newsletter.close_log/1` 函数。它接收处理该文件的进程的 PID，并关闭该文件。

```elixir
Newsletter.close_log(pid)
# => :ok
```

## 5. 发送通讯

现在你已经有了发送邮件流程的所有组成部分，需要把它们组合到一个函数里。

实现 `Newsletter.send_newsletter/3` 函数。它接收存有电子邮件地址的文件路径、日志文件的路径，以及一个向指定电子邮件地址发送邮件的匿名函数。它应从给定文件中读取所有电子邮件地址，并尝试向其中每一个发送邮件。如果发送邮件的匿名函数返回 `:ok`，就把该电子邮件地址写入日志文件，并在后面加上一个换行符。务必在邮件发送后立即写入。全部发送完成后，关闭日志文件。

```elixir
Newsletter.send_newsletter(
  "model_train_friends_emails.txt",
  "newsletter_issue1_log.txt",
  fn email -> :ok end
)

# => :ok
```

## Source

### Created by

- @angelikatyborska

### Contributed to by

- @neenjaw