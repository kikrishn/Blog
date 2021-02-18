---
layout: post
title: The Lebesgue Fundamental Theorem of Calculus
tags:
  - analysis
---

So I had an analysis exam last week which roughly covered the material in
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

After a fair amount of reading and thinking[^1], I finally fit the puzzle 
pieces together. Since I wrote it all down for myself as part of my studying, 
I figured I would post it here as well in case other people find it useful. 

So then, let's get started!

---

To start, we need to remember how to relate functions and measures. Everything
we say here will be in $\mathbb{R}^1$.

<div class=boxed markdown=1>
  If $F$ is increasing and continuous from the right, then there is a 
  (unique!) regular borel maeasure $\mu_F$ so that 

  $$
  \mu_F((a,b]) = F(b) - F(a)
  $$

  Moreover, given any regular borel measure $\mu$ on $\mathbb{R}$, the function

  $$
  F_\mu \triangleq 
  \begin{cases}
     \mu((0,x]) & x > 0 \\
    0           & x = 0 \\
    -\mu((x,0]) & x < 0
  \end{cases}
  $$

  is increasing and right continuous.
</div>

This is more or less the content of the [Carathéodory Extension Theorem][5].
It's worth taking a second to think where we use the assumptions on $F$. 
The fact that $F$ is increasing means our measure is positive. Continuity
from the right is a bit more subtle, though. Since $F_\mu$ is always right
continuous, we need to assume our starting function is right continuous
in order to guarantee $F_{\mu_F} = F$.

This is not a big deal, though. A monotone function is automatically continuous
except at a countable set (see [here][6], say) and at its countably many
discontinuities, we can force right-continuity by defining 

$$
F_r(x_0) \triangleq \lim_{x \to x_0^+} F(x)
$$

which agrees with $F$ wherever $F$ is continuous.
If we put our probabilist hat on, we say that $F_\mu$ is the 
<span class="defn">Cumulative Distribution Function</span> of $\mu$. 
Here $F_\mu(x)$ represents the total cumulative mass we've seen so far.

There's a very important question which we have to ask ourselves now.


---

[^1]:
    I was mainly reading Folland (Ch. 3), since it's the book for the course. 
    I've also been spending time with Terry Tao's lecture notes on the subject
    (see [here][4], and [here][2]), as well as 
    [this][3] PDF from Eugenia Malinnikova's measure theory course
    at Stanford. I read parts of Axler's new book, and while I meant to read
    some of Royden too, I didn't get around to it.


[1]: https://en.wikipedia.org/wiki/Lebesgue_differentiation_theorem
[2]: https://terrytao.wordpress.com/2009/01/04/245b-notes-1-signed-measures-and-the-radon-nikodym-lebesgue-theorem/
[3]: http://web.stanford.edu/~eugeniam/math205a/L3.pdf
[4]: https://terrytao.wordpress.com/2010/10/16/245a-notes-5-differentiation-theorems/
[5]: https://en.wikipedia.org/wiki/Carath%C3%A9odory%27s_extension_theorem
[6]: https://math.stackexchange.com/questions/84870/how-to-show-that-a-set-of-discontinuous-points-of-an-increasing-function-is-at-m


