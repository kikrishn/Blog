---
layout: post
title: Quick Analysis Trick 1
tags:
  - quick analysis tricks
  - lower bounds
---

This is the start of a series of short posts which will come sporadically.
To say that I struggle with analysis would be akin to saying that 
Stravinsky's "Rite of Spring" wasn't well received during its premier. 
While technically true, the reality is much 
[more chaotic](https://www.bl.uk/20th-century-literature/articles/the-riot-at-the-rite-the-premiere-of-the-rite-of-spring) 
than you might expect. I'm OK at it, but it's definitely not my strong suit
(this is probably in part due to lack of exposure).

That said, I recognize the importance of analysis, and I wouldn't make a very
good mathematician if I didn't do my best to improve. Oftentimes I'll come
across an argument and think "Wow! That's really clever!", but I always 
struggle to remember it. I had two of these moments today, and so I've decided
to write up a short post whenever I see one. In the best case, this will 
help me internalize the argument by putting me in a position where I have to
teach it. In the worst case, at least I'll have a searchable list of all the
arguments I thought were clever enough to save. Either way, future readers
will hopefully find these useful for their own studies.

---

So what's the inaugural post, then? It's probably something that many
analytically minded readers will find obvious: a technique for proving 
lower bounds. I came across this while reading Helemskii's 
"Lectures and Exercises in Functional Analysis", which a friend recommended me
because it uses the word "category".

In proposition 4 of chapter 1, Helemskii proves

<div class="boxed">
  Let $E$ be a [prenormed](https://en.wikipedia.org/wiki/Seminorm) vector space,
  and let $F$ be a closed subspace. For any $y \in F^c$ and $x \in F$, we 
  have the estimate $|| \lambda y + x || = \Omega_y(|\lambda|)$ (uniform in $x$).
</div>

(I have taken the liberty of rephrasing the theorem slightly. 
Notably Helemskii does not use $\Omega$ notation)

The idea that I want to take from this proof is simple: 
If $y$ were able to get arbitrarily close to $F$, then since $F$ 
is closed we would have $y \in F$. Thus $y$ has to remain a bounded 
distance away from $F$, that is we can find a $C$ so that 
$\inf_{x \in F} ||y-x|| \geq C$, or equivalently, so that $||y-x|| > C$ for every
$x \in F$. 

Here we've turned merely the _closedness_ of $F$ into a uniform lower bound,
whereas my brain would expect a _compactness_ assumption to be necessary.
In the interest of completeness, we then see

$$|| \lambda y + x || = |\lambda| ||y - (-\lambda^{-1}x)|| \geq C |\lambda|$$

and so $|| \lambda y + x || = \Omega(|\lambda|)$, where the constant $C$ 
depends on $y$ but not $x$.
