---
layout: post
title: Examples of Syntax/Semantics Theorems Throughout Math
tags:
  - 
---

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

  - $$\{x \mid fx =    gx \}$$ and $$\{ x \mid fx \leq gx \}$$ are closed
  - $$\{x \mid fx \neq gx \}$$ and $$\{ x \mid fx \lt  gx \}$$ are open

  This is the kind of theorem that you probably know intuitively, but you 
  might have never thought about formally. Notice that just by looking at the 
  _syntax_ (that is, how the set is defined) we can learn something nontrivial 
  about its _semantics_ (that is, its topological complexity).

  <div class=boxed markdown=1>
  As a simple exercise, if you've never seen this before you should prove this!

  You should recall that $\mathbb{R}$ is hausdorff, so 
  $$\Delta = \{ (x,x) \}$$ is closed in $\mathbb{R}^2$. 
  Similarly, notice $$\{ (x,y) \mid x \leq y \}$$ is closed in $\mathbb{R}^2$.
  
  Do you see how to use this to show the claim?
  </div>

Let's make things a little more complicated. Again, say $f, g : X \to \mathbb{R}$
is continuous. Then we can bound the complexity of various sets defined by
referencing $f$ and $g$ by counting quantifiers. 

First, let's look at things that are quantifier free. We can turn logical
symbols in the definition of a set into boolean operations on sets themselves.
So

- $$\{x \mid fx = 0 \land gx = 0\} = \{ x \mid fx = 0 \} \cap \{ x \mid gx = 0 \}$$
- $$\{x \mid fx = 0 \lor gx = 0 \} = \{ x \mid fx = 0 \} \cup \{ x \mid gx = 0 \}$$
- $$\{x \mid \lnot (fx = 0) \} = \{x \mid fx = 0 \}^c$$

Using the fact from earlier that $fx=0$ is a closed condition, we can immediately
see that the first two sets are closed, and the third is open. Any connectives
in the definition can be handled in this way.

That actually _includes_ infinite connectives! For instance, say we have a 
sequence of functions $(f_n)_{n \in \mathbb{N}}$. Then

- $$\{x \mid \bigvee_{n \in \mathbb{N}} f_n x = 0\} = \bigcup_{n \in \mathbb{N}} \{ x \mid f_n x = 0\}$$ is $F_\sigma$.

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
for borel sets, and the position of $$\{x \mid \varphi \}$$ in this hierarchy is
_exactly_ in correspondence with the (countable) quantifier complexity of 
$\varphi$.
</div>

A big part of [descriptive set theory][7] is trying to turn real-valued 
quantifiers into countable quantifiers. For a high powered example, you
might want to look into [uniformization theorems][9] (like lusin-novikov), 
but for a simple one let's look at the following classic analysis exercise:

<div class=boxed markdown=1>
Let $(f_n : X \to \mathbb{R})_{n \in \mathbb{N}}$ be a sequence of measurable functions.
Show the set of $x$ where $f_n(x)$ converges is measurable.
</div>

We can solve this by writing down what it means to be convergent, and converting
this syntactic definition into a semantic one. Since we're gunning for borel,
we know we're only allowed to use natural number quantifiers. This leads to
the following argument:

$$
\begin{aligned}
\{ x \mid f_n x \text{ converges} \}
&= \left \{ x \ \middle | \ \forall k . \exists N . \forall m, n \geq N . | f_n x - f_m x| \leq \frac{1}{k} \right \} \\
&= \bigcap_k \bigcup_N \bigcap_{m,n \geq N} \left \{ x \ \middle | \ | f_n x - f_m x| \leq \frac{1}{k} \right \} \\
&= \bigcap_k \bigcup_N \bigcap_{m,n \geq N} \left \{ x \ \middle | \ x \in | f_n - f_m |^{-1} \left [ 0, \frac{1}{k} \right ] \right \}
\end{aligned}
$$

Since $|f_n - f_m|$ is measurable, the set at the end is measurable, which 
makes our whole set measurable too. If the $f_n$ are assumed to be continuous
instead, then we can get a more precise bound: The set is $\mathbf{\Pi^0_3}$.

You might be wondering what happens if we _do_ allow real valued quantifiers.
It turns out there are _still_ theorems in this vein! 

Sets with only existential real quantifiers are called 
<span class="defn">Analytic</span>, and sets with only universal real quantifiers
are called <span class="defn">Coanalytic</span>. A (very!) nontrivial theorem 
in descriptive set theory says that both classes of sets are 
[universally measurable][10], have the [property of baire][11], etc.[^3]

But _now_ you might be wondering if we allow alternating quantifiers! For instance,
what if we allow sets defined by $\forall x . \exists y . \varphi(x,y)$ where
$x$ and $y$ are reals? This turns out to be independent of $\mathsf{ZFC}$!

The relevant search term is [projective determinacy][20], which follows from
certain large cardinal axioms. I was planning to write up a blog post about
this, but I've been beaten to the punch! There's a great introduction at
the blog **Complex Projective $4$ Space** (which you can read [here][21]),
and if you find set theory and large cardinals interesting, you might want to
read Tom Leinster's take on set theory [here][22]. It's a great introduction
so far, and is phrased in a way that I suspect will be a bit more accessible 
to the generic mathematician than a traditional set theoretic reference might be.

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
    if and only if it embeds into every [algebraically closed group][17].
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

But why stop at group theory? The notion of "presentation" exists in 
commutative algebra as well. Can we find similar theorems there[^4]?

Obviously the answer is "yes", but I'm still _very_ new to commutative algebra, 
and I wasn't familiar with any theorems in this area. 
I knew that there should be some examples in the theory
of [monomial ideals][26], but I didn't know of any concrete examples.
Thankfully, in my first year I got to know 
[Eloísa Grifo][24] and [Alessandra Costantini][25], and even though
they're both leaving[^5], they were nice enough to give me some examples!

First, what _is_ a monomial ideal? Well, it's more or less what it says on the
tin. If we work in a ring $k[x_1, \ldots, x_n]$ of polynomials over a field $k$,
then a <span class="defn">Monomial Ideal</span> is an ideal $I$ generated by
monomials. That is, $I = (f_1, \ldots, f_m)$ where each $f_i$ is a monomial.

There are lots of algorithms in commutative algebra 
([Buchberger's algorithm][27] and [gröbner bases][28] come to mind) which
treat polynomials as formal symbols to be pushed around. Then putting 
restrictions on what kinds of polynomials we have to work with is a syntactic
condition, which we should expect to give us nice semantic theorems!

Indeed, monomial ideals admit particularly simple [primary decompositions][29],
so simple in fact that there is an [_extremely_ simple algorithm][30] to compute the
primary decomposition in this case[^6]. 

Monomial ideals (in particular the squarefree monomial ideals) can be studied
with combinatorial tools using the dictionary of [stanley-reisner theory][23].
This theory associates simplicial complexes to (squarefree) monomial ideals,
and geometric conditions on this complex get turned into syntactic conditions
on the monomials generating the ideal (and also into semantic theorems on the
ideal and the quotient ring).

One deep open problem in commutative algebra is the question "when do the
[symbolic powers][31] $I^{(n)}$ of an ideal agree with the ordinary powers $I^n$"? 
There is a conjecture that for squarefree monomial ideals, we get a particularly 
simple syntactic answer to this problem: The symbolic and ordinary powers coincide
if and only if $I$ is "packed[^7]". This is called the Packing Problem, and
is a topic of much interest.

In the special case of squarefree monomial ideals whose simplicial complex is
a graph, this conjecture has been proven! It is a theorem of Gitler, 
Valencia, and Villareal that the following are equivalent for the edge ideal
of a (simplicial) graph $G$:

1. $G$ is bipartite
2. $I_G^{(n)} = I_G^n$
3. $I_G$ is packed

I'm sure there are other syntax/semantics theorems in commutative algebra,
and I would love to hear about them!

---

## Some Miscellany

There are _way_ more results of this form, and I feel like I could keep 
listing them forever. But this blog post is already getting long, and the
thought of revising it is becoming daunting. Plus, I want to include at least
a bit of exposition regarding each example so that people with less familiarity
can still get something out of it. 

With that in mind, I really _should_ stop. But I want to show some examples
that don't quite fit the mold of any of the examples we've seen so far. 
This miscellany section is here to scratch that itch!

This one is a bit more overtly logical in nature, as it's a corollary of 
[$o$-minimality][32] of [real closed fields][33]. It also takes a
bit of logic to explain what we mean by "syntax". However, it's such a cool
result I had to include it:

If $f : \mathbb{R} \to \mathbb{R}$ is a [semialgebraic function][34],
then we can partition $\mathbb{R} = I_1 \cup I_2 \cup \ldots \cup I_n \cup X$,
where $X$ is finite and each $I_k$ is an open interval, so that $f$ is 
continuous on each $I_k$.

Here semialgebraicity says that the graph $$\Gamma_f = \{ (x, fx) \mid x \in \mathbb{R} \}$$
of $f$ is expressible as a boolean combination of polynomial inequalities[^8]. 
This theorem says that semialgebraicity roughly guarantees continuity everywhere!
This is one manifestation of Brouwer's folklore result that 
(for the right definition of "definable") all definable functions are continuous.
You can find a discussion of this "theorem" [here][35].

One weaker version of this theorem is the informal rule that every function
you can write down is (borel) measurable. This is akin to Church's Thesis in 
computability theory, in the sense that we will never be able to truly
_prove_ it, but we have lots of small results providing evidence for it, and
every concrete example we've tried it on so far has worked.

Unrelatedly, we have definable combinatorics. The idea here is that by 
putting restrictions on how complicated a combinatorial object is allowed to 
be, we can get sharper extremal bounds for the complexity of that object.
I don't know much about this myself, but Terry Tao has talked about it
on his blog (see [here][1]).

Lastly, to end on a logical theorem close to my heart, lots of families of
logical formulas are <span class="defn">decidable</span>. For an easy example,
if you promise to only ask questions with bounded quantifiers, I can always
tell you whether your formula is true or false in $\mathbb{N}$. There are lots
of results which say that every formula satisfying some syntactic condition
is decidable, and so a computer program can tell you whether that formula is
true or false! I talked about this a bit in [a talk of mine][36], 
but I'm planning to write up a full blog post on it at some point.

Maybe that's something to look forward to!

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

[^4]:
    Arguably certain homological conditions are "syntactic" too, since we're putting
    restrictions on the number of generators/relators/higher syzygies 
    (or, more commonly, on how long we need a resolution to be). This feels a 
    little bit more abstract than the rest of the post, though, so I'm relegating
    it to a footnote. The stuff in the body is a little bit more down to earth,
    and is also obviously "syntactic" in a way that homological conditions aren't.

[^5]:
    A fact which is extremely sad for me and the department, though of course
    I'm sure they'll do great things at their new programs!

[^6]:
    This is in stark contrast to the difficult algorithms that exist for 
    computing primary decompositions of more general ideals.
    See Decker, Greuel, and Pfister's 
    _Primary Decomposition: Algorithms and Comparisons_ for more details.

[^7]:
    The significance of the definition of "packed" is not one I'll pretend to
    understand, but at the very least I can recount it for the interested reader.

    A (squarefree monomial) ideal is called <span class="defn">König</span> 
    if it contains a regular sequence of monomials of the same length as its 
    height.

    Now a (squarefree monomial) ideal is called <span class="defn">Packed</span>
    if every ideal obtained by setting any of the variables to $0$ or $1$ is
    König.

[^8]:

    This is a slightly complicated "syntactic" condition, but it really does deserve 
    to be called syntactic. See chapter $3$ of Marker's _Model Theory: An Introduction_
    for a more detailed account of why.


[1]: https://terrytao.wordpress.com/2020/09/08/zarankiewiczs-problem-for-semilinear-hypergraphs/
[2]: /2020/12/16/tmd-syntax-and-semantics.html
[3]: https://en.wikipedia.org/wiki/Model_theory
[4]: https://en.wikipedia.org/wiki/Compactness_theorem
[5]: https://en.wikipedia.org/wiki/Diagram_(mathematical_logic)
[6]: /2020/10/09/model-theory-and-you.html
[7]: https://en.wikipedia.org/wiki/Descriptive_set_theory
[8]: https://en.wikipedia.org/wiki/Borel_hierarchy
[9]: https://en.wikipedia.org/wiki/Uniformization_(set_theory)
[10]: https://en.wikipedia.org/wiki/Universally_measurable_set
[11]: https://en.wikipedia.org/wiki/Property_of_Baire
[12]: https://en.wikipedia.org/wiki/Formal_language
[13]: https://en.wikipedia.org/wiki/Regular_language
[14]: https://en.wikipedia.org/wiki/Context-free_language
[15]: https://en.wikipedia.org/wiki/Virtually
[16]: https://en.wikipedia.org/wiki/Computable_set
[17]: https://en.wikipedia.org/wiki/Algebraically_closed_group
[18]: https://en.wikipedia.org/wiki/Recursively_enumerable_language
[19]: https://en.wikipedia.org/wiki/One-relator_group
[20]: https://en.wikipedia.org/wiki/Axiom_of_projective_determinacy
[21]: https://cp4space.hatsya.com/2021/07/10/determinacy/
[22]: https://golem.ph.utexas.edu/category/2021/06/large_sets_1.html
[23]: https://en.wikipedia.org/wiki/Stanley%E2%80%93Reisner_ring
[24]: https://eloisagrifo.github.io/
[25]: https://sites.google.com/view/alessandracostantini/home
[26]: https://en.wikipedia.org/wiki/Monomial_ideal
[27]: https://en.wikipedia.org/wiki/Buchberger%27s_algorithm
[28]: https://en.wikipedia.org/wiki/Gr%C3%B6bner_basis
[29]: https://en.wikipedia.org/wiki/Primary_decomposition
[30]: https://math.stackexchange.com/a/628586/655547
[31]: https://en.wikipedia.org/wiki/Symbolic_power_of_an_ideal
[32]: https://en.wikipedia.org/wiki/O-minimal_theory
[33]: https://en.wikipedia.org/wiki/Real_closed_field
[34]: https://en.wikipedia.org/wiki/Semialgebraic_set
[35]: https://math.stackexchange.com/questions/176279/all-real-functions-are-continuous
[36]: /2021/01/23/why-think.html
