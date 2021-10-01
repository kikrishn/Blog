---
layout: post
title: Qual Recap
tags:
  - 
---

I passed ^\_^! Now that I've gotten my two exams back, I want to talk a bit
about what the experience was like, as well as explain my thought process 
for some of the problems. I've had _another_
friend ([Tim Rechen][8]) over the past few days, so I still haven't gotten
around to writing up the last analysis qual prep post about Fourier Analysis.
I promise I'll do that soon, though!

Now. Let's talk about the experience:

It sucked. I'm not the kind to worry about things, and I know that I'm a fairly
strong student, so the actual fear of passing/failing wasn't weighing particularly
heavily on my mind. That said, any time you have to take two $3$ hour exams in
a row, especially exams that are built up like these quals were,
it's going to be an unpleasant experience. It's made worse by the fact that 
your place in the program is resting on your results. I have close friends
(at multiple institutions) who are great mathematicians, but who are in hot 
water because they didn't do well on their quals. This is, of course, 
infuriating, and I can't imagine how much worse my already bad experience would
have been if I were a less confident person, or were struggling more with the
material, or didn't test well, or had been having personal issues before the 
exam, or... the list goes on. All this to say I view quals roughly as a 
kind of hazing, and I know a lot of other grad students who feel the same way.
For students who are anxious about their quals, complaints are often met with 
"Well of course you don't like the system! You can't take the heat, and maybe
you _should_ stay out of the kitchen". But conversely, for students who aren't
worried about the quals, complaints are met with 
"Well of course you don't like the system! It's just a tedious chore for you,
but you should just suck it up and take it so you can move to candidacy".

I want to know, then -- if people who are anxious about the system can't
complain about it, and people who _aren't_ anxious about the system can't
complain about it... Who _can_ give critiques?

Ok. I'll get off my soapbox now. Let's move on to the actual exams.

---

## Algebra

My first qual was in algebra, at $9$ am on a Monday. At UCR the algebra
qual is structured as $3$ sections (A, B, and C), each containing $5$ problems.
You choose $4$ from each section to answer, for $12$ problems total. 
They roughly fit the schema of

- A $\approx$ group theory and basic ring theory
- B $\approx$ commutative algebra, particularly modules and representations
- C $\approx$ field theory and galois theory

You can find the exam [here][6], and my solutions [here][1] if you want to follow along!

Algebra is one of my more comfortable subjects, so I don't have a lot to say
about this exam. I remember a few places where I really got held up, though.

First, problem B2:

<div class=boxed markdown=1>
Let $M$ be a $\mathbb{C}[x]$ module that's finite dimensional as a 
$\mathbb{C}$ vector space. If $m \in M$ is _not_ an eigenvector for $x$,
then the restriction map 

$$\text{Hom}_{\mathbb{C}[x]}(M,M) \to \text{Hom}_\mathbb{C}(M,M)$$

is not surjective.
</div>

I knew roughly how to solve this problem, but it took me a few tries to 
get the details right. I knew I wanted to build a linear map that didn't
commute with $x$, and the obvious way to do that is to use $m$ as a
basis vector (since it's the only vector we have any control over).

My initial thought was to extend $$\{ m \}$$ to a $\mathbb{C}$ basis for $M$,
then look at the projection map onto $\langle m \rangle$. Since 
$xm \not \in \langle m \rangle$, this should give us what we want. 

Writing it up that way was a little bit tricky, though. I knew I was 
right, but couldn't _quite_ figure out how to write it convincingly. After
all, why couldn't something weird happen with $xm$? 

Thankfully, this is an easy bug to fix. Since $m$ isn't an eigenvector
for $x$, $$\{m, xm\}$$ is linearly independent. So we can extend _it_ to 
a basis instead, and now we have full control over what happens to $xm$,
which is exactly what we need.

B3 also gave me some pause:

<div class=boxed markdown=1>
Show the following are equivalent for a (commutative, unital) ring $R$:

- Every $R$-module is projective
- Every $R$-module is injective
</div>

This would have gone more smoothly if I were more comfortable with injectives.
I don't know as many characterizations of injectives as I probably should,
so there may have been a slicker approach. That said, it was also a kind of
blessing, because when you only know one or two things about an object,
there's only so many ways you can prove something about it.

I know that injectives are dual to projectives, which at least got me a
definition I could work with. As for a proof strategy, since general
projectives _aren't_ injective, it doesn't make sense to try and directly
take a projective module and prove it injective (or vice versa). So we need
some way to link the two concepts that gives us more flexibility. I know that
every short exact sequence ending in a projective splits, and this statement
_feels_ like it should dualize to 
"every short exact sequence starting with an injective splits". So in both
the projective and injective cases, we know _every_ short exact sequence splits.

Some scratchwork convinced me that the statement really did dualize the way
I expected. I considered proving the projective case, then writing 
"the same holds of injectives by duality", but I wasn't entirely confident
we can just _do_ that (though I'm pretty sure we can). In either case, I wasn't
sure how the grader would feel about it. In the interest of
pragmatism, dualizing the proof by hand is quick, so I just wrote it out 
explicitly.

B4 is another lesson in pragmatism, I think:

<div class=boxed markdown=1>
Show 

$$\text{Hom}_R(M, \text{Hom}_R(N,P)) \cong \text{Hom}_R(N, \text{Hom}_R(M,P))$$
</div>

This is an exercise in adjunctions (and a great exercise to give someone who
doesn't believe in the power of abstract nonsense).

By the tensor-hom adjunction, we have

$$\text{Hom}_R(M, \text{Hom}_R(N,P)) \cong \text{Hom}_R(M \otimes N, P)$$

but by commutativity of $\otimes$, we know

$$\text{Hom}_R(M \otimes N, P) \cong \text{Hom}_R(N \otimes M, P)$$

and how we filp back with the tensor-hom adjunction again:

$$\text{Hom}_R(N \otimes M, P) \cong \text{Hom}_R(N, \text{Hom}_R(M, P))$$

and we're done.

Now, I _personally_ know that this argument is correct. But depending on how
much you care about little details, you might take issue with this argument.

The module $$\text{Hom}_R(X,Y)$$ is an _object_ in the category of $R$-modules. 
It's the so-called "internal hom", and even though in the category of 
$R$-modules it behaves almost exactly like the "external hom"
(namely the set of arrows $X \to Y$), there _are_ categories where the situation
is more subtle. See [here][2], for instance.

We know that we can move adjoints back and forth in the _external_ hom, but
do we know that we can do it in an _internal_ hom as well? I don't actually know!
I suspect the answer is "no", but I don't actually have a counterexample on hand[^2].
I've asked on [mse][15], though, so hopefully we'll know soon!

That said, it _does_ turn out to be true for the tensor hom adjunction.
That is, $$\text{Hom}_R(X \otimes Y, Z) \cong \text{Hom}_R(X, \text{Hom}_R(Y, Z))$$
as modules, and so the above argument goes through unchanged. 

<div class=boxed markdown=1>
As a quick exercise, you should show this if you don't think it's obvious[^1].
</div>

I wasn't sure if we'd seen this result in lecture, and decided it's better to
play it safe and prove the result by using the external hom directly,
especially since putting random adjunctions in the internal hom probably
_doesn't_ work in general.

The grader left a comment saying that I could have taken the shortcut,
but I still think that being explicit was the way to go.

Lastly, let's look at C4:

<div class=boxed markdown=1>
Let $F$ be a subfield of $\mathbb{C}$ with $F / \mathbb{Q}$ finite and
galois, with galois group $A_5$. 

If $\zeta_n$ is a primitive $n$th root of unity, 
show $F \cap \mathbb{Q}(\zeta_n) = \mathbb{Q}$ for every $n \geq 1$
</div>

I actually feel guilty about getting $8/10$ points on this problem. I
faked my way through all of the details of the proof, and the grader was
really generous to give me the credit that I got.

The broad idea is fairly clear: $F \cap \mathbb{Q}(\zeta_n)$ is a
galois subfield of $F$, and as such corresponds to a normal subgroup of
$A_5$. Of course, $A_5$ is famously simple, so there aren't many normal
subgroups to go around. If we can show that the galois group of $F$ 
over $F \cap \mathbb{Q}(\zeta_n)$ is all of $A_5$, then we're done by
the galois correspondence.

Unfortunately, in my answer, I screwed up in some pretty major (albeit common) ways. 
I'll leave it to you to read over my answer, but I remember thinking to 
myself while working on this problem that I didn't feel like sorting out the
details. I hadn't eaten breakfast yet, and this was pretty far into the exam,
so I kind of wanted to leave and get food. I threw down a sketch,
(not even noticing that I'd gotten the definition of galois subgroups backwards...)
and entirely left out a pretty major detail at the end because I couldn't 
figure out how to prove it.

Oh well, such is life. And so ends the algebra exam!

---

## Analysis

Analysis was also at 9am, which is truly unfortunate. It was on Wednesday,
though, which means I got all of Tuesday to decompress and get some last
minute studying in.

The format was different from the algebra qual. There were $4$ sections,
each containing $4$ problems. You got to choose $2$ problems from each sheet,
for $8$ problems total. The sections were

- Undergraduate $\approx$ continuity vs uniform continuity, riemann integration, etc
- A $\approx$ measure theory
- B $\approx$ more advanced measure theory on $\mathbb{R}$ (differentiation theorems, etc)
    and beginning functional analysis
- C $\approx$ basic functional analysis, $L^p$ spaces, and fourier theory

I would like to give one quick gripe before I move on with the problems.
When I went up to submit the exam, the proctor said (out loud!) that he
was confused by a technique I call "writing on both sides of the paper".
I have no idea what about this was confusing -- My questions were in order,
and each of the $4$ sections got their own two sheets, because I know that
each section got its own grader. I had also not eaten breakfast on this day
(you'd think I would have learned), and I was really looking to leave and get
food, but he made me rewrite my exam single-sided (which took an extra half hour or so).
I felt bad because my stomach was _definitely_ audible to anyone in my vicinity,
and I'm sure it was distracting.
Oh well, you have to pick your battles, and this would have been an extremely
stupid battle to fight. 

As before, you can find the exam [here][5] and my paper [here][4].

I was pleased at how confident I felt with a lot of the problems on this
exam. Analysts tend to be a bit more detail oriented than me 
(which, granted, isn't particularly hard to do), and so I'm never sure how
many details I _should_ show on an analysis exam. This was also a bit of a 
problem in algebra, but in my experience algebra problems have fewer routine
details, and it's pretty easy to know what you can and can't omit. 
Maybe this is because I'm more comfortable with algebra, and there are 
analysts who feel like it's obvious what details are relevant analytically
but are never sure how much to say on an algebra exam. If you happen to be
that kind of person, I would love to hear your opinions!

The first place I got really tripped up was in B4:

<div class=boxed markdown=1>
Show $L^p$ is meagre in $L^1$ for $p \gt 1$.
</div>

I got quite lucky in that I had prepared this problem while writing 
up my blog post on [$L^p$ spaces][7], even if the proof itself didn't 
make it into the final draft. The idea of showing meagreness from a 
failure of surjectivity is too clever to forget, so thankfully I knew
roughly what to do! But for some reason my brain just could not come up with
a function that's $L^1$ but not $L^p$. I knew it was something like $x^{-1/p}$,
but it felt like I was trying variations on that for like $20$ minutes before
I finally got it to work. Embarrassingly, this is in part because I tried and 
failed to integrate $x^{-1/p}$ at _least_ twice. In my defense, I was tired 
and hungry, and haven't taken an integral without [sage](https://www.sagemath.org/)
in a _very_ long time :P.

The next problem that really made me worry was C1, part b:

<div class=boxed markdown=1>
Is $(L^\infty, \lVert \cdot \rVert_1)$ separable?
</div>

The answer is intuitively "yes", because it's a subspace of a separable space
($L^1$)... Unfortunately, during the exam all I could think about was a 
pathological example I was remembering, where a separable space might 
have nonseparable subspaces (see [here][9] and [here][11], for instance). I felt like 
these pathologies couldn't happen in spaces this nice, but for the life of
me I wasn't able to come up with a proof. Of course, in hindsight, the argument
is [obvious][10], but at the time I was struggling to come up with good 
justification.

I remembered proving that $L^\infty$ was nonseparable (with its usual norm)
by constructing an uncountable discrete subset. This is an obvious obstruction
to separability, and it seemed reasonable enough to me that _every_ nonseparable
space might have this obstruction. Rather like the algebra exam, I was tired
at this point and wanted to get food, so I just asserted this as fact and 
happened to get lucky. You can find a discussion of this theorem [here][12],
and I'm not likely to forget it: an uncountable dense subset is a nice way
to witness nonseparability in a way that you can really get your hands on.

And lastly, I spent some time on C4:

<div class=boxed markdown=1>
If $f$ is a [Schwarz Function][13], then $\hat{f}$ is $C^\infty$
</div>

This is also obviously true, but I wasn't sure how many details to include. 
The fastest way to see it is to remember the fourier transform is an 
isomorphism from $\mathcal{S}$ (the space of schwarz functions) to itself.
Since every schwarz function is $C^\infty$, the claim follows.

This felt like it was assuming a bit much, though, so I decided to show 
a _bit_ more work. We know that _decay_ and _smoothness_ trade off
when we take fourier transforms. Precisely, if $x^k f$ is $L^1$ 
(so $f$ has to decay faster than $\frac{1}{x^k}$ as $x \to \infty$),
then $\hat{f}$ is $C^k$.

I _also_ wasn't sure if I was safe to assume this result, but the proof
is pretty quick (if you're willing to be a bit informal) so I figured it
wouldn't hurt to include it. I lost some points for not fully justifying
this, which is reasonable. I know differentiating under the integral is
allowed (we're working with schwarz functions. What could _possibly_ go wrong?), 
and I even know it's called [Leibniz's Rule][14][^3]. What I did _not_ know
were the assumptions that let us apply Lebiniz's rule... I thought 
smoothness might be involved? So I went ahead and guessed that, and the
grader (quite reasonably) took off points.

---

That's all, folks! I'm very happy to have the quals behind me[^4], 
and I feel a lot better about algebra and analysis, even if the
process of studying and sitting the exams was deeply unpleasant. 

Hopefully hearing my thought process for some of the problems helps
people realize that everyone is doing at least a little guessing 
during these exams, and it's ok to get stuck or take a less-than-direct
proof if you know it's right (as opposed to a slicker proof you're unsure of).

I'll write up my thoughts on fourier analysis soon, but now it's time to 
do more math, haha. I was surprised to hear I'm giving a talk tomorrow,
and I need to come up with a topic and write something. At least it's in person,
so I'll be back in my comfort zone of blackboard talks rather than 
beamer presentations. Once I have it written, I won't have to spend another
$6$ hours making the slides!

Stay safe, and see you all soon ^_^.


---

[^1]:
    You can also see proposition $3.2$ [here][3] if you want to see it done.

[^2]:
    That is, let $\mathcal{C}$ be a (symmetric) monoidal closed category with
    tensor $- \otimes -$ and internal hom $[-,-]$. If $L \dashv R$ are adjoint
    functors from $\mathcal{C} \to \mathcal{C}$, we know that for the 
    _external_ hom:

    $$\mathcal{C}(LX,Y) \cong \mathcal{C}(X,RY)$$ 
    
    as sets. Is it the case that

    $$[LX,Y] \cong [X,RY]$$

    in $\mathcal{C}$ too?

    I'm fairly sure the answer is "no", because the obvious proof doesn't go
    through, but I don't feel like thinking up a counterexample right now. 
    I asked the UCR grad student discord, but if nobody gets back to me I'll
    probably ask on MSE too.

[^3]:
    Rather unfortunately, I know this because I was TAing a calculus 
    class last year, and when somebody asked me about "Lebiniz's rule",
    I replied with a discussion of the product rule. Nobody told me that
    "Lebiniz's rule" refers to _two_ things in calculus! In fact, if I'm
    being entirely honest, I'm not sure if I ever learned the Leibniz 
    integral rule. I was _so_ embarrassed when I had to send an email 
    apologizing and explaining my mistake. So now the name is engraved in my
    head... If only the assumptions for using it would stick around too!

[^4]:
    Though I'm thinking of moving to a program with a logic department...
    So I might end up with more quals ahead of me.


[1]: /assets/docs/qual-recap/algebra.pdf
[2]: https://mathoverflow.net/questions/338599/are-there-categories-whose-internal-hom-is-somewhat-exotic
[3]: https://ncatlab.org/nlab/show/internal+hom#BasicProperties 
[4]: /assets/docs/qual-recap/analysis.pdf
[5]: /assets/docs/qual-recap/analysis-qual.pdf
[6]: /assets/docs/qual-recap/algebra-qual.pdf
[7]: /2021/09/02/lp-spaces
[8]: https://artistecard.com/timrechen
[9]: https://math.stackexchange.com/questions/758424/give-an-example-of-a-non-separable-subspace-of-a-separable-space
[10]: https://math.stackexchange.com/questions/2547487/every-subspace-of-a-separable-metric-space-is-separable
[11]: https://math.stackexchange.com/questions/3946786/example-of-non-separable-subspace-of-a-separable-hausdorff-space
[12]: https://math.stackexchange.com/questions/2512929/nonseparable-normed-space-contains-an-uncountable-set-of-isolated-elements
[13]: https://en.wikipedia.org/wiki/Schwartz_space
[14]: https://en.wikipedia.org/wiki/Leibniz_integral_rule
[15]: https://math.stackexchange.com/questions/4264886/are-there-adjoint-functors-that-dont-play-nicely-with-internal-homs
