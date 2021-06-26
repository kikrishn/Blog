---
layout: post
title: "Talk - Categories, Modalities, and Type Theories: Oh My"
tags:
  - my-talks
---

Last week I gave a talk at CMU's Graduate Student Workshop on
Homotopy Type Theory (HoTT). You can see the schedule of talks
[here](https://cmu-hott.github.io/workshop2021.html).

A good friend of mine from undergrad, [Jacob Neumann][1], 
reached out to me about speaking here, and I super appreciate it. 
It was great to see some familiar faces from the HoTT group at CMU,
and the talks were well worth the 8am start time[^1]! Jacob's talk on
[Allegories][2] was well exposited, though it was regrettably cut short
before we could get to the fun modal logic interpretation. Similarly,
[Wes Caldwell][3]'s talk was a return to form for HoTT! It was cool seeing
some heavy duty algebraic topology recast in this language, even if the
ending was a bit beyond me right now. Steve Awodey was certainly impressed by
it, so I hope Wes is proud ^_^. I was upset to have missed 
[Colin Zwanziger][4]'s talk, but I couldn't miss the GSS at UCR[^2].

I felt like I should present some thoughts of my own at a seminar like 
this one, and the subject matter is _just_ on the boundary of what I feel
comfortable with. Since the organizers asked for a 30-45 minute talk, I 
decided to stay on the shorter side: 
"Better to remain silent and be thought a fool than to speak and remove all doubt",
you know? 

One idea that had been on my mind for a little while was making
sense of first order modal logic using presheaf categories. In particular,
for [algebraic theories][5], we can view a model in a presheaf category as
a presheaf of models. Then if $\mathfrak{F}$ is a kripke frame for $\mathsf{S4}$,
it is a preorder and thus a category in a natural way. So we should be able
to use modal logic to talk about models in $\mathsf{Set}^\mathfrak{F}$.

This idea was (and is) a bit half-baked, but it was an interesting and stressful
feeling to talk about ideas of my own (particularly ideas that haven't been 
fully realized yet) in a talk. _Particluarly_ a talk with so many people I 
respect in attendence. I'm really grateful to the organizers and the attendees
for making it such a safe space for me to discuss these things, even if I'm sure
a lot of what I said was obvious to many people in the room. I really miss the
CMU HoTT group, and I might start attending the seminars again since they're
online anyways.

I knew my idea wasn't fully fleshed out[^3], but I also knew that something
like it must be right. So I took a moment to ask the audience if they knew
of any references for similar ideas. I had found a paper of Awodey and Kishida[^4]
which uses topological spaces and a kind of "Étale Space" version of this idea,
but nothing which used presheaves directly. Thankfully, the audience gave me 
a veritable barrage of papers to read 
(many of which I'm moving to the front of my, ever increasing "to read pile")!
For the interested:

 - [Kishida's Thesis](https://www.andrew.cmu.edu/user/awodey/students/kishida.pdf)
 - [An extension to HOL](https://arxiv.org/abs/1403.0020) (this one was mentioned twice, so it _must_ be good)
 - [Another Kishida paper](https://www.sciencedirect.com/science/article/pii/S1571066111001393)
    (I'd actually skimmed this one already, but I'm including it for completeness)
 - [A 77 pager on categorical modal logic](https://www.sciencedirect.com/science/article/pii/0168007293000854)
     (This is one that I'm definitely going to try to get through soon)

Even if last friday was _extremely_ long, with seminars straight through from
8am - 3pm, then teaching from 3-5, it was entirely worth it! And now, for the
abstract and recording (as usual)

---

Categories, Modalities, and Type Theories: Oh my!

Category theory and logic have a tight interplay, with
structured categories providing semantics for certain
logics, and "internal logics" providing a useful language for
speaking about structured categories. In this introductory
talk we will survey both directions of this correspondence
from the point of view of modal logic.

The slides are [here](/assets/docs/categories-modalities-and-type-theories/handout.pdf),
and the recording is below.

<iframe width="560" height="315" src="https://www.youtube.com/embed/qh96mjSmEyI" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>


---

[^1]:
    Sometimes living on the west coast has its down sides...

[^2]:
    And I'm _extra_ glad I went that week, because it was Jonathan Alcaraz's
    talk on LO Groups, which led me to a problem I talked about 
    [last week](/2021/02/26/lo-groups)

[^3]:
    Even calling it that is kind.

[^4]: 
    Topology and Modality: the Topological Interpretation of First-Order Modal Logic,
    DOI: 10.1017/S1755020308080143

[1]: https://jacobneu.github.io/
[2]: https://ncatlab.org/nlab/show/allegory
[3]: http://www.andrew.cmu.edu/user/wcaldwel/
[4]: https://colinzwanziger.com/
[5]: https://en.wikipedia.org/wiki/Algebraic_theory
