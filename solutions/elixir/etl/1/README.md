# ETL

欢迎来到 Exercism Elixir 轨道中的 ETL。
如果你在运行测试或提交代码时需要帮助，请查看`HELP.md`。

## Introduction

你在一家公司工作，这家公司开发了一款名为 Lexiconia 的在线多人游戏。

要玩这个游戏，每位玩家会拿到 13 个字母，需要把它们重新排列成单词。不同字母的分值不同，因为用有些字母组词比其他字母更容易。

游戏最初以英文推出，但非常受欢迎，现在公司想把它扩展到其他语言。

不同语言需要为字母设置不同的分值。分值取决于该语言中字母的使用频率与其他字母相比的高低。

例如，字母“C”在英文中相当常见，只值 3 分。但在挪威语中它非常罕见，值 10 分。

为了方便添加新语言，你的团队需要改变游戏中字母及其分值的存储方式。

## Instructions

你的任务是改变游戏中字母及其分值的数据格式。

目前，字母按得分分组存储，是一种一对多的映射关系。

- 1 分：“A”、“E”、“I”、“O”、“U”、“L”、“N”、“R”、“S”、“T”，
- 2 分：“D”、“G”，
- 3 分：“B”、“C”、“M”、“P”，
- 4 分：“F”、“H”、“V”、“W”、“Y”，
- 5 分：“K”，
- 8 分：“J”、“X”，
- 10 分：“Q”、“Z”，

现在需要改成把每个字母和它的得分单独存储，形成一对一的映射关系。

- “a”得 1 分。
- “b”得 3 分。
- “c”得 3 分。
- “d”得 2 分。
- 等等。

作为这次改动的一部分，团队还决定把字母改成小写，不再使用大写。

~~~~exercism/note
如果你想了解数据之前是如何组织的，以及它需要怎样改变，可以看看测试套件中的示例。
~~~~

## Source

### Created by

- @rubysolo

### Contributed to by

- @andrewsardone
- @angelikatyborska
- @bartj3
- @Cohen-Carlisle
- @dalexj
- @dantswain
- @devonestes
- @etrepum
- @henrik
- @herminiotorres
- @jinyeow
- @kytrinyx
- @lpil
- @neenjaw
- @parkerl
- @pminten
- @sotojuan
- @Teapane
- @waiting-for-dev

### Based on

Based on an exercise by the JumpstartLab team for students at The Turing School of Software and Design. - https://www.turing.edu/