---
layout: post
title: Reducing to $\mathbb{Z}$ -- Permanence and Concrete Proofs
tags:
  - 
---

There are lots of ways in which good notation can make results seem obvious. 
One particularly powerful way is by writing formal power series 
(in weird settings) as the function that power series would "traditionally"
represent. It turns out there is a general principle (the "permanence of identities")
which underlies these results, and this is one place where category theory
and model theory conspire to justify seemingly meaningless manipulations. 
In fact, this is one application of category theory and model theory that
working analysts use every day!

Let's see a few examples to start. Once we have some ideas in hand, we can 
see what ties everything together.

---

Example 1 -- The matrix exponential

$$\exp(A) \triangleq \sum_n \frac{1}{n!}A^n$$

This is well defined, since one can show (for any reasonable [matrix norm][1])
that 

$$
\lVert \sum_n \frac{1}{n!}A^n \rVert \leq 
\sum_n \frac{1}{n!} \lVert A \rVert^n \leq
\exp(\lVert A \rVert).
$$

This tells us that our sum converges, and represents an honest-to-goodness matrix.

You might guess by the notation and the definition (which is reminscent of the 
"traditional" exponential function on $\mathbb{R}$) that things like

 1. $\exp(A)^2 = \exp(2A)$
 2. $\exp(A) \exp(B) = \exp(A+B)$

It turns out that $(1)$ is always true, but $(2)$ is only true in some cases[^1].

---

Example 2 -- The mobius function of a poset

The [mobius function][4] $\mu$ of a poset is a useful tool in combinatorics. 
Without getting into too many details, $\mu$ (and its inverse $\zeta$) lets us
convert between functions of the form

$$
f(x) = \sum_{y \leq x} g(y)
$$

and functions of the form TODO

On a combinatorics problem set, one of the problems amounted to showing

$$
\mu(x,y) = \sum_n (I - \zeta)^n
$$

where $I$ is some notion of "identity".
But since we know that $\mu$ and $\zeta$ are inverses, we might notice

$$
\sum_n (I - \zeta)^n = \frac{1}{I - (I - \zeta)} = \frac{1}{\zeta} = \mu.
$$

In fact, this proof works!

---

Example 3 -- Euler-Maclaurin Summation 

It is a common idea to approximate a sum $\sum_a^b f(k)$ by the integral
$\int_a^b f(x)\ dx$. It's reasonable to try and bound the error of this 
approximation, and near the end of Concrete Mathematics (ch. 9.5) we're 
introduced to the Euler-Maclaurin Summation formula:

TODO: find a way to write this as an asymptotic expansion so that we don't
need to mess with the error term.

$$
\sum_{a \leq k \lt b} f(k) 
= \int_a^b f(x)\ dx + 
\left . \sum_{k=1}^m \frac{B_k}{k!} f^{(k-1)}(x) \right |_a^b
+ R_m
$$

Here $B_k$ is the $k$th [bernoulli number][5], 
$f^{(k)}$ is the $k$th derivative of $f$,
and $R_m$ is an error term[^2].

The authors provide a (genuinely shocking) proof of this claim:

We write $(\Delta f)(x) = f(x+1) - f(x)$ for the forward difference operator,
which we should think of as a kind of inverse to $\sum$ in the same way 
differentiation is a kind of inverse to $\int$. Indeed, 
$\sum_a^b \Delta f$ telescopes, and gives $f(b+1) - f(a)$. This is a kind of 
analogue for the fundamental theorem of calculus.

But then if we write $f$ as a taylor series around $x$, we see:

$$f(x + \epsilon) = f(x) + \frac{f^{(1)}(x)}{1!}\epsilon + \frac{f^{(2)}(x)}{2!}\epsilon^2 + \ldots$$

Then by setting $\epsilon = 1$, we find

$$\Delta f = f(x+1) - f(x) = \frac{f^{(1)}(x)}{1!} + \frac{f^{(2)}(x)}{2!} + \ldots$$ 

and if we write $D$ for the differentiation operator, we see

$$\Delta f = (\frac{D}{1!} + \frac{D^2}{2!} + \ldots)f = (e^D - 1)f.$$

So obviously, if we want a formula for $\sum$, we simply need to invert $\Delta$.

$$\sum = \frac{1}{\Delta} = \frac{1}{e^D - 1}$$ 

This is almost $\frac{z}{e^z - 1}$, whose taylor series is well known[^3]:

$$\frac{z}{e^z - 1} = \sum_n \frac{B_k}{k!}z^k.$$

Then, continuing to play fast and loose with... well everything, really. We find

$$\sum = \frac{1}{D} \frac{D}{e^D - 1} = \frac{B_0}{D} + \frac{B_1}{1!} + \frac{B_2}{2!} D + \frac{B_3}{3!} D^2 + \ldots$$

which, of course, gives

$$\sum = \int + \sum_{k \geq 1} \frac{B_k}{k!} D^{k-1}.$$

If you apply both sides to $f$ and add endpoints, you recover the 
Euler-Maclaurin formula above, so even though every line of this argument
seems to be based on nothing but hope and notation, we actually get a 
reasonable answer out the other side[^4].

---

In each of these examples, we're formally manipulating some expressions 
as though they followed the rules of ordinary power series. Even though,
at the face of it, there's little reason why it should be true! 

As the first example showed, though, we need to be at least a little bit 
careful, because even the innocuous looking $\exp(A) \exp(B) = \exp(A+B)$
may fail in general! 

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

So if we can show the claim in $\mathbb{Z}[\overline{a}, \overline{b}]$[^5],
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

 
TODO: talk about the paper objects in categories as concrete numbers as a 
version of the same principle. Maybe in a footnote?


[^1]:
    Of course, the failure of $(2)$ is in some sense the reason the [Lie Bracket][2]
    $[\cdot,\cdot]$ exists in Lie Algebras (cf. [TODO the fudge factor for exp(A+B)][3])

[^2]:
    For the interested, 
    $$R_m = (-1)^{m+1} \int_a^b \frac{B_m(x - \lfloor x \rfloor)}{m!}f^{(m)}\ dx.$$

[^3]: 
    For certain definitions of "well known"

[^4]:
    I actually asked a question about this on mse (see [here][6]), but I 
    was still fairly new to the site at the time and accepted an answer too
    quickly. In many ways this blog post is the answer that I would write 
    myself if I could talk to a younger me.

[^5]:
    Life is too short to keep typing out all the variables.

[1]: matrix norm
[2]: lie bracket
[3]: the fudge factor
[4]: mobius function
[5]: bernoulli number
[6]: my MSE question
