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
part of this machinery. I won't go into much detail in this post, because
I want to keep this short. But I highly encourage you to look into it if 
you spend a lot of time computing sums. Nowadays I mainly use
[sage](https://sagemath.org), but it's nice to know how to do some of these
things by hand.

We start with discrete differentiation:

<div class=boxed markdown=1>
  For a function $f$, we define $\Delta f$ 
  (the <span class="defn">Forward Difference</span> of $f$) to be

  $$\Delta f = \frac{f(x+1) - f(x)}{1} = f(x+1) - f(x).$$

  Obviously most people write it the second way, but I like to show the 
  first to emphasize the parallel with the classical derivative.
</div>

This satisfies variants of the nice rules you might want a "derivative" to satisfy:

<div class=boxed markdown=1>
As an exercise, show the following[^4]:

$$
\begin{align}
  \text{(Linearity)}   && \Delta(\alpha f + \beta g) &= \alpha \Delta f + \beta \Delta g \\
  \text{(Leibniz)} && \Delta(f \cdot g)          &= (\Delta f) \cdot g + f \cdot (\Delta g) + (\Delta f) \cdot (\Delta g) \\
\end{align}
$$

As a tricky challenge, can you find a quotient rule? 
As a _very_ tricky challenge, can you find a chain rule[^3]? 
</div>

We also get a fundamental theorem of calculus (with a _much_ easier proof!):

<div class=boxed markdown=1>
Theorem (Fundamental Theorem of Finite Calculus):

$$\sum_a^b \Delta f = f(b+1) - f(a)$$
</div>

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

Then we have the following "power rule" for forward differences[^5]:

<div class=boxed markdown=1>
$$\Delta x^{\underline{n}} = n x^{\underline{n-1}}$$
</div>

This plus the fundamental theorem lets us quickly compute 
"falling polynomials". As an example:

$$
\begin{align}
\sum_a^b 4 x^\underline{3} - 2 x^\underline{2} + 4
&= \sum_a^b 4 x^\underline{3} - \sum_a^b 2 x^\underline{2} + \sum_a^b 4 \\
&= \sum_a^b \Delta x^\underline{4} 
- \frac{2}{3} \sum_a^b \Delta x^\underline{3} 
+ 4 \sum_a^b \Delta x^\underline{1} \\
&= \left . x^\underline{4} - \frac{2}{3} x^\underline{3} + 4 x^\underline{1} \right |_a^b \\
&= \left ( (b+1)^\underline{4} - a^\underline{4} \right )
- \frac{2}{3} \left ((b+1)^\underline{3} - a^\underline{3} \right )
+ 4 \left ( (b+1) - a \right )
\end{align}
$$

This is great, but we don't often see $x^{\underline{k}}$ in the wild. 
Most of the time we want to sum "classical" polynomials with terms like $x^k$. 
If only we had a way to easily convert back and forth between "classical" 
polynomials and "falling" polynomials...

Of course, that's the punchline! We know the space of polynomials
has a standard basis $$\{x^0, x^1, x^2, x^3, \ldots \}$$. But notice the 
polynomials $$\{x^\underline{0}, x^\underline{1}, x^\underline{2}, x^\underline{3}, \ldots \}$$
_also_ form a basis! 

<div class=boxed markdown=1>
If this isn't obvious, you should do it as an easy exercise. As a hint, 
what is the degree of each $x^\underline{n}$?
</div>

And now we have a very obvious reason to care about change of basis, which
I think a lot of young mathematicians would appreciate. I think there's a lot
of good pedagogy that one can do with this, since the new basis isn't contrived
(it comes naturally out of a desire to compute sums), and it's an easy to 
understand example. Plus it's obvious that we're representing the 
_same polynomial_ in multiple ways. In my experience a lot of students struggle
with the idea that changing bases doesn't actually change the vectors themselves,
only the names we give them (i.e., their coordinates). This gives us an 
understandable example of that.

As a sample exercise, we might ask our students to compute 
$\sum_{x=1}^N x^2$. Once they know $x^2 = x^\underline{2} + x^\underline{1}$, 
(which can be worked out by hand without much effort) they can compute 

$$
\sum_1^n x^2 
= \sum_1^n x^\underline{2} + x^\underline{1} 
= \left . \frac{x^\underline{3}}{3} + \frac{x^\underline{2}}{2} \right |_1^{n+1} 
= \frac{(n+1)^\underline{3} - 1^\underline{3}}{3} + \frac{(n+1)^\underline{2} - 1^\underline{2}}{2}
$$

They can then check (with sage, say) that this agrees with the [usual formula][9].

---

At this point, we're probably sold on the idea that this alternate basis is
useful for computing these sums. But it's not yet clear how effective this is. 
If I ask you to compute, say, $\sum_a^b x^5$, how would you go about doing it?
We need to know how to actually _compute_ this change of basis[^6]. 

Enter the [stirling numbers][10]. There's a lot of very pretty combinatorics
here, but let's focus on what's relevant for our linear algebra. 
We write ${n \brace k}$ for the "stirling numbers of the second kind", and 
it turns out that

$$x^n = \sum_k {n \brace k} x^\underline{k}$$

which is almost usable! All we need now is a way to quickly compute 
${n \brace k}$. Thankfully, there's actually an analogue of Pascal's Triangle
that works for these coefficients!

We start with a $1$.

$$1$$

Just like pascal's triangle, we have $1$s down the outside, and we build 
the $n+1$th row by adding the two terms from the previous row which you 
sit between.

The only difference is the stirling numbers keep track of what _column_ you're
in as well. Concretely, the recurrence is

$${n+1 \brace k} = {n \brace k-1} + k {n \brace k}$$

So you add the number above you and to your left to $k$ times the number
above you and to your right. You increase $k$ with every step. Let's do some
sample rows together: 

Say our previous row was

$$1 \quad 7 \quad 6 \quad 1$$

Then our next row will be

$$
{\color{blue}1} 
\quad 
1 + {\color{blue}2} \times 7 
\quad 
7 + {\color{blue}3} \times 6 
\quad 
6 + {\color{blue}4}  \times 1 
\quad 
1
$$

which is, of course

$$1 \quad 15 \quad 25 \quad 10 \quad 1.$$

Then the next row will be

$$
1 
\quad 
1 + {\color{blue}2} \times 15 
\quad 
15 + {\color{blue}3} \times 25 
\quad 
25 + {\color{blue}4} \times 10 
\quad 
10 + {\color{blue}5} \times 1 
\quad 
1
$$

In the above example you can see the blue multiplier is just increasing by $1$
each time. We're always combining the two entries above the current one, just
like in pascal's version.

<br>

Finally, to be super clear, if we know the $4$th row of our triangle is

$$1 \quad 7 \quad 6 \quad 1$$ 

that tells us that 

$$x^4 = x^\underline{4} + 7 x^\underline{3} + 6 x^\underline{2} + x^\underline{1}.$$

<div class=boxed markdown=1>
There's no substitute for doing: As an exercise, you should write out the
first $10$ or so rows of the triangle. Use this to compute $\sum_a^b x^5$.
</div>

Another good exercise I might give students one day is to 
explicitly write down change of basis matrices for, say, polynomials of degree
$4$. This more or less amounts to writing the above triangle as a matrix,
but hopefully it will give students something to play with to better understand
how the change of basis matrices interact with the vectors. 

I really think this example has staying power throughout the course as well.
Once we know $\Delta$ is linear, we know it must have a representation as a
matrix. Computing that representation in the falling power basis and in the
standard basis would be another good exercise. One could also introduce
[indefinite summation][11] (say by picking constant term $0$).
Again, we know what its matrix looks like in the falling powers basis,
but it's not at all clear what it looks like in the standard basis. 
After conjugating by a change of basis matrix, though, we can figure this
out! And the cool thing? Next time you want to compute a sum, you can just
multiply by (a big enough finite part) of this matrix and evaluate at the 
endpoints!

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
    And who among us _wasn't_ when we first heard about it? I remember seeing it
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

[^4]:
    This actually isn't how you often see the leibniz rule written. Even though
    it's objectively better than the alternative. Almost every reference I've
    seen writes the leibniz rule as

    $$\Delta(f \cdot g) = (\Delta f) \cdot (Eg) + f \cdot (\Delta g)$$

    where $(Eg)(x) = g(x+1)$ is the "shift operator".

    I assume this is because summing both sides of this equation gives
    the summation by parts formula, but the fact that the left hand side
    is symmetric in $f$ and $g$ while the right hand side isn't is... offputting.

[^5]:
    There are other "fundamental" forward differences worth knowing as well. 
    Here's a few to have in your pocket:

    - $\Delta 2^x = 2^x$
    - More generally, $\Delta r^x = (r-1) r^x$
    - $\Delta \binom{x}{n} = \binom{x}{n-1}$
    - If we define $x^{\underline{0}} = 1$ and $x^{\underline{-n}} = \frac{1}{(x+1)(x+2)\cdots(x+n)}$, then the power rule continues to work.
    - $\Delta H_x = x^{\underline{-1}}$, where $H_x$ are the [harmonic numbers][8]

[^6]:
    This is the kind of thing that I would probably just tell my 
    hypothetical students, but I might post a video or send them a blog 
    post where I go through it in detail as extra material for anyone 
    who's interested. Introducing stirling numbers and proving properties
    about them is really the regime of a combinatorics class, but I think
    it doesn't take too much time to show them the analogue of pascal's 
    triangle so that they can actually _use_ this technique should the need
    arise.




[1]: https://www.math.cmu.edu/~clintonc/
[2]: /2021/05/05/initial-polynomial-proofs
[3]: https://en.wikipedia.org/wiki/Finite_difference
[4]: https://www.cs.purdue.edu/homes/dgleich/publications/Gleich%202005%20-%20finite%20calculus.pdf
[5]: https://en.wikipedia.org/wiki/Summation_by_parts
[6]: https://math.stackexchange.com/questions/235680/chain-rule-for-discrete-finite-calculus
[7]: https://en.wikipedia.org/wiki/Tangent_bundle
[8]: https://en.wikipedia.org/wiki/Harmonic_number
[9]: https://math.stackexchange.com/questions/48080/sum-of-first-n-squares-equals-fracnn12n16
[10]: https://en.wikipedia.org/wiki/Stirling_number
[11]: https://en.wikipedia.org/wiki/Indefinite_sum
