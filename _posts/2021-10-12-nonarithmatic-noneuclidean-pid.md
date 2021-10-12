---
layout: post
title: A Nonarithmetic Example of a Noneuclidean Principal Ideal Domain
tags:
  - 
---

This blog post changed dramatically over the course of writing it... 
I'm keeping the title, because I like the alliteration of 
"nonarithmetic noneuclidean", but by the end I actually understood the
arithmetic example better too. Perhaps a better title would be
"In which algebraic geometry explains noneuclidean PIDs in a way that
finally makes sense to me".

---

Every first course on rings wlil prove the chain of inclusions

$$\text{Fields} \subset \text{Euclidean Domains} \subset \text{PIDs} \subset \text{UFDs} \subset \text{Domains}$$

and _most_ first courses will prove each of these inclusions are strict by
giving examples of rings that are one but not the other. Most of these are 
fairly elementary, and are also _memorable_ in the sense that, after seeing
the example, it helps you understand _why_ the inclusion is strict, 
and conversely, once you really understand the _why_, it's quite easy to 
come up with counterexamples.

The exception, of course, is finding a PID which is not a euclidean domain.
I've looked this up enough times to have the "standard" counterexample memorized:
It's $\mathbb{Z} \left [ \frac{1 + \sqrt{-19}}{2} \right ]$... Obviously.
Also, if you asked me right now to prove that this is a PID and isn't euclidean,
I'm fairly confident I couldn't. One big reason for this, I think, is that I
really know embarrassingly little number theory. This ring is obviously
number theoretic, and so it makes perfect sense to me that knowing some 
heavier hitting number theory would probably clarify why this ring works
(and also why it's the "simplest" such ring). See [here][1] for what I'm sure
would be a great explanation if I knew more number theory.

Now, with this in mind, I wanted to try and find examples of this phenomenon 
outside of number theory, but it took me a surprisingly long time to find one[^1]!
In fact, the only examples I had seen were rings of integers of fields like
$\mathbb{Q}(\sqrt{-19})$, 
$\mathbb{Q}(\sqrt{-43})$, 
$\mathbb{Q}(\sqrt{-67})$, 
$\mathbb{Q}(\sqrt{-163})$.

As an aside, if I understand correctly, these four are the _only_ number theoretic 
examples if we assume the [generalized riemann hypothesis][3], and this got me
wondering if the "generic" PID is actually euclidean[^2]. I'm still interested
in that question, but while writing this post I found an article which
shows how to construct a whole slew of examples[^3], so I suspect it's not true
(if it can even be made precise).

---

On to the main event, though: 

<div class=boxed markdown=1>
$$R \triangleq \mathbb{R}[x,y] \big / \langle x^2 + y^2 + 1 \rangle$$

is a noneuclidean PID.
</div>

This is obviously some kind of geometric object, but it's quite hard for me
(at time of writing) to visualize... It's the coordinate ring of some curve
in $\mathbb{R}$ that doesn't _really_ exist 
(since $x^2 + y^2 + 1$ has no real solutions).

Even though $x^2 + y^2 + 1$ has no solutions in $\mathbb{R}^2$, we can still
argue about this ring geometrically. This is part of the magic of algebraic
geometry!

For instance, we expect the surface carved out by this polynomial to be 
one dimensional. After all, it's obviously some kind of curve in the plane.
We also expect it to be _smooth_, in the sense that the partial derivatives 
in the $x$ and $y$ direction never simultaneously vanish 
(note $(0,0)$ is not on our curve).

Now, I'm willing to believe that this is a UFD, since oftentimes a failure
of factorization is associated with a singular point[^4] and we've just checked
that our variety is smooth. Since we've also checked $R$ is one dimensional,
it must actually be a PID[^5].

I don't know of a good geometric interpretation of euclidean-ness,
but thankfully the direct proof that $R$ isn't euclidean[^9] is much easier
(to my sensibilities at least) than the proof for the number theoretic examples:

$\ulcorner$
Let $$|\cdot|$$ be a euclidean function on $R$, and let $p$ be a 
$$|\cdot|$$-minimal nonzero nonunit. Then $p$ is prime, thus maximal 
(in each case, do you see why?), so $R / (p)$ is a field algebraic over 
$\mathbb{R}$ and properly containing it. The only choice is $\mathbb{C}$.

Now, what's the plan? We know $R^\times \cong \mathbb{R}^\times$, and
$(\mathbb{R} / p)^\times \cong \mathbb{C}^\times$. But we have a surjection
$\pi : R \twoheadrightarrow R/p$! At this point we should start smelling 
blood in the water, since there's no obvious surjection from 
$\mathbb{R}^\times \twoheadrightarrow \mathbb{C}^\times$.

We can simplify things by noticing the projection map $\pi$ is injective on 
$R^\times = \mathbb{R}^\times$ 
(do you see why? Remember $\pi$ is a $\mathbb{R}$-algebra homomorphism),
so if we can show it's also _surjective_, we'll be done, since certainly
$\mathbb{R}^\times \not \cong \mathbb{C}^\times$ (again, do you see why?).

How do we do it? Well, let's take a unit $\overline{u} \in R / p$. Fix a lift
$u \in R$, and (using the euclidean algorithm) write $u = pq + v$ with
$$|v| \lt |p|$$. Notice $\overline{u} = \overline{v}$, so since 
$\overline{u} \neq 0$ (it's a unit) we must have $\overline{v} \neq 0$,
and $v \neq 0$ too (do you see why?). But since $p$ was $$| \cdot |$$-minimal amongst the
nonzero nonunits, $v$ must be a unit. Then $\pi(v) = \overline{u}$,
and $\pi$ is surjective (as needed).
<span style="float:right">$\lrcorner$</span>

---

Actually, now that I've typed this up, there is a more-than-superficial similarity 
between this and the $S \triangleq \mathbb{Z} \left [ \frac{1 + \sqrt{-19}}{2} \right ]$
version...

First, we might look at $\mathbb{Z}[\sqrt{-19}]$. This is not a UFD,
but we can fix this by moving to $S$. This move to the 
[integral closure][9] "removes the singularities", and gives us a UFD[^6].
Now this UFD is one dimensional[^7], so it's a PID, as before.
As for why it isn't euclidean:

$\ulcorner$
Again, let $$|\cdot|$$ be a euclidean norm, and pick a $$|\cdot|$$-minimal 
nonzero nonunit $p$. As before, $(p)$ is maximal. 
Next, notice that $S^\times = \{ \pm 1 \}$. So by definition, there 
are only $3$ elements of norm less than $$|p|$$: $0$, $1$, and $-1$.

By the euclidean algorithm, each $x \in S$ can be
written as $x = pq + r$ where $|r| \lt |p|$. So there are at most
$3$ residue classes mod $p$, and thus $S / p$ (which must be a field) is either 
$\mathbb{F}_2$ or $\mathbb{F}_3$.

Finally, the polynomial $x^2 + x + 5$ has a root in $S$ 
(indeed, $\theta = \frac{1 + \sqrt{-19}}{2}$ works), but this polynomial does _not_
have a root in $\mathbb{F}_2$ or $\mathbb{F}_3$. 

Now if $\pi : S \twoheadrightarrow S/p$ were as described, then 
$\pi(\theta)$ would have to satisfy this polynomial. A contradiction.
<span style="float:right">$\lrcorner$</span>

Notice in both cases, we were able to wave our hands past the PID proof
by arguing that we're a one dimensional UFD. Similarly, in both cases we
took a minimal nonzero nonunit $p$ of a purported euclidean function. 
Then by understanding the field we get by quotienting by $p$[^8], 
we were able to show that something bad must happen. For $R$, this was an
isomorphism $\mathbb{R}^\times \cong \mathbb{C}^\times$. For $S$, this was a
solution to an insoluble equation.

---

I definitely learned a lot writing this post! Hopefully you all enjoyed too ^_^.
If people have ideas about more ways to make this analogy precise, I would love
to hear about it. In particular, the handwaving about smoothness implying UFDness
feels a bit aggressive to me, and I would love to know more about how to put
that on solid ground. 

If people have any references for "what fraction" of PIDs are actually Euclidean,
I would also be super interested in hearing about that! I'm not sure if there's
a great way to measure that, though. Maybe there's an informal way of thinking
about it?

Anyways, that's two posts in one night, so I'm feeling quite tired now, haha.
Plus I (appropriately enough) have a number theory class tomorrow at $9.30$,
so it's ~ bed time ~. See you all soon ^_^.


---

[^1]:
    Rather embarrassingly, while writing this post I learned the example which 
    I'm about to give is actually on the [wikipedia page][2] for euclidean 
    domains... So...  I probably could have found an example sooner, haha.

[^2]:
    Interestingly, while many rings of integers _are_ euclidean domains, the
    norm _isn't_ the norm you would expect (inherited from $\mathbb{C}$).
    See [here][4] for more information, as well as the claim I cited about
    the generalized riemann hypothesis.

[^3]:
    D. D. Anderson's _An Existence Theorem for Non-euclidean PIDs_,
    which you can find [here][5], for instance.

    The author shows: 

    If $(R,\mathfrak{m})$ is any $2$-dimensional [local][6] UFD, then
    $R[1/f]$ is a nonprincipal PID for any $0 \neq f \in \mathfrak{m}^2$
    a principal prime.

    For instance, if $k$ is a field, then $k[[x,y]]$ is a $2$ dimensional
    local UFD (with maximal ideal $(x,y)$). So taking $f \in (x,y)^2$
    irreducible, say, $f = x^2 + y^3$, 
    we find $k[[x,y]][1/f]$ is principal and noneuclidean.

    Also, a quick clarifying note: the author uses "quasi-local", to mean a 
    non-noetherian ring with a unique maximal ideal. It seems it used to be
    standard to assume noetherian-ness when discussing local rings, but this
    has fallen out of fashion. Nowadays we use the word "local" in a broader
    sense. You can see some discussion about this [here][7].

    I imagine that a "principal prime" element is a similarly archaic name
    for an irreducible element. Since in a UFD, the principal ideal generated 
    by an irreducible is prime. I haven't actually read through the proof 
    closely enough to verify this, though.

[^4]:
    Though this argument doesn't _really_ work here, since you can also 
    "accidentally" fail to be a UFD when your underlying field isn't 
    algebraically closed. For instance, the coordinate ring of a circle

    $$\mathbb{R}[x,y] \big / \langle x^2 + y^2 - 1 \rangle$$

    is superficially very similar to our ring (in particular it's smooth)
    but unique factorization fails (do you see why?)

[^5]:
    In a one dimensional UFD, there's not enough room for a nonprincipal ideal
    to exist. Indeed, say we had a nonprincipal ideal $(f,g)$. Then

    $$(0) \subset (f) \subset (f,g)$$
    
    is a chain of length $2$, which can't fit in a ring of dimension $1$.

    The UFD condition avoids certain pathologies (again, associated with singularities),
    for instance in $k[t^2, t^3] = k[x,y] \big / \langle x^3 - y^2 \rangle$, which has a 
    singularity, we find the ideal $(t^2, t^3)$ 
    (corresponding to the singular point at the origin) 
    is nonprincipal, even though $k[t^2,t^3]$ is one dimensional.

[^6]:
    Recall the passage to the integral closure is how we get the 
    [Noether Normalization][10], which removes the singular points of a curve.

[^7]:
    See [here][11], for instance. We need to combine this with the fact that
    normalizing (that is, taking the integral closure) doesn't change the dimension.

[^8]:
    Which is easy, since the elements of the field are exactly the elements 
    of norm $$\lt |p|$$, and we can get our hands on them by using the euclidean algorithm

[^9]:
    Which I shamelessly stole from [this][8] mse question

[1]: https://math.stackexchange.com/questions/857971/ring-of-integers-is-a-pid-but-not-a-euclidean-domain
[2]: https://en.wikipedia.org/wiki/Euclidean_domain
[3]: https://en.wikipedia.org/wiki/Generalized_Riemann_hypothesis
[4]: https://mathoverflow.net/questions/38780/why-do-we-care-whether-a-pid-admits-some-crazy-euclidean-norm
[5]: https://www.researchgate.net/publication/233170379_An_existence_theorem_for_non-euclidean_pid%27S
[6]: https://en.wikipedia.org/wiki/Local_ring
[7]: https://math.stackexchange.com/questions/3973431/quasilocal-ring-notation
[8]: https://math.stackexchange.com/questions/864212/quotient-of-polynomials-pid-but-not-euclidean-domain
[9]: https://en.wikipedia.org/wiki/Integral_element
[10]: https://en.wikipedia.org/wiki/Noether_normalization_lemma
[11]: https://math.stackexchange.com/questions/607324/prove-that-every-nonzero-prime-ideal-is-maximal-in-mathbbz-sqrtd
