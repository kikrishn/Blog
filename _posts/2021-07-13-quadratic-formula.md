---
layout: post
title: Solving Solvable Polynomials with Galois Theory
tags:
  - sage
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

We can remedy the second situation by looking at $(\alpha - \beta)^2$, which _is_ fixed by $C_2$.

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
well. I was first given a hint of how to do this in Richard E Borcherds'
(characteristically excellent) [youtube video][1], but while writing up this
blog post I realized I wasn't able to fill in some of the details that he
omitted. After finally giving up, I eventually found Gaal's 
_Classical Galois Theory: With Examples_. This book has an entire chapter
called "How to Solve a Solvable Equation", which is rife with exactly the 
kinds of examples I was looking for! I haven't read the whole thing, but 
what I have read has been very lucid, with good examples of how to actually
solve problems with this machinery, so I'm happy to recommend it off this
chapter alone.

Let's start with $x^5 + x^4 - 4x^3 - 3x^2 + 3x + 1$. This polynomial's galois
group is cyclic of order $5$, which is solvable[^1]. So we should be able to
solve it by radicals.

Indeed, let's let $\alpha_0, \ldots, \alpha_4$ be the roots of this polynomial, 
and let $\sigma$ be a generator for the galois group. So $\sigma \alpha_i = \alpha_{i+1}$
(where $i+1$ is taken mod $5$).

Let $\omega$ be a primitive $5$th root of unity. Then we'll consider some
eigenvectors of $\sigma$:

$$
\begin{aligned}
v_0 &= \alpha_0 + \omega^0 \alpha_1 + \omega^0 \alpha_2 + \omega^0 \alpha_3 + \omega^0 \alpha_4 && \sigma v_1 = v_1 \\
v_1 &= \alpha_0 + \omega^1 \alpha_1 + \omega^2 \alpha_2 + \omega^3 \alpha_3 + \omega^4 \alpha_4 && \sigma v_2 = \omega   v_2 \\
v_2 &= \alpha_0 + \omega^2 \alpha_1 + \omega^4 \alpha_2 + \omega^1 \alpha_3 + \omega^3 \alpha_4 && \sigma v_2 = \omega^2 v_2 \\
v_3 &= \alpha_0 + \omega^3 \alpha_1 + \omega^1 \alpha_2 + \omega^4 \alpha_3 + \omega^2 \alpha_4 && \sigma v_2 = \omega^3 v_2 \\
v_4 &= \alpha_0 + \omega^4 \alpha_1 + \omega^3 \alpha_2 + \omega^2 \alpha_3 + \omega^1 \alpha_4 && \sigma v_2 = \omega^4 v_2
\end{aligned}
$$

We got these by starting with $\alpha_0$, and then applying $\omega^i \sigma$ repeatedly until we got back to $\alpha$
(that is, we _forced_ these to be eigenvectors for $\sigma$).

Now since $\omega^4 + \omega^3 + \omega^2 + \omega^1 + \omega^0 = 0$ and each
column contains exactly one of each $\omega^i$, we can sum these equations and find

$$\alpha_0 = \frac{v_0 + v_1 + v_2 + v_3 + v_4}{5}.$$

So if we can express each $v_i$ as a radical, then we'll be done!

<div class=boxed markdown=1>
Do you see how we can recover the other $\alpha_i$ by averaging these vectors
too? As a hint, rescale to get the coefficient in front of $\alpha_i$ to be $1$.
</div>

The idea now, is to notice that $\sigma$ _almost_ fixes each $v_i$. We're only
off by a fifth root of unity. So by raising everything to the fifth power, we find

$$\sigma v_i^5 = (\sigma v_i)^5 = (\omega^i v_i)^5 = v_i^5$$

and so each $v_i^5$ is fixed by $\sigma$!

Since $\sigma$ generates the galois group, this tells us that each $v_i^5$ is 
fixed by the whole group, and thus lies in the base field $\mathbb{Q}(\omega)$.

This is the moment that frustrated me for days: We _know_ that $v_i^5$ should
be in the base field... But how do we figure out what it _is_? Obviously we want
to use the fact that the coefficients of our polynomial 
$x^5 + x^4 - 4x^3 -3x^2 + 3x + 1$ are the [elementary symmetric polynomials][2]
in the $\alpha_i$. Then we want to argue that the $v_i^5$ are symmetric,
and thus polynomials in the elementary symmetric polynomials... The 
hangup, of course, is that the $v_i^5$ are only symmetric with respect to the
galois group! They are _not_ symmetric with respect to the whole of $S_5$,
and so they _don't_ decompose in terms of elementary symmetric polynomials!

This is where the insight from Gaal's book comes in. We'll _force_ this 
expression to be symmetric by considering the polynomial

$$
\psi = \prod_{i=1}^5 (Y - v_i^5) = \prod_{\text{some } \tau : S_5} (Y - \tau v_1^5)
$$

where $\tau$ acts on $v_1^5$ by permuting the $\alpha_i$ inside it. It turns out
each $v_i$ is $\tau v_1$ for some (possibly multiple) $\tau$, and we take
exactly one of each.

Since the coefficients of $\psi$ really _are_ symmetric in the $\alpha_i$, 
we can write them in terms of elementary symmetric polynomials, and thus,
in terms of the coefficients of our defining polynomial. This tells us how
to write $\psi$ with actual numbers as the coefficients!

Then, since we know abstractly that each $v_i^5$ is in the base field, we know 
that $\psi$ will factor into linear parts _in the base field_! So all we have 
to do is factor $\psi$, and then we'll finally get our hands on the $v_i^5$!

This is getting a bit hard to do by hand, but [sage][3] tells us that

$$
\begin{aligned}
v_0 &= -1 \\
v_1^5 &= \\
v_2^5 &= \\
v_3^5 &= \\
v_4^5 &= 
\end{aligned}
$$

And we finally learn that

$$
\alpha_0 = .
$$

<div class=boxed markdown=1>
  As a tricky exercise, throughout this post we have been working in
  $\mathbb{Q}(\omega)$. So we're only guaranteed to get an expression
  in terms of $\mathbb{Q}$, $\omega$, and radicals. 

  Show that this is no obstruction: Every $n$th root of unity 
  can be written with radicals[^2].
</div>

---

For reference, here's the sage code I used to figure that out. 
Keep in mind this is quite brittle, so you shouldn't just plug
your favorite polynomial in and see what happens. I'm fairly sure
it only works on polynomials with a cyclic galois group. It's possible
that it only works on polynomials with a cyclic galois group of prime order.

As an aside, it seems like getting this to work for an arbitrary solvable
polynomial is [still missing from sage][4], and if this code didn't take
literally 30 hours for the polynomial of degree $5$, I would try to polish 
this and submit it. As it stands, I'll probably play around with this a 
little bit more and try to get a faster implementation.

<div class="linked_auto">
<script type="text/x-sage">
# the code for the degree 5 polynomial in the rest of the blog post 
# takes FOREVER to run. I'm not sure why computing psi takes
# so long, but I had to let it run on my desktop overnight...
# If you want to run this, you should do it with this degree 3 
# polynomial instead, because it terminates in a reasonable amount
# of time. Obviously the algorithm is the same, so you can still
# follow what's happening when you read the rest of the post.
# f = x^5 + x^4 - 4*x^3 - 3*x^2 + 3*x + 1

f = x^3 + x^2 - 2*x - 1 


###################################################

n = f.degree(x)

# make a number field where w is a nth root of 1
K.<w> = CyclotomicField(n)

# make vars for the roots.
# a[i] = alpha_i
R = PolynomialRing(K, n, 'a')
a = R.gens()

#v_1^n
v = sum([w^k * a[k] for k in range(n)])^3

# build the conjugates of v.
# it turns out we only need one from each conjugacy class,
# which keeps the degree down.

Sn = SymmetricGroup(n)

conjugates = []
for tau in Sn:
  if v * tau not in conjugates:
    conjugates += [v * tau]


S.<Y> = PolynomialRing(R)
psi = prod([Y - conj for conj in conjugates])


# the coefficients of psi are symmetric functions in the ai.
# so let's write them as polynomials in the elementary
# symmetric functions.

Sym = SymmetricFunctions(K)
e = Sym.e() # elementary basis

coeffs = [e(Sym.from_polynomial(c)) for c in psi.coefficients(sparse=False)]

# now, since each elementary symmetric function is one of the coefficients
# of f (up to sign), we can convert the coefficients of psi into numbers!


# the coefficients of f.
# we reverse them to make the upcoming code a bit cleaner
poly = f.coefficients(sparse=False)[::-1]


def elemToNumber(elem):
  """
  Convert an elementary term into a number

  the pair (ns = [n1,n2,...,nk], c) corresponds to c * e_{n1} * e_{n2} ... * e_{nk}
  """
  ns, c = elem

  out = c
  for n in ns:
    if n < len(poly):
      # the elementary polys alternate in sign
      # when you view them as the coefficients of 
      # a polynomial from the roots.
      out *= (-1)^(n) * poly[n] 
    else:
      out *= 0

  return out

def ecoeffToNumber(ecoeff):
  """
  Convert a sum of elementary terms into a number
  """
  return sum(elemToNumber(elem) for elem in ecoeff)


coeffs = [ecoeffToNumber(list(c)) for c in coeffs]
psi = sum(Y^j * coeffs[j] for j in range(n))

# v1,v2,...v(n-1) are exactly the roots of psi!
# notice these are already in our underlying field,
# so finding the roots isn't actually cheating. 
# We could do this by hand by factoring psi, which
# must (by theory) factor into linear terms. 

v0 = - poly[1] # v0 = a0 + a1 + ... + a(n-1) = e1
vs = psi.roots(multiplicities=False)

# Finally, we're done! 
r = (v0 + sum(v^(1/n) for v in vs))/n

show(f)
show(r)

# and we can verify
show(r in f.roots(multiplicities=False))

</script>
</div>


---

[^1]:
    I got this by taking an $11$th root of unity, $\zeta$, then asking sage
    for the minpoly of $\zeta + \zeta^{-1}$. The galois group of 
    $\mathbb{Q}(\zeta)$ over $\mathbb{Q}$ is $(\mathbb{Z} / 11)^\times$,
    which is isomorphic to $\mathbb{Z} / 10$. So we just needed to find a 
    subfield of index $2$ inside it to get a field whose galois group is
    cyclic of order $5$.

    I got the degree $3$ polynomial in the codeblock in exactly the same way,
    but using $\zeta$ a 7th root of unity instead.

[^2]:
    As a hint, first show that it suffices to build the $p$th roots of unity
    for $p$ prime.

    Then, recall we just solved for $\zeta + \zeta^{-1}$ 
    (where $\zeta$ is an $11$th root of unity) in terms of $\omega$ 
    (a $5$th root of unity). Indeed, we showed $\zeta + \zeta^{-1} = \alpha_0$, 
    and so $\zeta^2 - \alpha_0 \zeta + 1 = 0$. Now we can get $\zeta$ with 
    radicals and the quadratic formula.

    In general, to build a $p$th root of unity $\zeta$, try looking at 
    $\zeta + \zeta^{-1}$. This will be of degree $\frac{p-1}{2}$ 
    (do you see why?), so inductively we only need smaller roots of unity to 
    construct it.

[1]: https://www.youtube.com/watch?v=UaeJNQ5x17g&list=PL8yHsr3EFj53Zxu3iRGMYL_89GDMvdkgt&index=15
[2]: https://en.wikipedia.org/wiki/Elementary_symmetric_polynomial
[3]: https://sagemath.org
[4]: https://trac.sagemath.org/ticket/17516
