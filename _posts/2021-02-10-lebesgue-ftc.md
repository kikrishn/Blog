---
layout: post
title: The Lebesgue Fundamental Theorem of Calculus
tags:
  - analysis
  - sage
---

So I have an analysis exam tomorrow which roughly covers the material in
chapter 3 of Folland's "Real Analysis: Modern Techniques and Their Applications".
I'm decently comfortable with the material, but a lot of it has always felt 
kind of unmotivated. For example, why is the [Lebesgue Differentiation Theorem][1]
called that? It obviously looks _something_ like a derivative... But I was 
never able to quite make the connection feel solid. 

A big part of my studying process is fitting together the various theorems
into a coherent narrative. It doesn't have to be linear 
(in fact, it typically isn't!), but it should feel like the theorems share
some purpose, and fit together neatly. 
I also struggle to care about theorems before I know what they do. This is
part of why I care so much about examples, and it means the other half of
finding a narrative is understanding what kinds of problems our techniques
are good for. 

After a fair amount of reading and thinking[^1], I finally have a coherent
narrative that works for me, and since I wrote it all down for myself
as part of my studying, I figured I would post it here as well in case
other people find it useful. I've also included some 
[sage](https://www.sagemath.org) code at the bottom which will show
off a theorem that surprised me. It's a very concrete application of
the theory, and has the added benefit of being extremely comprehensible!

[^1]:
    In case you're really dedicated, I've been mainly reading Folland (ch 3) 
    and Rudin's RCA (ch 6,7). I like to get a historical take when I can,
    because I find people often took more care motivating things when the 
    subject was new. Since I have a copy of Saks' "Theory of the Integral"
    lying around (I bought it at a used book sale a while ago for like, $2),
    I've been enjoying that as well (ch 3,4). <br>
    Obviously I'm not only reading textbooks, though. I've spent lots
    of time with Terry Tao's lecture notes on the subject 
    (see [here][2] for the first post in the series), as well as 
    [this][3] PDF from Eugenia Malinnikova's measure theory course
    at Stanford. I was planning to read parts of Royden and Axler's new book
    as well, but didn't get around to it. 

So, let's get started.



[1]: https://en.wikipedia.org/wiki/Lebesgue_differentiation_theorem
[2]: https://terrytao.wordpress.com/2009/01/04/245b-notes-1-signed-measures-and-the-radon-nikodym-lebesgue-theorem/
[3]: http://web.stanford.edu/~eugeniam/math205a/L3.pdf
