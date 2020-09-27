---
layout: post
title: Submodels vs Elementary Submodels
tags:
  - logic
---

I'm giving a GSS talk later this week in the hopes of introducing myself to 
my new department. More importantly, I am giving this talk to try and showcase
the utility of model theory in combinatorics and algebra. 
While writing this talk, I've been thinking about the best way to discuss 
<span class="defn">elementary submodels</span> as opposed to regular old
<span class="defn">submodels</span>. When it was taught to me, a focus was
placed on "quantifying over extra stuff", which is true, but I was never shown
a simple example. While I was thinking about how to teach it, I realized we
can already find elementary and nonelementary submodels in graph theory, and
that these might serve as good examples for people new to the area.

So, to begin, we have to talk about <span class="defn">Models</span>.
I'm planning to write a longer form post on model theory at some point, but 
here are the basics.

We typically have functions, relations, and constants associated to any given
"structure" in mathematics. For groups, we obviously have the constant $e$
(representing the identity), a binary function $\cdot$ (for the group operation),
and a unary function ${}^{-1}$ (for inversion). We can define other operations
too, such as the commutator $[x,y] = x^{-1}y^{-1}xy$, but these can all be
defined in terms of the operations given. For the natural numbers $\mathbb{N}$
we often restrict our attention to the constants $0$ and $1$, as well as binary
functions $+$ and $\times$, and a relation $\leq \subseteq \mathbb{N}^2$. An
example that we will refer to for the rest of this post will be graphs. A 
graph has a single binary relation $E$.

When studying any fixed branch of math, the discourse is usually confied to
formulas involving only some collection of symbols. Often we prove things
by manipulating these symbols according to known rules, which are set out
in _axioms_ for how these symbols should behave. Model Theory studies what
we can prove using only this information, and by formulating certain problems
model theoretically, we can bring a lot of powerful machinery to bear.

---

To start, we have to fix the symbols of interest. 
A <span class="defn">Signature</span> is a tuple $\sigma = (C,R_\bullet, F_\bullet)$,
where $C$ is a set of _Constant Symbols_,
$R_n$ is a set of (n-ary) _Relation Symbols_,
and $F_n$ is a set of (n-ary) _Function Symbols_.

Then we can define the <span class="defn">Language</span> $\mathcal{L}(\sigma)$
as (informally) the set of mathematical formulas using

- symbols from $\sigma$
- variables $x_1, x_2, x_3, \ldots$
- =
- $\land$, $\lor$, $\lnot$, $\to$, $\leftrightarrow$
- $\forall$, $\exists$

From your mathematical experience, you doubtless know intuitively how these
symbols are allowed to fit together. However, for those wanting to see the
precise definition, I've included one at this footnote [^1].

[^1]: 
    We recursively define _terms_, which pick out particular elements of a 
    model. Then we use terms to recursively define _formulas_, which are the
    actual objects of interest.
    
    A term is defined recursively as follows:
    - each variable $x_i$ is a term
    - each constant symbol $c$ is a term
    - given terms $t_1, \ldots, t_n$ and an n-ary function symbol $f$, $f(t_1,\ldots,t_n)$ is a term
    
    A formula is defined recursively as follows:
    - given terms $t_1$ and $t_2$, $t_1 = t_2$ is a formula.
    - given terms $t_1, \ldots, t_n$ and a n-ary relation symbol $r$, $r(t_1,\ldots,t_n)$ is a formula
    - given formulas $\varphi_1$ and $\varphi_2$, the following are formulas too
      - $\lnot \varphi_1$
      - $\varphi_1 \land \varphi_2$
      - $\varphi_1 \lor  \varphi_2$
      - $\varphi_1 \to   \varphi_2$
      - $\varphi_1 \leftrightarrow \varphi_2$
    - given a formula $\varphi$ and a variable $x_i$, the following are formulas too
      - $\forall x_i . \varphi$
      - $\exists x_i . \varphi$

    formulas of the first two types are called _atomic_.

Now that we know what formulas we are allowed to discuss (in a fixed language $\mathcal{L}(\sigma)$),
it is time to discuss _models_ for this language. These models are sets 
equipped with functions and relations for each symbol in $\sigma$, and will 
give us a way to assign a truth value to formulas.

Formally, a $\sigma$-model $\mathfrak{M} = (M, C^\mathfrak{M}, R_\bullet^\mathfrak{M}, F_\bullet^\mathfrak{M})$
is a set $M$ plus an element $c^\mathfrak{M} \in M$ for each $c \in C$, a
function $f^\mathfrak{M} : M^n \to M$ for each (n-ary) $f \in F_n$, and
a relation $r^\mathfrak{M} \subseteq M^n$ for each (n-ary) $r \in R_n$.
When no confusion can arise, the superscript ${}^\mathfrak{M}$ is often omitted.


TODO: Talk about first order formulas, models, and use graphs as an example

TODO: Define submodel

TODO: Look at an induced subgraph of a finite graph. Show it is a submodel

TODO: Define _elementary_ submodel

TODO: show that the subgraph from before _isn't_ elementary.

TODO: Exercise: The only elementary subgraph of a finite graph is the whole thing.
Hint: Can you write down a formula which characterizes the graph up to isomorphism?

TODO: So we need to move to infinite graphs. Consider $(\mathbb{Z}, \leq)$
with the submodel $(2\mathbb{Z}, \leq)$. This example isn't very interesting
because they are actually isomorphic. Notice, though, that $(\mathbb{N}, \leq)$
is a submodel too, which is not elementary. 

TODO: Exercise: why not?

TODO: Look at the complete graph on countably many vertices $K_{\aleph_0}$
and the complete graph on uncountably many vertices, say $K_{\mathfrak{c}}$.
Then $K_{\aleph_0}$ is elementary in $K_{\mathfrak{c}}$, yet they are clearly 
not isomorphic (they have different cardinality). 

TODO: It is obvious how $K_{\aleph_0}$ and $K_{\mathfrak{c}}$ "look the same"
despite being nonisomorphic. The notion of elementary submodel more broadly
generalizes this phenomenon. 

---
