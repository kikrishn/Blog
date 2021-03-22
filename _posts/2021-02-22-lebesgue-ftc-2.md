---
layout: post
title: Measure Theory and Differentiation (Part 2)
tags:
  - analysis
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

- locally lipschitz ==> differentiable ([Rademacher's Thm][2])


[1]: https://math.stackexchange.com/q/1523829/655547
[2]: https://en.wikipedia.org/wiki/Rademacher%27s_theorem
