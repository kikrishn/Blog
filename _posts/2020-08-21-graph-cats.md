---
layout: post
title: Choices for the "Category of Graphs"
tags:
  - combinatorics
  - graph theory
  - category theory
---

In the [last post](/2020/08/16/raag-defn) we talked about 
Right Angled Artin Groups and how the construction is functorial.
Of course, to even _talk_ about a functor, we need to know what categories
the raag construction moves between. Obviously it outputs a group, and the
category $\mathsf{Grp}$ of groups is fairly unambiguous. The domain, though,
should be a category of graphs, and this is a more subtle point. There are 
_lots_ of options for a category of graphs in the literature, and the one
you pick matters quite a bit. In this post I'll summarize the main ones,
as well as their similarities and differences, so that we can have a better
idea of what categorical constructions are available to us when we study
the raag functor.

As a tl;dr for future reference here is a table summarizing the various
categories. For a more in depth descritpion, one category at a time, 
keep reading. 

⚠ Warning: It seems like the names for the various categories is pretty 
nonstandard. I've chosen names that I think are memorable, and I've tried to
agree with any consensus that I'm aware of. If you're reading a paper, make
sure you know which category people are talking about. I'm sure I'm missing
many common ones - these are just the ones that I find myself reaching for
intuitively. For a slew of other options, see these pages on the nlab
(
[1](https://ncatlab.org/nlab/show/graph),
[2](https://ncatlab.org/nlab/show/category+of+simple+graphs),
[3](https://ncatlab.org/nlab/show/digraph),
[4](https://ncatlab.org/nlab/show/directed+graph)
).

---

| Name                 | Brief Description                                       | Complete | Cocomplete | Cartesian Closed | Subobject Classifier  | Remarks                                                                                                  |
| :---:                | :---:                                                   | :---:    | :---:      | :---:            | :---:                 | :---:                                                                                                    |
| $\mathsf{DiGph}$     | Sets with an edge relation                              |          |            |                  |                       | A good category for directed graphs. Keep in mind this allows self loops too!                            |
| $\mathsf{Gph}$       | Sets with a symmetric edge relation                     | Yes      | Yes        | Yes              | Only for strong monos | My preferred category of graphs. Keep in mind this allows self loops!                                    |
| $\mathsf{SimpDiGph}$ | Sets with an irreflexive edge relation                  |          |            |                  |                       | This is what most people are talking about when they discuss "directed graphs"                           |
| $\mathsf{SimpGph}$   | Sets with a symmetric, irreflexive edge relation        |          |            |                  |                       | This is what most people are talking about when they discuss "graphs"                                    |
| $\mathsf{ReflGph}$   | Sets with a reflexive, symmetric edge relation          | Yes      | Yes        | Yes              | Only for strong monos | This category handles graph minors elegantly, at the cost of sometimes allowing more homs than we'd like |
| $\mathsf{Quiv}$      | Functor Category $\mathsf{Set}^{e \rightrightarrows v}$ | Yes      | Yes        | Yes              | Yes                   | This category is of directed multi-graphs, allowing self loops. It is a fully fledged topos              |

---


TODO: detail graph categories and their properties

TODO: give explicit constructions of limits/colimits/etc in each category

TODO: make a table of various graph categories and their properties. 
