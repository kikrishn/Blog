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
this integral might take complex values as well! To that end, let's introduce
the idea of [Complex Valued Measures][9]
and see how much of measure theory we're able to recover.

If we meditate on what properties $m_f$ will have, we land on the following 
definition:

<div class=boxed markdown=1>
A <span class=defn>Complex Measure</span> on a $\sigma$-algebra $\mathcal{A}$
is a function $\nu : \mathcal{A} \to \mathbb{C}$ so that

1. $\nu \ \emptyset = 0$
2. $\nu \left ( \bigcup E_n \right ) = \sum \nu E_n$ for any disjoint $E_n$. 
Moreover, we require this sum to converge absolutely.

Notice $\nu E$ is never allowed to be $\infty$! This is an important difference
between complex and positive measures.
</div>

⚠ Be careful! Now that our measures allow nonpositive values, we might 
"accidentally" have $\nu E = 0$. If $E$ is the disjoint union of 
$E_+$ and $E_-$, where $\nu E_+ = 3$ and $\nu E_- = -3$ (say), then
$\nu E = 0$, even though we really shouldn't call it a nullset!

Because of this, we redefine the notion of nullset to be more restrictive:
We say $E$ is <span class=defn>$\nu$-null</span> if and only if 
$\nu A = 0$ for every $A \subseteq E$.

<div class=boxed markdown=1>

As an exercise, can you come up with a concrete signed measure $\nu$ for 
which $\nu E = 0$ even though $E$ is _not_ null?

As another exercise, why does this agree with our original definition of
nullsets when we restrict to positive measures?

</div>

Now, we _could_ try to build measure theory entirely from scratch in this 
setting. But it seems like a waste, since we've already done so much measure
theory already... It would be nice if there were a way to relate signed measures
to ordinary (unsigned) measures and leverage our previous results!

We know that $m_{f+g} = m_f + m_g$ in the unsigned case. So in the complex
case, it's natural to try and get this linearity to go further! But we know
we can write any complex function $f : X \to \mathbb{C}$ as a linear combination
of $4$ positive functions, by breaking up into real and imaginary parts,
then positive and negative parts:

$$
f = (f_R^+ - f_R^-) + i (f_I^+ - f_I^-)
$$

So we should expect 

$$
m_f = m_{f_R^+} - m_{f_R^-} + i (m_{f_I^+} - m_{f_I^-})
$$

and the [Jordan Decomposition Theorem][10], which says[^5] that every complex
measure $\nu$ decomposes uniquely into a sum of finite measures
$\nu = (\nu_R^+ - \nu_R^-) + i (\nu_I^+ - \nu_I^-)$ with the bonus property
that $\nu_R^+ \perp \nu_R^-$ and $\nu_I^+ \perp \nu_I^-$. Here, as usual,
$\perp$ means that two measures are [mutually singular][11], which we should
intuitively think of as having disjoint support. 

It can still be nice to work with an unsigned measure directly sometimes, 
rather than having to split our measure into $4$ parts. Thankfully
we have a convenient way of doing so!

There is a positive measure $|\nu|$, called the 
[Total Variation][12] of $\nu$, which is defined so that

$$
|m_f| = m_{|f|}.
$$

This posesses all the amenities the notation suggests, including:

<div class=boxed markdown=1>
1. (Triangle Inequality) $\lvert \nu + \mu \rvert \leq \lvert \nu \rvert + \lvert \mu \rvert$
2. (Operator Inequality) $\lvert \nu E \rvert \leq \lvert \nu \rvert E$
3. (Continuity) $\nu \ll \lvert \nu \rvert$
</div>

---

Ok. This has been a lot of information. How do we actually _compute_
with a complex measure? Thankfully, the answer is easy: We use the 
Jordan Decomposition. We _define_ 

$$
\int f \ d\nu \triangleq 
\left ( \int f \ d\nu^+_R - \int f \ d\nu^-_R \right )
+ i \left ( \int f \ d\nu^+_I - \int f \ d\nu^-_I \right ).
$$

In particular, in order to make sense of this integral, we need to know
that $f$ is in $L^1$ for each of these measures. So again, we just _define_

$$
L^1(\nu) \triangleq L^1(\nu^+_R) \cap L^1(\nu^-_R) \cap L^1(\nu^+_I) \cap L^1(\nu^-_I).
$$

<div class=boxed markdown=1>
As an easy exercise, show that the dominated convergence theorem is true
when we're integrating against $\nu$! 
</div>

We _can_ split up $\nu$ if we need to, but oftentimes we don't. Remember
that if $\nu = m_f$ (which is the whole reason we embarked on this journey!)
we should have $\int g \ d\nu = \int gf \ dm$. 

<div class=boxed markdown=1>
Show using the definition of $\int g \ d\nu$ that we gave that 
$\int g \ dm_f = \int gf \ dm$ actually holds.
</div>

So, as a quick example computation:

$$
\int_0^{2\pi} x^2 \ dm_{e^{ix}} = \int_0^{2\pi} x^2 e^{ix} dm = 4 \pi - 4 I \pi^2
$$

Notice, as usual, that once we've phrased the integral in terms of $dm$,
we can simply use integration by parts, or any other tricks we know 
(such as asking [sage](https://sagemath.org)) to compute the integral. 

---

Now, that example might have felt overly simplistic. After all, it was
mainly a matter of moving the $e^{ix}$ from downstairs below the $m$ to
upstairs inside the integral. What if we needed to integrate against a more 
complicated complex measure? Thankfully, up to singular measures, 
_every_ measure is of this simple form!

Remember last time, we had a structure theorem that told us _every_ measure is
of the form $m_f$, possibly plus a "singular" part $\lambda$. Moreover, the function
$f$ so that $\nu = m_f + \lambda$ was the "derivative" of $\nu$, and this
led us to the fruitful connection between measure theoretic and classical 
derivatives. Thankfully, the same theorem is still true in the complex 
setting!

<div class=boxed markdown=1>
<span class="defn">Lebesuge-Radon-Nikodym Theorem</span>

If $\nu$ is a $\sigma$-finite signed measure and $\mu$ is a
$\sigma$-finite _positive_ measure[^6], then $\nu$ decomposes uniquely as

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

At last, we have a complex measure theoretic notion of "derivative",
as well as half of the correspondence we're trying to generalize:

Given a locally $L^1$ function $f : \mathbb{R} \to \mathbb{C}$ 
we can build a (complex) measure $m_f$.

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

[^5]:
    Really it's a statement about real valued signed measures, and so it 
    allows for either $\pm \infty$ (but not both!) to occur. We won't need
    this extra flexibility, though.

    I went back and forth for a long time on whether to include a discussion
    about signed measures in this post. Eventually, I decided it made the 
    post too long, and it encouraged me to include details that obscure the
    main points. I want these posts to show the forest rather than the trees,
    and here we are.

[^6]:
    Notice for us $\mu$ will almost always be lebesgue measure. The theorem
    is true much more broadly, though, and we might ask 
    "why do we care about more general measures?". The answer is that there
    are other measures which are _also_ easy to compute in practice
    ([haar measures][13], and [counting measures][14] on countable sets come to mind).

    With this generality, we can know for sure that we can work in any 
    space which admits an effectively computable ($\sigma$-finite) measure
    (and there are lots of such spaces besides $\mathbb{R}^n$).

    Any space with a computable notion of integration _also_ admits a computable
    notion of integrating complex measures by application of Radon-Nikodym!



[1]: https://math.stackexchange.com/q/1523829/655547
[2]: https://en.wikipedia.org/wiki/Rademacher%27s_theorem
[3]: https://en.wikipedia.org/wiki/Dirac_measure
[4]: https://en.wikipedia.org/wiki/Heaviside_step_function
[5]: https://en.wikipedia.org/wiki/Radon%E2%80%93Nikodym_theorem#Radon%E2%80%93Nikodym_derivative
[6]: https://en.wikipedia.org/wiki/Lebesgue_differentiation_theorem
[7]: https://en.wikipedia.org/wiki/Product_measure
[8]: https://en.wikipedia.org/wiki/Bounded_variation
[9]: https://en.wikipedia.org/wiki/Complex_measure
[10]: https://en.wikipedia.org/wiki/Hahn_decomposition_theorem#Jordan_measure_decomposition
[11]: https://en.wikipedia.org/wiki/Singular_measure
[12]: https://en.wikipedia.org/wiki/Total_variation#Total_variation_norm_of_complex_measures
[13]: https://en.wikipedia.org/wiki/Haar_measure
[14]: https://en.wikipedia.org/wiki/Counting_measure
