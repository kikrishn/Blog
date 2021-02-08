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

---

