# 闰年

欢迎来到 Exercism Ruby 轨道中的 闰年。
如果你在运行测试或提交代码时需要帮助，请查看`HELP.md`。

## Introduction

闰年（在公历中）是这样出现的：

- 每一年，只要年份能被 4 整除。
- 除非年份能被 100 整除，这种情况下，只有年份同时也能被 400 整除时，它才是闰年。

一些例子：

- 1997 年不是闰年，因为它不能被 4 整除。
- 1900 年不是闰年，因为它不能被 400 整除。
- 2000 年是闰年！

~~~~exercism/note
想了解闰年这一现象的四分钟精彩讲解，请看[这个 YouTube 视频](https://www.youtube.com/watch?v=xX96xng7sAE)。
~~~~

## Instructions

你的任务是判断给定年份是否为闰年。

## 限制

避免使用标准库中的`Date#leap?`。

## Source

### Created by

- @kytrinyx

### Contributed to by

- @budmc29
- @cadwallion
- @dkinzer
- @Gaelan
- @henrik
- @hilary
- @iHiD
- @Insti
- @jcasimir
- @jmay
- @jpotts244
- @kotp
- @markijbema
- @mike-hewitson
- @NeimadTL
- @tryantwit

### Based on

CodeRanch Cattle Drive, Assignment 3 - https://web.archive.org/web/20240907033714/https://coderanch.com/t/718816/Leap