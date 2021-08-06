---
layout: post
title: Solving Solvable Polynomials with Galois Theory (Part 1)
tags:
  - sage
  - solving-solvable-polynomials
--- 

I'm super excited to be writing this post up! It's been haunting me for 
almost exactly a month now, and it feels good to be close enough to done
that I can finally share my hard work with the world ^_^.

I've been spending a lot of time studying galois theory in the past little 
while, since it's easily my weakest area in the standard algebra curriculum.
I've been meaning to really sit down and learn it for a few years now, but there's
always been something more pressing. I'm not a fan of the qual system overall, 
but I guess nothing is entirely without merit, and if I'm being honest with 
myself? I don't know when I would have gotten around to learning galois theory
if it weren't for the upcoming quals.

Now, one of the most famous theorems in galois theory is that 
the roots of a polynomial $f$ (in $\mathbb{Q}[x]$, say) can be expressed 
with nested radicals if and only if the galois group $G$ of $f$ is solvable.
_So_, if I were to give you a polynomial with solvable galois group, would you 
know how to actually... solve it?

The proof that's given in most books _is_ actually constructive, but enough
details are left out to make it mostly unimplementable. I eventually found
Gaal's _Classical Galois Theory With Examples_, which is very explicit about
how to do the solving process. In this blog post, we're going to focus in
on the case where most of the work is done: 
that of a cyclic group of prime order[^3]. 
You'll remember that every solvable group is an interated extension of these 
groups (in fact, this is basically the definition of solvable), so by tackling
this case, we'll get the full solvability case by iteration. I'll write up a
follow up blog post soon where we talk about that process.

For now, though let's see the algorithm:

<div class=boxed markdown=1>
Let $f$ be a monic polynomial of degree $n$ with cyclic galois group, generated
by $\sigma$.

1. Let $\alpha_0, \ldots, \alpha_{n-1}$ be the roots of $f$ -- these are just
symbols for now. But without loss of generality order them so that 
$\sigma \alpha_j = \alpha_{j+1}$.

2. Let $\omega$ be an $n$th root of unity

3. Look at the equations $\theta_k = \sum_{0 \leq j \lt n} \omega^{j k} \alpha_j$.
Notice $\sigma \theta_k = \omega^k \theta_k$ (do you see why?). This means
<br><br>
$$\sigma \theta_k^n = (\sigma \theta_k)^n = \omega^{nk} \theta_k^n = \theta_k^n$$
<br><br>
so $\theta_k^n$ is fixed by $\sigma$ (and thus the whole galois group). 

4. Since $\theta_k^n$ is fixed by $G$, it must lie in the base field. So
it's just a number, $\psi_k$. That means $\theta_k = \sqrt[n]{\psi_k}$.

5. Now we recover $\alpha_0 = \frac{1}{n} \sum \sqrt[n]{\psi_k}$. In fact,
we can recover each of the $\alpha_j$ as a weighted average of the $\psi_k$.
Do you see how?[^1]
</div>

This is great and all, but there's a bit of magic that happens in step
$4$... How do we actually figure out what the $\psi_k$s are in the base field?
Getting $\psi_0$ is pretty easy: It's the first 
[elementary symmetric polynomial][3], and as such, it's just (the negation of)
the $x^{n-1}$ coefficient of $f$! 

This is actually a clue for how we might in theory get each of the $\psi_k$.
Even though the other $\psi_k$ _aren't_ symmetric in the $\alpha_j$, we can 
still leverage the theorem of symmetric polynomials (with some work) to
figure out which numbers the $\psi_k$ really are. 
This is where Gaal's book was first helpful -- it introduced me to the following
idea:

Consider the polynomial (which I later learned is called the [galois resolvent][4])

$$
\mathcal{L}(t) = 
\prod \{ t - \tilde{\psi} \mid \tilde{\psi} \in \mathfrak{S}_n \cdot \psi_1 \}.
$$

This product ranges over an orbit of $\psi_1$. Notice that each of the $\psi_k$
for $k \neq 0$ are in this orbit (do you see why?) so each nonzero $\psi_k$ 
is a root of $\mathcal{L}$.

A priori, $\mathcal{L}$ lives in $\mathbb{Q}(\omega)[\alpha_0, \ldots, \alpha_{n-1}][t]$, 
since the $\psi$s are all polynomials in the $\alpha_j$. But the coefficients
of $\mathcal{L}$ are all symmetric in the orbit of $\psi_1$, and thus,
symmetric in the $\alpha_j$ (again, do you see why?). So $\mathcal{L}$ is
actually an element of $\mathbb{Q}(\omega)[t]$! But we know how to find the roots 
of a polynomial with constant coefficients (or rather, sage does), and these
roots are exactly the $\psi_k$!

I coded it up, and... it crashed my desktop. In lieu of downloading more ram,
I tried to optimize my code (see [here][5]), which still didn't work. I
also tried to find a more effective procedure (see [here][6]), but it seems 
like this is really how it's done. I know it's been done before 
(in the gap [radiroot][7] package, for instance), but I didn't want to have
to reverse engineer someone else's code unless I absolutely had to[^2].
So, I kept looking.

Eventually I learned that $\mathcal{L}$ is called the resolvent, and I spent
some time learning more about resolvents and why they're interesting and
useful[^4]. So my next step was to find an efficient algorithm for evaluating
resolvents, and I found one! My code here is an implmentation of the algorithm
described in Lehobey's 
_Resolvent Computations By Resultants Without Extraneous Powers_, which is
super readable if you're interested!

It's still kind of slow, but it's less memory intensive, and it definitely
gets the job done!

<div class="linked_auto">
<script type="text/x-sage">
def interpolating_functions(f):
  """
  Build a list of interpolating functions for f

  We require f : K[x1,...,xn][x]
  """
  R = f.parent().base_ring()
  xs = R.gens()

  n = f.degree()

  out = [f]  
  for k in range(f.degree()):
    fk = (out[-1] - out[-1].subs(x=xs[n-k-1]))/(x - xs[n-k-1])
    out += [f.parent()(fk.simplify_full())]

  return out[::-1]


def stabilizer(G,p):
  """
  Compute the stabilizer of p by G
  """
  elems = []
  for g in G:
    if p * g == p:
      elems += [g]
  return G.subgroup(elems)



def truncated_root(p,r,d):
  """
  Compute q so that q^r = p (working mod x^d)

  Assumes p : A[t] has constant term 1 
  and that such a q : A[t] actually exists!
  """

  r = int(r)
  t = p.variables()[0]
  n = p.degree()
  p = p.truncate(d)

  ps = p.coefficients(sparse=False)

  # these will be the coefficients of q
  qs = [1]

  for k in range(n // r):
    qs += [1/(k+1) * sum([(k+1 - (r+1)*j) * qs[j] * ps[k+1-j] / r for j in range(k+1)])]

  return sum([qs[j] * t^j for j in range(len(qs))])



def resolvent(f,Theta):
  """
  Compute mathcal{L}_{Theta,f} as per the paper

  Assumes f : K[x1,...,xn][x] and Theta : K[x1,...,xn]
  """
  R = Theta.parent()
  K = R.base_ring()
  xs = R.gens()

  SIterated.<t> = PolynomialRing(R)
  S = SIterated.flattening_morphism().codomain()

  T = K[t]

  Rj = (t - SIterated(Theta)).reverse()
  Rj = S(Rj)

  fs = interpolating_functions(f)

  HprevOrder = 1

  n = f.degree()

  for j in range(1,n+1):
    print(j, "/", n)
    Sj = SymmetricGroup(j)
    Hj = stabilizer(Sj,Theta)
    dj = factorial(j) / Hj.order()
    mj = Hj.order() / HprevOrder

    # update the previous order for the next cycle
    HprevOrder = Hj.order()

    # there's an annoying off-by-one error with the variable names
    # compared to everything else
    fj = S(fs[j].subs(x=xs[j-1]))

    res = fj.resultant(Rj, S(xs[j-1]))

    Rj = truncated_root(SIterated(res),mj,dj+1)
    Rj = S(Rj)

  return T(Rj).reverse()


def solveByRadicals(f):
  """
  Compute a root of f using radicals

  f(x) is assumed to be symbolic
  """

  n = int(f.degree(x))
  K.<w> = CyclotomicField(n)

  R = PolynomialRing(K,n,'x')
  xs = R.gens()

  R1 = R[x]
  f = R1(f)

  Theta = sum(xs[k] * w^(k) for k in range(n))

  # Theta^n is preserved under the action of the galois group,
  # while Theta itself is an eigenvector with eigenvalue w
  L = resolvent(f,Theta^n)

  psis = L.roots(multiplicities=False)
  thetas = [psi^(1/n) for psi in psis]

  # we need to choose the ~correct~ nth root for each psi.
  # I don't actually know how you're supposed to know which 
  # one is right, so we just try them all...
  #
  # There must be a better way to do this, but I want to start
  # working on other things.

  from itertools import product
  for es in product([w^k for k in range(n)], repeat=n-2):
    r = (-list(f)[-2] + thetas[0] + sum(es[k-1] * thetas[k] for k in range(1,n-1)))/n
    # there's definitely a better way to do this too...
    if abs(f(r).n()) < 0.000000001:
      return r

  # if we never found a root
  print("Uh oh!")

R = QQ[x]

deg3s = [x^3 - x^2 - a*x + b for (a,b) in [(26,-41), (32,79), (34,61), (36,4), (42,-80), (46,-103)]]

deg5s = [x^5 + x^4 - 4*x^3 - 3*x^2 + 3*x + 1, 
         x^5 + x^4 - 12*x^3 - 21*x^2 + 1*x + 5, 
         x^5 + x^4 - 16*x^3 + 5*x^2 + 21*x - 9, 
         x^5 + x^4 - 24*x^3 - 17*x^2 + 41*x - 13]

deg7s = [x^7 + x^6 - 12*x^5 - 7*x^4 + 28*x^3 + 14*x^2 - 9*x + 1]

fs = deg3s + deg5s + deg7s

@interact
def _ (f=selector(fs, label="$f$"), auto_update=False):
  show(solveByRadicals(f))
</script>
</div>

The sagemath online server times these out for polynomials of degree $5$ and $7$,
but you can run this code locally to see that it does give the right answer[^5].
The degree $5$ case is slow, but manageable. The degree $7$ case is... 
really impressively slow. You've been warned.


<div class=boxed markdown=1>
As a slightly tricky exercise, we're assuming throughout that we have access
to roots of unity... But how do we know that we can write roots of unity
in terms of radicals? 

Show that roots of unity can always be written in terms of radicals[^6].
</div>


---

[^1]: 
    As a little hint, you'll only need to scale the $\psi_k$ by powers of 
    $\omega$. You should try writing these sums out, say in the $n=3$ case,
    to try and get a handle for what's going on. You might also want to watch
    Richard E Borcherds' (characteristically excellent) video [here][1]

    As a _massive_ hint (and a cute connection with the rest of mathematics),
    the $\theta_k$ are actually the [Discrete Fourier Transform][2] of the
    $\alpha_j$! So once we know the $\theta_k$s, we can recover the $\alpha_j$s
    using the _inverse_ DFT!

[^2]:
    Especially since the package is based on Andreas Distler's 
    [thesis][8], and my German is.... nicht so gut.

[^3]:
    I'm fairly confident this will work on cyclic groups of composite order too,
    and I've even tested it on a few polynomials of degree $4$. But the prime
    case is all we need for solvability, and I can say for sure that it 
    always works in that case, so that's what we're going with.

[^4]:
    There's not much sense writing up a post about it, though, since there's 
    actually a ton of great resources on this! Healey's 
    _Resultants, Resolvents, and the Computation of Galois Groups_ 
    (available [here][9]) certainly comes to mind.

[^5]:
    The answers _are_ pretty unwieldy, though. So maybe it's for the best you
    need to run it locally. 

    For instance, if $\zeta$ is an $11$th root of 
    unity, then $\mathbb{Q}(\zeta)$ is a cyclic extension of degree $10$.
    This means $\zeta + \zeta^{-1}$ (which is of degree $2$ _under_ $\mathbb{Q}(\zeta)$)
    generates an extension of degree $5$ over $\mathbb{Q}$. 

    Sage tells us the minimal polynomial of $\zeta + \zeta^{-1}$ is 
    $x^5 + x^4 - 4x^3 - 3x^2 + 3x + 1$, and so we can use this code to write
    $\zeta + \zeta^{-1}$ as:

[^6]:
    As a hint, let $\zeta$ be an $n$th root of unity for $n$ odd. 
    First show that you can recover $\zeta$ from $\zeta + \zeta^{-1}$,
    and that $\zeta + \zeta^{-1}$ satisfies a (cyclic) equation of degree $\frac{n-1}{2}$.
    Then, inductively, we can solve this by radicals, and then get $\zeta$ 
    with one more square root.

    Do you see how to do the $n$ even case as well?


[1]: https://youtu.be/UaeJNQ5x17g
[2]: https://en.wikipedia.org/wiki/Discrete_Fourier_transform#The_unitary_DFT
[3]: https://en.wikipedia.org/wiki/Elementary_symmetric_polynomial
[4]: https://en.wikipedia.org/wiki/Resolvent_(Galois_theory)
[5]: https://ask.sagemath.org/question/58035/polynomial-multiplication-is-unexpectedly-slow/
[6]: https://math.stackexchange.com/questions/4204419/solving-a-solvable-polynomial-by-radicals-effectively
[7]: https://www.gap-system.org/Packages/radiroot.html
[8]: http://www.icm.tu-bs.de/ag_algebra/software/distler/Diplom.pdf
[9]: http://www.alexhealy.net/papers/math250a.pdf
