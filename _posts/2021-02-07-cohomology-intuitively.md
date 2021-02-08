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
is doing. Regrettably, while there's some very nice visual intuition for 
homology classes and what they represent, cohomology groups tend to feel a bit
more abstract and magical.

[1]: https://math.stackexchange.com/q/4011756/655547

This post is going to be an extension of the answer I gave on the linked
question. Cohomology is a big subject, and there were a lot of things that
I wanted to include in that answer that I didn't have space for. A blog post
is a much more reasonable setting for something a bit more rambling anyways.
That said, everything contained in that answer will _also_ be discussed here,
so it's far from prerequisite reading. 

In particular, we're going to go over two useful case studies of cohomology:

 - [De Rham Cohomology][3]
 - [Simplicial Cohomology][4][^1]

[3]: https://en.wikipedia.org/wiki/De_Rham_cohomology
[4]: https://en.wikipedia.org/wiki/Simplicial_homology

[^1]: 
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

[2]: https://www.math.cmu.edu/~ffrick/


With that out of the way, let's get started ^_^

---

First things first. Let's give a _very_ high level description of what
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



---

