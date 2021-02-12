---
layout: post
title: Cohomology Intuitively
tags:
  - cohomology
  - geometry
  - algebra
  - sage
  - mse
---

It feels like I've been opening a lot of posts this way lately, but I was
on mse the other day... 

<img src="/assets/images/cohomology-intuitively/letterkenny.jpg">

Anyways, somebody [asked a question][1] about finding generators
in cohomology groups. I think understanding how to compute the generators
is important, but it's equally important to understand what that computation
is doing. Regrettably, while there's some very nice visual intuition[^1] for 
homology classes and what they represent, cohomology groups tend to feel a bit
more abstract.

[^1]: 
    See, for instance, [this](https://jeremykun.com/2013/04/03/homology-theory-a-primer/) 
    wonderful series by Jeremy Kun, and even the 
    [wikipedia page](https://en.wikipedia.org/wiki/Homology_(mathematics)#Background).
    The basic idea is that homology groups correspond to "holes" in your space.
    These correspond to subsurfaces that aren't "filled in". That is, they
    aren't the boundary of another subsurface. This is where the "boundary"
    terminology comes from.

This post is going to be an extension of the answer I gave on the linked
question. Cohomology is a big subject, and there were a lot of things that
I wanted to include in that answer that I didn't have space for. A blog post
is a much more reasonable setting for something a bit more rambling anyways.
That said, everything contained in that answer will _also_ be discussed here,
so it's far from prerequisite reading. 

In particular, we're going to go over two useful case studies of cohomology:

 - [De Rham Cohomology][4]
 - [Simplicial Cohomology][5][^2]

[^2]: 
    I know this is a link to simplicial _homology_, but there's no 
    good overview page (at least on the first page of google) for 
    simplicial cohomology. It's close enough, though, especially since
    we're going to be spending a lot of time talking about simplicial
    cohomology in this post.

There's a really nice example that [Florian Frick][2] gave when I took his
algebraic topology class, and it was such good pedagogy I have to evangelize it.
The idea is to study simplicial cohomology for graphs -- it turns out to say
something which is very down to earth, and we can then view cohomology of more
complicated simplicial complexes as a generalization of this.

Graphs are one of very few things that we can really understand, and so using
them as a case study for more complex theorems tends to be a good idea.
As such, we'll study what cohomology on graphs is all about, and there will
even be some sage code at the bottom so you can check some small cases yourself!


With that out of the way, let's get started ^_^

---

First things first. Let's give a high level description of what
cohomology does for us. 

Say you have a geometric object, and you want to define a function 
on it. This is a very general framework, and "geometric" can mean a lot
of different things. Maybe you want to define a continuous function on some
topological space. Or perhaps you're interested in smooth functions on a 
manifold. The same idea works for defining functions on schemes as well,
and the rabbit hole seems to go endlessly deep!

<div class=boxed markdown=1>
  For concreteness, let's say we want to define a square root function
  on the complex plane. So our "geometric object" will be $\mathbb{C}$
  and our goal will be to define a continuous $\sqrt{\cdot}$ on it.
</div>

It's often the case that you know what you _want_ your function to do 
somewhere (that's why we want to define it at all!), and then you would like
to _extend_ that function to a function defined everywhere.

<div class=boxed markdown=1>
  For us, then, we know we want $\sqrt{1} = 1$. 

  This is an arbitrary choice, but it certainly seems like a natural one. 

  We now want to extend $\sqrt{\cdot}$ (continuously!) to the rest of the plane.
</div>

It is _also_ often the case that the continuity/smothness/etc. constraint 
means that there's only one way to define your function locally. So it
should be "easy" (for a certain notion of easy) to do the extension in a small
neighborhood of anywhere it's already been defined.

<div class=boxed markdown=1>
  So we know that $\sqrt{1} = 1$. What should $\sqrt{i}$ be? 

  Well, the real part of $\sqrt{1} = 1$ is positive. So if we want 
  $\sqrt{\cdot}$ to be continuous we had better make sure $\sqrt{i}$ 
  has potiive real part as well 
  (otherwise we would contradict the intermediate value theorem).

  So we're forced into defining $\sqrt{i} = \frac{1 + i}{\sqrt{2}}$.
</div>

However, sometimes the geometry of your space prevents you from gluing all
of these small easy solutions together. You might have all of the pieces lying
around to build your function, but the pieces don't quite fit together right.

<div class=boxed markdown=1>
  As before, we know $\sqrt{1} = 1$, and this forces 
  $\sqrt{i} = \frac{1 + i}{\sqrt{2}}$. This has positive imaginary part.

  If we want to extend this continuously from $\sqrt{i}$ to $\sqrt{-1}$, 
  we have no choice but to define $\sqrt{-1} = i$ 
  (which also has positive imaginary part). 
  This is the intermediate value theorem again.

  But now we can go from $\sqrt{-1}$ to $\sqrt{-i}$. Again, we have to keep
  the imaginary part positive, and we're forced into choosing 
  $\sqrt{-i} = \frac{-1 + i}{\sqrt{2}}$.

  And lastly, we go from $\sqrt{-i}$ back to $1$. The real part is negative 
  now, and we're forced by continuity into choosing $\sqrt{1} = -1$...

  Uh oh.
</div>

Obviously the above argument isn't entirely rigorous. That said, it does a 
good job outlining what problem cohomology solves. We had only one choice
at every step, and at every step nothing could go wrong. Yet somehow, when
we got back where we started, our function was no longer well defined.
We thus come to the following obvious question: 

<div class=boxed markdown=1>
  If you have a way to solve your problem _locally_, can we tell if those local
  solutions patch together to form a _global_ solution?
</div>

It turns out the answer is yes! Our local solutions come from a global
solution exactly when the "cohomology class" associated to our function
vanishes[^3].

[^3]:
    If you've heard of [sheaves](https://en.wikipedia.org/wiki/Sheaf_(mathematics))
    before, this is also why we care about sheaves! They are the right
    "data structure" for keeping track of these "locally defined functions"
    that we've been talking about.

There's a bit of a zoo of cohomology theories depending on exactly what kinds 
of functions you're trying to define[^4]. They all work in a similar way, though:
your local solutitions piece together exactly when their cohomology class is $0$. 
So the nonzero cohomology classes are all of the different "obstructions" to 
piecing your solutions together. Rather magically, cohomology groups tend to 
be finite dimensional, and so there are finitely many "basic" obstructions 
which are responsible for all the ways you might fail to glue your pieces 
together.

[^4]:
    We can tell we're onto something important, though, because for nice
    spaces, all the different definitions secretly agree! Often when you
    have a topic that is very robust under changes of definition, it means
    you're studying something real. We see a similar robustness in, for 
    instance, the notion of computable function. There's at least a half
    dozen useful definitions of computability, and it's often useful to
    switch between them fluidly to solve a given problem. Analogously, we
    have a bunch of definitions of cohomology theories which are known to
    be equivalent in many contexts. It's similarly useful to keep multiple
    in your head at once and use the one best suited to a given problem.

<span class="defn">De Rham Cohomology</span> makes this precise by looking at
certain differential equations which can be solved locally. Then the cohomology
theory tells us which differential equations admit a global solution. In this 
post, though, we're going to spend our time thinking about 
<span class="defn">Simplicial Cohomology</span>. Simplicial Cohomology doesn't
have quite as snappy a description, but it's more combinatorial in nature,
which makes it easier to play around with.

---

Actually setting up cohomology requires a fair bit of machinery, so before
go through the formalities I want to take a second to detail the problem
we'll solve.

Take your favorite graph, but make sure you label the vertices. 
My favorite graph (at least for the purposes of explanation) is this one:

<img src="/assets/images/cohomology-intuitively/naked-graph.png" width="50%">

Notice the edges are always oriented from the smaller vertex to the bigger one.
This is not an accident, and keeping a consistent choice of orientation is
important for what follows. The simplest approach is to order your vertices,
then follow the convention of $\text{small} \to \text{large}$j

Now our problem will be to "integrate" a function defined on the edges
to one defined on the vertices. What do I mean by this? Let's see some
concrete examples:

<img src="/assets/images/cohomology-intuitively/coboundary.png" width="50%">

Here we see a function defined on the vertices. Indeed, we could write this
more formally as

$$
\begin{aligned}
f(e_{01}) &= 5 \\
f(e_{02}) &= 5 \\
f(e_{12}) &= 0
\end{aligned}
$$


The goal now is to find a function on the vertices whose difference 
along each edge agrees with our function. This is what I mean when I
say we're "integrating" this edge function to the vertices.
It's not hard to see that the following works:

<img src="/assets/images/cohomology-intuitively/coboundary-integrated.png" width="50%">

Again, if you like symbols, we can write this as

$$
\begin{aligned}
F(v_0) &= 3 \\
F(v_1) &= 8 \\
F(v_2) &= 8 \\
\end{aligned}
$$

Then we see for each edge $f(e_{ij}) = F(v_j) - F(v_i)$. This may seem
like a weird problem to try and solve, but at least we solved it!
Notice we pick up an arbitrary constant when we do this -- 
We can set $v_0 = C$ for any $C$ we want as long as $v_1 = v_2 = C+5$.
This is one parallel with integration, and helps justify our language.

Let's look at a different function now:

<img src="/assets/images/cohomology-intuitively/cocycle.png" width="50%">

You can quickly convince yourself that no matter how hard you try,
you can't integrate this function. No function on the vertices can
possibly be compatible with our function on the edges.

After all, say we assign $v_0$ the value $C$. Then $v_1$ is forced into
the value $C+5$ in order to agree with $e_{01}$. But then because of 
$e_{12}$ we must set $v_2 = C+5$ as well, and uh oh! Our hand was forced
at every step, but looking at $e_{02}$ we see were out of luck. 

This should feel at least superficially similar to the $\sqrt{\cdot}$ 
example from earlier. At each step along the way, it's easy to solve 
our problem: If you know what $F(v_i)$ is, and you see an edge $v_i \to v_j$,
just assign $F(v_j)$ to $F(v_i) + f(e_{ij})$. The problem comes from making
these choices _consistently_, which turns out to not always be possible!

<div class=boxed markdown=1>
  As an aside, you can see that the problem comes from the fact that our
  graph has a cycle in it. Can you show that, on an acyclic graph, 
  _every_ edge function can be integrated to a function on the vertices?

  We will soon see that the functions which can't be integrated are 
  (modulo an equivalence relation) exactly the cohomology classes. So the 
  presence of a function which can't be integrated means there must be a cycle 
  in our graph, and it is in this sense that cohomology "detects holes".
</div>

---

Ok, so now we know what problem we're trying to solve. When can we 
integrate one of these edge functions? The machinery ends up being
a bit complicated, but that's in part because we're working with 
graphs, which are one dimensional simplicial complexes. 
This _exact same setup_ works for spaces of arbitrary dimension,
so it makes sense that it would feel a bit overpowered for our comparatively
tiny example.

First things first, we look at the [free abelian groups][3] generated
by our $n$-dimensional cells. For us, we only have $0$-dimensional vertices
and $1$-dimensional edges. So we have to consider two groups:

$$
\mathbb{Z}E \text{ and } \mathbb{Z}V
$$

For the example from before, that means

$$
\mathbb{Z} \{ e_{01}, e_{12}, e_{02} \} \text{ and } \mathbb{Z} \{ v_0, v_1, v_2 \}
$$

which are both isomorphic to $\mathbb{Z} \oplus \mathbb{Z} \oplus \mathbb{Z}$. 

Second things second. We want to _connect_ these two groups together in a way
that reflects the combinatorial structure. We do this with the 
<span class="defn">Boundary Map</span> $\partial : \mathbb{Z}E \to \mathbb{Z}V$.
This map takes an edge to its "boundary", so $\partial e_{01} = v_1 - v_0$. 
Since we have a basis floating around anyways, it's convenient to represent
this map by a matrix:

$$
\partial = 
\begin{pmatrix}
-1 &  0 & -1 \\
1  & -1 &  0 \\
0  &  1 &  1
\end{pmatrix}
$$

So for instance, 

$$
\partial e_{01} = 
\begin{pmatrix}
-1 &  0 & -1 \\
1  & -1 &  0 \\
0  &  1 &  1
\end{pmatrix}
\begin{pmatrix} 1 \\ 0 \\ 0 \end{pmatrix} = 
\begin{pmatrix} -1 \\ 1 \\ 0 \end{pmatrix} = 
v_1 - v_0
$$

Now our groups assemble into a <span class="defn">Chain Complex</span>:

$$
\cdots \to 
0 \to 
0 \to 
\mathbb{Z}E \overset{\partial}{\longrightarrow} 
\mathbb{Z}V
$$

The extra groups $0$ correspond to higher dimensional simplices that
aren't present for us. If we filled in our cycle with a $2$-dimensional
triangular _face_, then we would have an extra group $\mathbb{Z}F$ and
an extra map (which is _also_ called $\partial$, rather abusively) 
from $\mathbb{Z}F \to \mathbb{Z}E$ which takes a face to its boundary
(this might also help explain the term "boundary"). Then if we had a
"cycle" of faces, we could fill them in with a (solid) tetrahedron. 
So we would have a new group $\mathbb{Z}T$, equipped with a map
$\partial : \mathbb{Z}T \to \mathbb{Z}F$ taking each tetrahedron to
its boundary of faces. Of course, this goes on and on into higher and
higher dimensions[^5].

There's actually a technical condition to be a chain complex that's
automatically satisfied for us because our chain only has one interesting 
"link". Given an $n+2$-dimensional simplex $\sigma$, we need to know that
$\partial \partial \sigma = 0$.
I won't say much more about it now, but I might write a blog post 
giving examples of higher-dimensional simplicial cohomology at some point. 
When that happens, we'll have no choice but to go into more detail.

[^5]:
    For $\partial$ from edges to vertices, we know what our orientation 
    should be (always subtract the low vertex from the high vertex),
    but it's less clear what signs each of the edges bounding a triangle
    should receive... It's even _less_ clear what signs the faces bounding
    a tetrahedron should get! In fact, the issue of signs 
    (and orientation in general) is a [bit fussy][6]. Once you pick a convention,
    though (for us, it's high minus low), the orientation in higher dimensions
    is set in stone. You shouldn't worry too much about the formulas for $\partial$.
    What matters is the signs are chosen to make $\partial \partial \sigma = 0$ 
    for every $n+2$-simplex $\sigma$. This should make a certain amount of sense,
    as the boundary of a figure should not have its own boundary... 
    Thats worth some meditation.

<div class=boxed markdown=1>
As a quick exercise: 

What is the boundary $\partial (e_{01} + e_{12} - e_{02})$? What, 
intuitively, does $e_{01} + e_{12} - e_{02}$ represent? Does it make sense why
the _boundary_ of this figure should be what it is?
</div>

So we know that elements of $\mathbb{Z}E$ (resp. $\mathbb{Z}V$)
represent (linear combinations of) edges (resp. vertices). Of course,
we want to look at _functions_ defined on the edges and vertices. 
So our next step is to _dualize_ this chain:

$$
\cdots \leftarrow 
\text{Hom}(0, \mathbb{R}) \leftarrow 
\text{Hom}(0, \mathbb{R}) \leftarrow 
\text{Hom}(\mathbb{Z}E, \mathbb{R}) \overset{\partial^T}{\longleftarrow} 
\text{Hom}(\mathbb{Z}j, \mathbb{R})
$$

We're now looking at all (linear) functions from 
$\mathbb{Z}E \to \mathbb{R}$ (resp. $\mathbb{Z}V \to \mathbb{R}$).
By the universal property of free abelian groups, though, we know
that the functions $\mathbb{Z}E \to \mathbb{R}$ correspond exactly 
to the functions $E \to \mathbb{R}$ (extended linearly).

Moreover, our boundary operator $\partial$ has become a _coboundary_
operator $\partial^T$ that points the other direction[^6]. Here if
$F : V \to \mathbb{R}$ then we define $\partial^T f : E \to \mathbb{R}$ by

$$
(\partial^T F) (e) = F(\partial e)
$$

[^6]:
    Oftentimes you'll see this written as $d$ in the literature, since it acts
    like a differential. Indeed in the case of De Rham Cohomology it literally
    is the derivative!

Moreover, our notation $\partial^T$ is not misleading. 
$\text{Hom}(\mathbb{Z}V, \mathbb{R})$ has a basis of characteristic functions

$$
\{ \chi_{v_0}, \chi_{v_1}, \chi_{v_2} \}
$$

where

$$
\chi_{v_i}(v_j) = \begin{cases} 1 & i=j \\ 0 & i \neq j \end{cases}
$$

Similarly $\text{Hom}(\mathbb{Z}E, \mathbb{R})$ has a basis of characteristic
functions, and it turns out that, with respect to these "dual bases", the map 
$\partial^T$ is actually represented by the transpose of $\partial$!



<div class=boxed markdown=1>
  If you haven't seen this before, you should convince yourself that 
  it's true. Remember that the transpose of a matrix has 
  [something to do with][7] dualizing.

  Moreover, you should check that a function $f$ on the edges 
  is in the image of $\partial^T$ exactly when it can be integrated.
  Moreover, if $f = \partial^T F$, then $F$ _is_ an "antiderivative"
  for $f$.
</div>

We're in the home stretch! The second half of that box alludes to
something important: A function $f$ can be integrated exactly when
it is in the image of $\partial^T$. With this in mind, we're finally
led to the definition of the cohomlogy group of our graph:

Since the only map $0 \to \mathbb{R}$ is the trivial one, we can
rewrite our complex as:

$$
\cdots \overset{0}{\leftarrow}
0 \overset{0}{\leftarrow}
0 \overset{0}{\leftarrow}
\text{Hom}(\mathbb{Z}E, \mathbb{R}) \overset{\partial^T}{\longleftarrow} 
\text{Hom}(\mathbb{Z}j, \mathbb{R})
$$

Then we define[^7]

[^7]:
    In general, if we have a complex 
    $$
    \cdots \overset{\partial^T_{n+2}}{\longleftarrow} 
    C^{n+1} \overset{\partial^T_{n+1}}{\longleftarrow}
    C^{n} \overset{\partial^T_{n}}{\longleftarrow}
    C^{n-1} \overset{\partial^T_{n-1}}{\longleftarrow} \cdots
    $$
    The $n$th cohomology group is 
    $$
    H^n = 
    \frac
    {
      \text{Ker} \big ( \partial^T_{n+1} : C^n \to C^{n+1} \big )
    }{
      \text{Im} \big ( \partial^T_n : C^{n-1} \to C^n \big )
    }
    $$
    Again, if I end up writing a follow-up post with higher dimensional 
    examples, you'll hear _lots_ more about this.


$$
H^1 = 
\frac
{
  \text{Ker}\big ( \partial^T : \text{Hom}(\mathbb{Z}E, \mathbb{R}) \to 0 \big )
}{
  \text{Im} \big ( \partial^T : \text{Hom}(\mathbb{Z}V, \mathbb{R}) \to \text{Hom}(\mathbb{Z}E, \mathbb{R}) \big )
}
$$

Since there are no two dimensional faces, $\partial^T : \mathbb{Z}E \to 0$
is the trivial map, and so its kernel is everything. In light of this,
we see a slightly simpler definition of $H^1$:

$$
H^1 = 
\frac
{
  \text{Hom}(\mathbb{Z}E, \mathbb{R})
}{
  \text{Im} \big ( \partial^T : \text{Hom}(\mathbb{Z}V, \mathbb{R}) \to \text{Hom}(\mathbb{Z}E, \mathbb{R}) \big )
}
$$

This says the elements of $H^1$ are exactly the functions on edges, but
we've quotiented out by all the functions that we can integrate to the vertices!
So if we want to check if a function can be integrated, we just compute its
cohomology class and check if it's $0$. 

Moreover, the _basis_ of $H^1$ as an $\mathbb{R}$-vector space give us 
a collection of "basic" non-integrable functions. Then _every_ function
on the edges can be written as an integrable one, plus some linear
combination of the basic nonintegrable ones. This dramatically reduces
the number of things we have to think about! From the point of view of
integration, we only need to worry about the "good" functions 
(which admit antiderivatives) and (typically finitely many) "bad"
functions which we can handle on a case-by-case basis.

<div class=boxed markdown=1>
  If we put $0$s to the right of $\mathbb{Z}V$ as well as to the left of
  $\mathbb{Z}E$, we can also look at 

  $$
  H^0 = 
  \frac
  {
    \text{Ker}\big ( \partial^T : \text{Hom}(\mathbb{Z}V, \mathbb{R}) \to \text{Hom}(\mathbb{Z}E, \mathbb{R}) \big )
  }{
    \text{Im} \big ( \partial^T : 0 \to \text{Hom}(\mathbb{Z}V, \mathbb{R}) \big )
  } =
  \text{Ker}\big ( \partial^T : \text{Hom}(\mathbb{Z}V, \mathbb{R}) \to \text{Hom}(\mathbb{Z}E, \mathbb{R}) \big )
  $$

  What is the dimension of $H^0$ in our example? What about for a graph with
  multiple connected components? In this sense, $H^0$ detects "$0$-dimensional holes".
</div>


---

We've spent some time now talking about what cohomology is. But again,
part of its power comes from how _computable_ it is. Without the exposition, 
you can see it's really a three step process:

1. Turn your combinatorial data into a chain complex by taking free
abelian groups and writing down boundary matrices $\partial$.

2. Dualize by hitting each group with $\text{Hom}(\cdot, \mathbb{R})$

3. Compute the kernels and images of $\partial^T$, then take quotients.

Steps $1$ and $2$ should feel very good, and hopefully you're aware that
taking kernels and images of a linear map _should_ be easy 
(even if I know I'm pretty rusty). It turns out computing a vector space 
quotient is _also_ easy, though it's much less widely taught. That doesn't
matter, though, since [sage](https://www.sagemath.org) absolutely remmebers
how to do it.

Since it's so computable, and the best way to gain intuition for things
is to work through examples, I've included some code to do just that!

---

<div class=boxed markdown=1>
  
  Enter a description of a graph, and then try to figure out what you think
  the cohomology should be. 

  See if you can find geometric features of your graph which make the 
  dimension obvious! If you want a bonus challenge, can you guess what the 
  generators will be? Keep in mind there's lots of generating sets, so you 
  may get a different answer from what sage tells you even if you're right.
</div>


<div class="linked_auto">
<script type="text/x-sage">
# Write the edges in the box. You can add isolated vertices by including an 'edge' with only one vertex
@interact
def _(Simplices = input_box([["a"],["b","c"],["c","d"],["b","d"]], width=50), auto_update=False):
    show("The graph is:")
    S = SimplicialComplex(Simplices)
    show(S.graph()) # I can't figure out how to directly draw the complex...
    
    show("The chain complex is:")
    
    # we did it over the reals in the post,
    # but if we use the reals here, sage will
    # print 1.00000000000000 instead of 1...
    # so we're using the rationals instead
    C = S.chain_complex(base_ring=QQ)
    show(ascii_art(C))
    
    show("Which dualizes to:")
    
    Cdual = C.dual()
    show(ascii_art(Cdual))
    
    show("So the cohomology is:")
    
    # the cohomology of the original complex is
    # exactly the homology of the dual complex.
    H1 = Cdual.homology(deg=1,generators=True)
    show(QQ^(len(H1)))
    
    # Remember, the outputs here represent functions!
    # The entry in position i is the value that our
    # function assigns edge i
    show("With generators:")
    for g in H1:
        show(g[1].vector(1))
</script>
</div>


---

[1]: https://math.stackexchange.com/q/4011756/655547
[2]: https://www.math.cmu.edu/~ffrick/
[3]: https://en.wikipedia.org/wiki/Free_abelian_group
[4]: https://en.wikipedia.org/wiki/De_Rham_cohomology
[5]: https://en.wikipedia.org/wiki/Simplicial_homology
[6]: https://en.wikipedia.org/wiki/Simplicial_homology#Boundaries_and_cycles
[7]: https://en.wikipedia.org/wiki/Transpose_of_a_linear_map


