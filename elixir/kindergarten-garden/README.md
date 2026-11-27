# 幼儿园花园

欢迎来到 Exercism Elixir 轨道中的 幼儿园花园。
如果你在运行测试或提交代码时需要帮助，请查看`HELP.md`。

## Introduction

幼儿园班正在学习种植植物。老师觉得，给班里的孩子一些种子，让他们种在泥土里生长，是个不错的主意。为此，孩子们沿着窗台摆上了小杯子，每个杯子里种一种植物。孩子们可以从四种可供选择的种子中挑选自己最喜欢的：grass、clover、radishes 和 violets。

## Instructions

你的任务是：给定一张图示，判断幼儿园班里的每个孩子负责哪些植物。

班里有 12 个孩子：

- Alice、Bob、Charlie、David、Eve、Fred、Ginny、Harriet、Ileana、Joseph、Kincaid 和 Larry。

这里种着四种不同的种子：

| 植物 | 图示编码 |
| ------ | ---------------- |
| Grass  | G                |
| Clover | C                |
| Radish | R                |
| Violet | V                |

每个孩子分到四个杯子，每行两个：

```text
[window][window][window]
........................ # each dot represents a cup
........................
```

老师按照孩子名字的字母顺序来分配杯子，也就是说 Alice 排在最前面，Larry 排在最后。

下面是一张示例图示，表示 Alice 的植物：

```text
[window][window][window]
VR......................
RG......................
```

在离窗户最近的第一行，她有一株 violet 和一株 radish。
第二行，她有一株 radish 和一些 grass。

你的程序会按从左到右的顺序收到这些植物，从离窗户最近的那一行开始。
据此，它应该能判断出每株植物分别属于哪个学生。

例如，如果告诉它花园长这样：

```text
[window][window][window]
VRCGVVRVCGGCCGVRGCVCGCGV
VRCCCGCRRGVCGCRVVCVGCGCV
```

那么，如果问它 Alice 的植物，它应该给出：

- Violets, radishes, violets, radishes

而问 Bob 的植物则会得到：

- Clover, grass, clover, clover

## Source

### Created by

- @devonestes

### Contributed to by

- @angelikatyborska
- @Cohen-Carlisle
- @jwworth
- @lpil
- @nathanielknight
- @neenjaw
- @parkerl
- @sotojuan

### Based on

Exercise by the JumpstartLab team for students at The Turing School of Software and Design. - https://www.turing.edu/