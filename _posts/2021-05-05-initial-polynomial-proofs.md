---
layout: post
title: Reducing to $\mathbb{Z}$ -- Permanence and Concrete Proofs
tags:
  - category-theory
  - model-theory
  - algebra
---

There are lots of ways in which good notation can make results seem obvious. 
There are also lots of ways in which "illegally" manipulating expressions can
give a meaningful answer at the end of the day.
It turns out that in many cases our illegal manipulations are actually justified,
and this is codified in the principle of
<span class=defn>Permanence of Identities</span>! 
This is one place where category theory and model theory conspire in a 
particularly beautiful (and powerful) way.

In this post we'll talk about how to prove statements in general rings by
proving analogous statements for polynomials with integer coefficients. 
This is nice because we often have access to ~bonus tools~ when working in
$\mathbb{Z}$, and it doesn't matter if we _use_ these bonus tools to prove
the general result!

I think this technique is best shown by example, so I'll give a smattering
of proofs using this idea. Hopefully by the end you'll be convinced of its
flexibility ^_^. 

---

## Example -- The Binomial Theorem

Let's start simple, and build from here. In any of my favorite rings $R$
(though I should mention all my favorite rings are commutative with $1$) 
we can take any two elements $a$ and $b$ and know that

$$(a+b)^n = \sum_k \binom{n}{k} a^k b^{n-k}$$

where we (as usual) interpret scaling by an integer as repeated addition.

Many authors prove this by saying something like 
"the usual proof goes through unchanged", but we can actually be a bit cleverer.

$\ulcorner$
First we prove this identity in $\mathbb{Z}[a,b]$. Then we notice there is
a (unique) ring hom $\varphi : \mathbb{Z}[a,b] \to R$ for each choice of $a$ and $b$
in $R$. This is the category theory at work, since $\mathbb{Z}[a,b]$ is the 
free (commutative) ring on two generators. Next, we use model theory: 
Homomorphisms preserve truth, and so the true equation $p(a,b) = q(a,b)$ in
$\mathbb{Z}[a,b]$ must stay true after we hit it with $\varphi$! 

So since we proved $(a+b)^n = \sum_k \binom{n}{k} a^k b^{n-k}$ in $\mathbb{Z}[a,b]$,
we actually get for _free_ that the equation holds for every pair of elements
in every ring!
<span style="float:right">$\lrcorner$</span>

Notice that it doesn't matter what "the usual proof" is! Maybe you like to 
prove the binomial theorem by looking at the taylor series of $(1+x)^n$ and
remembering $\mathbb{Z} \subseteq \mathbb{R}$. 
This method is entirely unavailable in a general ring, but because we end up
with a polynomial equality, we can conclude that the theorem is
true in general rings anyways!

There are lots of situations where we run this same kind of argument. 

---

## Example -- Sylvester's Identity

This one is a favorite example of [Bill Dubuque][11] on mse. I've seen him
evangelize it so often I felt obligated to include it. It helps that it's
such a great example! He actually has a _fantastic_ explanation of this same
princple [here][12], which I definitely recommend reading if you're interested!

Sylvester's identity says that 
(for $n \times n$ matrices over any ring $R$)

$$\text{det}(1 + AB) = \text{det}(1 + BA)$$

$\ulcorner$
How can we prove this? Well, let's work in 
$\mathbb{Z}[a_{ij}, b_{ij}]$, where we have one variable for each of the $2n^2$
matrix entires. Now we have

$$
\text{det}(1 + AB) \text{det}(A) = \text{det}(A + ABA) = \text{det}(A) \text{det}(1+BA)
$$

Since the determinant is a polynomial in the entries of a matrix[^7], this is
really expressing the equality of polynomials with integer coefficients!

So we have a polynomial equation $fh = hg$, and we can happily cancel the
nonzero polynomial $h$ from both sides, since $\mathbb{Z}[a_{ij}, b_{ij}]$ 
is a domain! Here $h$ is the polynomial $\text{det}(A)$, and we get the claim.
<span style="float:right">$\lrcorner$</span>

Notice that we've, again, used a special property of integer polynomials in 
this proof! We can cancel polynomials with reckless abandon because we're working
in a domain. Once we prove this polynomial identity, though, the result remains
true after we evaluate! In particular, even if
the specific $\text{det}(A)$ of interest is $0$, or the particular $R$ of 
interest is _not_ a domain! 

Whatever tools we want to use inside $\mathbb{Z}[a_{ij}, b_{ij}]$ is totally ok,
as long as we end our proof with a polynomial identity.

<div class=boxed markdown=1>
As a simple exercise, can you extend this result to the case where
$A = n \times m$ and $B = m \times n$?
</div>

---

## Example -- Computing Inverses

I said we would be focusing on commutative rings in this post, and that's true.
But there's a really cool noncommutative example that follows the same
principle and is worth showing.
I learned about this on mse (where else?) in a different [excellent post][7] by Bill Dubuque.

<div class=boxed markdown=1>
Even in noncommutative rings[^3], if $1 - ab$ has an inverse, then 
$1 - ba$ does too.
</div>

$\ulcorner$
We want to work in the ring of noncommutative polynoimals
$\mathbb{Z} \langle a,b \rangle$, but it's not quite big enough. 
We're making an assumption that $(1-ab)^{-1}$ exists, but it actually
_doesn't_ in $\mathbb{Z} \langle a,b \rangle$. That said, we can freely add 
such an inverse -- let's work in

$$R = \mathbb{Z} \langle a, b, c \rangle \Bigg / (1 - ab)c = 1 = c(1-ab).$$

Now for the clever trick: 
we can embed this into the ring of noncommutative power series
$$\mathbb{Z} \langle \! \langle a,b \rangle \! \rangle$$. 
We send $a \mapsto a$, $b \mapsto b$, and $c \mapsto (1-ab)^{-1}$.

In $$\mathbb{Z} \langle \! \langle a,b \rangle \! \rangle$$, we 
can run the following argument 
(which, of course, would be nonsensical in other settings):

$$
\begin{aligned}
(1-ba)^{-1} 
&= 1 + ba + (ba)^2 + (ba)^3 + \ldots \\
&= 1 + ba + baba + bababa + \ldots \\
&= 1 + b(1 + ab + abab + \ldots)a \\
&= 1 + b(1-ab)^{-1}a \\
\end{aligned}
$$

But this means in $$\mathbb{Z} \langle \! \langle a, b \rangle \! \rangle$$
we have the identity

$$ (1-ba) (1 + b(1-ab)^{-1}a) = 1 = (1 + b(1-ab)^{-1}a) (1-ba)$$

which, under our embedding, gives us the following identity in 
$R$:

$$ (1-ba) (1+bca) = 1 = (1+bca) (1-ba) $$

But then since this ring is initial
among all noncommutative rings with $2$ free variables and an inverse 
for $(1-ab)$, we find the identity holds in _every_ (noncommutative) ring $R$!
<span style="float:right">$\lrcorner$</span>

Notice the extra power we got, both by using quotient rings to model 
some hypotheses in our theorem and by passing to formal power series.
This is part of what's so nice about embeddings! They let us prove statements
in some smaller setting by using techniques from a bigger setting[^8]. We've 
been implicitly using this idea throughout the post, but I wanted to make it
explicit at least once. After all, once we're aware of it, we can intentionally 
use it in other settings as well[^9]. 

---

## A Sentimental Interlude -- Seven Trees in One

The first paper I ever read[^2] opens with the following beautiful passage:

> Consider the following absurd argument concerning planar, binary, rooted, 
> unlabelled trees. Every such tree is either the trivial tree or consists of 
> a pair of trees joined together at the root, so the set $T$ of trees is 
> isomorphic to $1+T^2$. Pretend that $T$ is a complex number and solve the 
> quadratic $T = 1+T^2$ to find that $T$ is a primitive sixth root of unity 
> and so $T^6 = 1$. Deduce that $T^6$ is a one-element set; realize immediately 
> that this is wrong. Notice that $T^7 \cong T$ is, however, not obviously 
> wrong, and conclude that it is therefore right. In other words, conclude 
> that there is a bijection $T^7 \cong T$ built up out of copies of the 
> original bijection $T \cong 1 + T^2$: a tree is the same as seven trees.
> The point of this paper is to show that ‘nonsense proofs’ of this kind are,
> actually, valid.

You can see that we've "proven" a claim about trees by proving a polynomial
implication in $\mathbb{C}$. That is, the authors show

$$T = 1+T^2 \implies T^7 = T.$$

In the paper, the authors show that homomorphisms of certain polynomial 
_implications_ are also preserved[^10] for rigs (that is, rings without negatives).
Here $\mathbb{N}[T]$ plays the role of the initial rig, which embeds in 
$\mathbb{C}[T]$. Then we use complex analysis to show the above implication
holds in $\mathbb{C}[T]$ and thus in $\mathbb{N}[T]$.

Since the objects of a category (up to isomorphism) with products and coproducts
forms a rig, this tells us there is a hom from $\mathbb{N}[T]$ to the category
of, say, algebraic datatypes (up to isomorphism). 

Since this polynomial implication is of the variety that's preserved, and in
the category of datatypes we have $T \cong 1 + T^2$, we are allowed to conclude
$T \cong T^7$! 

This follows the _spirit_ of what we're doing in this post, but is a bit 
more detailed because general homomorphisms _don't_ preserve all implications.
A model theorist might jump straight to elementary embeddings, but that's 
far too restrictive for our purposes here. The authors of the above paper do a
great job finding (only slightly technical) conditions which make this 
argument go through. I've included it both to show what's possible when you 
extend the ideas in this post, and also because it was my first paper and I feel
a certain amount of love for it.

---

## Example -- Mutliplicative Determinants

Say we want to prove that $\text{det}(AB) = \text{det}(A) \text{det}(B)$.
When we're working over a field, there are slick basis-dependent arguments
to show this. See, for instance, Knapp's "Basic Algebra" (ch. II.7)[^11]. 

These arguments don't go through for a general ring $R$, though, so you might
think we should drink some caffeine, look up the definition of the determinant
(for the second time this blog post... nobody _really_ remembers it, right?), 
and just hit this problem with some honest computation.

Of course, once we remember $\mathbb{Z} \subseteq \mathbb{Q}$, we 
we might think of a better way (especially since we've seen the rest of the 
post).

$\ulcorner$
We again look at $\mathbb{Z}[a_{ij}, b_{ij}]$.

We first note that the entries of $AB$ are polynomials in the
entries of $A$ and $B$ (if this isn't clear, you should check it).

But since the determinant is a polynomial in the entries, we see the equation

$$
\text{det} \left ( (a_{ij}) (b_{ij}) \right )
= \text{det} \left ( (a_{ij}) \right ) \text{det} \left ( (b_{ij}) \right )
$$

is actually a polynomial equation (albeit a complicated one) in the 
$a_{ij}$ and $b_{ij}$. So it suffices to show that it's true in our 
polynomial ring.

But $\mathbb{Z}[a_{ij},b_{ij}] \subseteq \mathbb{Q}(a_{ij},b_{ij})$, and we 
_know_ the formula is true for matrices over a field! So the formula is true
for us, and the claim follows for all rings.
<span style="float:right">$\lrcorner$</span>

---

This is a fun and powerful technique, and it's really useful in a lot of 
situations! Here are some quick exercises for you to play around with,
but I encourage you to look for your own as well!

<div class=boxed markdown=1>
  Pick your favorite two facts about matrix algebra and see if they're
  true over arbitrary rings. If you stick to facts about determinants,
  matrix multiplication, row operations, etc. you should be able to choose
  pretty much anything!
</div>

<div class=boxed markdown=1>
  Show that the quadratic formula always works, unless it obviously doesn't.

  As a hint, you'll want to work in the ring

  $$\mathbb{Z}\left [ a,b,c,d,a^{-1}, \frac{1}{2} \right ] \Bigg / d^2 = b^2 - 4ac$$
</div>

<div class=boxed markdown=1>
  Show that $\mathbb{Z}[x_1, \ldots, x_n]$ embeds in 

  - $C(\mathbb{R})$ (the ring of continuous functions on $\mathbb{R}$)
  - $C(\mathbb{C})$ (the ring of continuous functions on $\mathbb{C}$
  - $C^\infty(\mathbb{R})$ (the ring of smooth functions on $\mathbb{R}$)
  - $C^\infty(\mathbb{C})$ (the ring of entire functions on $\mathbb{C}$)

  so if we prove an polynomial identity using real or complex analysis it
  is true in $\mathbb{Z}[x_1, \ldots, x_n]$ (and thus in all rings).
</div>

<div class=boxed markdown=1>
  As another powerful tool in your arsenal, say you want to prove some
  polynomial identity in one variable: $p(x) = q(x)$. 

  1. Show that there's some finite number $N$ (depending on $p$ and $q$) 
  so that $p(x) = q(x)$ if and only if it's true for $N$ many choices of $x$.

  2. Show that that $$\binom{x}{3} \binom{3}{2} = \binom{x}{2} \binom{x-2}{1}$$ 
      is a polynomial identity in $x$. Verify it by hand for $4$ choices of $x$.
      Argue that this verification proves this identity holds in all rings 
      where you can divide by $2$.

  It's wild to me that some finite verification like this is enough to prove
  an identity (even a simple one like this) for all rings. If you want to see
  more of this proof technique you should check out Petkovšek, Wilf, and
  Zeilberger's book [A = B][19] (section 1.4, to start).

  Does this technique work for polynomials with more than one variable?
</div>

---

As one last aside, I'm really interested in figuring out when we can do this
with power series. Over a year ago now I asked [a question][6] about this,
though I accepted the answer too quickly 
(and in hindsight it isn't really the kind of answer I was looking for).

With the extra year to think about it, though, I think I have a better idea
how to make it work. I meant this to be a kind of prequel where we work in
the simpler setting of polynomials to get practice before we jump into proving
identities with power series.

---

[^1]:
    Of course, the failure of $(2)$ is in some sense the reason the [Lie Bracket][2]
    $[\cdot,\cdot]$ exists in Lie Algebras (cf. [TODO the fudge factor for exp(A+B)][3])

[^2]:
    "Objects of Categories as Complex Numbers" by Fiore and Leinster. See
    [here](https://arxiv.org/pdf/math/0212377.pdf) for an arxiv link. It's
    _really_ excellent, and readable too!

[^3]:
    They still have $1$, though. We aren't animals. 

[^4]: 
    For certain definitions of "well known"

[^5]:
    I actually asked a question about this on mse (see [here][6]), but I 
    was still fairly new to the site at the time and accepted an answer too
    quickly. In many ways this blog post is the answer that I would write 
    myself if I could talk to a younger me.

[^6]:
    Life is too short to keep typing out all the variables.
  
[^7]:
    This is the one place where it's helpful to remember that 
    [horrible definiton][13] of the determinant in terms of a sum over
    permutations of products of the entries. It's obviously a polynomial
    (albeit a gross one).

[^8]: 
    If you like the model theoretic language, embeddings _reflect_ truth.

[^9]:
    We really do use this kind of machinery ALL the time, though. 
    Whenver we use complex numbers to prove things about 
    $\mathbb{R}$, $\mathbb{N}$, etc. for instance. 

    More excitingly, this is part of the power of the 
    yoneda lemma -- We embed any (small) category into a [topos][16]
    of presheaves. Then if we can prove some fact 
    (which doesn't refer to any topos-y things) using this high powered 
    machinery, it reflects down to our original category!

    This is also why model theorists care so much about 
    [elementary embeddings][17], which I've given a quick introduction
    to [here][18]. The tl;dr is that embeddings _don't_ need to preserve 
    or reflect the truth of formulas involving quantifiers. Elementary 
    embeddings, on the other hand, do both.

[^10]:
    In fact, we do this by quotienting by the assumptions of our impliction,
    just like we did with the $(1-ba)^{-1}$ example. So the relevant rig 
    for binary trees is $\mathbb{N}[T] \big / T^2 - T + 1$. 

    The issue is that for some equations 
    $\mathbb{Z}[x] \big / p=q$ (and also $\mathbb{N}[x] \big / p=q$) might
    not _embed_ into $\mathbb{C}$! 

    For instance, when we quotient by some non-monic identity, we get 
    something that [isn't finitely generated][21] as a $\mathbb{Z}$-module.
    In particular, the powers of some root we added won't satisfy any integer 
    linear combinations.
    This is a problem since in $\mathbb{C}$ the subfield generated by the 
    roots of some integer polynomial will be finite dimensional over 
    $\mathbb{Q}$, and thus powers of any root _will_ satisfy some integer linear combination!

    Since we no longer have an embedding, truth is no longer reflected! 
    The core of Fiore and Leinster's paper is giving conditions where this 
    doesn't happen.

[^11]:
    Knapp also happens to spend some time talking about Permanence of Identities
    (in ch. V.2), which is why I chose this book in particular to mention. 
    It turns out the exact example we're about to work out is _also_ in Artin's
    "Algebra" (ch. 12.3) alongside a discussion of Permanence of Identities! 
    So if you want to see some other perspectives on this topic, you can read
    about it there too.


[4]: https://en.wikipedia.org/wiki/Incidence_algebra
[6]: https://math.stackexchange.com/q/3500045/655547
[7]: https://math.stackexchange.com/a/675128/655547
[8]: https://en.wikipedia.org/wiki/Euler%E2%80%93Maclaurin_formula
[9]: https://en.wikipedia.org/wiki/Asymptotic_expansion
[10]: https://en.wikipedia.org/wiki/Finite_difference
[11]: https://math.stackexchange.com/users/242/bill-dubuque
[12]: https://math.stackexchange.com/a/98365/655547
[13]: https://en.wikipedia.org/wiki/Leibniz_formula_for_determinants
[14]: https://en.wikipedia.org/wiki/Formal_power_series#Non-commuting_variables
[15]: https://en.wikipedia.org/wiki/Free_algebra
[16]: https://en.wikipedia.org/wiki/Topos
[17]: https://en.wikipedia.org/wiki/Elementary_equivalence#Elementary_embeddings
[18]: /2020/10/01/elementary-vs-submodel
[19]: https://www2.math.upenn.edu/~wilf/AeqB.pdf
[20]: https://en.wikipedia.org/wiki/Congruence_relation
[21]: https://math.stackexchange.com/q/2230921/655547
