---
layout: post
title: Rings of Invariants
tags:
  - 
---

TODO:

Spend some time talking about groups acting on vector spaces,
and how this situation arises in (mathematical) nature.

A natural question, then, is how can we _distinguish_ two vectors?
For instance, the vectors foo and bar represent different physical situations
because they have different _lengths_ (obviously, come up with foo and bar).
Notice: length is <span class=defn>invariant</span> under transformations.
So if $|v| \neq |w|$, then $v \neq gw$ for any $g$. In fact, for $O(n)$,
the length is a complete set of invariants, in the sense that 
$v = gw \iff |v| = |w|$ (fact check this).

There is now an obvious question, which we can ask for any group action
$G \curvearrowright V$: Which functions of the entries of the vector
$v = (v_1, \ldots v_n)$ are invariant for the group action?

For instance, if $G = \mathbb{Z} / 2$ acting on $\mathbb{R}^2$ by reflection
about the $y$ axis (picture!), then notice $f(a,b) = b$ is fixed by the
action, since $f(a,b) = f(-a,b) = f(\sigma(a,b))$ (exercise). 
So is $f(a,b) = a^2$, for the same reason.

Another concrete example, showing how we start systematically solving this problem
(introduce the reynolds operator, talk about averages)

For simplicity, let's restrict attention to polynomials. Then we can work with
$k[x,y]$ where $x(a,b) = a$ and $y(a,b) = b$. Talk a bit about how this is a
fairly common convention in geometry, despite it being potentially confusing
at first (cf differential forms, etc).

Now define $$k[x,y]^G \triangleq \{ f \in k[x,y] \mid g \cdot f = f \forall g \in G \}$$,
and do the averaging argument from before in the abstract. Conclude that from
any polynomial we can get an invariant, and moreover, there are 
(finitely many!) "basic" invariants from which all others arise 
(since linear combinations of invariants are obviously invariants).
This is Hilbert's Theorem (fact check this).

From here, there are many more natural questions:

1. When is a set of invariants "complete"? (recall this definition) 
(you should try to find an answer)

2. Can we explicitly compute the generators of $k[\overline{x}]^G$? 
At the very least can we bound the number of generators? what about the
degrees of the geenrators?

3. Given an invariant polynomial, can we effectively write it in terms of the generators?

4. Come up with a few more, and find some references for each.

Exercises:

1. $GL_n$ acts on $GL_n$ by left multiplication. Now vectors are $v = \begin{pmatrix} a & b \\ c & d \end{pmatrix}$.
Compute the ring of invariants? (Is that too hard?)

2. A finite group acting on a vector space? Maybe with application to galois theory?
