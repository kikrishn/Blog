---
layout: post
title: Measure Theory and Differentiation (Part 1)
tags:
  - measure-theory-and-differentiation
  - analysis-qual-prep
---

So I had an analysis exam <s>yesterday</s> <s>last week</s> a while ago 
(this post took a bit of time to finish writing). It roughly covered the material in
chapter 3 of Folland's "Real Analysis: Modern Techniques and Their Applications".
I'm decently comfortable with the material, but a lot of it has always felt 
kind of unmotivated. For example, why is the [Lebesgue Differentiation Theorem][1]
called that? It doesn't _look_ like a derivative... At least not at first glance.

A big part of my studying process is fitting together the various theorems
into a coherent narrative. It doesn't have to be linear 
(in fact, it typically isn't!), but it should feel like the theorems share
some purpose, and fit together neatly. 
I also struggle to care about theorems before I know what they do. This is
part of why I care so much about examples -- it's nice to know what problems
a given theorem solves.

After a fair amount of reading and thinking[^1], I think I've finally fit the 
puzzle pieces together in a way that works for me. Since I wrote it all down 
for myself as part of my studying, I figured I would post it here as well in 
case other people find it useful. Keep in mind this is probably obvious to 
anyone with an analytic mind, but it certainly wasn't obvious to me!

Let's get started!

---

To start, we need to remember how to relate functions and measures. Everything
we say here will be in $\mathbb{R}$, and $m$ will be the ($1$-dimensional) 
Lebesgue Measure.

<div class=boxed markdown=1>
  If $F$ is increasing and continuous from the right, then there is a 
  (unique!) regular borel measure $\mu_F$ 
  (called the [Lebesgue-Stieltjes Measure][7] associated to $F$)
  so that 

  $$
  \mu_F((a,b]) = F(b) - F(a)
  $$

  Moreover, given any regular borel measure $\mu$ on $\mathbb{R}$, the function

  $$
  F_\mu \triangleq 
  \begin{cases}
     \mu((0,x]) & x \gt 0 \\
    0           & x = 0 \\
    -\mu((x,0]) & x \lt 0
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

It turns out that Lebesgue-Stieltjes measures are extremely concrete, and
a lot of this post is going to talk about computing with them[^2]. After all,
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

Something is missing from the above theorem, though.
We know sending $F \rightsquigarrow \mu_F$ is
faithful, in the sense that $F = F_{\mu_F}$ and $\mu_{F_\mu} = \mu$. We've
now introduced the measure $m_f$, but we didn't say how to recover $f$ 
from $m_f$... Is it even possible? The answer is yes, as a corollary of a
much more powerful result:

<div class=boxed markdown=1>
<span class="defn">Lebesgue-Radon-Nikodym Theorem</span>

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

In the case $\mu = m_f$, then this shows us how to recover 
$f$ (uniquely) from $m_f$, and life is good: 

$$\frac{d m_f}{dm} = f$$

The converse needs a ~bonus condition~. In order to say 
$\mu = m_{\frac{d\mu}{dm}}$, we need to know that $\mu$ is 
[absolutely continuous][12] with respect to $m$, written $\mu \ll m$.

<div class=boxed markdown=1>
As an exercise, do you see why this condition is necessary? If
$\mu \not \ll m$, why don't we have a chance of writing $\mu = m_f$
for any $f$? 
</div>

In the case of Lebesgue-Stieltjes measures, Lebesgue-Radon-Nikodym buys us 
something almost magical. For almost every $x$, we see:

$$
\begin{aligned}
\frac{d\mu_F}{dm}(x)
&= \lim_{r \to 0} \frac{\mu_F(B_r(x))}{m(B_r(x))} \\
&= \lim_{r \to 0} \frac{F(x+r) - F(x-r)}{x+r - (x-r)} \\
&= \lim_{r \to 0} \frac{F(x+r) - F(x-r)}{2r} \\
&= F'(x)
\end{aligned}
$$

Now we see why we might call this $f$ the Radon-Nikodym _derivative_. In 
the special case of Lebesgue-Stieltjes measures, it literally _is_ the 
derivative. It's immediate from the definitions that 
$F = F_{m_f}$ acts like an antiderivative of $f$, since
$F_{m_f}(x) = \int_0^x f\ dm$. 
Now we see $f = \frac{d \mu_F}{dm}$ works as a derivative of $F$ as well!

In fact, we can push this even further! Let's take a look at the 
<span class="defn">Lebesgue Differentiation Theorem</span>

<div class=boxed markdown=1>
For almost every $x$, we have:

$$
\lim_{r \to 0} \frac{1}{m B_r(x)} \int_{B_r(x)} f(t) dm = f(x)
$$
</div>

Why is this called the _differentiation_ theorem? 
Let's look at $F_{m_f}$, which you should remember is a kind of antiderivative
for $f$.

For $x > 0$ (for simplicity), we have $F_{m_f}(x) = m_f((0,x]) = \int_{(0,x]} f dm$.
If we rewrite the theorem in terms of $F_{m_f}$, what do we see?

$$
\begin{aligned}
f(x) 
&= \lim_{r \to 0} \frac{1}{m B_r(x)} \int_{B_r(x)} f dm \\
&= \lim_{r \to 0} \frac{1}{(x+r) - (x-r)} \int_{x-r}^{x+r} f dm \\
&= \lim_{r \to 0} \frac{1}{2r} \left ( \int_{0}^{x+r} f dm - \int_{0}^{x-r} f dm \right )\\
&= \lim_{r \to 0} \frac{F_{m_f}(x+r) - F_{m_f}(x-r)}{2r} \\
&= F_{m_f}'(x)
\end{aligned}
$$

So this is giving us part of the fundamental theorem of calculus[^4]! This theorem
(in the case of Lebesgue-Stieltjes measures) says exactly that (for almost every $x$)

$$
\left ( x \mapsto \int_0^x f dm \right )' = f(x)
$$

Let's take a moment to summarize the relationships we've seen. Then we'll
use these relationships to actually _compute_ with Lebesgue-Stieltjes integrals.

<div class=boxed markdown=1>
$$
 \bigg \{ \text{increasing, right-continuous functions $F$} \bigg \}
 \leftrightarrow
 \bigg \{ \text{regular borel measures $\mu_F$} \bigg \}
$$

$$
  \bigg \{ \text{positive locally $L^1$ functions $f$} \bigg \}
  \leftrightarrow
  \bigg \{ \text{regular borel measures $m_f \ll m$} \bigg \}
$$

Moreover:

 - By considering $F_{m_f}$ we see functions of the first kind are antiderivatives
of functions of the second kind.

 - By considering $\frac{d \mu_F}{dm}$, we see functions of the second kind
are (almost everywhere) derivatives of functions of the first kind.

 - Indeed, $\frac{d \mu_F}{dm} = F'$ almost everywhere.

 - And $F_{m_f}' = f$ almost everywhere.
</div>

---

Why should we care about these theorems? Well, Lebesgue-Stieltjes integrals
arise fairly regularly in the wild, and these theorems let us actually 
compute them! It's easy to integrate against $m_f$, since monotone convergence 
gives us $\int g dm_f = \int g f dm$. 

Then this buys us the (very memorable) formula:

$$\int g d \mu_F = \int g \frac{d \mu_F}{dm} dm = \int g F' dm$$

and now we're integrating against lebesgue measure, and all our years of 
calculus experience is applicable!

Of course, I've left out an important detail: Whatever happened to that
measure $\lambda$? 
The above formula is true exactly when $F$ is continuous everywhere. At points
where it is _discontinuous_ we need to change it slightly by using
$\lambda$. These are called [singular measures][11], and they can be
pretty [pathological][9]. A good first intuition, though, is to think of them
like [dirac measures][8], and that's the case that we'll focus on in this post[^5].

Let's write $$H = \begin{cases} 0 & x \lt 0 \\ 1 & 0 \leq x \end{cases}$$.
This us usually called the <span class="defn">heaviside function</span>.

<img src="/assets/images/lebesgue-ftc-1/heaviside.png">

Recall our interpretation of this function: $H(x)$ is supposed to 
represent the mass of $(-\infty, x]$. So as we scan from left to right,
we see the mass is constantly $0$ until we hit the point $0$. Then suddenly
we jump up to mass $1$. But once we get there, our mass stays constant again.

So $H$ thinks that $0$ has mass $1$ all by itself, and thinks that there's
no other mass at all! 

Indeed, we see that

$$
\mu_H((a,b]) = H(b) - H(a) = \begin{cases} 1 & 0 \in (a,b] \\ 0 & 0 \not \in (a,b] \end{cases}
$$

So $\mu_H$ is just the dirac measure at $0$ (or $\delta_0$ to its friends)!
Notice this lets us say the "derivative" of $H$ is $\delta_0$, by analogy
with the Lebesgue-Stieltjes case. Or conversely, that $H$ is the 
"antiderivative" of $\delta_0$. This shows us that recasting calculus in
this language actually buys us something new, since there's no way to make
sense of $\delta_0$ as a traditional function.

It's _finally_ computation time! Since we know $\int g d\delta_0 = g(0)$, 
and (discrete) singular measures look like (possibly infinite) linear 
combinations of dirac measures, this lets us compute
all increasing right-continuous Lebesgue-Stieltjes measures that are likely
to arise in practice. Let's see some examples! If you want to see more,
you really should look into Carter and van Brunt's 
"The Lebesgue-Stieltjes Integral: A Practical Introduction". I mentioned
it in a footnote earlier, but it really deserves a spotlight. It's full of
concrete examples, and is extremely readable!

---

Let's start with a continuous example. Say 
$$F = \begin{cases} 0 & x \leq 0 \\ x^2 & x \geq 0 \end{cases}$$.

<img src="/assets/images/lebesgue-ftc-1/example1.png">

So $\mu_F$ should think that everything is massless until we hit $0$. 
From then on, we start gaining mass faster and faster as we move to the right.
If you like, larger points are "more dense" than smaller ones, and thus 
contribute more mass in the same amount of space.

Say we want to compute

$$
\int_{-\pi}^\pi \sin(x) d \mu_F = \int_{-\pi}^\pi \sin(x) \cdot F' dm
$$

We can compute $$F' = \begin{cases} 0 & x \leq 0 \\ 2x & x \geq 0 \end{cases}$$, 
so we split up our integral as

$$
\int_{-\pi}^0 \sin(x) \cdot 0 dm + \int_0^\pi \sin(x) \cdot 2x dm
$$

But both of these are integrals against lebesgue measure $m$! So these are
just "classical" integrals, and we can use all our favorite tools.
So the first integral is $0$, and the second integral is $2\pi$ 
(integrating by parts). This gives

$$
\int_{-\pi}^\pi \sin(x) d \mu_F = 2\pi
$$

That wasn't so bad, right?

---

Let's see another, slightly trickier one. Let's look at 
$$F = \begin{cases} x & x \lt 0 \\ e^x & x \geq 0 \end{cases}$$

<img src="/assets/images/lebesgue-ftc-1/example2.png">

You should think through the intuition for what $\mu_F$ looks like. 
You can then test your intuition against a computation:

$$\mu_F = \lambda + m_f$$

In the previous example, $\lambda$ was the $0$ measure since our function
was differentiable everywhere. Now, though, we aren't as lucky. Our 
function $F$ is not differentiable at $0$, so we will have to work with
some nontrivial $\lambda$.

Let's start with the places $F$ _is_ differentiable. This gives us the
density function $$f = F' = \begin{cases} 1 & x \lt 0 \\ e^x & x \gt 0 \end{cases}$$.

We can also see the point $0$ has mass $1$. In this case we can more or less
read this off the graph (since we have a discontinuity where we jump up by $1$),
but in more complex examples we would compute this by using
$\mu_F(\{ 0 \}) = \lim_{r \to 0^+} F(r) - F(-r)$. You can see that this 
does give us $1$ in this case, as expected. So we see (for $f$ as before)

$$
\mu_F = \delta_0 + m_f
$$

So to compute

$$
\int_{-1}^1 4 - x^2 d\mu_F = 
\int_{-1}^1 4 - x^2 d(\delta_0 + m_f) =
\int_{-1}^1 4 - x^2 d \delta_0 + \int_{-1}^1 (4 - x^2)f dm
$$

we can handle the $\delta_0$ part and the $f dm$ part separately!

We know how to handle dirac measures:

$$
\int_{-1}^1 4 - x^2 d \delta_0 = 
\left . (4 - x^2) \right |_{x = 0} = 4
$$

And we also know how to handle "classical" integrals:

$$
\int_{-1}^1 (4 - x^2) f dm =
\int_{-1}^0 (4 - x^2) dm + \int_0^1 (4 - x^2) e^x dm =
\frac{11}{3} + (3e-2)
$$

So all together, we get $$\int_{-1}^1 4 - x^2 d\mu_F = 4 + \frac{11}{3} + (3e-2)$$.

<div class=boxed markdown=1>
As an exercise, say 
$$F = \begin{cases} e^{3x} & x \lt 0 \\ 2 & 0 \leq x \lt 1 \\ 2x+1 & 1 \leq x \end{cases}$$

Can you intuitively see how $\mu_F$ distributes mass? 

Can you compute 

$$\int_{-\infty}^2 e^{-2x} d\mu_F$$
</div>

<div class=boxed markdown=1>
As another exercise, can you intuit how $\mu_F$ distributes mass when
$F(x) = \lfloor x \rfloor$ is the floor function?

What is $\int_1^\infty \frac{1}{x^2} d\mu_F$? What about $\int_1^\infty \frac{1}{x} d\mu_F$?
</div>


---

Ok, I hear you saying. There's a really tight connection between 
increasing (right-)continuous functions $F$ on $\mathbb{R}$ and 
positive integrable functions $f$. This connection is at its tightest
wherever $F$ is actually continuous, as then the measures $\mu_F$ and $m_f$
have a derivative relationship, which is reflected in the same derivative
relationship of functions $F' = f$. Not only does this give us a way to 
generalize the notion of derivative to functions that might not normally 
have one (as in the case of the heaviside function and the dirac delta), 
it gives us a concrete way of evaluating Lebesgue-Stieltjes integrals.

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
from what I can tell, this really is the raison d'être for signed and 
complex measures. I was always a bit confused why we might care about these
objects, but it's beginning to make more sense.

This post is getting pretty long, though, so we'll talk about the signed
case in a (much shorter, hopefully) part 2!

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

[^5]:
    In no small part because I'm not sure how you would actually integrate
    against a singular continuous measure in the wild...





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
[12]: https://en.wikipedia.org/wiki/Absolute_continuity#Absolute_continuity_of_measures
