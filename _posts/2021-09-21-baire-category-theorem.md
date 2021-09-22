---
layout: post
title: Interlude -- The Baire Category Theorem
tags:
  - analysis-qual-prep
---

We've had a few really detailed posts in a row -- summarizing
the main theorems of some major objects of study in analysis, and putting
these theorems in contexts which (I hope) make them feel coherent and memorable.
Today's post is going to be a bit more relaxed. Two of my best friends
([Remy][1] and [Alyss][7]) are visiting me, so I want a slightly shorter
form post to make sure I have time to spend with them. 
The Baire Category Theorem seems like the _perfect_ topic!

(Future Chris here, they left on Sunday, but I'm only now getting this post up.
My qual is tomorrow morning, and I ended up studying for that instead of 
revising this. I'm still going to write up how I organized my thoughts on
Fourier Analysis, but it'll probably be after I actually take the exam.
Wish me luck!)

---

First, let's remind ourselves of the (deceptively simple) statement of the
Baire Category Theorem. Recall a set is called 
<span class=defn>Meagre</span> if it is a countable union of nowhere 
dense sets. This forms a [$\sigma$-ideal][2] which gives a similar notion
of "smallness" to sets of measure $0$[^2].

<div class=boxed markdown=1>
  Let $X$ be a complete metric space[^1]

  Then $X$ is not meagre in itself.
</div>

Another way of phrasing the result, which sounds less obvious by expanding
some of the complexity trapped in the word "meagre", is very useful in 
practice:

<div class=boxed markdown=1>
  Let $X$ be a complete metric space[^3], and
  let $U_n$ be a countable family of dense open sets in $X$

  Then $\bigcap U_n$ is still dense in $X$[^4].
</div>

This result, which especially in its first form seems obvious, has a 
surprising number of consequences. I'll give some applications here,
particularly applications which are relevant for qual-related counterexamples,
but if you want more you should see [here][5] for a long list, and 
[here][6] for what is essentially a "user manual" for proving existence
results using the Baire Category Theorem!

---

The idea behind proving theorems with the BCT is to write think about 
what properties you _want_ some object to satisfy. Ideally there are only
countably many such properties $P_n$, and each $P_n$ is a "dense open condition"
in the sense that $$\{ x \mid P_n(x) \}$$ is dense and open.

If you find yourself in this scenario, then the BCT promises you can find an
element which satisfies _all_ the properties simultaneously!

Contrapositively, if we have countably many meagre conditions, then we can
_avoid_ all of them simultaneously!

Let's see a few examples in action:

<div class=boxed markdown=1>
Most continuous functions $f : [0,1] \to \mathbb{R}$ are nowhere differentiable.
</div>

Here "most" means "a dense $G_\delta$ set". 

$\ulcorner$
We work in $C([0,1])$ with the sup norm. Notice this is a banach space, so
we have access to the BCT.

Now we want to characterize those $f$ which are differentiable at a point. 
A standard trick is to turn $$\{ f \mid f' \text{ exists} \}$$ into the 
countable pieces $$\bigcup \{ f \mid |f'| \leq n \}$$. Of course, $f'$ is
still hard to talk about in general. So we use this trick _again_
(well, the reciprocal of it), and replace the $\lim_{h \to 0}$ in the
definition of $f'$ by the countably many "$h \leq \frac{1}{k}$"s.

In full, we want to look at the sets

$$
D_{n,k} \triangleq
\left \{
f \ \middle | \ 
\exists x . 
\left \lvert \frac{f(x+h) - f(x)}{h} \right \rvert \leq n 
\text{ for every } 0 \lt |h| \lt \frac{1}{k}
\right \}
$$

As a quick exercise, you should verify that if $f$ is differentiable
at a point, then $f \in D_{n,k}$ for some $n$ and $k$.

A (slightly tedious) argument shows that each $D_{n,k}$ is closed and
nowhere dense, thus meagre. So $\bigcup_{n,k} D_{n,k}$ is meagre
(and thus so is the set of functions differentiable at even one point).

This tells us that most continuous functions are not differentiable anywhere.
<span style="float:right">$\lrcorner$</span>

---

This was supposed to be a shorter, lower effort post, and I definitely 
succeeded in that regard, haha. I was originally going to also prove that
if $f : S^1 \to \mathbb{C}$ is merely continuous, we can't guarantee pointwise
convergence. Indeed, "most functions" diverge at "many points" in the sense
that for any countable dense set of points in $S^1$, we can find
comeagrely many functions in $C(S^1)$ whose fourier series diverge
at every point in that set.

I know there _is_ a BCT argument, but I'm feeling too lazy to come up with
it myself, and all the places I checked proved this by using the 
uniform boundedness principle[^5] (which does indirectly use BCT, but I would 
like to be a bit more explicit in this post).

If someone happens to have an argument on hand, I'd love to hear about it!
Until then, the qual is tomorrow, so wish me luck! Next time will be about
fourier analysis, and it'll be the last post in the series. See you there ^_^.

---

[^1]:
    Or a locally compact hausdorff space

[^2]:
    Though _which_ sets are classified as "small" can differ! 
    There are subsets of the unit interval which have lebesgue measure $1$ 
    despite being meagre.

    The precise differences between the $\sigma$-ideals of meagre and nullsets
    is a topic of some classical interest in descriptive set theory. 
    If we assume [$\mathsf{CH}$][3], then there is an involution on 
    $\mathbb{R}$ which swaps meagre and null sets. See [here][4],
    for instance.

[^3]:
    Again, or a locally compact hausdorff space

[^4]:
    If you've never seen this proven, it's worth doing it yourself at least 
    once! It's not hard, and will help you gain some comfort with the definition
    of meagre.

[^5]:
    See [here][8], for instance.

[1]: https://remydavison.com/
[2]: https://en.wikipedia.org/wiki/Sigma-ideal
[3]: https://en.wikipedia.org/wiki/Continuum_hypothesis
[4]: http://www.artsci.kyushu-u.ac.jp/~ssaito/eng/maths/duality.pdf
[5]: https://math.stackexchange.com/questions/165696/your-favourite-application-of-the-baire-category-theorem
[6]: https://projecteuclid.org/journals/real-analysis-exchange/volume-23/issue-2/Applications-of-the-Baire-Category-Theorem/rae/1337001353.pdf
[7]: https://www.tiktok.com/@butterflyastrophysics
[8]: https://www-users.cse.umn.edu/~garrett/m/fun/notes_2012-13/05b_banach_fourier.pdf
