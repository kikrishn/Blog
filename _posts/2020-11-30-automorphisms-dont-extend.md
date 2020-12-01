---
layout: post
title: Automorphisms Don't Extend
tags:
  - mse
  - algebra
  - group theory
  - automorphism group
  - gap
---

I was on mse last night (later than I should have been...) when I saw a really
[interesting question][1]. In the interest of keeping the blog post self 
contained, I'll transcribe the question here (with some notational edits):

<div class=boxed markdown=1>
Let $\text{Aut}(G)$ denote the group of automorphisms of $G$, and let
$A$ be a subgroup of $B$. 

Is $\text{Aut}(A)$ a subgroup of $\text{Aut}(B)$?

If not, is there a necessary and sufficient condition for this to hold?
</div>

I think [automorphism groups][4] are really interesting. They're a very natural 
operation on groups, and yet they seem to be quite difficult to understand
in general. I haven't done any extensive work with them, but the fact that 
they're so difficult to compute surprises and excites me. Moreover, if a group
$G$ measures the symmetries of an object $X$, then in some sense $\text{Aut}(G)$
measures the "symmetries among the symmetries". This seems like an interesting
topic of study, analogous to the study of [Syzygies][2] in ring
theory[^1]. I've actually asked [a question][3] about this myself, though
I didn't phrase the question as clearly as I could have so I didn't get any
answers. It's also possible the problem is Hard™️, which would be another 
reason there's no answers. In general, automorphism groups are one of many
objects I'd like to learn more about, so I got excited to see this question
about them.

[^1]:
    I'm not sure how precise this analogy can be made, however. It's 
    certainly an informally similar idea, but it clearly doesn't align
    with the notion of a $\mathbb{Z}$-syzygy for abelian groups.

My instinct, upon seeing this problem, was to answer "no". That is,
there's no reason $\text{Aut}(A)$ should be a subgroup of $\text{Aut}(B)$.
After all, it's possible for $A$ to be some very symmetric object living inside
some less symmetric object $B$. Then there's no reason why a symmetry of $A$
should extend to a symmetry of the larger object $B$. 

One picture you might have in mind is this[^2]:

![deathly hallows symbol](/assets/images/automorphisms-dont-extend/deathly-hallows.jpg){:width="200px"}

[^2]: Taken from [here][5] 

The circle has LOTS of symmetries, but the deathly hallows logo[^3] has
only two. The "do nothing" symmetry, and the "reflect horizontally" symmetry.
Most of the symmetries of the circle _don't_ extend to symmetries of the
entire object, and there's no reason to expect symmetries of groups to behave
any differently. Mark Bennet phrases this well in [his comment][6] under the 
original question.

[^3]: 
    I know, I know, she's cancelled. The books were still impactful on me,
    and this is a good and fairly fun example.

Gerry Myerson asked if I could give a counterexample, rather than informally
arguing that such a theorem shouldn't be true. It's a good question, but
he asked it around 2am, so when I couldn't immediately think of one 
(again, I'm not very comfortable with computing automorphism groups myself)
I told him I'd think harder (and ask sage) in the morning.

---

By the time I checked again, there were already some counterexamples floating
around. Ancientmathematician mentions $\mathfrak{S}_6 \leq \mathfrak{S}_7$,
and uses some "well known" facts about their orders 
(which happened to be not-so-well-known to me :P). Moreover, in a comment
on my answer, Derek Holt mentions $C_2 \times C_2 \leq D_8$ but again,
the automorphisms can't work out. 

I was still interested in verifying this by hand, and since sage doesn't seem
to have a way to compute automorphism groups directly[^4] I decided making
calls to `gap.eval()` every other line was too much of a hassle 
(also it kept weirdly segfaulting?)... If I wanted to do this, I was going
to have to do it directly in [gap][7]. It took me some experimenting to get
the syntax right, but at the end of the day, it really wasn't too hard to 
get some (naive) code working:

[^4]: I'm not crying, you're crying.

<div class="gap">
<script type="text/x-sage">
  # Some code to find a counterexample to the mse question here:
  # https://math.stackexchange.com/q/3928573/655547
  #
  # In short, can we find groups A < B with
  # Aut(A) NOT a subgroup of Aut(B)?

  Embeds := function(G,H)
    # Does G embed into H?
    # This was shockingly hard to get working. Eventually 
    # I shamelessly stole a solution from here:
    # https://math.stackexchange.com/a/767953/655547

    local homs, kernelSizes;

    homs := AllHomomorphismClasses(G,H);
    kernelSizes := List(homs, h -> Order(Kernel(h)));
    
    # The smallest a kernel can be is 1, which happens when h is an embedding
    return Minimum(kernelSizes) = 1; 
  end;


  TestGroup := function(B)
    # Return a witness A with Aut(A) not a subgroup of Aut(B) if one exists

    local A, AutA, AutB, flag;
    AutB := AutomorphismGroup(B);

    flag := false;
    for A in ConjugacyClassesSubgroups(B) do
      A := Representative(A); # get a representative from the conjugacy class
      AutA := AutomorphismGroup(A);

      if not Embeds(AutA, AutB) then
        Print(StructureDescription(A), " is a subgroup of ", StructureDescription(B));
        Print("\n");
        Print("But Aut(A) = ", StructureDescription(AutA), "\n");
        Print("Which is not a subgroup of Aut(B) = ", StructureDescription(AutB));
        Print("\n\n");

        flag := true;
      fi;
    od;

    return flag;
  end;

  # TestGroup(SymmetricGroup(7));
  # TestGroup(DihedralGroup(8));
</script>
</div>

You can uncomment either of the tests at the bottom to verify that the 
counterexamples mentioned above are actually counterexamples. You can also
ask this same question of any group you're interested in. It raises some
warnings along the way (something about my code being inefficient for large
subgroups), but it's good enough for right now.

<div class=boxed markdown=1>
  You might try to add a loop to this code to run `TestGroup` on every group
  of order $\leq 100$. 
</div>

Being able to test a conjecture on all the "small" groups is obviously a
useful skill, so if you aren't sure how you would go about doing this,
give it a try! It's not too hard, and you can even test your code out
in the sage cell above.

---

[1]: https://math.stackexchange.com/q/3928573/655547
[2]: https://en.wikipedia.org/wiki/Linear_relation
[3]: https://math.stackexchange.com/q/3864726/655547
[4]: https://groupprops.subwiki.org/wiki/Automorphism_group_of_a_group
[5]: https://www.reddit.com/r/Whatisthis/comments/5d23vg/i_keep_seeing_this_trianglecircle_symbol_recently/
[6]: https://math.stackexchange.com/questions/3928573/if-a-is-a-subgroup-of-b-just-it-hold-that-textauta-is-a-subgroup-of/3928582?noredirect=1#comment8102277_3928573
[7]: https://www.gap-system.org/
