---
layout: post
title: Measure Theory and Differentiation (Part 2)
tags:
  - analysis
---

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

TODO: state the theorem. Prove it.

---

- Recap first post
  - increasing, right cts functions $F$
  - positive $L^1$ functions $f$
  - functions of the second type and functions of the first type are 
    derivatives/integrals of each other. We can extend this notion to 
    measures
  - allows us to (elegantly) show that all increasing functions are differentiable ae
  - (show a proof, say elementary methods might not exist (cf. [here][1])
- Can we use this to get more general differentiation/integration results?

- Integration is comparatively easy, so let's start there. That might give us
    necessary conditions, which will, with luck, be sufficient too.
- Say $f$ is Locally $L^1$. We want to define $m_f E \triangleq \int_E f\ dm$.
- This might be negative! To handle this, we introduce _Signed Measures_.

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

