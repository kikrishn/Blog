---
layout: post
title: Examples of Syntax/Semantics Theorems Throughout Math
tags:
  - 
---

TODO: fix the links

I've been promising a blog post on syntax and semantics for a long time now.
There's a _lot_ to say, as this duality underlies much of mathematical logic,
but I want to focus on one particular instance of the syntax/semantics 
connection which shows up _everywhere_ in mathematics. I talked about this
briefly in a talk last year (my blog post debriefing from the talk is [here][1])
and I'm exited to finally get around to giving a bunch of examples of this 
principle in action.

As a reminder, <span class="defn">Syntax</span> is the part of mathematics that
deals with symbols, and rules for manipulating them. So the _syntax_ associated
to groups are variables and the symbols $1$, $\cdot$, and ${}^{-1}$. There 
are also rules for manipulating the syntax. For instance, $1 \cdot x$ can always
be replaced by $x$ (and vice versa). 

Syntax, it turns out, gives us a way of _asking questions_ or _talking about_
an object. For instance we can ask the question $\forall x . \forall y . xy = yx$.
The answer to this question, of course, depends on which group we're talking about.

Dually, <span class="defn">Semantics</span> tell us what the syntax _means_. 
If you fix an actual group $G$, then you can _interpret_ the syntax in $G$,
and answer the questions that get asked. We typically denote this with the
symbol $\models$ which is read "models" or "satisfies". 

As an example, $\mathbb{Z} \models \forall x . \forall y . xy = yx$, but 
$\mathbb{S_3} \not \models \forall x . \forall y . xy=yx$.

This is a very [model theoretic][3] notion of syntax and semantics, but I think
it's a good fundamental example[^1]. The kind of theorem that I'm going to focus
on in this post, though, are [descriptive][7] in nature. The idea is this:

<div class=boxed markdown=1>
If your object is simple syntactically, then it must be simple semantically as well.
</div>

Another way to phrase this is

<div class=boxed markdown=1>
If your object is complicated, then it must be difficult to describe.
</div>

This post isn't going to go into the details of any particular example of this
phenomenon. The idea, instead, is to showcase its ubiquity in mathematics by
giving as many examples as I can think of. I would love to hear any other 
examples that you can think of as well!

TODO: spend some time revising the introduction. 

---

## Definable Sets in a Topological Space

Let's start simple. Say $f, g : X \to \mathbb{R}$ are continuous. Then

  - $\{x \mid fx =    gx \}$ and $\{ x \mid fx \leq gx \}$ are closed
  - $\{x \mid fx \neq gx \}$ and $\{ x \mid fx \lt  gx \}$ are open

  This is the kind of theorem that you probably know intuitively, but you 
  might have never thought about formally. Notice that just by looking at the 
  _syntax_ (that is, how the set is defined) we can learn something nontrivial 
  about its _semantics_ (that is, its topological complexity).

  <div class=boxed markdown=1>
  As a simple exercise, if you've never seen this before you should prove this!

  You should recall that $\mathbb{R}$ is hausdorff, so 
  $\Delta = \{ (x,x) \}$ is closed in $\mathbb{R}^2$. 
  Similarly, notice $\{ (x,y) \mid x \leq y \}$ is closed in $\mathbb{R}^2$.
  
  Do you see how to use this to show the claim?
  </div>

Let's make things a little more complicated. Again, say $f, g : X \to \mathbb{R}$
is continuous. Then we can bound the complexity of various sets defined by
referencing $f$ and $g$ by counting quantifiers. 

First, let's look at things that are quantifier free. We can turn logical
symbols in the definition of a set into boolean operations on sets themselves.
So

- $\{x \mid fx = 0 \land gx = 0\} = \{ x \mid fx = 0 \} \cap \{ x \mid gx = 0 \}$
- $\{x \mid fx = 0 \lor gx = 0 \} = \{ x \mid fx = 0 \} \cup \{ x \mid gx = 0 \}$
- $\{x \mid \lnot (fx = 0) \} = \{x \mid fx = 0 \}^c$

Using the fact from earlier that $fx=0$ is a closed condition, we can immediately
see that the first two sets are closed, and the third is open. Any connectives
in the definition can be handled in this way.

That actually _includes_ infinite connectives! For instance, say we have a 
sequence of functions $(f_n)_{n \in \mathbb{N}}$. Then

- $\{x \mid \bigvee_{n \in \mathbb{N}} f_n x = 0\} = \bigcup_{n \in \mathbb{N}} \{ x \mid f_n x = 0\}$ is $F_\sigma$.

A countable conjunction/disjunction is often viewed as a _countable quantifier_ since 

- $\exists n \in \mathbb{N} . \varphi(n) \iff \bigvee_{n \in \mathbb{N}} \varphi(n)$
- $\forall n \in \mathbb{N} . \varphi(n) \iff \bigwedge_{n \in \mathbb{N}} \varphi(n)$

Now we've extended our syntax to be more expressive. We can now use 
countable conjunctions/disjunctions, or equivalently countable quantifiers.
Since our syntax is slightly more complicated, we should be able to describe
more complex sets in this way. 

<div class=boxed markdown=1>
As another fun exercise, you should check that every set definable with 
countable quantifiers is borel. In fact, there's a [hierarchy][8] of complexity
for borel sets, and the position of $\{x \mid \varphi \}$ in this hierarchy is
_exactly_ in correspondence with the (countable) quantifier complexity of 
$\varphi$.
</div>

A big part of [descriptive set theory][7] is trying to turn real-valued 
quantifiers into countable quantifiers. For a high powered example, you
might want to look into [uniformization theorems][9], but for a simple one
let's look at the following classic analysis exercise:

<div class=boxed markdown=1>
Let $f : X \to \mathbb{R}$ be _any_ function. Show the set of points where
$f$ is continuous is borel (indeed, $G_\delta$).
</div>

Notice

$$
\begin{aligned}
\{ x \mid f \text{ is continuous at } x \} 
&= \{ x \mid 
      \forall \epsilon . 
      \exists \delta . 
      \forall y . 
      |x - y| \lt \delta \to |fx - fy| \lt \epsilon 
   \} \\
&\overset{(1)}{=} \{ x \mid
      \forall k \in \mathbb{N} .
      \exists r \in \mathbb{N} .
      \forall y .
      |x - y| \lt \frac{1}{r} \to |fx - fy| \lt \frac{1}{k}
   \} \\
&\overset{(2)}{=} 
   \bigcap_{k \in \mathbb{N}} 
   \bigcup_{r \in \mathbb{N}}
   \{ \forall y . |x-y| \lt \frac{1}{r} \to |fx - fy| \lt \frac{1}{k} \} \\
&\overset{(3)}{=}
   \bigcap_{k \in \mathbb{N}} 
   \bigcup_{r \in \mathbb{N}}
   \{ \forall y \in B_{\frac{1}{r}}(x) . fy \in B_{\frac{1}{k}}(fx) \} \\
\end{aligned}
$$

TODO: sort this example out. How does implication work? It's some sort of
subset relation... Maybe "bounded" real quantifiers are OK?

TODO: write a quick description of each of these steps. Leave another 
problem of this type as an exercise?

<div class=boxed markdown=1>
Notice nothing we've done so far _really_ uses continuity of $f$. Knowing
$f$ is continuous lets us get very precise bounds on the borel complexity
of a definable set, but if $f$ is merely measurable then all of these ideas
go through unchanged if you only want to show a definable set is measurable.

If this isn't obvious, as a quick exercise you should convince yourself of it!
</div>

TODO: phrase the above as a life pro tip?

You might be wondering what happens if we _do_ allow real valued quantifiers.
It turns out there are _still_ theorems in this vein! 

Sets with only existential real quantifiers are called 
<span class="defn">Analytic</span>, and sets with only universal real quantifiers
are called <span class="defn">Coanalytic</span>. A (very!) nontrivial theorem 
in descriptive set theory says that both classes of sets are 
[universally measurable][10], have the [property of baire][11], etc.

TODO: describe universally measurable.

But _now_ you might be wondering if we allow alternating quantifiers! For instance,
what if we allow sets defined by $\forall x . \exists y . \varphi(x,y)$ where
$x$ and $y$ are reals? This turns out to be independent of $\mathsf{ZFC}$!

TODO: say something about the projective hierarchy, large cardinals, and
determinacy.

---

## Restricting the Syntax of an Algebraic Structure

Say we have a group $G = \langle g_1, \ldots, g_n \mid R_1, \ldots, R_m \rangle$ 
defined by generators and relations. This is a _syntactic_ description of the 
group, since it tells us what symbols to use and what the rules are for 
pushing those symbols around.

It's often the case in algebra that we have some syntactic description of an
algebraic object like this. A general life pro tip in this situation is to 
try to make restrictions on the syntax. Oftentimes this will give you 
surprisingly powerful restrictions on how complicated your object itself is.
That is, powerful restrictions on the _semantics_.

Again, let's start easy. The <span class="defn">Word Problem</span> for a 
group $G = \langle S \mid R \rangle$ is the
set of words[^2] $w \in S^*$ which equal the identity in $G$. 
What can we say about $G$ if we assume the word problem isn't too complicated?

The word problem is a subset $W \subseteq S^*$, which we can view as a 
[formal language][12]. There are a few well known classes of languages,
of increasing complexity, and we can ask what must be true of our group if we
assume $W$ falls into each of these classes.

- $W$ is [regular][13] if and only if $G$ is finite.
- $W$ is [context free][14] if and only if $G$ is [virtually free][15]
- $W$ is [computable][16] (that is, the word problem is decidable, or solvable)
    if and only if it can be embedded in a simple group embedding in a 
    finitely presented group.
- Alternatively, $W$ is computable if and only if it embeds into every 
    [algebraically closed group][17].
- $W$ is _always_ [computably enumerable][18], so this does not actually
    pose any restrictions on $G$.

Notice how natural restrictions on the syntax of $G$ correspond to 
(relatively) natural restrictions on the semantics of $G$.

One particularly famous result in this vein is Gromov's theorem on groups of
polynomial growth. This theorem says that a group $G$ has "polynomial growth"
(a syntactic condition) if and only if $G$ is virtually nilpotent.

This is also leaving aside all of the work done on [one relator groups][19].
Mostly I'm leaving this aside because I'm not particularly familiar with 
this area. I know that there _are_ theorems of this form, though. For instance,
if the one relator is not a proper power, then $G$ is torsion free. If anyone
is more familiar than me with one relator groups (and this is not a high bar to clear)
I would love to hear about other examples!



12. monomial ideals

13. other stuff in combinatorial commutative algebra?

---

## Definable Functions

7. definable functions f : R^n --> R decompose their domain into finitely many
regions where f is cts (C^m?) on each region ( see marker, iirc )

8. something about hardy fields? check that book

16. informally, every function you can write down is measurable


## Definable Combinatorics

10. definable graphs admit nice extremal bounds (cf. [here][1])

18. something about borel combinatorics? There must be _some_ result about
definable colorings being "better behaved" than undefinable colorings, etc.
right?

## Logic


15. galois connection between modal logic frames and axioms

17. arithmatically, things with bounded quantifiers must be decidable predicates


## Misc

11. a bit of a stretch, but matrices are "syntax" for the "semantics" of a linear transformation
  - you can read off information about the transformation (eigenvalues, etc) from a matrix



---

[^1]:
    Like any good example, this is true but far from the whole story.

    For instance, free groups
    (and free objects more generally) tend to be made out of pure syntax. We
    are able to interpret the strings of symbols as themselves having a 
    (purely formal) group structure. This method of building semantics out of
    syntax is a great way to make sure that you get a "universal" object in
    some sense. Oftentimes it turns out that something is true of _every_ 
    model if and only if it's true of this "syntactic" model, though this takes
    some work to formalize. 

    We can go the other way as well, and make our syntax so rich it forces 
    the semantics to have some properties. This trick of turning semantics 
    into syntax is _extremely_ useful throughout model theory, because our
    big tool, [compactness][4] is syntactic. We do this using a gadget called
    the [diagram][5] of a model, and you can see a simple example of this 
    in [my talk][6] about model theory.

[^2]:
    Let's assume $S = S^{-1}$ is closed under inverses for simplicity.

[1]: https://terrytao.wordpress.com/2020/09/08/zarankiewiczs-problem-for-semilinear-hypergraphs/
[2]: /2020/12/16/tmd-syntax-and-semantics.html
[3]: model theory wikipedia page
[4]: logical compactness
[5]: diagram of a model
[6]: /2020/10/09/model-theory-and-you.html
[7]: descriptive set theory
[8]: borel hierarchy
[9]: uniformization theorems... maybe lusin-novikov in particular?
[10]: universally measurable
[11]: property of baire
[12]: formal language
[13]: regular language
[14]: context free
[15]: https://en.wikipedia.org/wiki/Virtually
[16]: https://en.wikipedia.org/wiki/Computable_set
[17]: https://en.wikipedia.org/wiki/Algebraically_closed_group
[18]: https://en.wikipedia.org/wiki/Recursively_enumerable_language
[19]: one relator group
