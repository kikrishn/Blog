---
layout: post
title: Deriving the Quadratic Formula with Galois Theory
tags:
  - 
---

A good friend of mine (Pedro Marun again) is always looking for ideas 
for a joke talk where he proves simple things with absurdly difficult 
machinery. Since I've been thinking a lot about galois theory recently,
I came up with a proof that the quadratic formula exists using galois theory.
This is obviously overkill, and of the things we've joked about, I think it
really maximizes the statement complexity to proof complexity ratio.

The proof goes as follows:

<div class=boxed markdown=1>
There is a formula which solves all quadratics over $\mathbb{Q}$ using radicals.
</div>

$\ulcorner$

Let $x^2 + bx + c$ be an irreducible quadratic in $\mathbb{Q}[x]$. 
We'll look at the splitting field $E$ over $\mathbb{Q}$, where this
polynomial will factor as $(x-\alpha)(x-\beta)$. Since the galois group
of this extension has order $2$, it must be $C_2$, and thus solvable.
So we should be able to express $\alpha$ and $\beta$ using radicals.

How do we do this? 

Recall an element is fixed by all of $C_2$ (where the nontrivial automorphism $\sigma$
acts by swapping $\alpha$ and $\beta$)
if and only if it's in $\mathbb{Q}$
(this is the fundamental theorem of galois theory). Then we can have some 
clever insight:

- $\alpha + \beta$ is fixed by $C_2$ (since $\sigma (\alpha + \beta) = \sigma \alpha + \sigma \beta = \beta + \alpha$)
- $\alpha - \beta$ is _almost_ fixed by $C_2$ ($\sigma (\alpha - \beta) = \beta - \alpha$)

We can rememdy the second situation by looking at $(\alpha - \beta)^2$, which _is_ fixed by $C_2$.

Thus we should have $\alpha + \beta$ and $(\alpha - \beta)^2$ as elements of $\mathbb{Q}$.
We know that $(x - \alpha)(x - \beta) = x^2 + bx + c$, and by expanding the 
left hand side and rearranging it's easy to see

- $\alpha + \beta = -b$
- $(\alpha - \beta)^2 = b^2 - 4c$

But now we're done! This tells us that $\alpha - \beta = \sqrt{b^2 - 4c}$,
and so

- $\alpha = \frac{(\alpha + \beta) + (\alpha - \beta)}{2} = \frac{-b + \sqrt{b^2 - 4c}}{2}$
- $\beta  = \frac{(\alpha + \beta) - (\alpha - \beta)}{2} = \frac{-b - \sqrt{b^2 - 4c}}{2}$

which is exactly the quadratic formula!
<span style="float:right">$\lrcorner$</span>

<br>

Of course, the reason I was thinking about this is because I was trying to 
explicitly solve equations by radicals provided their galois group is solvable.
This is another situation where I haven't actually seen many people give
explicit examples of this machinery in use, so I want to include one here as 
well. 

Let's start with $x^5 + x^4 - 4x^3 - 3x^2 + 3x + 1$. This polynomial's galois
group is cyclic of order $5$, which is solvable[^1]. So we should be able to
solve it by radicals.

Indeed, let's let $\alpha$ be a root of this polynomial, and let $\sigma$ be
a generator for the galois group. Following Richard E Borcherds' 
(characteristcally excellent) [youtube video][1]:

Let $\omega$ be a primitive $5$th root of unity. Then we'll consider the 
eigenvectors of $\sigma$:

$$
\begin{aligned}
v_1 &= \alpha + \omega^0 \sigma \alpha + \omega^0 \sigma^2 \alpha + \omega^0 \sigma^3 \alpha + \omega^0 \sigma^4 \alpha && \sigma v_1 = v_1 \\
v_2 &= \alpha + \omega^1 \sigma \alpha + \omega^2 \sigma^2 \alpha + \omega^3 \sigma^3 \alpha + \omega^4 \sigma^4 \alpha && \sigma v_2 = \omega   v_2 \\
v_3 &= \alpha + \omega^2 \sigma \alpha + \omega^4 \sigma^2 \alpha + \omega^1 \sigma^3 \alpha + \omega^3 \sigma^4 \alpha && \sigma v_2 = \omega^2 v_2 \\
v_4 &= \alpha + \omega^3 \sigma \alpha + \omega^1 \sigma^2 \alpha + \omega^4 \sigma^3 \alpha + \omega^2 \sigma^4 \alpha && \sigma v_2 = \omega^3 v_2 \\
v_5 &= \alpha + \omega^4 \sigma \alpha + \omega^3 \sigma^2 \alpha + \omega^2 \sigma^3 \alpha + \omega^1 \sigma^4 \alpha && \sigma v_2 = \omega^4 v_2
\end{aligned}
$$

We got these by starting with $\alpha$, and then applying $\omega^i \sigma$ repeatedly until we got back to $\alpha$
(that is, we _forced_ these to be eigenvectors for $\sigma$).

Now since $\omega^4 + \omega^3 + \omega^2 + \omega^1 + \omega^0 = 0$ and each
column contains exactly one of each $\omega^i$, we can sum these equations and find

$$\alpha = \frac{v_1 + v_2 + v_3 + v_4 + v_5}{5}.$$

So if we can express each $v_i$ as a radical, then we'll be done!

The idea now, is to notice that $\sigma$ _almost_ fixes each $v_i$. We're only
off by a fifth root of unity. So by raising everything to the fifth power, we find

$$\sigma v_i^5 = (\sigma v_i)^5 = (\omega^i v_i)^5 = v_i^5$$

and so each $v_i^5$ is fixed by $\sigma$!

Since $\sigma$ generates the galois group, this tells us that each $v_i^5$ is 
fixed by the whole group, and thus lies in the base field $\mathbb{Q}(\omega)$.

Now comes a nasty combination of highschool algebra: 
we know that $v_i^5$ should be in $\mathbb{Q}(\omega)$. We also know that
the coefficients of our polynomial are symmetric polynomials in the roots.
That is:

- $e_1 = \alpha + \sigma \alpha + \sigma^2 \alpha + \sigma^3 \alpha + \sigma^4 \alpha = 1$
(the coefficient of $x^4$)

- $e_2 = \sum_{0 \leq i \lt j \leq 4} (\sigma^i \alpha)(\sigma^j \alpha) = -4$
(the coefficient of $x^3$)

- $e_3 = \sum_{0 \leq i \lt j \lt k \leq 4} (\sigma^i \alpha)(\sigma^j \alpha)(\sigma^k \alpha) = -3$
(the coefficient of $x^2$)

- $e_4 = \sum_{0 \leq i \lt j \lt k \lt l \leq 4} (\sigma^i \alpha)(\sigma^j \alpha)(\sigma^k \alpha)(\sigma^l \alpha) = 3$
(the coefficient of $x$)

- $e_5 = \alpha (\sigma \alpha) (\sigma^2 \alpha) (\sigma^3 \alpha) (\sigma^4 \alpha) = 1$
(the constant coefficient)

Each of our $v_i^5$ is symmetric in the $\sigma^i \alpha$. 
So the [fundamental theorem of symmetric polynomials][3] tells us that each
$v_i^5$ is actually a polynomial in the expressions above! But a polynomial
in the expressions above evaluates down to a constant, since each expression
is equal to one of the coefficients of our defining polynomial.

Thankfully, [sage][4] can expand out each $v_i^5$, and can also write each one
as a polynomial in the $e_i$. 

---

[^1]:
    I got this by taking an $11$th root of unity, $\zeta$, then asking sage
    for the minpoly of $\zeta + \zeta^{-1}$. The galois group of 
    $\mathbb{Q}(\zeta)$ over $\mathbb{Q}$ is $(\mathbb{Z} / 11)^\times$,
    which is isomorphic to $\mathbb{Z} / 10$. So we just needed to find a 
    subfield of index $2$ inside it to get a field whose galois group is
    cyclic of order $5$.


[1]: https://www.youtube.com/watch?v=UaeJNQ5x17g&list=PL8yHsr3EFj53Zxu3iRGMYL_89GDMvdkgt&index=15
[2]: https://en.wikipedia.org/wiki/Elementary_symmetric_polynomial
[3]: https://en.wikipedia.org/wiki/Elementary_symmetric_polynomial#Fundamental_theorem_of_symmetric_polynomials
[4]: https://sagemath.org
