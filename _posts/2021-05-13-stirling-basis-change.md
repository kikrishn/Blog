---
layout: post
title: Finite Calculus, Stirling Numbers. and Cleverly Changing Basis
tags:
  - 
---

I'm TAing a linear algebra class right now, and the other day a student came
to my office hours asking about the homework. Somehow during this discussion
I had a flash of inspiration that, if I ever teach a linear algebra class of
my own, I would want to use as an example of changing basis "in the wild". 
When I took linear algebra, all the example applications were to diagonalization
and differential equations -- but I"m mainly a discrete mathematician, and I 
would have appreciated something a bit closer to my own wheelhouse.

The observation in this post was first pointed out in a combinatorics class
I took with [Clinton Conley][1]. I was aware of the theorem, but I hadn't 
thought of it as a change of basis theorem until that point. I remember feeling
like this was incredibly obvious, and simultaneously quite enlightening. I hope
you all feel the same way about it ^_^. At the very least, this will be a nice 
change of pace from all the thinking I've been doing about power series 
(which should be a follow up to [my post][2] the other day) as well as a few 
other tricky things I'm working on. It's nice to talk about something 
(comparatively) easy for a change!

---

Let's take a second to talk about [finite calculus][3]. That wikipedia link
is only so-so (at least at the time of writing), but there's a great intro 
by David Gleich [here][4] and you can read more in 
Knuth, Graham, and Patashnik's _Concrete Mathematics_ (Ch 2.6) as well as
the (encyclopedic) _Calculus of Finite Differences_ by Jordan[^1].

There's a lot to say, but the tl;dr is this: 
Finite Calculus's raison dêtre is to compute sums with the same facility
we compute integrals (and indeed, with analogous tools). If you've ever
been mystified by [Summation by Parts][5][^2], you've already encountered 
part of this machinery.

We start with discrete differentiation:

<div class=boxed markdown=1>
  For a function $f$, we define $\Delta f$ 
  (the <span class="defn">Forward Difference</span> of $f$) to be

  $$\Delta f = \frac{f(x+1) - f(x)}{1} = f(x+1) - f(x).$$

  Obviously most people write it the second way, but I like to show the 
  first to emphasize the parallel with the classical derivative.
</div>

This satisfies all the nice rules you might want a "derivative" to satisfy:

<div class=boxed markdown=1>
Write $(Eg)(x) = g(x+1)$ for the "shift" operator.

As an exercise, show the following:

$$
\begin{align}
  \text{(Linearity)} && \Delta(\alpha f + \beta g) &= \alpha \Delta f + \beta \Delta g \\
  \text{(Leibniz)}   && \Delta(f \cdot g)          &= (\Delta f) \cdot g + f \cdot (\Delta g) + (\Delta f) \cdot (\Delta g) \\
  \text{(Leibniz 2)} && \Delta(f \cdot g)          &= (\Delta f) \cdot (Eg) + f \cdot (\Delta g) \\
\end{align}
$$

If (Leibniz 2) looks silly, that's because it is. It's nice to have, because
it's easier to use in summation by parts, but the fact that the left hand side
is symmetric in $f$ and $g$ while the right hand side isn't is... offputting.

I used to stress out trying to remember where the $E$ went, until I realized
the formula _really is_ symmetric (since the left hand side is), so I can put
the $E$ on either $f$ or $g$ without worrying. From that day forward I never
forgot the summation by parts formula.

As a tricky challenge, can you find a quotient rule? 

As a _very_ tricky challenge, can you find a chain rule[^3]? 
</div>

We also get a fundamental theorem of calculus (with a _much_ easier proof!):

<div class=boxed markdown=1>
Theorem (Fundamental Theorem of Finite Calculus):

$$\sum_a^b \Delta f = f(b+1) - f(a)$$
</div>

This gives summation by parts as an easy corollary: just sum both sides of
Leibniz 2 above.

---

Of course, these give us ways of _combining_ facts we already know. In a 
calculus class we have a toolbox of "basic" functions that we know how to 
differentiate. Are there any such functions here? The answer is _yes_, and
that leads us to the linear algebraic point of this post!

<div class=boxed markdown=1>
Define the <span class="defn">$n$th falling power</span> to be

$$x^{\underline{n}} = (x-0) (x-1) (x-2) \cdots (x-(n-1))$$

(at least when $n \gt 0$).
</div>

Then we have the following "power rule" for forward differences:

<div class=boxed markdown=1>
$$\Delta x^{\underline{n}} = n x^{\underline{n-1}}$$
</div>

There are other "fundamental" forward differences worth knowing as well. 
Here's a few to have in your pocket:

- $\Delta 2^x = 2^x$
- More generally, $\Delta r^x = (r-1) r^x$
- $\Delta \binom{x}{n} = \binom{x}{n-1}$
- If we define $x^{\underline{0}} = 1$ and $x^{\underline{-n}} = \frac{1}{(x+1)(x+2)\cdots(x+m)}$, then the power rule continues to work.
- $\Delta H_x = x^{\underline{-1}}$, where $H_x$ are the [harmonic numbers][8]

<div class=boxed markdown=1>
  As a (fun?) exercise, use these to compute

  - $\sum_a^b r^x$
  - $\sum_a^b x^{\underline{k}}$
  - $\sum_a^b x 2^x$
  - $\sum_a^b x H_x$
</div>

---

This is great, but we don't often see $x^{\underline{k}}$ in the wild. 
Most of the time we want to sum the "classical" $x^k$. Surely finite calculus
won't be useful here!

Now it's time for the main point of this post: We know the space of polynomials
has a standard basis $$\{x^0, x^1, x^2, x^3, \ldots \}$$. But notice the 
polynomials $$\{x^\underline{0}, x^\underline{1}, x^\underline{2}, x^\underline{3}, \ldots \}$$
is _also_ a basis! After all, we still get one basis element in each degree.

Now we see the idea! Given a polynomial $p = \sum p_i x^i$, we can compute
$\sum_a^b p$ by first rewriting $p = \sum \tilde{p_i} x^\underline{i}$,
then applying finite calculus to this sum to find that

$$\sum_a^b p = \sum \tilde{p_i} \left . \frac{x^\underline{i+1}}{i+1} \right |_a^{b+1}$$

For instance, once we know $x^2 = x^\underline{2} + x^\underline{1}$, we can
compute 

$$
\sum_1^n x^2 
= \sum_1^n x^\underline{2} + x^\underline{1} 
= \left . \frac{x^\underline{3}}{3} + \frac{x^\underline{2}}{2} \right |_1^{n+1} 
= \frac{(n+1)^\underline{3} - 1^\underline{3}}{3} + \frac{(n+1)^\underline{2} - 1^\underline{2}}{2}
$$

You can check (with sage, say) that this agrees with the [usual formula][9].

---

Ok. So at this point we can tell that this alternate basis is useful for
computing these sums (this is the point that I would drive home to my hypothetical students). 
How do we actually _change_ basis though? If you give me some polynomial written
in terms of $x^i$, how can I figure out how to represent it using the $x^\underline{i}$?

Enter, rather magically, the [stirling numbers][10].

---

[^1]:
    This book is actually _super_ cool. It's fairly old, and that shows in the
    language (which can be kind of hard to read sometimes). What's really cool,
    though, is that it's written for working statisticians in a pre-computer 
    era. So there's a ton of pages with detailed tables, and a ton _more_ 
    pages about how to go about making your own tables should you need some
    family of constants that isn't included. Obviously I'll never have use
    for those particular skills, so I haven't read those parts too closely,
    but I find it _so_ interesting to see how things like that used to be done!

[^2]:
    And who among us _wasn'T_ when we first heard about it? I remember seeing it
    in Baby Rudin, at which point I got really excited. Then really confused.
    Then (after some deep thinking) really excited again. It took me a long time
    to understand some quirks of the formula, though.

[^3]:
    I'm not sure if there's a good answer to this one, actually. There's an 
    mse question about it [here][6], but it's pretty unsatisfying. 

    If you'll indulge me in some philosophical waxing: The
    classical chain rule witnesses the functoriality of the derivative
    (really functoriality of the [tangent bundle][7], but the induced map on
    tangent bundles is exactly the derivative). I'm curious if the nonexistence
    of a nice chain rule for us comes down to the fact that this isn't actually
    a functorial thing to do... I would think about it more, but I'm trying to
    keep this post somewhat low-effort. I would love to hear someone else's
    thoughts on this, though.

[1]: https://www.math.cmu.edu/~clintonc/
[2]: /2021/05/05/initial-polynomial-proofs
[3]: https://en.wikipedia.org/wiki/Finite_difference
[4]: https://www.cs.purdue.edu/homes/dgleich/publications/Gleich%202005%20-%20finite%20calculus.pdf
[5]: https://en.wikipedia.org/wiki/Summation_by_parts
[6]: https://math.stackexchange.com/questions/235680/chain-rule-for-discrete-finite-calculus
[7]: https://en.wikipedia.org/wiki/Tangent_bundle
[8]: https://en.wikipedia.org/wiki/Harmonic_number
[9]: https://math.stackexchange.com/questions/48080/sum-of-first-n-squares-equals-fracnn12n16
[10]: https://en.wikipedia.org/wiki/Stirling_numbers_of_the_second_kind
