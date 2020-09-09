---
layout: post
title: Choices for the "Category of Graphs"
tags:
  - combinatorics
  - graph theory
  - category theory
---

In the [last post](/2020/08/16/raag-defn) we talked about 
Right Angled Artin Groups and gave some basic examples. At the end, I
asserted that this construction is functorial, but I didn't show it.
This is because, to even _talk_ about functoriality, we need to know what categories
the raag construction moves between. Obviously it outputs a group, and the
category $\mathsf{Grp}$ of groups is fairly unambiguous. The domain, though,
should be a category of graphs, and this is a more subtle point. There are 
_lots_ of options for a category of graphs in the literature, and the one
you pick matters quite a bit. In this post I'll summarize the ones that I'm
most drawn to, as well as their similarities and differences. 
This way we can have a better idea of what categorical constructions are 
available to us when we study the raag functor.

As a tl;dr for future reference here is a table summarizing the various
categories. For a more in depth descritpion, one category at a time, 
keep reading. 

⚠ Warning: It seems like the names for the various categories is pretty 
nonstandard. I've chosen names that I think are memorable, but 
if you're reading a paper, make sure you know which category the authors 
are talking about. I'm also missing plenty of categories that people have
considered -- these are just the ones that I find myself reaching for 
intuitively. For a zoo of other options, see these pages on the nlab
(
[1](https://ncatlab.org/nlab/show/graph),
[2](https://ncatlab.org/nlab/show/category+of+simple+graphs),
[3](https://ncatlab.org/nlab/show/digraph),
[4](https://ncatlab.org/nlab/show/directed+graph)
).

---

| Name                 | Brief Description                                       | Complete | Cocomplete | Cartesian Closed | Subobject Classifier    | Remarks                                                                                                                                                                                                |
| :---:                | :---:                                                   | :---:    | :---:      | :---:            | :---:                   | :---:                                                                                                                                                                                                  |
| $\mathsf{DiGph}$     | Sets with an edge relation                              | Yes      | Yes        | Yes              | Only for full subgraphs | A good category for directed graphs. Keep in mind this allows self loops!                                                                                                                              |
| $\mathsf{Gph}$       | Sets with a symmetric edge relation                     | Yes      | Yes        | Yes              | Only for full subgraphs | My preferred category of graphs. Keep in mind this allows self loops too!                                                                                                                              |
| $\mathsf{SimpDiGph}$ | Sets with an irreflexive edge relation                  | No       | Yes        | No               | No                      | This is what most people are talking about when they discuss "directed graphs"                                                                                                                         |
| $\mathsf{SimpGph}$   | Sets with a symmetric, irreflexive edge relation        | No       | Yes        | No               | No                      | This is what most people are talking about when they discuss "graphs"                                                                                                                                  |
| $\mathsf{ReflGph}$   | Sets with a reflexive, symmetric edge relation          | Yes      | Yes        | Yes              | Only for full subgraphs | This category _always_ allows maps that collapse vertices. This is great for working with [minors](https://en.wikipedia.org/wiki/Graph_minor) but usually adds more homs than I would personally like. |
| $\mathsf{Quiv}$      | Functor Category $\mathsf{Set}^{e \rightrightarrows v}$ | Yes      | Yes        | Yes              | Yes                     | This category is of directed multi-graphs, allowing self loops. It is a fully fledged topos                                                                                                            |

---

$\mathsf{DiGph}$
================

We're starting here, because the objects are as simple as possible. Everything
else (except quivers) will be a variation on this theme. Because of that, 
I'll define a lot of terms here that will end up being used later as well.

The objects of $\mathsf{DiGph}$ are pairs $(V,E)$ where $E \subseteq V \times V$ 
is _any_ relation. We visualize these by drawing a (directed!) arrow from
$v_1$ to $v_2$ whenever $(v_1, v_2) \in E$. Notably, there is nothing preventing
$(v,v) \in E$, and so we might have _self-loops_ connecting a vertex to itself.

As a quick example, if $$V = \{a,b,c\}$$ and $$E = \{(a,a), (a,b), (b,c), (c,b)\}$$,
then we would depict this as the following digraph:

![example digraph](/assets/images/graph-cats/example-digraph.png)

The morphisms of this category are the _structure preserving maps_.
More explicitly, a morphism from $(V,E)$ to $(W,F)$ is a function $f : V \to W$ 
with the bonus property $(v_1, v_2) \in E \Longrightarrow (f(v_1),f(v_2)) \in F$.

$\mathsf{DiGph}$ is categorically excellent, in large part because of 
its intimate relationship with $\mathsf{Set}$. Indeed, $\mathsf{DiGph}$
is [topologically concrete](https://ncatlab.org/nlab/show/topological+concrete+category),
which (among other things) means it has all limits and colimits. Of course,
it would be nice to know how to _compute_ (co)limits, whether or not we 
abstractly know they exist. 

For this, let $U$ be the <span class="defn">forgetful functor</span> that sends a 
digraph $(V,E)$ to its underlying set $V$. Then $U$ admits both a left _and_ 
a right [adjoint](https://en.wikipedia.org/wiki/Adjoint_functors), 
and these will let us compute (co)limits in practice!
The <span class="defn">discrete functor</span> $D$ sends a set $X$ to the digraph 
$(X,\emptyset)$, and dually the <span class="defn">indiscrete functor</span> 
$I$ sends a set $X$ to the graph $(X,X^2)$. 

<div class="boxed">
If it's not obvious, verifying $D \dashv U \dashv I$ is a great exercise!
Remember that functions on digraphs have to preserve the relation, but
for $DX$ there's nothing to preserve, and $IX$ already has all the relations!
</div>

Since $U$ is both a right _and_ a left adjoint, it preserves limits _and_ colimits!
So the vertex set of a (co)limit of digraphs is exactly the (co)limit of the
vertex set! Thus we can compute (co)limits of digraphs by figuring out
the vertex set, then guessing the edge relation. In general, in limits you
want to keep all of the edges you are allowed to keep, and in colimits you 
should keep only the edges you're forced to.

Let's see an example of this in action:

The product of two graphs $(V,E)$ and $(W,F)$ must have $V \times W$ as its
vertex set. So we need to know when $(v_1,w_1)$ is related to $(v_2,w_2)$.
Since $\pi_V$ has to be a morphism, there can't be a relation between
$(v_1,x)$ and $(v_2,y)$ unless $(v_1, v_2) \in E$. Symmetrically,
there can't be any relations between $(x,w_1)$ and $(y,w_2)$ unless a 
relation already exists between $w_1$ and $w_2$. Thus we can only have
an edge $(v_1,w_1)$ to $(v_2,w_2)$ if $(v_1,v_2) \in E$ and $(w_1,w_2) \in F$.
Moreover, we know that the product should be _maximal_ among those graphs who 
see $(V,E)$ and $(W,F)$. So we must have all of the relations that we are 
permitted. Thus, the above condition is _exactly_ the condition for edges:

$$
(V,E) \times (W,F) = 
\big ( V \times W, \quad \{((v_1,w_1),(v_2,w_2)) ~|~ (v_1,v_2) \in E \land (w_1,w_2) \in F\} \big )
$$

In fact, we can convince ourselves that this is correct. The categorical
product (sometimes called the tensor product) is implemented in Sage.
Apologies in advance for the ugliness of self-loops. I'm not sure how
to make self loops look better, unfortunately.

<div class="auto">
<script type="text/x-sage">
@interact
def _(GVertices = input_box(['a','b','c'], width=20),
GEdges = input_box([('a','a'),('a','b'),('b','c'),('c','b')], width=20),
HVertices = input_box(['x','y'], width=20),
HEdges = input_box([('x','y'),('y','y')]),
auto_update=False):
  G = DiGraph([GVertices,GEdges],loops=True)
  H = DiGraph([HVertices,HEdges],loops=True)
    
  G.show(title="G", vertex_size = 1000)
  H.show(title="H", vertex_size = 1000)
  (G.tensor_product(H)).show(title="G x H", vertex_size=2000)
</script>
</div>

For completeness (pun intended) we can also implement equalizers. 
The following code expects two functions from $H$ to $G$ to equalize.
Be warned: this code _doesn't_ check that $f$ and $g$ actually preserve
the edge relation!

<div class="auto">
<script type="text/x-sage">
@interact
def _(GVertices = input_box(['a','b','c'], width=20),
GEdges = input_box([('a','a'),('a','b'),('b','c'),('c','b')], width=20),
HVertices = input_box(['x','y'], width=20),
HEdges = input_box([('x','y')]),
f = input_box("lambda v: 'a' if v == 'x' else 'b'"),
g = input_box("lambda v: 'a'"),
auto_update=False):
  G = DiGraph([GVertices,GEdges],loops=True)
  H = DiGraph([HVertices,HEdges],loops=True)
    
  EVertices = [v for v in HVertices if f(v) == g(v)]
  EEdges = [(x,y) for (x,y) in HEdges if x in EVertices and y in EVertices]
    
  E = DiGraph([EVertices, EEdges],loops=True)
    
  G.show(title="G")
  H.show(title="H")
  E.show(title="Equalizer", vertex_size=2000)
</script>
</div>


<div class="boxed" markdown=1>
There is a [well known method](https://math.stackexchange.com/questions/1737954/limits-by-products-and-equalizers)
for constructing arbitrary limits from products and equalizers. You might
try to write code that computes all products of a certain shape, or if you're
particularly ambitious, code that can compute any product!
</div>

<div class="boxed">
Another fun exercise might be to implement coproducts and coequalizers. 
You might also implement colimits of some other shapes!
</div>

In fact, $\mathsf{DiGph}$ enjoys even more structure! It is 
<span class="defn">Cartesian Closed</span> and has a kind of
<span class="defn">Subobject Classifier</span>. While there is 
plenty of [abstract nonsense](https://math.stackexchange.com/questions/511517/pullbacks-and-pushouts-in-the-category-of-digraphs/512832#512832)
to justify these claims, it's nice to see a concrete description of
these objects too. In the interest of conciseness, I'll simply state 
the construction, and I'll leave it to you to verify the relevant properties.

Given two digraphs $(V,E)$ and $(W,F)$, their <span class="defn">Exponential Graph</span>
is given by 

$$(W,F)^{(V,E)} = \big (\{ f : V \to W \}, \quad \{ (f,g) ~|~ \forall v_1, v_2. (v_1, v_2) \in E \Longrightarrow (f v_1, g v_2) \in F \} \big )$$

Of course, we can implement this with little effort. This code will
compute $H^G$, but I've turned off the labels for cleanliness. If you want
to see what the functions are, I suggest playing with 
`E.show(vertex_labels=False, method='js')`.

<div class="auto">
<script type="text/x-sage">
@interact
def _(GVertices = input_box(['a','b','c'], width=20),
GEdges = input_box([('a','a'),('a','b'),('b','c'),('c','b')], width=20),
HVertices = input_box(['x','y'], width=20),
HEdges = input_box([('x','y')]),
auto_update=False):
  G = DiGraph([GVertices,GEdges],loops=True)
  H = DiGraph([HVertices,HEdges],loops=True)
    
  EVertices = FiniteSetMaps(GVertices, HVertices)

  edgeCondition = lambda f,g,v1,v2: ((v1,v2) not in GEdges) or ((f(v1),g(v2)) in HEdges)

  EEdges = [(f,g) for f in EVertices for g in EVertices if all([edgeCondition(f,g,v1,v2) for v1 in GVertices for v2 in GVertices])]
    
  E = DiGraph([EVertices, EEdges],loops=True, format='vertices_and_edges')
    
  G.show(title="G", vertex_size = 1000)
  H.show(title="H", vertex_size = 1000)
  E.show(title="G^H", vertex_size=1000, vertex_labels=False)
</script>
</div>

<div class="boxed">
To check that this deserves the name "exponential", you should check that
$ - \times (V,E) \dashv (-)^{(V,E)}$
</div>

Finally, we get to the [Subobject Classifier](https://en.wikipedia.org/wiki/Subobject_classifier). 
In $\mathsf{Set}$, there is a bijection between the subsets of $X$ and
the functions in $2^X$. This bijection identifies $A \subseteq X$ with
the function 
$$\chi_A = \begin{cases} 1 & x \in A \\ 0 & x \not \in A \end{cases}$$,
and identifies $f : X \to 2$ with $$\{ x ~|~ fx = 1 \}$$.

We phrase this categorically by saying that subobjects $A \rightarrowtail X$
are all pullbacks of $$T : \{1\} \rightarrowtail 2$$ along a map $\chi_A : X \to 2$:

![subobject pullback in set](/assets/images/graph-cats/subobject-set.png){:height="20%" width="20%"}

In $\mathsf{DiGph}$, we can similarly identify full subgraphs of $(X,E)$
with functions in $\Omega^{(X,E)}$ where $\Omega$ is the graph below:

![subobject classifier](/assets/images/graph-cats/digraph-subobject-classifier.png)

We can do this with a similar pullback diagram:

![subobject pullback in digph](/assets/images/graph-cats/subobject-digph.png){:height="30%" width="30%"}

This endows $\mathsf{DiGph}$ with the structure of a [quasitopos](https://ncatlab.org/nlab/show/quasitopos).
This is abstract-nonsense speak for "extremely nice category". It behaves like 
$\mathsf{Set}$, the category against which all others are compared, in basically
every situation.

---

$\mathsf{Gph}$
==============

Now that we have a lot of discussion and example computations out of the way, 
this section will feel extremely quick! This is mainly because
computations in $\mathsf{Gph}$ are exactly the same as 
computations in $\mathsf{DiGph}$.

$\mathsf{Gph}$ has objects $(V,E)$ where $V$ is a set and
$E$ is a _symmetric_ relation on $V$. The arrows are still the
functions which preserve the edge relation. Indeed, we can view
$\mathsf{Gph}$ as a full (in fact, reflective[^1]) subcategory of $\mathsf{DiGph}$.
By requiring the relations be symmetric, we are getting rid of the "directed"
nature of the edges. Now instead of having a connection from $a$ to $b$,
we simply have a connection between $a$ and $b$.

[^1]: The reflector is the "symmetrization" functor that adds in $(b,a)$ for every $(a,b) \in E$.

$\mathsf{Gph}$ is every bit as nice as $\mathsf{DiGph}$, as its 
forgetful functor _also_ admits a chain of adjunctions $D \dashv U \dashv I$.
Notice in particular that $\emptyset, X^2 \subseteq X^2$ are both already
symmetric relations. Because of this, we can compute limits and colimits
with the exact same guess-and-check method as before! 

Additionally, $\mathsf{Gph}$ is cartesian closed, with the same exponential,
and has the same subobject classifier too!

<div class="boxed">
Why is 
$(W,F)^{(V,E)} = \big ( \{ f : V \to W \}, \quad \{(f,g) ~|~ \forall v_1, v_2. (v_1,v_2) \in E \Longrightarrow (f v_1, g v_2) \in F \} \big )$
symmetric whenever $E$ and $F$ are?
</div>

---

$\mathsf{SimpDiGph}$
====================

TODO: what are the objects and arrows

TODO: what are the benefits of this category?

TODO: topological? quasitopos? 

TODO: does the forgetful functor have adjoints?

TODO: what are the limits?

TODO: what are the colimits?

TODO: what are the exponents?

TODO: what is the subobject classifier?

---

$\mathsf{SimpGph}$
==================

TODO: what are the objects and arrows

TODO: what are the benefits of this category?

TODO: topological? quasitopos? 

TODO: does the forgetful functor have adjoints?

TODO: what are the limits?

TODO: what are the colimits?

TODO: what are the exponents?

TODO: what is the subobject classifier?

---

$\mathsf{ReflGph}$
==================

TODO: what are the objects and arrows

TODO: what are the benefits of this category?

TODO: topological? quasitopos? 

TODO: does the forgetful functor have adjoints?

TODO: what are the limits?

TODO: what are the colimits?

TODO: what are the exponents?

TODO: what is the subobject classifier?

---

$\mathsf{Quiv}$
===============

TODO: what are the objects and arrows

TODO: what are the benefits of this category?

TODO: topological? quasitopos? 

TODO: does the forgetful functor have adjoints?

TODO: what are the limits?

TODO: what are the colimits?

TODO: what are the exponents?

TODO: what is the subobject classifier?

---
