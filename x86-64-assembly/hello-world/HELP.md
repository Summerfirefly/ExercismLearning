# Help

## 运行测试

要运行测试，请执行以下命令：

```bash
make
```

## 跳过的测试

解决一道练习，意味着让它所有的测试都通过。
默认情况下，运行测试时只会执行一个测试（第一个）。
这是有意为之的，这样你就能专注于让那一个测试通过。
一旦它通过了，你就可以删掉`TEST_IGNORE()`这一行，启用下一个测试。
当所有测试都已启用，并且你的实现让它们全部通过时，你就完成了这道练习！

## 调试

为了方便调试，`debug.mac`文件中定义了各种宏。
可以用一个或多个大小合适的实参来调用它们。
例如：

```x86asm
debugf32 xmm0, xmm1 ; prints the value of two 32-bit floating-point numbers
debugd16 ax, cx, dx ; prints the value of three signed 16-bit integers
debugx64 [rax]      ; prints the value of a 64-bit integer in hexadecimal format
debugs rsi          ; prints a NUL-terminated string whose address is stored in `rsi`
debugu8_xmm xmm1    ; prints 16 packed 8-bit unsigned integers
```

要使用其中任何一个宏，必须在提交的解答文件的顶部引入`debug.mac`：

```x86asm
%include "debug.mac"
```

## 提交你的解答

你可以使用`exercism submit hello_world.asm`命令提交你的解答。
这个命令会把你的解答上传到 Exercism 网站，并打印出解答页面的 URL。

你也可以提交一个不完整的解答，这样可以：

- 看看别人是如何完成这道练习的
- 向导师寻求帮助

## 需要帮助吗？

如果你在解这道练习时需要帮助，请查看以下页面：

- [x86-64 Assembly 轨道文档](https://exercism.org/docs/tracks/x86-64-assembly)
- [x86-64 Assembly 轨道在论坛上的编程版块](https://forum.exercism.org/c/programming/x86-64-assembly)
- [Exercism 在论坛上的编程版块](https://forum.exercism.org/c/programming/5)
- [常见问题解答](https://exercism.org/docs/using/faqs)

如果这些资源还不够，你也可以提交（不完整的）解答，以申请导师指导。

如果你遇到问题需要帮助，可以使用以下资源：

- [The NASM Manual](https://www.nasm.us/doc/)
- [x86 and amd64 instruction reference](https://www.felixcloutier.com/x86/)
- [StackOverflow](http://stackoverflow.com) 可以用来搜索你的问题，看看是否已经有人解答过。你也可以提问和回答问题。