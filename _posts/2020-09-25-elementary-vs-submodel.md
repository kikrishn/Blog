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
