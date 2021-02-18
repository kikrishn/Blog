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
Here $F_\mu(x)$ represents the total (cumulative) mass we've seen so far.

The measures $\mu_F$ are called [Lebesgue-Stieltjes Measures][7], and they're
extremely concrete. Secretly this post is about manipulating Lebesgue-Stieltjes
measures, and showing exactly how concrete they are[^2].

There's a very important question which we have to ask ourselves now:
How do we actually _compute_ with these measures? For instance,
is there a simple way to evaluate integrals over these measures? 
We've learned a lot about integration in our calculus classes, but do
the techniques carry over to this new setting? If we could relate 
$\mu_F$ to the lebesgue measure $m$ somehow, then we would be able to use
all of our techniques from calculus! Enter the Lebesgue-Radon-Nikodym Theorem:

<div class=boxed markdown=1>
Every measure $\mu$ decomposes as $d \mu = d \lambda + f dm$ where
$\lambda \perp m$

People often write $f = \frac{d \mu}{dm}$, for reasons we will see shortly.
</div>

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

This machinery works for more general measures, but to keep things focused,
let's see what this means for Lebesgue-Stieltjes measures $\mu_F$. 
Moreover, we're not going to say how to integrate against a measure $\lambda$ 
which is mutually singular to $m$. The case of 
(linear combinations of) [dirac measures][8] is quite easy to handle,
but there are lots of [pathologies][9] lurking which I'd rather not talk about.
So, for the rest of this post at least, $F$ will be assumed continuous[^3].

The second question, though, is answered by the following theorem:

<div class=boxed markdown=1>
For a regular measure $\mu$ which decomposes as $d\mu = d\lambda + f dm$,
we see (for $m$-almost every $x$):

$$
\lim_{r \to 0} \frac{\mu(B_r(x))}{m(B_r(x))} = f(x)
$$
</div>

Here, as usual, $B_r(x)$ is the ball of radius $r$ around $x$. This gives
us some control over the function $f$! If we have a good understanding of
what $\mu$ looks like near a point, then we also know what $f$ should be.
We can actually relax this constraint to a family that "shrinks nicely" to $x$, 
though it's still a bit unclear to me what that means and what it buys us.

In the case of Lebesgue-Stieltjes measures, though, this buys us something
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
the special case of Lebesuge-Stieltjes measures, it literally _is_ the 
derivative. You should think of $f = F'$ as being a kind of "density". Then
we can recover our "mass" $\mu_F$ by integrating over $f$.

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
    Again, if you want to see an excellent treatment of the computational
    aspect of this material, "The Lebesgue-Stieltjes Integral: A Practical Introduction"
    should really be your best friend.

[^4]: 
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
