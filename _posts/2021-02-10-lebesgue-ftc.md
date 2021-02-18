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
called that? It doesn't _look_ like a derivative... At least not at first glance.

A big part of my studying process is fitting together the various theorems
into a coherent narrative. It doesn't have to be linear 
(in fact, it typically isn't!), but it should feel like the theorems share
some purpose, and fit together neatly. 
I also struggle to care about theorems before I know what they do. This is
part of why I care so much about examples, and it means the other half of
finding a narrative is understanding what our techniques are used for.

After a fair amount of reading and thinking[^1], I think I've finally fit the 
puzzle pieces together in a way that works for me. Since I wrote it all down 
for myself as part of my studying, I figured I would post it here as well in 
case other people find it useful. Keep in mind this is probably obvious to 
anyone with an analytic mind. It's even obvious to me in hindsight. So I want
to write this up while I still remember what it feels like for this to be 
nonobvious.

Let's get started!

---

To start, we need to remember how to relate functions and measures. Everything
we say here will be in $\mathbb{R}$, and $m$ will be the ($1$-dimensional) 
Lebesgue Measure.

<div class=boxed markdown=1>
  If $F$ is increasing and continuous from the right, then there is a 
  (unique!) regular borel maeasure $\mu_F$ 
  (called the [Lebesgue-Stieltjes Measure][7] associated to $F$)
  so that 

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
except at a countable set (see [here][6] for a proof) and at its countably many
discontinuities, we can force right-continuity by defining 

$$
\tilde{F}(x_0) \triangleq \lim_{x \to x_0^+} F(x)
$$

which agrees with $F$ wherever $F$ is continuous.
If we put our probabilist hat on, we say that $F_\mu$ is the 
<span class="defn">Cumulative Distribution Function</span> of $\mu$. 
Here $F_\mu(x)$ represents the total (cumulative) mass we've seen so far.

It turns out that Lebesgue-Stieltjes measures are extremely concrete[^2], and
a lot of this post is going to talk about computing with them. After all,
it's entirely unclear which (if any!) techniques from a calculus class carry
over when we try to actually integrate against some $\mu_F$. Before we can 
talk about computation, though, we have to recall another (a priori unrelated)
way to relate functions to measures:

<div class=boxed markdown=1>
  Given a positive, locally $L^1$ function $f$, we can define the regular measure $m_f$ by

  $$m_f(E) \triangleq \int_E f dm$$

  Moreover, if $m_f = m_g$, then $f=g$ almost everywhere.
</div>

The locally $L^1$ conditions says that $\int_E f dm$ is finite 
whenever $E$ is bounded. It's not hard to show that this is equivalent to
the regularity of $m_f$, which we'll need shortly.

So we have two ways of converting between measures and functions. It turns out
we can put these together as follows:

$$
f \rightsquigarrow m_f \rightsquigarrow F_{m_f}
$$

How does $f$ relate to $F = F_{m_f}$, though? Well...

$$\int_a^b f dm = \int_{(a,b]} dm_f = F(b) - F(a)$$

So we can view $F$ as a kind of "antiderivative" of $f$! There is still a 
question nagging us, though. We know sending $F \rightsquigarrow \mu_F$ is
faithful, in the sense that $F = F_{\mu_F}$ and $\mu_{F_\mu} = \mu$. We've
now introduced the measure $m_f$, but we didn't say how to recover $f$ 
from $m_f$... Is it even possible? The answer awaits:

<div class=boxed markdown=1>
Lebesgue-Radon-Nikodym Theorem:

Every measure $\mu$ decomposes (uniquely!) as 

$$\mu = \lambda + m_f$$ 

for some measure $\lambda \perp m$ and some function $f$.

Moreover, we can recover $f$ from $\mu$ as[^3]

$$f(x) = \lim_{r \to 0} \frac{\mu(B_r(x))}{m(B_r(x))}$$

for almost every $x$. Here, as usual $B_r(x) = (x-r,x+r)$ is the ball of
radius $r$ about $x$.

People often write $f = \frac{d \mu}{dm}$, and call it the 
<span class="defn">Radon-Nikodym Derivative</span>. Let's see why.
</div>

In the case of Lebesgue-Stieltjes measures, this buys us something
almost magical:

For almost every $x$, we see

$$
\begin{aligned}
f(x) 
&= \lim_{r \to 0} \frac{\mu_F(B_r(x))}{m(B_r(x))} \\
&= \lim_{r \to 0} \frac{F(x+r) - F(x-r)}{x+r - (x-r)} \\
&= \lim_{r \to 0} \frac{F(x+r) - F(x-r)}{2r} \\
&= F'(x)
\end{aligned}
$$

Now we see why we might call this $f$ the Radon-Nikodym _derivative_. In 
the special case of Lebesgue-Stieltjes measures, it literally _is_ the 
derivative. We saw earlier that $F$ acts like an antiderivative of $f$,
and now we see the other direction works too!

This also answers our earlier question about _computing_ with the measures
$\mu_F$! It's easy to integrate against $m_f$, since monotone convergence buys
us $\int g dm_f = \int g \cdot f dm$. 

Then this buys us the (very memorable) formula:

$$\int g d \mu_F = \int g \frac{d \mu_F}{dm} dm$$

and now we're integrating against lebesgue measure, and all our years of 
calculus experience is applicable!

Of course, I've left out an important detail: Whatever happened to that
measure $\lambda$? These are called [singular measures][11], and they can be
pretty [pathological][9]. A good first intuition, though, is to think of them
like [dirac measures][8], and that's the case that we'll focus on in this post[^4].

Ok, so we can decompose $\mu$ in some nice way... what does this really buy us?
In practice, it means we can write 

$$
\int g d \mu = \int g d \lambda + \int g \cdot f dm
$$

The first integral will require some finesse, but the second is just a 
"classical" integral of a product of two functions! So now we're led to two
new (natural) questions: 

 - How do we integrate against $\lambda \perp m$?
 - How do we compute $f$ from $\mu$?


So, as a quick example, say $$F = \begin{cases} 0 & x \leq 0 \\ x^2 & x \geq 0 \end{cases}$$.
Then, for total concreteness:

$$
\int_{-\pi}^\pi \sin(x) d \mu_F = \int_{-\pi}^\pi \sin(x) \cdot F' dm
$$

We can compute $$F' = \begin{cases} 0 & x \leq 0 \\ 2x & x \geq 0 \end{cases}$$, 
so we split up our integral as

$$
\int_{-\pi}^0 \sin(x) \cdot 0 dm + \int_0^\pi \sin(x) \cdot 2x dm
$$

Of course, the first integral is $0$, and the second integral is $2\pi$
(integrating by parts). So then

$$
\int_{-\pi}^\pi \sin(x) d \mu_F = 2\pi
$$

That wasn't so bad, right?

The relationship between $F'$ and $f$ is really exactly as you'd expect.
For instance, let's look at the Lebesgue Differentiation Theorem:

<div class=boxed markdown=1>
For almost every $x$, we have:

$$
\lim_{r \to 0} \frac{1}{m B_r(x)} \int_{B_r(x)} f(t) dm = f(x)
$$
</div>

Why is this called the _differentiation_ theorem? Well, remember
we can associate a function $F$ to any regular borel measure. 
In particular, we can associate a function $F$ to $d \mu = f dm$.

For $x > 0$ (for simplicity), we have $F_\mu(x) = \mu((0,x]) = \int_{(0,x]} f dm$.
So $F_\mu$ is a kind of integral of $f$. Then in this context, what does the
differentiation theorem tell us?

$$
\begin{aligned}
f(x) 
&= \lim_{r \to 0} \frac{1}{m B_r(x)} \int_{B_r(x)} f dm \\
&= \lim_{r \to 0} \frac{1}{(x+r) - (x-r)} \int_{x-r}^{x+r} f dm \\
&= \lim_{r \to 0} \frac{1}{2r} \left ( \int_{0}^{x+r} f dm - \int_{0}^{x-r} f dm \right )\\
&= \lim_{r \to 0} \frac{F_\mu(x+r) - F_\mu(x-r)}{2r} \\
&= F_\mu'(x)
\end{aligned}
$$

So this is giving us part of the fundamental theorem of calculus[^4]! This theorem
(in the case of Lebesgue-Stieltjes measures) says exactly that (for almost every $x$)

$$
\left ( x \mapsto \int_0^x f dm \right )' = f(x)
$$

---

Ok, I hear you saying. There's a really tight connection between 
increasing (right-)continuous functions $F$ on $\mathbb{R}$ and 
positive integrable functions $f$. This connection is at its tightest
wherever $F$ is actually continuous, as then the measures $\mu_F$ and $f dm$
have a derivative relationship, which is reflected in the same derivative
relationship of functions $F' = f$. Not only does this give us a way to 
generalize the notion of derivative to functions that might not normally 
have one, it gives us a concrete way of evaluating Lebesgue-Stieltjes integrals.

But doesn't this feel restrictive? There are lots of functions $F$ which aren't
(right-)continuous or increasing that we might be interested in differentiating. 
There are _also_ lots of nonpositive functions $f$ which we might be interested
in integrating. Since we got a kind of "fundamental theorem of calculus" from
these measure theoretic techniques, if we can show how to apply these techniques
to a broader class of functions, we might be able to get a more general 
fundamental theorem of calculus.

Of course, to talk about more general functions $F$, we'll need to allow
our measures to assign _negative_ mass to certain sets. That's ok, though,
and we can even go so far as to allow _complex_ valued measures! In fact,
from what I can tell, this really is the Raison d'être for signed and 
complex measures. I was always a bit confused why we might care about these
objects, but it's beginning to make more sense.

This post is getting pretty long, though, so we'll talk about the signed
case in a (much shorter, hopefully) part 2!

TODO: say something about dirac measures?

TODO: lebesgue ftc

TODO: say something about how this works for _any_ measures, not just
L-S ones. That gives us a way of "doing calculus" with measures, 
and can make precise the idea that $\delta_0$ is "infinitely dense at $0$",
for example.


---

[^1]:
    I was mainly reading Folland (Ch. 3), since it's the book for the course. 
    I've also been spending time with Terry Tao's lecture notes on the subject
    (see [here][4], and [here][2]), as well as 
    [this][3] PDF from Eugenia Malinnikova's measure theory course
    at Stanford. I read parts of Axler's new book, and while I meant to read
    some of Royden too, I didn't get around to it.

[^2]:
    As an aside, I really can't recommend Carter and van Brunt's 
    "The Lebesgue-Stieltjes Integral: A Practical Introduction" enough. 
    It spends a lot of time on concrete examples of computation, which is
    exactly what many measure theory courses are regrettably missing.
    Chapter 6 in particular is great for this, but the whole book is excellent.

[^3]:
    We can actually relax this from balls $B_r(x)$ to a family $\{E_r\}$ 
    that "shrinks nicely" to $x$, though it's still a bit unclear to me 
    what that means and what it buys us. It seems like one important feature
    is that the $E_r$ don't have to contain $x$ itself. It's enough to take up
    a (uniformly) positive fraction of space near $x$.

[^4]:
    In no small part because I'm not sure how you would actually integrate
    against a singular continuous measure in the wild...

[^5]: 
    There's another way of viewing this theorem which is quite nice. I
    think I saw it on Terry Tao's blog, but now that I'm looking for it I 
    can't find it... Regardless, once we put on our nullset goggles, we
    can no longer evaluate functions. After all, for any particular point
    of interest, I can change the value of my function there without changing
    its equivalence class modulo nullsets. However, even with our nullset 
    goggles on, the integral $\frac{1}{m B_r(x)} \int_{B_r(x)} f dm$ is well 
    defined! So for almost every $x$, we can "evaluate" $f$ through this
    (rather roundabout) approach. The benefit is that this notion of evaluation
    does not depend on your choice of representative!





[1]: https://en.wikipedia.org/wiki/Lebesgue_differentiation_theorem
[2]: https://terrytao.wordpress.com/2009/01/04/245b-notes-1-signed-measures-and-the-radon-nikodym-lebesgue-theorem/
[3]: http://web.stanford.edu/~eugeniam/math205a/L3.pdf
[4]: https://terrytao.wordpress.com/2010/10/16/245a-notes-5-differentiation-theorems/
[5]: https://en.wikipedia.org/wiki/Carath%C3%A9odory%27s_extension_theorem
[6]: https://math.stackexchange.com/questions/84870/how-to-show-that-a-set-of-discontinuous-points-of-an-increasing-function-is-at-m
[7]: https://en.wikipedia.org/wiki/Lebesgue%E2%80%93Stieltjes_integration
[8]: https://en.wikipedia.org/wiki/Dirac_measure
[9]: https://en.wikipedia.org/wiki/Cantor_distribution
[10]: https://en.wikipedia.org/wiki/Bounded_variation
[11]: https://en.wikipedia.org/wiki/Singular_measure
