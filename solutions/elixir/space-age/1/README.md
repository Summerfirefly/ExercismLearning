# 太空时代

欢迎来到 Exercism Elixir 轨道中的 太空时代。
如果你在运行测试或提交代码时需要帮助，请查看`HELP.md`。

## Introduction

2525 年，你刚刚踏上旅程，准备造访太阳系里的所有行星（水星、金星、地球、火星、木星、土星、天王星和海王星）。
第一站是水星，那里的海关要求你填写一张表格（看来官僚作风_并非_地球独有）。
你把表格递给海关官员，对方仔细查看后皱起了眉。
“你_真的_觉得我会相信你只有 50 岁吗？
你肯定快 200 岁了！”

你觉得好笑，等着海关官员笑出声，可对方一脸严肃，完全不像在开玩笑。
你这才意识到，自己填的年龄是按_地球年_算的，而官员期待的却是_水星年_！
水星绕太阳的公转周期比地球短得多，所以换算成水星年，你的年龄其实大得多。
快速计算一番之后，你报出了自己的水星年龄。
海关官员满意地笑了笑，挥手示意你通过。
你暗暗记下，以后过海关检查前要_提前_算好自己的各行星年龄，免得再出这种岔子。

~~~~exercism/note
如果你想知道冥王星为什么没有入选，可以看看[这个 YouTube 视频][pluto-video]。

[pluto-video]: https://www.youtube.com/watch?v=Z_2gbGXzFbs
~~~~

## Instructions

给定一个以秒为单位的年龄，计算这个人在太阳系中某颗行星上的年龄。

一个地球年等于 365.25 个地球日，即 31,557,600 秒。
如果有人告诉你某人已经 1,000,000,000 秒大了，那么他的年龄就是 31.69 地球年。

对于其他行星，你需要考虑它们以地球年为单位的公转周期：

| Planet  | Orbital period in Earth Years |
| ------- | ----------------------------- |
| Mercury | 0.2408467                     |
| Venus   | 0.61519726                    |
| Earth   | 1.0                           |
| Mars    | 1.8808158                     |
| Jupiter | 11.862615                     |
| Saturn  | 29.447498                     |
| Uranus  | 84.016846                     |
| Neptune | 164.79132                     |

~~~~exercism/note
地球绕太阳完整公转一周的实际时长更接近 365.256 天（1 个恒星年）。
公历平均一年有 365.2425 天。
虽然不完全准确，但本练习采用的就是 365.25 这个值。
衡量一年的方法还有很多，参见[维基百科上的“年”][year]。

[year]: https://en.wikipedia.org/wiki/Year#Summary
~~~~

## Source

### Created by

- @rubysolo

### Contributed to by

- @angelikatyborska
- @Cohen-Carlisle
- @dalexj
- @devonestes
- @henrik
- @jinyeow
- @koriroys
- @kytrinyx
- @lpil
- @neenjaw
- @parkerl
- @pminten
- @sotojuan
- @Teapane
- @waiting-for-dev

### Based on

Partially inspired by Chapter 1 in Chris Pine's online Learn to Program tutorial. - https://pine.fm/LearnToProgram/chap_01.html