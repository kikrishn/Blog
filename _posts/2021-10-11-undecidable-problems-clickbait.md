---
layout: post
title: Talk - Top $5$ Undecidable Problems -- Number $4$ will shock you!
tags:
  - my-talks
---

The quarter is starting to get into swing, and that means the grad student
seminar has started back up! True to form I volunteered to give the first talk,
but the scheduling led to a bit of a fiasco. I didn't realize I was supposed to
teach during gss, so on Monday I emailed the organizers to say that I couldn't 
give the talk after all. Then, ~~yesterday~~ last Thursday 
(it took me just over a week to finish writing this blog post), I heard that they had 
moved the gss especially for me, so I could make it! Unfortunately, since I 
thought I'd cancelled, I hadn't worked on a talk throughout the week, and had to 
come up with _something_ on the fly. It ended up being fine, but I have high 
standards for myself, and I do like to have a _bit_ of time to prepare.
The great news, though, is that we're back in person, so I could do a 
blackboard talk (or whiteboard, as it were) and I didn't need to make slides.

I've heard stories of John Conway taking suggestions from the crowd for his 
talks, or showing up with a selection of talk titles on the board, allowing
the audience to vote on what they'd like to hear about. This is definitely a
bit of a flex, but I've always thought the idea sounded really fun. 
I think John Conway's lectures are what I most admire about him, and the ability
to "improvise" a talk resonates with my [Dalcroze][1] training as something
aspirational. In any case, I see nothing
wrong with a bit of light showboating, and I thought it would be
fun to try my hand at it. Plus, this meant I didn't have to come up with a
title or an abstract! 

I have a list of talks in a todo list, all of which I've
spent a _bit_ of time thinking about. 
I went in ~~today~~ last Friday, listed a few that I felt particularly 
prepared for, and asked the crowd which sounded the most interesting.

As I was writing up the ideas, people said I should make them more clickbaity.
I tried my best to oblige, and the talk they decided on ended up being called
"Top $5$ Undecidable Problems: Number $4$ will shock you!".

Let's talk about how it went ^_^

---

All in all, I think the talk went fairly well. It was definitely a bit less
organized than my talks usually are (which is wholly unsurprising, given the
circumstances). Apologies in advance, by the way. I'm going to summarize what
I said during the talk, but I'm not going to go into too many details. 
I'm feeling quite tired, and I've been sitting on this post for a while now
and want to get it off my mind. I love these problems, though, so one day I'll
probably write up a blog post that's better exposited.

My $5$ undecidable problems were, in order of presentation, not necessarily 
in order of favorite-ness:

- [The Halting Problem][4]
- [MRDP][3]
- [Wang's Tiling Problem][5]
- [Richardson's Theorem][6]
- [The Word Problem for Groups][7]

Obviously there are many other interesting undecidable problems, but I think
these flow quite nicely into each other, and provide a pretty varied set of
examples. 

It's pretty quick to prove the undecidability of the halting problem directly,
so I started there and explained what exactly it means for a problem to be 
"undecidable". Then I said that, with some effort, you can prove that you can
simulate the execution of a turing machine using polynomials plus some mild
exponentiation[^1], this was shown by Robinson, Davis, and Putnam. Then,
famously, Matiyasevich showed that you can actually remove the exponentiation,
proving the MRDP theorem, and showing that it's undecidable if a polynomial
(with integer parameters) has integer zeroes for some value of the parameters. 

Then we change tack, and talk about tiling the plane. This, to me, is one of
the most surprising undecidable problems I know. It's such a simple sounding
problem, that you might give to children as a game. The fact that it's 
undecidable in general is really shocking to me, so obviously it needs to be
included. I'd never actually seen a proof of this fact, but it turns out to be
relatively easy. See [here][8] for instance. 

Next, we talked about Richardson's Theorem, which says roughly that the 
problems you had in precalculus where you had to prove some trig identity
are, in general, impossible! This is basically because the theory of 
$\mathbb{Z}$ is undecidable (by the MRDP theorem) but we can define 
$\mathbb{Z} \subseteq \mathbb{R}$ by using $\sin(x)$.

<div class=boxed markdown=1>
  I don't normally leave exercises in my talk recap posts, but this is 
  too cute to pass up! If you've never seen it before, can you show that

  $$\mathbb{Z} = \{ x \in \mathbb{R} \mid \phi(x) \}$$

  for some first order formula $\phi$ that uses 
  $=, +, \times, 0, 1, \leq$ and $\sin(x)$?

  As a hint, see if you can write down $\{ \pi \}$ first, then use it
  plus the zeroes of $\sin(x)$, in order to get $\mathbb{Z}$.
</div>

After this I intended to talk about the word problem for groups, but people 
were clearly excited about real equations, and were asking some questions about
variants. Because of that, I spent the rest of the talk giving some related
problems, and talking about some fun theorems in this area. Unrelatedly,
this is one of the things that I most love about giving blackboard talks.
If I had premade a bunch of slides for this talk, I wouldn't have been able
to transition the talk in this way.

First, I mentioned that the presence of $\sin(x)$ in the above theorem is
_extremely_ necessary: The [Tarski–Seidenberg Theorem][9] says that a 
computer can answer any question about real polynomials. Then I mentioned
that this is in stark contrast to integer polynomials (by MRDP). 
I posed the question about rational polynomials, which is still open. 

Then people wanted to know about how one proves Tarski-Seidenberg, and since
I'm _always_ happy to talk about model theory, we talked about quantifier 
elimination. I mentioned this can be generalized, and this led to a major
error on my part: I accidentally said that the theory of $\mathbb{R}$ with
the field operations and $\exp(x)$ was decidable. What I was actually
remembering was that this theory is [o-minimal][10], and it turns out
decidability of this theory is [open][11], though it's settled 
(in the affirmative) by [Schanuel's Conjecture][12], which I believe is
widely believed (so I didn't lie too badly!). You can read more about extensions
of real arithmetic, and their o-minimality, etc. [here][2].

---

Top $5$ Undecidable Problems: Number $4$ will shock you!

Undecidable problems are problems which are, in a certain sense,
provably unsolvable. In this talk we'll survey some undecidable problems
in mathematics, both famous and surprising, and discuss how these problems
witness the close ties between mathematical logic and other branches of math.

Sorry I don't have slides or a recording for this talk. That's the downside
of working at a whiteboard (and also of improvising). The summary above will 
have to be enough.

---

[^1]:
    Formally, a set $S \subseteq \mathbb{Z}^n$ is called 
    <span class=defn>Exponential Diophantine</span> if and only if there is
    a polynomial $p \in \mathbb{Z}[\overline{x}, \overline{y_1}, \overline{y_2}]$
    and a base $b \in \mathbb{Z}$ so that 

    $$
    S = 
    \{ \overline{a} 
    \mid 
    \exists \overline{t} . p(\overline{a}, \overline{t}, b^\overline{t}) = 0
    \}
    $$

    Here $b^{(t_1, \ldots, t_m)} = (b^{t_1}, \ldots, b^{t_m})$.

    The fact that every computably enumerable set is exponential diophantine
    is a major theorem of Robinson, Davis, and Putnam. Showing that every
    exponential diophantine set is actually diophantine in the classical sense
    was the contribution of Matiyasevich.


[1]: https://en.wikipedia.org/wiki/Dalcroze_eurhythmics
[2]: http://homepages.math.uic.edu/~marker/orsay/orsay3.pdf
[3]: https://en.wikipedia.org/wiki/Diophantine_set#Matiyasevich's_theorem
[4]: https://en.wikipedia.org/wiki/Halting_problem
[5]: https://en.wikipedia.org/wiki/Wang_tile
[6]: https://en.wikipedia.org/wiki/Richardson%27s_theorem
[7]: https://en.wikipedia.org/wiki/Word_problem_for_groups
[8]: http://www.cs.bc.edu/~straubin/cs385-07/tiling
[9]: https://en.wikipedia.org/wiki/Tarski%E2%80%93Seidenberg_theorem
[10]: https://en.wikipedia.org/wiki/O-minimal_theory
[11]: https://en.wikipedia.org/wiki/Tarski%27s_exponential_function_problem
[12]: https://en.wikipedia.org/wiki/Schanuel%27s_conjecture
