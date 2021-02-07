---
layout: post
title: Algebraic Misconceptions 1
tags:
  - algebraic-misconceptions
  - algebra
  - mse
---

I spend a lot of time on [math stackexchange](https://math.stackexchange.com) (mse), 
and I periodically see "simple" questions that totally shatter a misconception that
I didn't know I even held.

My first time experiencing this was when I learned that normal subgroups 
need not be transitive. That is,

<div class="boxed" markdown=1>
  If $N \vartriangleleft H$ and $H \vartriangleleft G$, it is _not_ true
  (in general) that $N \vartriangleleft G$.
</div>

For cultural growth, we _do_ have transitivity whenever $N$ is 
[characteristically normal](https://en.wikipedia.org/wiki/Characteristic_subgroup)
in $H$. Symbolically, $N \vartriangleleft^c H$. 

In fact, not only is $\vartriangleleft^c$ transitive, we recover some amount
of transitivity with the regular "normal subgroup" relation too. That is, 
in addition to transitivity

$$N \vartriangleleft^c H \vartriangleleft^c G \implies N \vartriangleleft^c G$$

we _also_ have a "weak transitivity"

$$N \vartriangleleft^c H \vartriangleleft G \implies N \vartriangleleft G$$

I forget exactly when I first saw that normal subgroup-ness isn't transitive, 
but I remember it was shocking. Even though
in hindsight it is obvious how normalcy fails to be transitive, it was never
something I explicitly saw. Moreover, the notation is so suggestive of a
transitive relation, it felt more "obvious" than it probably should have.
I had this realiziation long enough ago that I 
no longer have the mse post where I first saw it. However, I have had two 
similar realizations in recent memory, and I figured I would include them
here as quick posts analogous to my "quick analysis trick" series.

---

The first fact is that [simple groups](https://en.wikipedia.org/wiki/Simple_group)
need not be hereditary. That is, if $G$ is simple and $H \leq G$, it is 
not necessarily true that $H$ is simple.

This misconception is interesting to me because I think if you asked me
"are simple groups hereditary?" I would have probably answered 
"I don't think so?" as a gut reaction. Giving myself the benefit of the doubt,
I'll say I might even have come up with a counterexample after a minute or two. 

Even though I think I would have said "no" when asked, when I first saw this
written out it struck me as somewhat surprising. At the very least, it struck
me as a mistake a younger me might have made. Even knowing it is false, though,
I don't think I would not have guessed how badly it fails! 
Again, I'm afraid I've lost the mse link to the question
where I learned about this, but I remember the idea: 

<div class="boxed" markdown=1>
Every finite group embeds into some alternating group $A_n$. 
</div>

We know by Cayley's Theorem that every $G$ embeds into the
symmetric group $$\mathfrak{S}_{|G|}$$. Then it remains to show $$\mathfrak{S}_n$$
embeds into the alternating group $A_{n+2}$. But we can do this by the map
(which one easily checks to be an embedding)

$$
f(\sigma) = 
\begin{cases} 
  \sigma & \text{when } \sigma \text{ is even}\\
  \sigma (n+1 \quad n+2) & \text{when } \sigma \text{ is odd}
\end{cases}
$$

Then every $G$ embeds into $$A_{|G|+2}$$. 
Pairing this with the fact[^1] that we can find a finite group 
$G_n$ so that every group of order $\leq n$ embeds in $G_n$, we see 
there is an alternating group $A_N$ (with $N \gg n$) which contains _every_ group
of order at most $n$ as a subgroup!

[^1]:
    Enumerate the (finitely many) groups of order $\leq n$ (up to isomorphism)
    as $H_i$. Then we can simply product them all together to get a (rather large)
    finite group $G_n = \prod H_i$. This is obviously inefficient, 
    but it seems like [not much is known](https://math.stackexchange.com/questions/324913/order-of-the-smallest-group-containing-all-groups-of-order-n-as-subgroups)
    about how small we can make $|G_n|$. 

Once we know that every finite group embeds into some alternating group, 
it is natural to ask the same of other families of finite simple groups. 
This question has [been asked before](https://mathoverflow.net/questions/163640/variations-to-cayleys-embedding-theorem-for-groups),
and there are references on that post which show that some natural families of
simple groups _don't_ have this property 
(such as the [Suzuki Groups](https://en.wikipedia.org/wiki/Suzuki_groups)),
but I don't know enough about the classification
to properly think about this myself. Someday, though!
 
---

The second fact is one that I saw today, in 
[this question](https://math.stackexchange.com/questions/3861138/quotient-of-abelian-group-by-isomorph-subgroups).

<div class="boxed" markdown=1>
  There are abelian groups $G$ with isomorphic subgroups $H_1 \cong H_2 \leq G$
  such that $G/H_1 \not \cong G/H_2$.
</div>

This caught me super off guard. Unlike the last one, my gut reaction would
be that whenever $H_1 \cong H_2$ we must have $G/H_1 \cong G/H_2$.
It still feels weird to me, but at least I'm 
aware of it, so now I can start properly internalizing it. An example of this
phenomenon was given by Andreas Blass in the comments of the post above. 

$$G = (\mathbb{Z}/2) \times (\mathbb{Z}/4)$$

$$H_1 = (\mathbb{Z}/2 \times \{ 0 \})$$

$$H_2 = (\{ 0 \} \times 2 \mathbb{Z}/4)$$

Here we have $H_1 \cong \mathbb{Z}/2 \cong H_2$, while 
$G/H_1 \cong \mathbb{Z}/4$ and $G/H_2 \cong \mathbb{Z}/2 \times \mathbb{Z}/2$.

One natural question is "when _does_ $G/H_1 \cong G/H_2$"? This is
explored in [a different mse post](https://math.stackexchange.com/questions/40881/isomorphic-quotients-by-isomorphic-normal-subgroups?rq=1).
The asker notices that it is enough to have some automorphism 
$\varphi : G \to G$ so that $\varphi(H_1) = H_2$. Unfortunately for those
looking for a clean characterization, the answer on that question shows this is not enough.
However, this can also be taken as a comfort. There are
lots of examples of non-automorphic subgroups which still have $G/H_1 \cong G/H_2$,
so perhaps it's not so surprising that I found this surprising.

---
