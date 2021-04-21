---
layout: post
title: Reducing to $\mathbb{Z}$ -- Permanence and Concrete Proofs
tags:
  - 
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

Let's see a few examples to start. Once we have some ideas in hand, we can 
talk about the general principle.

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
free (commutative) ring on two generators. But we have model theory too! 
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

## Example -- Seven Trees in One

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

This follows the _spirit_ of what we're doing in this post, but is more general
in two ways. Firstly, the authors of this paper consider polynomial 
_implications_, whereas we will only consider equations. Secondly, the authors
show that these implications remain true (under certain hypotheses) even in
rngs (that is, rings without inverses). In this post we're only going to 
consider rings, but I wanted to include this result for sentimental reasons.

---

## Example -- Computing Inverses

<div class=boxed markdown=1>
Even in noncommutative rings[^3], if $1 - ab$ has an inverse, then 
$1 - ba$ does too.
</div>

$\ulcorner$

$$
\begin{aligned}
(1-ba)^{-1} 
&= 1 + ba + (ba)^2 + (ba)^3 + \ldots \\
&= 1 + ba + baba + bababa + \ldots \\
&= 1 + b(1 + ab + abab + \ldots)a \\
&= 1 + b(1-ab)^{-1}a
\end{aligned}
$$

<span style="float:right">$\lrcorner$</span>

Of course, general rings don't have a notion of power series! So the
above proof is meaningless... right? 

Also, we said we were going to be considering commutative rings. Why
are we suddenly allowing noncommutativity? Is there really some underlying
principle that will let us know when we can and can't do things like this?

---

## Example -- Mutliplicative Determinants

Say we want to prove that $\text{det}(AB) = \text{det}(A) \text{det}(B)$.
When we're working over a field, there are slick basis-dependent arguments
to show this. See, for instance, Knapp's "Basic Algebra" (ch. II.7), which
also spends some time talking about the Permanence of Identities in ch. V.2.

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

<div class=boxed markdown=1>
  Use this technique to prove the following:

  - $\text{det}(I) = 1$
  - $\text{det}(A^t) = \text{det}(A)$
  - $\text{det}(A)$ is multilinear in the rows of $A$
  - $\text{det}(A)$ swaps signs if you swap two rows

  This technique isn't restricted to matrices either! 

  - Show that, in any ring, $(a+b)^n = \sum_k \binom{n}{k} a^k b^{n-k}$
</div>

This technique is _extremely_ flexible. Since, at the end of the day,
we only need to show a polynomial equality for infinitely many special cases,
we have a _lot_ of leeway in choosing the cases. For instance, there are 
infinitely many invertible, or diagonalizable matrices. So this technique 
lets us prove things about _all_ matrices over _all_ rings by thinking only
about invertible or diagonalizable matrices over $\mathbb{Z}$! Similarly, in 
the above example we used $\mathbb{Z} \subseteq \mathbb{Q}$, but there's 
nothing special about $\mathbb{Q}$. Maybe it's more useful to use some fact
from complex analysis, and we can show the polynomial identity by using
$\mathbb{Z} \subseteq \mathbb{C}$. That's entirely allowed!

---

What about power series, though? Is there a similar way for us to argue 
that results we've proven for $\mathbb{Z} [ \\! [\overline{x} ] \\! ]$
must be true in more general settings? I probably wouldn't be writing this
post if the answer were no!


TODO: write an exercise about computing the mobius function of a poset.

[^1]:
    Of course, the failure of $(2)$ is in some sense the reason the [Lie Bracket][2]
    $[\cdot,\cdot]$ exists in Lie Algebras (cf. [TODO the fudge factor for exp(A+B)][3])

[^2]:
    "Objects of Categories as Complex Numbers" by Fiore and Leinster. See
    [here](https://arxiv.org/pdf/math/0212377.pdf) for an arxiv link. It's
    _really_ excellent, and readable too!

[^3]:
    They still have $1$, though. We aren't animals. Jokes aside, I learned
    about this on mse (where else?) in an [excellent post][7] by Bill Dubuque

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

[1]: matrix norm
[2]: lie bracket
[3]: the fudge factor
[4]: mobius function
[5]: bernoulli number
[6]: my MSE question
[7]: https://math.stackexchange.com/a/675128/655547
[8]: https://en.wikipedia.org/wiki/Euler%E2%80%93Maclaurin_formula
[9]: https://en.wikipedia.org/wiki/Asymptotic_expansion
[10]: https://en.wikipedia.org/wiki/Finite_difference
[11]: https://math.stackexchange.com/users/242/bill-dubuque
[12]: https://math.stackexchange.com/a/98365/655547
[13]: https://en.wikipedia.org/wiki/Leibniz_formula_for_determinants
