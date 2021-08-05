---
layout: post
title: Solving Solvable Polynomials with Galois Theory
tags:
  - sage
--- 

I'm super excited to be writing this post up! It's been haunting me for 
almost exactly a month now, and it feels good to be close enough to done
that I can write this up. 

I've been spending a lot of time studying galois theory over the past little 
while, since it's easily my weakest area in the standard algebra curriculum.
I've been meaning to really sit down and learn it for a while now, but there's
always been something more pressing. I'm not a fan of the qual system overall, 
but I guess nothing is entirely without merit, and if I'm being honest with 
myself I don't know when I would have gotten around to learning galois theory
if it weren't for the upcoming quals.

Now, one of the most famous theorems in galois theory is that 
the roots of a polynomial $f$ (in $\mathbb{Q}[x]$, say) can be expressed 
with nested radicals if and only if the galois group $G$ of $f$ is solvable.
_So_, if I give you a polynomial with solvable galois group, would you know 
how to actually... solve it?

The proof that's given in most books _is_ actually constructive, but enough
details are left out to make it mostly unimplementable. I eventually found
Gaal's _Classical Galois Theory With Examples_, which is very explicit about
how to do the solving process. In this blog post, we're going to focus in
on the case where most of the work is done: that of a cyclic group. 
You'll remember that every solvable group is an interated extension by cyclic
groups (in fact, this is basically the definition of solvable), so by tackling
this case, we'll get the full solvability case by iteration. I'll write up a
follow up blog post soon where we can talk about that process.

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

$$\sigma \theta_k^n = (\sigma \theta_k)^n = \omega^{nk} \theta_k^n = \theta_k^n$$

so $\theta_k^n$ is fixed by $\sigma$ (and thus the whole galois group). 

4. Since $\theta_k^n$ is fixed by $G$, it must lie in the base field. So
it's just a number, $\psi_k$. That means $\theta_k = \sqrt[n]{\psi_k}$.

5. Now we recover $\alpha_0 = \frac{1}{n} \sum \sqrt[n]{\psi_k}$. In fact,
we can recover each of the $\alpha_j$ as a weighted average of the $\psi_k$.
Do you see how?[^1]
</div>

This is great and all, but there's a bit of magic that happens in step
$4$... How do we actually figure out what the $\psi_k$ are in the base field?
Getting $\psi_0$ is pretty easy: It's the first 
[elementary symmetric polynomial][3], and as such, it's just (the negation of)
the $x^{n-1}$ coefficient of $f$! 

This is actually a clue for how we might in theory get each of the $\psi_k$.
Even though the other $\psi_k$ _aren't_ symmetric in the $\alpha_j$, we can 
still leverage the theorem of symmetric polynomials (with some work) to
figure out which numbers the $\psi_k$ really are. 
This is where Gaal's book was first helpful -- It gives the following algorithm
to really compute the $\psi_k$:

<div class=boxed markdown=1>
1. Consider 

$$
\mathcal{L} = \prod \{ t - \tilde{\psi} \mid \tilde{\psi} \in \mathfrak{S}_n \cdot \psi_1 \}
$$

2. This polynomial _is_ symmetric in the $\alpha_j$ (we forced it to be) 
and so its coefficients live in the base field. We also know that each of the
$\psi_k$ are roots of it.
</div>

I coded it up, and... it crashed my desktop.
It turns out 


I'm going to write a follow up to this post sometime soon where we tackle the
full 


---

[^1]: 
    As a little hint, you'll only need to scale the $\psi_k$ by powers of 
    $\omega$. You should try writing these sums out, say in the $n=3$ case,
    to try and get a handle for what's going on. You might also want to watch
    Richard E Borcherds' (characteristically excellent) video [here][1]

    As a _massive_ hint (and a cute connection with) the rest of mathematics,
    the $\theta_k$ are actually the [Discrete Fourier Transform][2] of the
    $\alpha_j$! So once we know the $\theta_k$s, we can recover the $\alpha_j$s
    using the _inverse_ DFT!

[1]: https://youtu.be/UaeJNQ5x17g
[2]: https://en.wikipedia.org/wiki/Discrete_Fourier_transform#The_unitary_DFT
[3]: https://en.wikipedia.org/wiki/Elementary_symmetric_polynomial
