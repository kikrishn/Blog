---
layout: post
title: Measure Theory and Differentiation (Part 2)
tags:
  - measure-theory-and-differentiation
  - analysis-qual-prep
---

This post has been sitting in my drafts since Feb 22, and has been mostly
done for a _long_ time. But, with my upcoming analysis qual, I've finally
been spurred into finishing it. My plan is to put up a new blog post every
day this week, each going throug some aspect of the analysis that's going to
be on the qual. Selfishly, this will be great for my own preparation 
(I definitely learn through teaching) but hopefully this will also help future
students who want to see a fairly application heavy treatment of the standard
analysis curriculum. 

The first half of this post is available [here](/2021/02/21/lebesgue-ftc-1.html),
as well as at the measure theory and differentiation 
[tag](/tags/measure-theory-and-differentiation). I'm also going to make a new
[tag](/tags/analysis-qual-prep) for this series of analysis qual prep posts,
and I'll retroactively add part 1 to that tag.

With that out of the way, let's get to the content!

---

In [part 1](/2021/02/21/lebesgue-ftc-1.html) we talked about two ways of 
associating (regular, borel) measures to functions on $\mathbb{R}$:

 - To an increasing, right continuous $F$ we associate the measure $\mu_F$
    defined by $\mu_F((a,b]) \triangleq F(b) - F(a)$. In the special case where
    $F$ is the identity function, we get Lebesgue Measure $m$ from this construction.

 - To a positive, locally $L^1$ function $f$ we associate the measure $m_f$
    defined by $m_f(E) \triangleq \int_E f\ dm$.

Perhaps surprisingly, we can go the _other_ way too!

 - Given a measure $\lambda$, we can define an increasing, right continuous 
   function $F_\lambda$ so that $\mu_{F_\lambda} = \lambda$

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

You should think of the increasing, right-continuous functions $F$ as being
antiderivatives of the positive locally $L^1$ functions $f$, 
and theorems like the [Lebesgue Differentiation Theorem][6] link
the (measure theoretic) [Radon-Nikodym Derivative][5]
of $\mu_F$ with the classical derivative of $F$.

<div class=boxed markdown=1>
As an exercise to recap what we did in the last post, prove that
every monotone function $F : \mathbb{R} \to \mathbb{R}$ is 
differentiable almost everywhere[^1].
</div>

This result _can_ be proven without the machinery of measure theory
(see, for instance, Botsko's 
_An Elementary Proof of Lebesgue's Differentiation Theorem_),
but the proof is much more delicate, and certainly less conceptually obvious.
Also, _some_ sort of machinery seems to be required. See [here][1], for instance.

This should feel somewhat restrictive, though. There's more to life than 
increasing, right continuous functions, and it would be a shame if all this
machinery were limited to functions of _such_ a specific form. Can we push
these techniques further, and ideally get something that works for a large
class of functions? Moreover, can we _use_ these techniques to prove 
interesting theorems about this class of functions?
Obviously I wouldn't be writing this post if the answer
were "no", so let's see how to proceed!

---

We've been using differentiation as the motivating target, but integration
is theoretically much simpler. We can't expect to be able to differentiate
most functions, but it is reasonable to want to integrate them. With this
in mind, rather than trying to guess the class of functions we'll be able
to differentiate, let's try to guess the class of functions we'll be able
to _integrate_. 

Previously we were restricting ourselves to positive locally $L^1$ functions.
Since we want to meaningfully integrate our new class, it seems 
unwise to try and lift the "locally $L^1$" condition. Positivity, however, 
seems like a natural thing to drop. Let's be optimistic and see what happens if 
we work with _all_ (complex valued) locally $L^1$ functions!

The correspondence says to take $f$ and send it to the measure 
$m_f(E) \triangleq \int_E f \ dm$. Of course, now that $f$ is complex valued,
this integral might take complex values as well! Let's start small and see if
we can make sense of measures which are real valued, but might be negative.
Afterwards, we can be brave and introduce
<span class="defn">Complex Valued Measures</span> and see how much of measure
theory we're able to recover. 

So then, we want to define a "measure" $m_f$ for a real valued function $f$.
If we meditate on its properties for a bit, we're led to the following definition:

<div class=boxed markdown=1>
A <span class=defn>Signed Measure</span> on a $\sigma$-algebra $\mathcal{A}$
is a $\sigma$-additive function $\nu : \mathcal{A} \to [-\infty,\infty]$.

Notice if $E_1$ and $E_2$ are disjoint sets with $\nu E_1 = \infty$ and 
$\nu E_2 = - \infty$, we're going to have trouble with 
$\nu \left ( E_1 \cup E_2 \right ) = \infty - \infty$ (which is undefined). 

Rather than deal with this problem, we define our way out of it and say that
$\nu$ can have sets of measure $\infty$ or sets of measure $-\infty$ (or neither),
but never both.
</div>

Notice this is _precisely_ cooked up so that if $f : X \to [-\infty,\infty]$
is measurable, and $\int f^+$ and $\int f^-$ are not _both_ infinite[^2], then
$m_f$ defines a signed measure on $X$! 

<div class=boxed markdown=1>
⚠ Be careful! Now that our measures are signed, we might "accidentally"
have $\nu E = 0$ because $E = E^+ \cup E^-$ with $\nu E^- = - \nu E^+ \neq 0$.
Because of this, we redefine the notion of nullset to be more restrictive:

We say $E$ is $\nu$-null if and only if $\nu A = 0$ for every $A \subseteq E$.

As an exercise, can you come up with a concrete signed measure $\nu$ for 
which $\nu E = 0$ even though $E$ is _not_ null?

As another exercise, why does this agree with our original definition of
nullsets when we restrict to positive measures?
</div>

Now, we _could_ try to build measure theory entirely from scratch in this 
setting. But it seems like a waste, since we've already done so much measure
theory already... It would be nice if there were a way to relate signed measures
to ordinary (unsigned) measures and leverage our previous results!

We know that $m_{f+g} = m_f + m_g$ in the unsigned case. So in the signed
case, we probably want that linearity to extend further! Then if we write
$f = f^+ - f^-$, we should have $m_f = m_{f^+} - m_{f^-}$! But each of these
are positive measures, which we know how to handle! Moreover, these have the
_bonus property_ that $m_{f^+}$ and $m_{f^-}$ have disjoint support. That is,
$m_{f^+}$ gets all its mass from $$\{ x \mid fx \gt 0 \}$$ and $m_{f^-}$ gets
all _its_ mass from $$\{ x \mid fx \lt 0 \}$$. These sets are disjoint, so
we might have a picture in our head like this:

TODO: a potato cut in half.

Precisely, we can write $X$ as a disjoint union $X = P \cup N$ so that
$N$ is $m_{f^+}$-null and $P$ is $m_{f^-}$-null. Whenever we can partition $X$
in this way, we will say that $m_{f^+}$ and $m_{f^-}$ are 
<span class="defn">Mutually Singular</span>, written $m_{f^+} \perp m_{f^-}$.

Can we actually decompose every signed measure in this way? The answer,
it turns out, is _yes_[^3]!

<div class=boxed markdown=1>
<span class="defn">Jordan Decomposition Theorem</span>

If $\nu$ is a signed measure, then there exist (unique!) positive 
measures $\nu^+$ and $\nu^-$ so that

1. $\nu = \nu^+ - \nu^-$
2. $\nu^+ \perp \nu^-$

We call $\nu^+$ (resp. $\nu^-$) the <span class="defn">Positive Variation</span>
(resp. <span class="defn">Negative Variation</span>) of $\nu$.
</div>

We write $|\nu| \triangleq \nu^+ + \nu^-$, called the 
<span class="defn">Total Variation</span> of $\nu$. We note this is a positive
measure, and we'll say that $\nu$ is finite (resp. $\sigma$-finite) exactly
when $|\nu|$ is.

<div class=boxed markdown=1>
Ok, that was a _lot_ of information! To make sure you're following, prove
for a $L^1$ function $f : X \to [-\infty,\infty]$ that

  1. $m_f^+ = m_{f^+}$
  2. $m_f^- = m_{f^-}$
  3. $\lvert m_f \rvert = m_{\lvert f \rvert}$

Prove these are still true in the more general case that at most one of 
$\int f^+$ or $\int f^-$ is infinite.
</div>

---

Let's recap. We've shown that we can relate signed measures to unsigned 
measures in a variety of ways. This lets us redevelop a fair amount of 
measure theory in this more general setting. But let's remember _why_ we
were interested in this. Can we extend the differentiation theorems from
last time into this setting? Of course!

<div class=boxed markdown=1>
<span class="defn">Lebesuge-Radon-Nikodym Theorem</span>

If $\nu$ is a $\sigma$-finite signed measure and $\mu$ is a
$\sigma$-finite _positive_ measure, then $\nu$ decomposes uniquely as

$$\nu = \lambda + \mu_f$$

for a $\sigma$-finite measure $\lambda \perp \mu$ and 
$\mu_f(E) \triangleq \int_E f\ d\mu$.

As in the unsigned case, we write $f = \frac{d\nu}{d\mu}$.
</div>

I realized while writing this post that last time I forgot to mention an 
important aspect of the Radon-Nikodym derivative! It satisfies the obvious
laws you would expect a "derivitave" to satisfy[^4]. For instance:

<div class=boxed markdown=1>

 - (Linearity) $\frac{d(a\nu_1 + b\nu_2)}{d\mu} = a\frac{d\nu_1}{d\mu} + b\frac{d\nu_2}{d\mu}$
 - (Chain Rule) If $\nu \ll \mu \ll \lambda$, then 
    $\frac{d \nu}{d\lambda} = \frac{d \nu}{d\mu} \frac{d\mu}{d\lambda}$

It's worth proving each of these. The second is harder than the first, but
it's not too bad.

</div>

So now we have a measure theoretic notion of "derivative", and we have half of
our correspondence: Given a locally $L^1$ function 
$f : \mathbb{R} \to [-\infty,\infty]$ we can build a measure $m_f$.
But which functions will generalize the increasing right continuous ones?
The answer is Functions of [Bounded Variation][8]!

---
---

- Signed Measures
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

---

[^1]:
    The idea is to show that $F$ is basically increasing and right continuous,
    then apply the results from the part $1$ of this blog post. We can get
    increasing-ness by possibly replacing $F$ by $-F$. We can get right
    continuity by replacing $F$ with $F^+(x) = \lim_{y \to x^+} F(y)$,
    and checking that $F = F^+$ almost everywhere.

[^2]:
    Here, as usual, $f^+$ and $f^-$ are the 
    <span class="defn">positive and negative parts</span> of $f$. That is,
    $f^+ = \max(f,0)$ and $f^- = -\min(f,0)$, so that $f = f^+ - f^-$.

[^3]:
    The proof, at least in Folland, goes through a _separate_ decomposition
    theorem. I'll include it here for completeness:

    <div class=boxed markdown=1>
    <span class="defn">Hahn Decomposition Theorem</span> 

    If $\nu$ is a signed measure on $X$, then there are measurable sets 
    $P$ and $N$ so that

    1. $P \cup N = X$
    2. $P \cap N = \emptyset$
    3. $\nu E \geq 0$ for every $E \subseteq P$ 
    (we say $P$ is a <span class="defn">Positive Set</span>)
    4. $\nu E \leq 0$ for every $E \subseteq N$
    (we say $N$ is a <span class="defn">Negative Set</span>)

    Moreover, $P$ and $N$ are unique up to nullsets.
    </div>

[^4]:
    If you're familiar with [product measures][7], there's actually a 
    useful fact:

    If $\nu_1 \ll \mu_1$ and $\nu_2 \ll \mu_2$ and everything in sight is
    $\sigma$-finite, then we have $\nu_1 \times \nu_2 \ll \mu_1 \times \mu_2$,
    and

    $$
    \frac{d(\nu_1 \times \nu_2)}{d(\mu_1 \times \mu_2)}(x_1, x_2) = 
    \frac{d \nu_1}{d \mu_1}(x_1) \frac{d \nu_2}{d \mu_2}(x_2)
    $$

    This is great, since it means to integrate against some product measure
    on $\mathbb{R}^2$, we can separately integrate against each component.


[1]: https://math.stackexchange.com/q/1523829/655547
[2]: https://en.wikipedia.org/wiki/Rademacher%27s_theorem
[3]: https://en.wikipedia.org/wiki/Dirac_measure
[4]: https://en.wikipedia.org/wiki/Heaviside_step_function
[5]: https://en.wikipedia.org/wiki/Radon%E2%80%93Nikodym_theorem#Radon%E2%80%93Nikodym_derivative
[6]: https://en.wikipedia.org/wiki/Lebesgue_differentiation_theorem
[7]: https://en.wikipedia.org/wiki/Product_measure
[8]: https://en.wikipedia.org/wiki/Bounded_variation
