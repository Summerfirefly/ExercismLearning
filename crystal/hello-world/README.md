# 你好，世界

欢迎来到 Exercism Crystal 轨道中的 你好，世界。
如果你在运行测试或提交代码时需要帮助，请查看`HELP.md`。

## Instructions

经典的入门练习。
只需要说“Hello, World!”。

“Hello, World!”是初学一门新的编程语言或进入一个新环境时，传统的第一个程序。

目标很简单：

- 修改提供的代码，让它输出字符串“Hello, World!”。
- 运行测试套件，确保它能通过。
- 提交你的解答，并在网站上查看结果。

如果一切顺利，你就可以去获取第一个真正的练习了。

[hello-world]: https://en.wikipedia.org/wiki/%22Hello,_world!%22_program

## 项目结构

* `src`里放着你为这个练习写的解答
* `spec`里放着这个练习要运行的测试

## 运行测试

如果你在正确的目录下（也就是包含`src`和`spec`的那个目录），就可以通过运行`crystal spec`来运行这个练习的测试：

```bash
$ pwd
/Users/johndoe/Code/exercism/crystal/hello-world

$ ls
GETTING_STARTED.md README.md          spec               src

$ crystal spec
```

这会运行`spec`目录下的所有测试文件。

在每个测试文件里，除了第一个测试，其余测试都被跳过了。

一旦有一个测试通过，你就可以把下一个测试的`pending`改成`it`，取消它的跳过状态。

## 提交你的解答

提交解答时，请务必提交`src`目录下的源文件：

```bash
$ exercism submit src/hello_world.cr
```

## Source

### Created by

- @mhelmetag

### Contributed to by

- @amscotti
- @bmulvihill
- @issyl0
- @jhonnymoreira
- @kytrinyx

### Based on

This is an exercise to introduce users to using Exercism - https://en.wikipedia.org/wiki/%22Hello,_world!%22_program