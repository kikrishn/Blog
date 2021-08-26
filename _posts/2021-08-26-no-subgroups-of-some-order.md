---
layout: post
title: Showing There is No Element of Some Order in a Group
tags:
  - 
---

I took a practice algebra qual the other day, and was totally stumped by a 
pretty basic group theory question:

<div class=boxed markdown=1>
  Assume that $G$ is a simple group of order $168$. 

  (a) How many elements of order $7$ are there in $G$?

  (b) Show that $G$ does not contain any elements of order $14$.
</div>

Part (a) is a pretty routine application of the Sylow theorems[^1], but part (b) 
stumped me. I don't think I've ever seen a problem like tihs before, and it's
(at least to me) entirely unobvious what to do. Of course, we discussed it 
after the mock qual, and after meditating on the solution for a bit, I'm 
writing this up so I'll hopefully remember the idea.

$\ulcorner$

Let $H \leq G$ with $|H| = 14$. Then $H$ has a $7$-sylow subgroup $P$,
and since $[H:P] = 2$, we must have $P \vartriangleleft H.$ So $H$ 
is contained in $N_G(P)$ (the normalizer[^2] of $P$). 

Now we use a fact that I had entirely forgotten: 
$$[G : N_G(P)] = n_p = \# p\text{-sylow subgroups}$$.
Once you see this, it becomes obvious (exercise: why?[^3]),
and I'm going to try to not forget it again.

With this in hand, though, the rest comes fairly quickly. 
If $[G : N_G(P)] = n_7 = 8$, then 

$$
|N_G(P)| = \frac{|G|}{[G : N_G(P)]} = \frac{168}{8} = 21.
$$

But we know $H \leq N_G(P)$, so $$|H| \, \bigg \vert \, |N_G(P)|$$ and we find 
$14 \, \big \vert \, 21$, giving us the desired contradiction.

<span style="float:right">$\lrcorner$</span>

---

The most obvious way to show that $H \not \leq G$ is to use lagrange's theorem,
and this is still using lagrange's theorem, just in a slightly sharper way.

Normally, we show that $|H|$ does not divide $|G|$, but if we can control
$H$ enough to guarantee $H \leq K \leq G$, then we can actually apply lagrange's
theorem to this subgroup instead! As we saw above, $|G|$ was not restrictive
enough to prevent a subgroup of order $14$, but the smaller group $N_G(P)$
was able to get the job done!

Now, how could we have been clued into thinking about $H \leq N_G(P)$?
Well, primed by the previous paragraph we notice that $14$ _does_ divide the
order of $G$. So if we're going to show the nonexistence of this subgroup,
we'll need something stronger. Without knowing how $H$ embeds into $G$,
though, we have very few tools for finding a $K$ with $H \leq K \leq G$. 
In fact, we really only have two tools which let us move up in the subgroup
lattice.

1. Taking normalizers (note $H \leq N_G(H)$ for every $H$)
2. Working with $p$-subgroups

The normalizer angle isn't promising, since we don't know how $H$ should
sit inside $G$, so we don't know anything about how it conjugates. 
The $p$-subgroup idea seems reasonable, though. After all, every $p$-subgroup
is contained in a Sylow $p$-subgroup. So we might be able to pass information
from the bottom of the subgroup lattice to the top. 

This is doubly effective in our current case, since $7$ is the maximal power
of $7$ in both $H$ _and_ $G$. So actually the (unique!) $7$-sylow subgroup of 
$H$ is already one of the $7$-sylow subgroups of $G$. A very common idea with
$p$-groups is to take normalizers[^4], indeed if you've done much finite group
theory, you're surely familiar with the [frattini argument][2]. The standard
example of this argument is showing

<div class=boxed markdown=1>
If $H \vartriangleleft G$, and $P$ is a $p$-sylow subgroup of $H$, 
then $G = N_G(P) H$.
</div>

So when we see $p$-sylow subgroups, we might be trained to think about 
their normalizers. But as soon as we look at the normalizer of $P$, we
see it contains $H$, and we can finish the proof from there.

---

As a quick epilogue, I [asked mse][3] for general techniques for showing
$G$ does not have a subgroup of order $k$. There have been some comments,
but nothing substantial (at least at time of writing), which makes me
wonder if there _are_ any general techniques for this.

One idea which was brought up (twice) is letting $G$ act on the cosets of
$H$. Then if $G$ is simple, $G$ acts faithfully on the cosets, and so there
is an injection $$G \hookrightarrow \mathfrak{S}_{[G:H]}.$$ In particular, if
the order of $G$ doesn't divide $[G:H]!$, there can be no subgroup of order $H$.

I seem to remember seeing this idea on an exam from an undergraduate algebra
midterm, but I can't find the problem... 

There's a lot of results describing how the prime factorization of $|G|$
relates to the subgroups that it _does_ have
(I'll discuss this some more in a footnote[^5]), but I'm still struggling to come
up with more ways to show $G$ _omits_ a subgroup of some order. If anyone
has any ideas, I would love to hear about it, either at my [mse question][3]
or in the comments here ^_^.

---

[^1]:
    For completeness, we know each element of order $7$ is in exactly one
    $7$-sylow subgroup. How many $7$-sylow subgroups are there? Well, it's 
    $1$ mod $7$ and divides $\frac{168}{7} = 24$. It's quick to see that 
    the only choices are $1$ and $8$, but we know it cannot be $1$ 
    (otherwise the $7$-sylow subgroup would be normal, contradicting 
    simplicity of $G$). So there are $8$ of them. Each contributes $6$ elements
    of order $7$ (since they each contain the identity), and we get $48$
    elements total.

[^2]:
    Recall the normalizer of $P$ is the _largest_ subgroup of $G$ in which $P$
    is normal.

[^3]:
    As a little hint, consider the orbit-stabilizer theorem. 

    As a big hint, let $G$ act on the set of sylow subgroups by conjugation,
    then consider orbit-stabilizer.

[^4]:
    In fact, the mantra for proving things about finite $p$-groups is 
    "normalizers grow". This mantra extends to finite nilpotent groups, 
    since a finite nilpotent group is the direct product of its $p$-sylow 
    subgroups. 

    This doesn't immediately seem helpful, since there are groups where
    some $p$-sylow subgroup satisfies $N_G(P) = P$. 
    Though since looking it up, it seems like this is actually a pretty safe
    bet. _Self Normalizing Sylow Subgroups_ by Guralnick, Malle, and Navarro
    (available from the [ams][1]) shows that if $P$ is a $p$-sylow subgroup for
    $p \gt 3$ then $P = N_G(P)$ implies $G$ is solvable!

    Since our group is simple (and $7 \gt 3$), we could retroactively justify
    this idea. I like the Frattini Argument angle more, though, so that's 
    what I put in the main body of this post.

[^5]:
    The Sylow Theorems tell you that we can always find 
    subgroups of prime power order, and more generally [Hall's Theorem][4] tells
    us that if $G$ is solvable, then $G$ has a subgroup of order $k$ whenever
    $k$ and $\frac{|G|}{k}$ are coprime[^5].

    But we know that lots of groups are solvable! For instance, the famed
    [Feit-Thompson Theorem][5], says that every group of odd order is 
    solvable! Citing another famous result, we know by 
    [Burnside's $p^aq^b$ Theorem][6] that any group with only two prime divisors
    (that is, every group of order $p^aq^b$) is solvable too. 

    Moreover, it's easy to see that every group of squarefree order is solvable
    (this is a cute exercise), and thus satisfies the converse of lagrange's 
    theorem (here we heavily use squarefree-ness of $|G|$). So any group which
    omits a subgroup of some order _must_ have a factor of $p^2$ for some prime 
    $p$.

    There may be odd order groups (or groups with only two prime divisors) which
    omit subgroups, but we see that they can't omit _many_ subgroups by Hall's
    Theorem. By the remark about squarefree order groups, the simplest case is
    groups of order $p^2 q$, and indeed there are already groups of this
    order which omit a subgroup. 
    We see this with $A_4$, of order $12 = 2^2 \cdot 3$, for instance,
    which famously has [no subgroup of order $6$][7].

    Groups which have subgroups of all possible orders are called 
    <span class="defn">CLT Groups</span> for "Converse to Lagrange's Theorem". 
    For more information about the relation between the prime factors of $|G|$
    and the CLT-ness (or indeed the non-CLT-ness) of $G$, you should check out
    the (extremely readable!) thesis 
    _Groups Satisfying the Converse to Lagrange's Theorem_ by Jonah N. Henry.
    You can find a copy [here][8].


[1]: https://www.ams.org/journals/proc/2004-132-04/S0002-9939-03-07161-2/S0002-9939-03-07161-2.pdf
[2]: https://en.wikipedia.org/wiki/Frattini%27s_argument
[3]: https://math.stackexchange.com/q/4232945/655547
[4]: https://en.wikipedia.org/wiki/Hall_subgroup
[5]: https://en.wikipedia.org/wiki/Feit%E2%80%93Thompson_theorem
[6]: https://en.wikipedia.org/wiki/Burnside%27s_theorem
[7]: https://math.stackexchange.com/questions/582658/a-4-has-no-subgroup-of-order-6
[8]: https://bearworks.missouristate.edu/cgi/viewcontent.cgi?article=4484&context=theses
