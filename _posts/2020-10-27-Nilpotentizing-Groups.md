---
layout: post
title: Nilpotentizing Groups
tags:
  - Group Theory
  - Universal Algebra
---

I really like group theory, and I've spent a lot of time reading about groups
and their properties. Most of these properties seem like very natural things
to consider ($p$-groups, abelian groups, simple groups, etc.) and the ones 
that don't typically seem motivated by some external factor 
(solvable groups come to mind). However, I have always been somewhat confused
by nilpotent groups. I know that they are "almost abelian", and I can rattle
off some facts about them and sketches of proofs... But it was never made 
clear to me how to work with them _in practice_. If I come across a nilpotent
group in the wild, how does that help me? Surely I should be able to leverage
the "almost abelian"-ness in a way that's more general than "elements of 
coprime order commute".

I figured out how the nilpotency assumption is helpful in computations last 
night, though I got on the topic in a rather roundabout way. I forget 
exactly how my brain moved between these ideas, but the basic outline was
this:

 - The nilpotent groups of class $c$ (really class $\leq c$) form a variety
      by [the HSP theorem](https://en.wikipedia.org/wiki/Variety_(universal_algebra)#Birkhoff's_theorem)
 - But this means there are some _bonus axioms_ that we can add to the standard
      group axioms in order to carve out the class $c$ nilpotent groups.
      (In fact, since the $1$ nilpotent groups are exactly the abelian groups,
      we know the bonus axiom is $xy=yx$ in the case $c=1$)
 - So we should be able to "$c$-nilpotentize" a group in the same way we abelianize 
      it by quotienting by the relations which force these new axioms to hold.

I spent some time thinking about what these new axioms might be, as well as
some categorical questions: Is the subcategory of class $c$ nilpotent groups
reflective in $\mathsf{Grp}$? After all, $\mathsf{Ab}$ is. But then I started
thinking about why somebody might care about this construction. We care about
the abelianization because it _simplifies_ the group. It stands to reason that
a nilpotentization might simplify the group with a slightly softer touch. 
By varying $c$, we can control how big a quotient we want to take -- this
lets us trade simplicity of the quotient against fidelity to our original group!
Immediately, there are two very natural questions that arise:

 - Can we actually $c$-nilpotentize a group in practice? What do we quotient by?
 - How exactly are nilpotent groups are easier to work with than general groups? 
    What does this construction _really_ buy us?

It was in the process of understanding the second bullet that I felt like
I started understanding some practical benefits of nilpotency. 

<div class="boxed" markdown=1>
  As a fun game, can you show that $c\mathsf{Npt}$, the subcategory
  of class $c$ nilpotent groups, is reflective in $\mathsf{Grp}$? You 
  can see this abstractly if you know that every variety has free objects,
  so there is a "free class $c$ nilpotent group" on a given set $X$ [^1].

  Remember, to show that $c\mathsf{Npt}$ is reflective in $\mathsf{Grp}$, 
  you want to show that there is a unique "$c$-nilpotentization" $G^{c\text{Nil}}$
  so that every hom $G \to H$ with $H \in c\mathsf{Npt}$ factors through 
  $G^{c\text{Nil}}$. In the case $c=1$, this is exactly the abelianization!
</div>

---

Let's start with the second bullet and talk about what nilpotency buys us.
We understand the class-$1$ groups (alias: abelian groups) well, so let's 
take a look at class-$2$ groups. 

Recall the <span class="defn">Lower Central Series</span> of a group $G$ 
is recursively defined by 

 - $\gamma_1(G) = G$
 - $\gamma_{n+1}(G) = [\gamma_n(G),G]$

Then $G$ is called <span class="defn">Nilpotent</span> (of class $c$) whenever
$\gamma_{c+1}(G) = 1$. So, a nilpotent group of class $1$ is a group where
$\gamma_2(G) = [G,G] = 1$, and $G$ is abelian. This definition has always felt
kind of opaque to me, but last night I realized what I was missing 
(and what was probably obvious to most other people):

$$gh = hg[g,h]$$

This wholly obvious fact says that we can commute any two elements provided
we pick up a factor of $[g,h]$. In this way, $[g,h]$ measures how $g$ and $h$
fail to commute.

Now, in an abelian group, $[g,h] = 1$ for all $g,h$. So we can commute with
impunity. In a group of class $2$ this can fail, but we know that
$\gamma_3(G) = 1$. That is, $[[G,G],G] = 1$. Said yet another way, $[[g,h],k] = 1$
for every $g,h,k$! So sure we might pick up a commutator fudge factor, but 
this fudge factor will commute with everything!

Concretely, this means we can always push commutators to one side!

$$ghk = hg[g,h]k = hgk[g,h]$$

So in a group of class $2$, we can rearrange our product as much as we want
as long as we promise to multiply by a fudge factor from $[G,G]$ at the end.
For any permutation $\sigma$:

$$g_1 g_2 \ldots g_n = g_{\sigma(1)} g_{\sigma(2)} \ldots g_{\sigma(n)} h$$

for some $h \in [G,G]$ depending on $\sigma$.

Similarly for groups of class $3$. Now $[G,G,G,G]$ is trivial[^2], so
our commutators may not be central, but our "second order" commutators are:

$$ghk = hg[g,h]k = hgk[g,h][[g,h],k]$$

In this instance, the "second order" fudge factor $[[g,h],k]$ 
(often written as $[g,h,k]$ -- see the earlier footnote) will commute
with everything.

It is clear that these get hairy fairly quickly, but it makes the entire
concept feel (at least to me) more concrete. It also makes clear how this
is a generalization of abelianness - when we commute things, the resulting
fudge factors are easy to control. Of course, the degree of "easiness"
decreases fairly quickly as the nilpotency class $c$ increases. For $c=2$,
though, this seems like a viable object to study if one is looking to
simplify a group!

---

So how might we find the nilpotentization of $G$? Earlier on in the 
post I alluded to some abstract nonsense which will give us the result
(It probably says something about me that this was the proof my sleep-deprived
brain first reached for). However, now that we've remembered the 
lower central series definition of a nilpotent group, there is a much cleaner,
down-to-earth approach:

<div class="boxed" markdown=1>
  $G^{c\text{Nil}} = G / \gamma_{c+1}(G)$
</div>

We simply _force_ $\gamma_{c+1}(G) = 1$. This is directly analogous to the
abelianization, since $\gamma_2(G) = [G,G]$! It takes a tiny argument to 
show that any group homomorphism $G \to H$ with $H$ of class $c$ factors
through $G^{c\text{Nil}}$, but I'll leave this verification as a cute exercise.

One thing I will touch on, though -- Why can we quotient by $\gamma_{c+1}(G)$?
Is it obvious that these groups are always normal? I certainly don't think so!
But, it turns out that $\gamma_{c+1}(G)$ shares lots of nice properties with $[G,G]$.

Here is (for me) the easiest way to see what I mean: Just like 
$[G,G] = \gamma_2(G)$ is generated by $\langle [g,h] \rangle$, it turns out
$[G,G,G] = \gamma_3(G)$ is generated by $\langle [[g,h],k] \rangle$! 
In fact, $\gamma_{n}(G)$ is generated by $\langle [g_1, \ldots, g_n] \rangle$
(again, using the notation from the footnote). 

But this is fantastic! We know that subgroups of this form are called
[verbal](https://groupprops.subwiki.org/wiki/Verbal_subgroup) and they 
satisfy _lots_ of very nice properties [^3]! In particular, all verbal
subgroups are 
[characteristic](https://en.wikipedia.org/wiki/Characteristic_subgroup), 
thus normal.

---

As one last question, we might ask how easy it is to compute with these
nilpotentizations. Luckily, there are some efficient implementations of these results.
You can read more about these algorithms [here](https://math.stackexchange.com/questions/3258639/nilpotent-quotient-algorithm),
but the tldr is:

 - [Magma](http://magma.maths.usyd.edu.au/magma/) has functions like 
      $\mathtt{NilpotentQuotient(G,c)}$ which computes the class $c$ 
      nilpotentization of $G$. 
      (Documentation [here](https://magma.maths.usyd.edu.au/magma/handbook/text/831#9446))

 - [GAP](https://www.gap-system.org/) has the $\mathtt{NQ}$ package, which also
      has a $\mathtt{NilpotentQuotient(G,c)}$ function.
      (Documentation [here](https://www.gap-system.org/Packages/nq.html))

Since GAP ships built-in with [Sage](https://www.sagemath.org/), we have access
to these algorithms in our favorite computational tool. Unfortunately,
the $\mathtt{NQ}$ package wasn't included in my sage installation by default --
I had to install gap-packages via pacman in order to get it.

With that subtle point out of the way, let's see it in action. 
Since the sage cloud server I use doesn't play nice with the GAP console,
I can only include a screenshot. You should definitely experiment with this
stuff yourself, though!

![Some GAP code running inside of sage](/assets/images/nilpotentizing-groups/sage-out.png)

Notice we asked for the class $1$ nilpotentization of $F_2$, and GAP
correctly gave us $\mathbb{Z}^2 = F_2^\text{ab}$! 

In the case of finite groups, we can write dumber code in pure sage:


<div class="linked_auto">
<script type="text/x-sage">
from itertools import combinations_with_replacement

def Nilpotentize(G,c):
    """
    Return the nilpotent quotient of class c.
    
    Only works for finite groups G!
    """
    def iterated_commutator(gs):
        """
        computes [g1, g2, ... gn] from a list gs
        """
        comm = gs[0]
        for g in gs[1:]:
            comm = comm.inverse() * g.inverse() * comm * g
        return comm
    
    # Get the subgroup generated by the iterated commutators
    toKill = G.subgroup([iterated_commutator(gs) for gs in combinations_with_replacement(G.list(),c+1)])

    return G.quotient(toKill)
</script>
</div>


I only wrote this code today, so I haven't had time to play around with it yet.
Here are some fun questions I have for myself, which you might also want to
think about!

 - Where do the various $\gamma_n(G)$ show up in the lattice of subgroups of $G$?
 - For finite groups, the decreasing chain $\gamma_n(G)$ must eventually stabilize. 
    Given a group $G$, can we predict for which $n$ this will happen?
 - What can we say about a group $G$ if we know the chain $\gamma_n$ stabilizes quickly? Stabilizes slowly?

There's lots of interesting questions one gets by playing around with these groups!
Let me know in the comments if you think of any of your own ^_^

---

[^1]: 
    Free nilpotent groups seem to be well studied, and fairly complicated! 
    This is one excellent example of abstract nonsense providing the existence
    of a free object whose combinatorial description is... unpleasant.
    You can read Terry Tao's description of them
    [here](https://terrytao.wordpress.com/2009/12/21/the-free-nilpotent-group/).

[^2]:
    Here we define $[G,G,G,G] = [[[G,G],G],G]$. This seems to be standard 
    in the literature, and we can do it at the element level too:
    $[g,h,k] = [[g,h],k]$. Notice this is _not_ associative! 
    $[[g,h],k] \neq [g,[h,k]]$ so we must remember to associate _left_!

[^3]:
    This is a kind of syntax-semantics relationship. 
    One day I want to make a post talking about syntax and semantics, 
    and in particular some real-world ways where this duality arises
    (even if somewhat informally). In the mean time, trust that this
    result is part of a larger pattern of spiritually related results.
