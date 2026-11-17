# 倍数之和

欢迎来到 Exercism Elixir 轨道中的 倍数之和。
如果你在运行测试或提交代码时需要帮助，请查看`HELP.md`。

## Introduction

你在一家开发在线奇幻生存游戏的公司工作。

玩家每完成一个关卡，就会获得能量点。
获得多少能量点，取决于玩家在探索该关卡时找到了哪些魔法物品。

## Instructions

你的任务是编写代码，计算玩家完成一个关卡时获得的能量点。

获得的点数取决于两件事：

- 玩家完成的关卡（一个数字）。
- 玩家在该关卡中收集的每件魔法物品的基础值。

能量点按以下规则发放：

1. 对每件魔法物品，取其基础值，找出所有小于该关卡编号的、该值的倍数。
2. 把这些数字集合合并起来。
3. 去掉重复的数字。
4. 计算剩下的所有数字之和。

来看一个例子：

**玩家完成了第 20 关，并找到了两件基础值分别为 3 和 5 的魔法物品。**

要计算玩家获得的能量点，我们需要找出所有小于第 20 关、且是这两个基础值的倍数的不重复数字。

- 小于 20 的 3 的倍数：`{3, 6, 9, 12, 15, 18}`
- 小于 20 的 5 的倍数：`{5, 10, 15}`
- 合并集合并去掉重复：`{3, 5, 6, 9, 10, 12, 15, 18}`
- 把这些不重复的倍数相加：`3 + 5 + 6 + 9 + 10 + 12 + 15 + 18 = 78`
- 因此，玩家完成第 20 关，并找到两件基础值为 3 和 5 的魔法物品后，可获得**78**能量点。

## Source

### Created by

- @petehuang

### Contributed to by

- @andrewsardone
- @angelikatyborska
- @CoderDennis
- @Cohen-Carlisle
- @dalexj
- @devonestes
- @elasticdog
- @jinyeow
- @krishandley
- @kytrinyx
- @lpil
- @neenjaw
- @parkerl
- @rubysolo
- @sotojuan
- @Teapane
- @waiting-for-dev

### Based on

A variation on Problem 1 at Project Euler - https://projecteuler.net/problem=1