---
layout: post
title: Hilbert Spaces
tags:
  - analysis-qual-prep
---

Hilbert Spaces are banach spaces whose norms come from an inner product.
This is fantastic, because inner product spaces are a very minimal amount
of structure for the amount of geometry they buy us. Beacuse of the new
geoemtric structure, many of the pathologies of banach spaces are absent from
the theory of hilbert spaces, and the rigidity of the category of hilbert 
spaces (there is a complete cardinal invariant describing hilbert spaces up to
isometric isomorphism) makes it extremely easy to make an abstract hilbert 
space concrete. Moreover, this "concretization" is exactly the genesis of
the fourier transform!

With that introduction out of the way, let's get to it!

---

First, a word on conventions. I'll be working with the inner product
$\langle x,y \rangle$ which is linear in the _second_ slot, and 
conjugate linear in the first. This is often called the "physicist" notation,
but I have a reason for it:

<div class=boxed markdown=1>
<span class=defn>Riesz Representation Theorem</span>

If $\mathcal{H}$ is a hilbert space, then the map

$$x \mapsto \langle x, \cdot \rangle : \mathcal{H} \to \mathcal{H}^*$$

is a conjugate linear isometry $\mathcal{H} \cong \mathcal{H}^*$.

In particular, every linear functional on a hilbert space is of the
form $\langle x, \cdot \rangle$ for some $x$[^3].
</div>

Since we write function application on the left[^1], it makes sense for the
associated functional $\langle x, \cdot \rangle$ to also be "on the left".
With the standard "mathematician" convention, we instead have the linear map
$\langle \cdot, y \rangle$ which acts on $x$ "on the right" by 
$x \mapsto \langle x, y \rangle$. 

Obviously this doesn't matter at all, but I feel the need to draw attention to it[^2].

There are two key examples of hilbert spaces:

- $L^2(X,\mu)$ is a hilbert space, with the inner product

    $$\langle f, g \rangle \triangleq \int \overline{f} g \ d\mu$$

- A special case of the above, if $A$ is any set and $\\#$ is the counting measure,
    then $\ell^2(A) = L^2(A, \\#)$ is a hilbert space with the inner product

    $$\langle (x_\alpha), (y_\alpha) \rangle \triangleq \sum \overline{x_\alpha} y_\alpha$$

In fact, as we will see, _every_ hilbert space is isometrically isomorphic to
some $\ell^2(A)$, and just as we can distinguish vector spaces by the cardinality
of their basis, we can distinguish hilbert spaces by the cardinality of their
"hilbert basis".

First, though, why should we care about inner products? How much extra structure
does it _really_ buy us? The answer is: lots! 

As is so often the case in mathematics, _theorems_ in a concrete setting become
_definitions_ in a more general setting, and once we do this much of the 
intuition for the concrete setting can be carried over. For us, then, let's 
see what we can do with inner products.

---

First, it's worth remembering that an inner product defines a norm

$$\lVert f \rVert \triangleq \sqrt{\langle f, f \rangle}$$

so every inner product preserving function _also_ preserves the norm. 

It turns out we can go the other way as well, and the [polarization identity][1]
lets us write the inner product in terms of the norm[^4]. This is fantastic,
as it means any norm preserving function automatically preserves the inner product!

We can also define the _angle_ between to vectors by 

$$
\cos \theta \triangleq \frac{\langle f, g \rangle}{\lVert f \rVert \lVert g \rVert}
$$

and when $\theta = \pm \frac{\pi}{2}$ (that is, when $\langle f, g \rangle = 0$)
we say that $f$ and $g$ are <span class=defn>orthogonal</span>, written $f \perp g$.

Of course, once we have orthogonality, we have a famous theorem from antiquity:

<div class=boxed markdown=1>
<span class=defn>The Pythagorean Theorem</span>

If $f_1, \ldots, f_n$ are pairwise orthogonal, then

$$\lVert \sum f_k \rVert^2 = \sum \lVert f_k \rVert^2$$
</div>

<div class=boxed markdown=1>
As a quick exercise, you should prove the <span class=defn>Law of Cosines</span>:

For _any_ $f$ and $g$, if the angle between $f$ and $g$ is $\theta$, then:

$$
\lVert f+g \rVert^2 = 
\lVert f \rVert^2 + \lVert g \rVert^2 - 2 \lVert f \rVert \lVert g \rVert \cos \theta
$$
</div>

Once we have orthogonality, we _also_ have the notion of orthogonal complements.
You might remember from the finite dimensional setting that there's (a priori)
no distinguished complement to a subspace. For instance, any two distinct
$1$-dimensional subspaces are complements in $\mathbb{R}^2$.
But if we decomposed $\mathbb{R}^2$ as a direct sum of the subsaces shown 
below, we would likely feel there's a "better choice" of complement for
the orange subspace:

<img src="/assets/images/hilbert-spaces/complement.png" width="50%">

The blue subspace is one of many complements of the orange, so why should
we choose it over anything else? Instead, we can use the inner product
(in particular the notion of orthogonality) to choose a _canonical_ 
complement: 

<img src="/assets/images/hilbert-spaces/orthogonal-complement.png" width="50%">

Why is this complement canonical? Because it is the _unique_ complement 
so that every blue vector is orthogonal to every orange vector. 

In the banach space setting (where we don't have access to an inner product)
recall there are subspaces which have no complement. In the hilbert space 
setting this problem vanishes -- the orthogonal complement always exists,
and is a complement[^5]!

<div class=boxed markdown=1>
  If $U$ is a subspace of $\mathcal{H}$, 
  the <span class=defn>orthogonal complement</span> of $U$ is

  $$U^\perp \triangleq \{ x \mid \forall u \in U . \langle u, x \rangle = 0 \}.$$

  $U^\perp$ is always a closed subspace of $\mathcal{H}$, and moreover

  $$(U^\perp)^\perp = \overline{U}$$

  so if $U$ is a _closed_ subspace of $\mathcal{H}$, then $(U^\perp)^\perp = U$
  and $\mathcal{H} = U \oplus U^\perp$.
</div>

You might also remember from the finite case that we can find particuarly 
nice bases for inner product spaces (called [orthonormal bases][3]). It's
then natural to ask if there's an analytic extension of this concept to 
the hilbert space setting.

The answer, of course, is "yes":

<div class=boxed markdown=1>
If $$\{u_\alpha\} \subseteq \mathcal{H}$$ is orthonormal 
(that is, pairwise orthogonal and of norm $1$), the following are equivalent:

1. (Completeness) If $\langle u_\alpha, x \rangle = 0$ for every $\alpha$, then $x = 0$

2. (Parseval's Identity) $\lVert x \rVert^2 = \sum_\alpha \lvert \langle u_\alpha, x \rangle \rvert^2$

3. (Density) $x = \sum_\alpha \langle u_\alpha, x \rangle u_\alpha$, and the sum converges
    no matter how the terms are ordered[^6]

If any (and thus all) of the above are satisfied, we say that 
$$\{ u_\alpha \}$$ is a <span class=defn>Hilbert Basis</span> for $\mathcal{H}$.

Moreover, _every_ hilbert space admits a hilbert basis!
</div>

These conditions are _very_ foundational to hilbert space theory, and are worth
remembering. The way that I like to remember is 

<div class=boxed markdown=1>
  Let $$\{u_\alpha\}_{\alpha \in A}$$ be a hilbert basis for $\mathcal{H}$.

  The map $x \mapsto (\langle u_\alpha, x \rangle)_{\alpha \in A}$ is a 
  [unitary][4] map witnessing the (isometric!) isomorphism

  $$\mathcal{H} \cong \ell^2(A).$$

  Here Parseval's Identity is tells us that this map is isometric,
  and Density tells us that the obvious inverse map
  $(c_\alpha) \mapsto \sum c_\alpha u_\alpha$ really is an inverse.
</div>

In fact, one can show that the size of a hilbert basis is a complete
invariant for hilbert spaces. That is, any two hilbert bases for $\mathcal{H}$
have the same cardinality 
(often called the <span class=defn>Hilbert Dimension</span>), and
$\mathcal{H}_1 \cong \mathcal{H}_2$ if and only if they have the same
hilbert dimension[^7].

---

That's a lot of information about hilbert spaces in the abstract. But why
should we _care_ about any of this? Let's see how to solve some problems
using this machinery!

Let's work with $L^2(S^1)$, the hilbert space of square-integrable functions
on the unit circle. Classically, we would extend these to be _periodic_
functions on $\mathbb{R}$, but that turns out to be the wrong point of view[^8].

A hilbert space is separable if and only if it has a countable 
hilbert basis.  This is nice since most hilbert spaces arising in practice 
(including $L^2(S^1)$) _are_ separable, so we can work with a _countable_ sum 
(even though the theorem is true in more generality).
For us, we note that $$\{ e^{inx} \}_{n \in \mathbb{Z}}$$ is a hilbert
basis for $L^2(S^1)$, sj we would expect periodic functions to decompose
into an infinite sum of these basic functions.

Historically, it was a very important problem to understand the convergence
of "fourier series". That is, if we define

$$\hat{f}(n) \triangleq \int e^{-inx} f$$

(which we, with the benefit of hindsight, recognize as $\langle e^{inx}, f \rangle$)

when is it the case that we can recover $f$ as the sum 
$\displaystyle \sum_{-\infty}^\infty \hat{f}(n) e^{inx}$?
That is, as the $n \to \infty$ limit of the _partial_ fourier series 

$$S_n f \triangleq \sum_{-n}^n \hat{f}(n) e^{inx}$$

In particular, for "nice" functions $f$, is it the case that
$\displaystyle \lim_{n \to \infty} S_n f(x) \to f(x)$ pointwise?
If not, is there _some_ sense in which $S_n f \to f$? 

This problem was fundamental for hundreds of years, with Fourier publishing
his treatise on the theory of heat in $1822$, and there are textbooks written
as recently as $1957$ which says it is unknown whether the fourier coefficients
of a continuous function has to converge at even _one_ point! See the 
historical survey [here][6] for more information, as well as the full course
notes [here][7] by the same author.

The language of $L^p$ and Hilbert spaces wasn't developed until the $1910$s, 
and they are _integral_ (pun intended) in phrasing the solution of the 
fourier series convergence problem ([Carleson's Theorem][8]). 

Carleson's theorem is famously hard to prove, be we can get a partial solution
for free using the theory of hilbert spaces! 

<div class=boxed markdown=1>
For any $L^2$ function $f$, we have

$$S_n f \overset{L^2}{\longrightarrow} f$$
</div>

This is _exactly_ the "density" part of the equivalence above! 
With some work, one can show that $S_n f \to f$ in the $L^p$ norm for any
$p \neq 1, \infty$[^9]. 

Hilbert spaces are _also_ useful in the world of [ergodic theory][11]. 
Say we have a function $T$ from some space $X$ to itself, which we should
consider as describing how $X$ evolves over one time-step.
One might expect that if we _average_ the position of a point $x$ over time,
we should converge on a fixed point of the transformation[^10].

A result in hilbert space theory tells us we aren't off base!

<div class=boxed markdown=1>
<span class=defn>Von Neumann Ergodic Theorem</span>

If $U : \mathcal{H} \to \mathcal{H}$ is a unitary operator on a separable
hilbert space, then for every $x \in \mathcal{H}$ we have

$$\lim_{n \to \infty} \frac{1}{n} \sum_{k=0}^{n-1} U^k x = \pi(x)$$

where $\pi$ is the orthogonal projection onto the subspace of $U$-fixed points
$$\{ x \mid Ux = x \}$$.
</div>

This gives us the <span class=defn>Mean Ergodic Theorem</span> as a corollary!

<div class=boxed markdown=1>
If $T : X \to X$ is measure preserving and $f \in L^2(X)$, then

$$\frac{1}{n} \sum_{k=0}^{n-1} T^n f \to \pi(f)$$

where $\pi$ is (orthogonal) projection onto the $T$-invariant functions.
</div>

---

Alright! We've seen some of the foundational results in hilbert space theory,
and it's worth remembering our techniques from the banach space world still
apply. Hilbert spaces are very common in analysis, with application in
PDEs, Ergodic Theory, Fourier Theory and more. The ability to 
basically do algebra as we would expect, and leverage our geometric intuition,
is extremely useful in practice.

Next time, we'll give a quick tour of applications of the 
[Baire Category Theorem][10], and then it's on to the Fourier Transform
on $\mathbb{R}$!

The qual is a week from today, but I'm starting to feel better about the
material. This has been super useful in organizing my thoughts, and if I'm
lucky, you all might find them helpful as well.

If you have been, thanks for reading! And I'll see you next time ^_^.


---

[^1]:
    Though we _really_ shouldn't, it seems to be unchangeable at this point.

    I tried switching over a few years ago, but it made communication 
    terribly confusing. Monomorphisms, for instance, cancel on the left
    with the usual notation, but cancel on the right with the other notation.
    I tried to get around this by remembering monos "cancel after" and epis
    "cancel before", but I got horribly muddled up anytime I tried to talk
    with another mathematician. 

    Teaching and communication are _extremely_ important to me, so I sacrificed
    my morals and went back to functions on the left.


[^2]:
    And to evangelize. Until we switch over to functions on the right, this
    really _is_ the correct convention. 

    So I suppose the "mathematician" convention is correct, but inconsistent
    with how we (incorrectly) write function application on the left, while
    the "physicist" convention is incorrect, but consistent with the rest of 
    our (incorrect) notation... What a world to live in :P.

    If you happen to have a convincing argument for using the other convention,
    though, I would love to hear it!

[^3]:
    The proof is pretty easy once we have a bit more machinery. 

    Take a functional $f$. If $f = 0$, then $x=0$ works.
    Otherwise, $\text{Ker}(f)$ is a proper closed subspace of 
    $\mathcal{H}$, and has a nontrivial orthogonal complement. 
    If we take some $x \neq 0$ in the orthogonal complement, then
    $\overline{fx}x$ works (as you should verify).

[^4]:
    It's worth taking a moment to ask yourself why we can't use polarization
    to turn _every_ normed space into an inner product space. The answer has
    to do with the [parallelogram law][2].

[^5]:
    In fact, I mentioned this last time as well, but this feature characterizes
    hilbert spaces! If every subspace of a given banach space is complemented, 
    then that banach space is actually a hilbert space!

[^6]:
    This does _not_ mean the terms are absolutely summable!

[^7]:
    This isomorphism is in the category of hilbert spaces and unitary maps,
    so it is automatically an isometry.

[^8]:
    The natural domain of a periodic function really is $S^1$, and the
    mathematics reflects this.

    There is a notion of fourier transform on arbitrary (locally compact) 
    abelian groups. This "[pontryagin duality][5]" swaps "compactness" and 
    "discreteness" (amongst other things) and we see this already. $S^1$ is 
    compact and $\mathbb{Z}$ is discrete, and they are pontryagin duals of
    each other.

    Abstract harmonic analysis 
    (the branch of math that studies this duality theory)
    seems _really_ interesting, and I want to learn more about it 
    when I have the time. It seems to have a lot of connections to
    representation theory, which is also on my to-learn list.

[^9]:
    The case of $L^1$ and $L^\infty$ are both interesting, and the disproofs 
    proceed by the [uniform boundedness principle][9]!

    If $S_N f \to f$ in $L^1$ or $L^\infty$, we would know the maps
    $S_N$ are bounded pointwise. 
    But then by banach space-ness we have the uniform boundedness principle,
    and we would know that the $S_N$s would need to be _uniformly_ bounded.
    But we can find functions so that $S_N f$ have arbitrarily high $L^1$
    and $L^\infty$ norm, giving us the contradiction.
 
[^10]:
    This idea of averaging to land on a fixed point is both common and powerful.
    It is the key idea behind [Maschke's Theorem][12] and many other results.
    I've actually been meaning to write a blog post on these kinds of 
    averaging arguments, but I haven't gotten around to it yet...

[1]: https://en.wikipedia.org/wiki/Polarization_identity
[2]: https://en.wikipedia.org/wiki/Parallelogram_law
[3]: https://en.wikipedia.org/wiki/Orthonormal_basis
[4]: https://en.wikipedia.org/wiki/Unitary_operator
[5]: https://en.wikipedia.org/wiki/Pontryagin_duality
[6]: https://golem.ph.utexas.edu/category/2013/01/carlesons_theorem.html
[7]: https://www.maths.ed.ac.uk/~tl/fa/fa_notes.pdf
[8]: https://en.wikipedia.org/wiki/Carleson%27s_theorem
[9]: https://en.wikipedia.org/wiki/Uniform_boundedness_principle
[10]: https://en.wikipedia.org/wiki/Baire_category_theorem
[11]: https://en.wikipedia.org/wiki/Ergodic_theory
[12]: https://en.wikipedia.org/wiki/Maschke%27s_theorem
