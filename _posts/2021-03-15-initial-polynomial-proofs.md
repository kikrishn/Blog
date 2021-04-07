---
layout: post
title: Reducing to $\mathbb{Z}$ -- Permanence and Concrete Proofs
tags:
  - 
---

TODO: another example for datatype derivatives

There are lots of ways in which good notation can make results seem obvious. 
There are also lots of ways in which "illegally" manipulating expressions can
give a meaningful answer at the end of the day.
One particularly exciting example of _both_ of these phenomena comes from
using formal power series in ways which are, at first glance, dubious.
It turns out there is a general principle 
(the <span class=defn>Permanence of Identities</span>) which underlies these
results, and this is one place where category theory
and model theory conspire in a particularly beautiful (and powerful) way.
In fact, this is one application of category theory and model theory that
working analysts use every day!

In this post we'll talk about how to prove statements in general rings by
proving analogous statements for polynomials with integer coefficients. 
This is nice because we often have access to ~bonus tools~ when working in
$\mathbb{Z}$, and it doesn't matter if we _use_ these bonus tools to prove
the general result!

Let's see a few examples to start. Once we have some ideas in hand, we can 
talk about the general principle.

---

## Example 1 -- The matrix exponential

We define the matrix exponential as 

$$\exp(A) \triangleq \sum_n \frac{1}{n!}A^n$$

This is well defined, since one can show (for any reasonable [matrix norm][1])
that 

$$
\left \lVert \sum_n \frac{1}{n!}A^n \right \rVert \leq 
\sum_n \frac{1}{n!} \lVert A \rVert^n \leq
\exp(\lVert A \rVert).
$$

This tells us that our sum converges, and represents an honest-to-goodness matrix.

Similarly, we can define the matrix logarithm 
(for matrices with $\lVert A - I \rVert \lt 1$) by

$$\log(A) \triangleq \sum_n \frac{(-1)^n}{n} A^n.$$

You might guess by the notation and the definition (which is reminiscent of the 
"traditional" exponential and logarithmic functions) that

 1. $\exp(\log(A)) = A$
 2. $\exp(A) \exp(B) = \exp(A+B)$
 3. $\exp(A)^2 = \exp(2A)$
 4. etc.

It turns out that $(1)$ and $(3)$ are always true, but $(2)$ is only 
true in some cases[^1]. Indeed, it is true exactly when $A$ and $B$ commute!
This is a warning that something nontrivial is going on, and because of it
we're going to (mostly) look at commutative rings.

---

## Example 2 -- Seven Trees in One

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

This shows the _spirit_ of what we're doing in this post, but is more general
in two ways. Firstly, the authors of this paper consider polynomial 
_implications_, whereas we will only consider equations. Secondly, the authors
show that these implications remain true (under certain hypotheses) even in
Rngs (that is, rings without inverses). In this post we're only going to 
consider Rings 
(indeed, we're going to consider _commutative_ rings almost exclusively).

---

## Example 3 -- Computing Inverses

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

## Example 4 -- Euler-Maclaurin Summation 

We've saved the most jaw dropping example for last. This "proof" of the
[Euler-Maclaurin Summation Formula][8] comes from Graham, Knuth, and 
Patashnik's fantastic book "Concrete Mathematics" (ch. 9.5). 

We often approximate as sum $\sum_a^b f(k)$ by the integral $\int_a^b f(x)\ dx$.
You may recognize this idea from the proof that 
$\sum_n \frac{1}{n} \sim \ln(n)$.

What if we want to understand the _error_ of this approximation, though?
Enter the Euler-Maclaurin Formula:

<div class=boxed markdown=1>
  If $f$ is smooth, we have an [asymptotic expansion][9]

  $$
  \sum_{n=a}^b f(n) \sim \int_a^b f(x)\ dx + 
  \left . \sum_{k = 1}^\infty \frac{B_k}{k!} \frac{d^{k-1} f}{dx^k} \right |_a^b
  $$

  Where $B_k$ is the $k$th [Bernoulli Number][5].
</div>

The authors provide a (genuinely shocking) proof of this claim 
(which I've copied almost verbatim).
Here $(\Delta f)(x) = f(x+1) - f(x)$ is the [forward difference operator][10]
and $Df = \frac{df}{dx}$ is differentiation.

$\ulcorner$

We can express $\Delta$ in terms of $D$ using Taylor's formula as follows:

$f(x + \epsilon) = f(x) + \frac{f'(x)}{1!}\epsilon + \frac{f''(x)}{2!}\epsilon^2 + \cdots$

Setting $\epsilon = 1$ tells us that

$$
\begin{aligned}
\Delta f(x) 
&= f(x+1) - f(x) \\
&= f'(x)/1! + f''(x)/2! + f'''(x)/3! + \cdots \\
&= (D/1! + D^2/2! + D^3/3! + \cdots)f(x) \\
&= (e^D - 1)f(x)
\end{aligned}
$$

Since summation and forward difference have a similar inverse relationship as
integration and differentiation (do you see why?), 
we might write $\sum = \Delta^{-1}$ and $\int = D^{-1}$. Arguing in this way, 
we would expect

$$
\sum = \Delta^{-1} = \frac{1}{e^D - 1}
$$

Now $\frac{z}{e^z - 1} = \sum_k \frac{B_k}{k!} z^k$ is a known power series 
(it is the exponential generating function for the bernoulli numbers).
This tells us that

$$
\begin{aligned}
\sum 
&= \frac{1}{D} \frac{D}{e^D - 1} \\
&= \frac{1}{D} \sum_k \frac{B_k}{k!} D^k \\
&= \frac{1}{D} + \sum_{k \geq 1} \frac{B_k}{k!} D^{k-1} \\
&= \int + \sum_{k \geq 1} \frac{B_k}{k!} D^{k-1}
\end{aligned}
$$

Now we apply both operators to $f$, then evaluate at $a$ and $b$, we see

$$
\sum_{n=a}^b f(n) = \int_a^b f(x)\ dx + 
\left . \sum_{k \geq 1} \frac{B_k}{k!} D^k f \right |_a^b
$$

Which is, frankly, black magic[^5].

<span style="float:right">$\lrcorner$</span>


---

In each of these examples, we're formally manipulating some expressions 
as though they followed the rules of ordinary power series. Even though,
at the face of it, there's little reason why it should be true! 

So what's going on here? Why are these arguments working, and how do we know
when it's safe to use them? To answer these questions, let's move to the 
setting of polynomials. This will avoid any convergence issues, and we can
focus on the mechanics of the technique. After we've spent some time honing
our skills there, we can move back to the world of power series for the 
thrilling conclusion!

---

Let's say we have two $n \times n$ matrices $A$ and $B$ with coefficients in my 
favorite ring $R$ (I should probably mention that all my favorite rings are commutative
with $1$). 

Say we want to prove that $\text{det}(AB) = \text{det}(A) \text{det}(B)$.
When we're working over a field, there are slick basis-dependent arguments
to show this. See, for instance, Knapp's "Basic Algebra" (ch. 2.7).

These arguments don't go through for a general ring $R$, and you might think
we're out of luck. We should drink some caffeine, look up the definition
of the determinant (which nobody _really_ remembers, right?), and just hit
this problem with some honest computation.

There's a better way, though. And it saves _so_ much work it's worth 
remembering. Knapp calls this <span class=defn>Permanence of Identities</span>,
but I call it the graceful interplay of model theory and category theory.
If you want to read his take, you can find it in Basic Algebra (ch. V.2).
Let's see the proof:

$\ulcorner$
The only thing we need from the definition of the determinant is to recognize
that $\det(M)$ is a polynomial in the entries of $M$. Indeed, it's a sum 
of products of the entries, so we're golden.

We also need to remember that the entries of $AB$ are polynomials in the
entries of $A$ and $B$. We know the $(i,j)$th entry of $AB$ is a sum 
of products of entries of $A$ and $B$, so again, we're in the clear.

Now, let's look at the polynomial ring 
$\mathbb{Z}[a_{11}, \ldots, a_{nn}, b_{11}, \ldots, b_{nn}]$. 

Here is where category theory and model theory conspire. We know
that $\mathbb{Z}$ is the initial Ring. So there is a unique ring hom
from $\mathbb{Z} \to R$ for any ring $R$. Of course, since polynomial rings
are free, this means a hom from 
$\mathbb{Z}[a_{11}, \ldots, a_{nn}, b_{11}, \ldots, b_{nn}] \to R$ is exactly
a choice of $n \times n$ matrices $A$ and $B$ with entries in $R$.
Now for the model theory. Ring homs _preserve truth_. Given a ring hom
$f : R \to S$ and an equation $x=y$ in $R$, we _must_ have $f(x) = f(y)$ in $S$.

So if we can show the claim in $\mathbb{Z}[\overline{a}, \overline{b}]$[^6],
that is, if we can show

$$
\text{det} \left ( (a_{ij}) (b_{ij}) \right )
= \text{det} \left ( (a_{ij}) \right ) \text{det} \left ( (b_{ij}) \right )
$$

Then we're done. After all, this is really an abbreviation for some
(absolutely horrifying) polynomial equation. This is why we took the time 
to notice that determinants and matrix products were all polynomials in the
entries.

If this polynomial equation is true in $\mathbb{Z}[\overline{a}, \overline{b}]$,
then it remains true after we hit it with some ring hom. But we know that for
_any_ pair of matrices in _any_ ring, we can find a ring hom to do the job!

So now we've reduced our question from arbitrary rings to a question about
one (very concrete!) ring. In fact, this ring is _so_ concrete that we can
use a bunch of special facts about it in order to prove the claim here. 

Here's the last big idea: In order to prove a polynomial identity in some
polynomial ring over $\mathbb{Z}$, we only need to check the identity at
a finite number of points. After all, if we want to show $p=q$, that means
we want to show $p-q = 0$. But if $p-q$ is a polynomial of degree $n$, and 
$(p-q)(\overline{x}) = 0$ for $n+1$ many choices of $\overline{x}$, then
we're done. This is because a nonzero polynomial of degree $n$ can have at
most $n$ many roots.

So we want to show that 
$\text{det} \left ( (a_{ij}) (b_{ij}) \right ) = \text{det} \left ( (a_{ij}) \right ) \text{det} \left ( (b_{ij}) \right )$ 
is true in $\mathbb{Z}[\overline{a}, \overline{b}]$, but this is just a polynomial
equation. If we can show that it has more solutions than its degree, we'll know
that it must actually be true everywhere! If we really wanted to, we could 
probably compute the degree of this polynomial, but let's be lazy. Whatever
the degree is, it's finite. So if we can show there are infinitely many
solutions than we'll definitely be done. 

But we know that for _any_ integers we plug into this polynomial, we'll
have a solution. Why? Because for any integers we plug in, we now have 
a concrete matrix with integer entries. But since $\mathbb{Z} \subseteq \mathbb{Q}$
and we know the claim is true in fields, we know the claim is true for any
integers we want! 

This, rather magically, proves the claim.
<span style="float:right">$\lrcorner$</span>

I know this looks long, but that's because I was trying to exposit the entire
way. If we wanted to write this up neatly, it would look something like this:

<div class=boxed markdown=1>
For any $n \times n$ matrices $A$ and $B$ with entires in any 
(commutative, unital) ring $R$, we have $\text{det}(AB) = \text{det}(A) \text{det}(B)$.
</div>

$\ulcorner$
Since this is a polynomial in the entires of $A$ and $B$, if we can 
prove the claim for matrices with indeterminate entries in 
$\mathbb{Z}[\overline{a}, \overline{b}]$ then we will be done.

But since $\mathbb{Z} \subseteq \mathbb{Q}$, any way we instantiate the
indeterminates will make the equation true (since we know the claim for vector spaces). 
Then we have more solutions to a polynomial equation than its degree, and
the polynomials must be equal. As desired.
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
that results we've proven for $\mathbb{Z} \llbracket \overline{x} \rrbracket$
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
