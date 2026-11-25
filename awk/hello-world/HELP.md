# Help

## 运行测试

每个练习都包含一个测试文件。
使用`bats`程序运行测试。
```bash
bats test-hello-world.bats
```

需要先安装`bats`。
关于如何为你的系统安装`bats`，请参见 [Bash track 的测试][bash] 页面。

### bats 用 bash 实现

bats 文件是一个 bash 脚本，其中包含一些由`bats`命令识别的特殊函数。
你会看到一些像这样的测试
```sh
gawk -f some-exercise.awk <<< "some,input,here"
```
那个 `<<<` 语法是 bash 的[此处字符串][here-string]。
它把右侧的字符串送入左侧程序的标准输入。
它（[大致][so]）等同于
```sh
echo "some,input,here" | gawk -f some-exercise.awk
```

## assert 函数的帮助

测试使用了 [bats-assert][bats-assert] 库中的函数。
各种 `assert*` 函数的帮助可以在那里找到。

## 被跳过的测试

解出一道练习意味着让它所有的测试都通过。
默认情况下，运行测试时只会执行一个测试（第一个）。
这是有意设计的，让你可以专注于让这一个测试通过。
一旦它通过了，你就可以通过注释掉或删除位于其他测试前面的

    [[ $BATS_RUN_SKIPPED == true ]] || skip

注释来启用下一个测试。

## 取消跳过

要运行所有测试（包括带 `skip` 注释的测试），可以运行：
```bash
BATS_RUN_SKIPPED=true bats test-some-exercise.bats
```

用包装函数可以省去不少输入：在`bash`中，你可以这样做：
```bash
bats() {
    BATS_RUN_SKIPPED=true command bats *.bats
}
```
然后只需这样运行测试：
```bash
bats
```

## 调试输出

```exercism/caution
这在本地用`bats`可以正常工作，但在 Exercism 在线编辑器中**不行**。
```

运行测试时，`bats`会同时捕获 stdout 和 stderr，以便与预期输出进行比较。
如果你把调试信息打印到 stdout 或 stderr，它们会被包含在捕获的输出中，可能导致测试失败。

为了在不影响测试结果的情况下打印调试信息，`bats`为此提供了文件描述符 **3**。
打印到文件`/dev/fd/3`的任何内容都会在测试运行期间显示出来，但不会包含在用于断言的捕获输出中。

示例：

```awk
BEGIN {
    # This debug message will not interfere with test output comparison
    print "a debug message" > "/dev/fd/3"

    # Normal program output (this is what your tests will see and compare)
    print "Hello, World!"
}
```

运行示例：

```none
$ bats test-hello-world.bats
test-hello-world.bats
 ✓ Say Hi!
a debug message

1 test, 0 failures
```

这样你就可以看到有用的调试输出，而不会影响测试。

如果你在代码的多个地方用到它，把细节藏进函数里可以提高可读性：

```awk
BEGIN {
    debug("starting ...")
}

# do stuff here ...

END {
    debug("... finished")
}

function debug(msg) {print msg > "/dev/fd/3"}
```

[bash]: https://exercism.org/docs/tracks/bash/tests
[bats-assert]: https://github.com/bats-core/bats-assert
[here-string]: https://www.gnu.org/software/bash/manual/bash.html#Here-Strings
[so]: https://unix.stackexchange.com/a/80372/4667

## 提交你的解答

你可以使用`exercism submit hello-world.awk`命令提交你的解答。
这个命令会把你的解答上传到 Exercism 网站，并打印出解答页面的 URL。

你也可以提交一个不完整的解答，这样可以：

- 看看别人是如何完成这道练习的
- 向导师寻求帮助

## 需要帮助吗？

如果你在解这道练习时需要帮助，请查看以下页面：

- [AWK 轨道文档](https://exercism.org/docs/tracks/awk)
- [AWK 轨道在论坛上的编程版块](https://forum.exercism.org/c/programming/awk)
- [Exercism 在论坛上的编程版块](https://forum.exercism.org/c/programming/5)
- [常见问题解答](https://exercism.org/docs/using/faqs)

如果这些资源还不够，你也可以提交（不完整的）解答，以申请导师指导。

遇到 AWK 问题时，可以到这些地方寻求帮助：

* [Stack Overflow`awk`标签][so]。
* 查看 [Stack Overflow`awk`标签信息页][so-info]中的 Resources 部分。
* 在 [exercism/awk][github] GitHub 代码仓库提交 issue。
* IRC：`irc://irc.liberachat.net/#awk`、`irc://irc.liberachat.net/#exercism`
    * 如果你不熟悉 IRC，请参阅 [Libera.chat][libera]。


[so]: https://stackoverflow.com/tags/awk
[so-info]: https://stackoverflow.com/tags/awk/info
[github]: https://github.com/exercism/awk
[libera]: https://libera.chat