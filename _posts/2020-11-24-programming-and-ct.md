---
layout: post
title: Talk - Programming and Category Theory
tags:
  - my talks
  - category theory
  - pl theory
---

Yesterday I gave a talk at the UCR Category Theory Seminar. I ended up putting
off making the slides for longer than I should have, because I wasn't entirely
sure what I wanted the talk to be. The connections between
Cartesian Closed Categories/Proof Theory and Constructive Logic/Programming Languages
run extremely deep, and ths kind of talk can kind of be arbitrarily abstract. I wanted
to make sure this talk was easily approachable, though, and it was tricky to
find that balance.

I've given talks on this kind of topic before, mainly in 
[Hype4Types](https://hypefortypes.github.io/), a class that I founded with some
friends a few years ago. We discussed various topics in type theory and 
pl theory, and it's really cool to see that the class has survived our graduating
for two years now! But in those classes, I knew the students were already
familiar with some basics of writing programming languages, and had seen 
[grammars](https://en.wikipedia.org/wiki/Extended_Backus%E2%80%93Naur_form)
before (for instance). 

The point of the talk was to describe how certain category theoretic notions
arise automatically from the desire to write good maintainable code. The talk
was at its most abstract when describing Categorical Semantics for programming
languages inside Cartesian Closed Categories, which was at about the halfway 
point. After that, we discussed polymorphism 
(and how it corresponds to natural transformations) and data structures
(which correspond to monads on the category of your semantics). 

I had an outline prepared, but actually writing up the slides was stressing me
out so I waited until the last minute to do it. 
I've [mentioned before](/2020/10/09/model-theory-and-you.html) 
that I don't like giving talks with slides, and this talk in particular would
have been better if I could read the room and adapt to what it seemed like
my audience was and wasn't comfortable with. Excuses aside, I ended up 
latexing these slides from 11pm - 6am the day of the talk... oops.

I knew after giving the talk that it was only OK. It was still a fine talk,
but it didn't live up to my standards. It took me a little while to piece
together why, though, which is why I'm uploading this post on the following day.
Here are some critiques for myself, which you may or may not enjoy reading:

The big thing that I think slipped through the cracks was my section on 
Categorical Semantics. My sleep deprived brain was really worried about
people being familiar with the programming language theory, but becasue
I was giving this talk at a category theory seminar I think I glossed over
some categorical notions that really should have been addressed. I billed
this as an introductory talk, so I think giving some more explicit examples of
Cartesian Closedness, as well as a concrete example of the internal logic of
some small category would have been good additions. Most annoyingly for my 
own standards, I used "elements" to denote arrows from the terminal object
for a huge section of the talk. This is entirely standard, and is a harmless
convention, but I didn't even _mention_ it... I think this led to a mild
amount of confusion from some members of the audience. All in all, the talk
would have been improved by a bit more formality regarding the definitions 
of categorical elements/cartesian closed categories/categorical semantics/etc.

Of course, I'm still putting the slides up. Once I get sent a link to the
recording, I'll put that here as well. As before, the abstract is below:

---

Programming for Category Theorists

Bartosz Milewski has an excellent (free!) book teaching category theory to programmers. The connections run deep,
and many programmers find themselves interested in category theory (that's what happened to me). In this talk we will
attack the opposite problem: If the connections run deep, surely category theorists have something to learn from the
programmers! We will survey some ways a familiarity with programming can provide intuition for working with categorical
objects. Notably, we will show that arrows in a Cartesian Closed Category are really programs you can run. Moreover,
we will show how functors and monads arise naturally in a programming context. We will finish with the notion of a
polymorphic function, which encodes the notion of a natural transformation.

The talk slides are [here](/assets/docs/programming-and-ct/talk.pdf).
Again, there's some typos (most notably $𝟙 \xrightarrow[x]{A}$ should be 
$𝟙 \xrightarrow{x} A$). 
