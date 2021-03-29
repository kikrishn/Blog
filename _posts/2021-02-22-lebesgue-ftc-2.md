---
layout: post
title: Measure Theory and Differentiation (Part 2)
tags:
  - analysis
---

TODO: Say somewhere that we're working on $\mathbb R$

It's the start of a new quarter, and I'm flying back to california from
pittsburgh. It's been a great 2 weeks, and I'm _super_ happy I was able to see
so many people I love. Now that I'm in an airport for a few hours, though, 
I thought I'd write up the second half of this post. If you haven't read part 1,
you can find it [here](/2021/02/21/lebesgue-ftc-1.html). As a quick recap:

We talked about two ways of associating (regular, borel) measures to functions:

 - To an increasing, right continuous $F$ we associate the measure $\mu_F$
    defined by $\mu_F((a,b]) \triangleq F(b) - F(a)$. In the special case where
    $F$ is the identity function, we get Lebesgue Measure $m$ from this construction.
 - To a positive, locally $L^1$ function $f$ we associate the measure $m_f$
    defined by $m_f(E) \triangleq \int_E f\ dm$.

One really cool and useful fact is that we can go the _other_ way too!

 - Given a measure $\lambda$, we can define a function $F_\lambda$ so that $\mu_{F_\lambda} = \lambda$
 - Given a measure $\lambda \ll m$, we can find a function $f_\lambda$ so that $m_{f_\lambda} = \lambda$

These facts together give us a correspondence 
<div class=boxed markdown=1>
$$
 \bigg \{ \text{increasing, right-continuous functions $F$} \bigg \}
 \longleftrightarrow
 \bigg \{ \text{regular borel measures $\mu_F$} \bigg \}
$$

$$
  \bigg \{ \text{positive locally $L^1$ functions $f$} \bigg \}
  \longleftrightarrow
  \bigg \{ \text{regular borel measures $m_f \ll m$} \bigg \}
$$
</div>

One useful piece of intuition to have is that measures of the second kind act
like _derivatives_ of measures of the first kind. Indeed, if $F$ is differentiable
everywhere, then when we do the following maneuver:

TODO: find a good way to say $F \rightsquigarrow \mu_F = m_f + \lambda$

We find $f = F'$.

This gives us a way to say that certain measures are "derivatives" of functions.
For instance, the [dirac delta measure][3] is like a derivative of the 
[heaviside function][4]. Indeed if $H$ is the heaviside function, then 
$\mu_H = m_0 + \delta$. 

Moreover, it gives us an elegant way of showing certain differentiability results.
Consider the following theorem, for which no elementary method is known 
(cf. [here][1])! 

TODO: fact check that

<div class=boxed markdown=1>
  All monotone functions are differentiable a.e.
</div>

$\ulcorner$
Let $F$ be monotone. Without loss of generality, we can assume $F$
is increasing (otherwise we consider $-F$).

Since $F$ is monotone, it can only be discontinuous in countably
many places. Then by redefining $F$ on these countably many points
we can assume $F$ is continuous from the right. Note that this new $F$
is equal to our original $F$ almost everywhere.

But now $F$ is increasing and right-continuous, so has an associated 
measure $\mu_F$. Applying Lebesgue-Radon-Nikodym, we see 
$\mu_F = m_f + \lambda$ where $f = \frac{d \mu_F}{dm} = F'$ almost everywhere
(by our work from last week).
<span style="float:right">$\lrcorner$</span>

<div class=boxed markdown=1>
As a quick exercise, you might show that wherever $F$ is continuous,
$F'$ is defined. TODO: how hard is this? Maybe give a hint?
</div>

Of course, it's not _just_ differentiation results. We get integration 
results from this machinery too!
If $f$ is positive and locally $L^1$, then $m_f$ is a measure. Then
$F(x) \triangleq \int_0^x m_f = \int_0^x f\ dm$ is an increasing function.
So, from the example above, we know that $F$ is differentiable a.e., and 
just by pattern matching we might hope that $F' = f$ where defined. 
Excitingly, this is true, and the result is called the
<span class=defn>Lebesgue Differentiation Theorem</span>.

So we've developed some high-power machinery which gives us new proofs of 
differentiation and integration results. Whenever you get new proofs of well
known results, it's a good idea to ask yourself if these proofs go through in
more general settings than the original ones. For us, we're obviously out of luck:
We know now to differentiate functions which aren't increasing and right continuous,
and we _also_ know how to find antiderivatives for functions which are allowed
to be negative.

If we want to apply these measure theoretic tools to a more broad class of
functions, we're going to need a more general notion of measure. If we're lucky,
the theorems we're using to get our new calculus proofs will be true for these
more general measures too. Then we'll be able to use measure theory to do 
everything we did in calculus and more. At the risk of spoiling the surprise, 
this idea works! 

---

Measure theory is more closely tied to integration than differentiation, so
let's start there. 

Our correspondence sends a positive, locally $L^1$ function $f$ to the measure
$m_f$ defined by integration against $f$. Since we're integrating, it seems 
unwise to lift the locally $L^1$ condition, and the positivity condition is
what we wanted to try to work out anyways! 

So what's the problem with defining $m_f(E) \triangleq \int_E f\ dm$ when $f$
isn't positive? Well, the integral might be negative! Since we want measures
to give us a notion of "mass" or "volume", we typically insist that they be
positive valued... But let's be brave. It seems the only way forward is to 
relax this restriction, so we make a definition:

<div class=boxed markdown=1>
A <span class=defn>Signed Measure</span> on a $\sigma$-algebra $\mathcal{A}$
is a $\sigma$-additive function $\mu : \mathcal{A} \to [-\infty,\infty]$.

Notice if $E_1$ and $E_2$ are disjoint sets with $\mu E_1 = \infty$ and 
$\mu E_2 = - \infty$, we're going to have trouble with 
$\mu \left ( E_1 \cup E_2 \right ) = \infty - \infty$ (which is undefined). 

Rather than deal with this problem, we define our way out of it and say that
$\mu$ can have sets of measure $\infty$ or sets of measure $-\infty$ (or neither),
but never both.
</div>

We custom-built this new definition of measure in order to guarantee 
$m_f$ is a (signed) measure for _every_ locally $L^1$ function $f$. 
We do this at the cost of some quality-of-life issues. Positive numbers
are easy to handle, but when you're dealing with positive _and_ negative 
numbers, there's a lot of extra things to think about.

One important example of this is the concept of a null set. It's not enough
to ask that $\mu(E) = 0$. It's possible that $E$ has positive mass in some
places, but negative mass in others, and they happen to cancel out!

The right thing to do is more subtle: we say $N$ is null whenever every 
subset of $N$ has measure $0$.

<div class=boxed markdown=1>
  As a quick exercise, you should verify that $m_f$ is actually a signed 
  measure for every locally $L^1$ function $f$.
</div>

As in the positive case, we want to think of $f$ as a kind of "density" 
function. Then when we integrate $f$ we get a mass. The only difference is that
now our mass is allowed to be negative. 

TODO: describe the positive/negative variations, both in terms of $f$ and in
terms of $m_f$. This becomes the Hahn/Jordan decompositions.

<div class=boxed markdown=1>
Intuitively, our nullsets should be the places where our density $f$ is 
constantly $0$. These are the regions which contribute no mass. 

We can avoid situations where regions of positive and negative mass cancel
out by looking at the _absolute value_ of the mass. That is, we can integrate
against the density $|f|$.

In the measure theoretic world, we look at $|\mu| = \mu^+ + \mu^-$. This is
called the <span class=defn>Total Variation</span> of $\mu$.

Can you show that $N$ is $\mu$ null if and only if $|\mu|(N) = 0$? 

Moreover, can you show that $|m_f| = m_{|f|}$?
</div>


- Signed Measures
  - warning! Be careful about nullsets
  - By analogy, we want to consider $F = \mu((-\infty, x])$
  - Equivalently, $F = \int_{- \infty}^x dm_f = \int_{- \infty}^x f\ dm$
  - Hahn/Jordan decomposition $$\{x \mid Fx \geq (\leq) 0 \}$$ and $F^+$ ($F^-$).
  - "Total Variation" (analogous to $|f|$)
  - "Pos/Neg Variations" -- basically monotone functions. 
  - _Bounded Variation_ is the right thing to consider for measures.
  - NBV, put in a footnote that this isn't an issue, just add a constant: $F(-\infty)$.

- Our machinery from before furnishes $\mu_F = \lambda + m_f$
  - What must $\lambda$ look like?
    - give an example of a negative discontinuity
  - What must $f$ look like?
    - It is exactly $F'$ a.e. again!

- Summarize: (state for complex measures)
  - NBV <--> signed measures $F \mapsto \mu_F$
  - locally integrable <--> absolutely continuous measures $f \mapsto m_f$
  - NBV --diff--> locally integrable
  - locally integrable --int--> NBV
  - We've lifted almost all the silly restrictions from last time! 
  - We get a perfect correspondence if we restrict to $F$ absolutely continuous

- Lebesgue FTC

- Example integral against $\mu_F$

- locally lipschitz ==> differentiable (add a footnote on [Rademacher's Thm][2])


[1]: https://math.stackexchange.com/q/1523829/655547
[2]: https://en.wikipedia.org/wiki/Rademacher%27s_theorem
[3]: https://en.wikipedia.org/wiki/Dirac_measure
[4]: https://en.wikipedia.org/wiki/Heaviside_step_function

