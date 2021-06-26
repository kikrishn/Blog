---
layout: post
title: Talk - Problem Solving Without Ansibles -- An Introduction to Communication Complexity
tags:
  - my-talks
---

Wow, two talk posts in one day! Thankfully the actual talks were a week apart!

Earlier today I gave _another_ talk in the grad student seminar here at UCR. 
I wanted to break out of my logician mold a _little_ bit, and so I decided to
talk about a result which absolutely blew my mind when I first saw it: 
the (public coin) randomized communication complexity of equality is $O(1)$
for any fixed error tolerance $\epsilon$!

Since communication complexity is all about measuring the number of messages
you send, I thought a fun framing device would be to imagine Alyss and Bob on
separate planets. If they're very far from each other, but they each have the
computational power of an entire planet at their disposal, then it makes sense
to measure communication as the limiting factor in their computation. This was
in part inspired by [Ryan O'Donnell][1]'s excellent videogame themed talk 
([here][2]), and indeed I tried to make my slides in google slides instead of
beamer as an homage to him. 

It definitely had advantages and disadvantages, but I liked a lot of the 
flexibility it offers. I think he does his in powerpoint, which might solve
some of my bigger gripes. Notably drawing on the slides directly was impossible
(because any time you release your pen, the scribble tool closes itself... 
that really needs a rethink on google's end), so I had to do all the handwriting
in gimp, then insert the writing as an image in google slides. This was annoying
at first, but I gradually got into the flow of it. The most damning problem was
how annoying it is to write mathematical symbols. Every single $\epsilon$ gave
me a headache, and my entire browser lagged anytime the symbols menu was open. 
I know there are some add-ons which might make this easier, but nothing can
beat a raw latex engine. In a more technical talk, I don't think I could have
possibly made the slides in this way. 

All in all, I was really pleased with how the talk went, though! I think it's
an interesting enough topic to stand on its own, and it was fun getting to 
evangleize computer science to a crowd of mathematicians. CMU's math department
obviously worked quite closely with its CS department, and I forget sometimes
that that isn't the norm. I knew going into the talk that I wanted to spend 
some time talking about an interpretation of this using error-correcting codes
([Hamming Codes][3] in particular), but I ended up scrapping it and not writing
the slides for it. In hindsight, I should have just made the slides, because
as soon as someone asked a question that even _hinted_ at this idea, I pounced
on it and went on a mild tangent. I suspect I lost a lot of people during that,
and it would have been a lot easier to retain them if I'd just organized the
big ideas into slides. Oh well, I'm not going to fault past my too much for
their laziness. 

All in all, I really enjoyed giving this talk, and it seemed like the 
audience really enjoyed watching it. This was almost certainly due to the
influence of Ryan's lecturing style, and anyone familiar with his (excellent)
"Theorist's Toolkit" lectures (which I reference in the talk, and which you
can find [here][4]) will recognize his impact.

With that out of the way, here are the things:

---

Problem Solving Without Ansibles: An Introduction to Communication Complexity

In the world of Science Fiction, an "ansible" is a device that allows for
faster-than-light communication. Without ansibles, interstellar travel
puts an interesting constraint on computation. If two planets want to
collaborate on solving a problem, the obstruction will likely not be the
computation that either planet does individually. Instead, what matters
is the *Communication Complexity* which tracks the amount of messages
the planets have to send each other to solve their problem. In this talk
we will solve a prototypical problem in communication complexity. But be
warned: the answer may surprise you!

You can find the slides [here](/assets/docs/problem-solving-without-ansibles/handout.pdf)

<iframe width="560" height="315" src="https://www.youtube.com/embed/ImCFucEag3I" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>


[1]: http://www.cs.cmu.edu/~odonnell/
[2]: https://www.youtube.com/watch?v=4B0jwIu9fPs
[3]: https://en.wikipedia.org/wiki/Hamming_code
[4]: https://www.youtube.com/playlist?list=PLm3J0oaFux3ZYpFLwwrlv_EHH9wtH6pnX
