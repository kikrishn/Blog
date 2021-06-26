---
layout: post
title: Remembering the Reverse Triangle Inequality
tags:
  - quick-analysis-tricks
---

The quarter is over, and now that I'm vaccinated (twice!) I feel comfortable
seeing people again. So I flew east coast to see my family and a bunch of friends.
Before I left, I had a few ideas for blog posts, and figured I would get around
to writing one now.

I've made it known that I struggle with analysis[^1], and one manifestation of 
this is a complete inability to remember elementary facts about inequalities.
It took me a long time to feel comfortable with things as basic as 
"which way does the triangle inequality go?", and until fairly recently things
like Cauchy-Schwarz were almost entirely beyond me. Over the past year or two,
I've been trying to answer lots of analysis questions on mse, as well as read 
lots of books on analysis and solve lots of problems, and (thankfully) some of 
it is starting to stick. But one inequality that I _always_ seem to forget is
the [reverse triangle inequality][1]:

<div class=boxed markdown=1>
$$\Bigg | |x| - |y| \Bigg | \leq |x-y|$$
</div>

I don't know many ways for showing a lower bound on absolute values, 
but almost every time I need one, I go through the following process:

1. "Doesn't the reverse triangle inequality give a lower bound?"
2. "I wonder if I should use that. Let me google it!"
3. "Oh right, _that's_ what it says. How do I always forget this?"
4. "This is actually not as useful as I would have liked. Oh well."

The most recent time I went through this, something on the wikipedia page
really clicked with me, and I'm not sure why it never clicked before.
The geometric intuition[^2] never really stays in my head, but for some reason
this did:

<div class=boxed markdown=1>
  The reverse triangle inequality says that the norm $\lVert \cdot \rVert$ 
  of some vector space $X$ is 1-[lipschitz][2] as a function from $X \to \mathbb{R}$:

  $$\Bigg | \lVert x \rVert - \lVert y \rVert \Bigg | \leq \lVert x-y \rVert$$

  Or, even more suggestively:

  $$d_\mathbb{R}(\lVert x \rVert, \lVert y \rVert) \leq d_X(x,y)$$
</div>

I'm trying to see why this is more memorable for me, and moreover why it's
_suddenly_ more memorable. Because I know that I've seen this before.

I think part of it is the visual and semantic distinction that we get by
writing $\lVert \cdot \rVert$ instead of $|\cdot|$. When everything in sight
was a real number, there were too many combinations of what we should and 
shouldn't be absolute-value-ing. As with many things in math and computer
science, taking some time to recognize the [types][3] involved in an equation
or proof, and then making sure to distinguish these types inyour mind, 
helps a lot for keeping the structures straight.

I think another reason this is memorable is because the notion of lipschitz
maps has become something I feel familiar with. When I was taking my first
undergraduate analysis class, I really didn't know why we should care about 
the various strengthenings of continuity. Over time I've learned to better 
appreciate their differences, and I feel like lipschitz-ness is one of the
regularity conditions that I understand best[^3]. It also makes intuitive 
sense that taking the norm of a vector should be a very regular operation. 

Anyways, this isn't so much a "trick" as a "mnemonic", but I wanted to say
something about it anyways because I think it would have helped younger me.
At the very least, it was nice to write up a really short post with a 
somewhat obvious observation. To make it somewhat more worth your time,
here's a picture of my old cat Oreo. I got to visit her while I was visiting
[Remy](https://remydavison.com) in New York!

<img src="/assets/images/quick-analysis-trick-5/oreo.jpg" alt="My daughter, a gremlin" 
style="width: 400px; height: auto; display: block; margin-left: auto; margin-right: auto" />

---

[^1]: 
    Though I've done fairly well the past two quarters, which has been a 
    real confidence boost... It's feeling better, but I still don't feel 
    like I understand things as well as I should, and while it's coming 
    faster, I still don't feel like it's coming naturally...
    Maybe it's imposter syndrome? Who's to say ¯\_(ツ)_/¯

[^2]:
    The difference between two legs of a triangle must be less than than the
    length of the third leg. Otherwise, by adding the length of the shorter 
    leg to both sides you would violate the triangle inequality.

[^3]: Not that that's saying much.

[1]: https://en.wikipedia.org/wiki/Triangle_inequality#Reverse_triangle_inequality
[2]: https://en.wikipedia.org/wiki/Lipschitz_continuity
[3]: https://en.wikipedia.org/wiki/Type_system
