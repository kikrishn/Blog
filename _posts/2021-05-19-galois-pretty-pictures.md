---
layout: post
title: Making Pretty Pictures for Galois Theory
tags:
  - sage
---

So in my algebra class we're doing [galois theory][1], a subject which 
never seems to really click with me. I know a lot of the theorems, and 
I can even solve a lot of the problems, but I always feel uneasy about it.
The computational problems often feel like guesswork, and the theoretical 
problems feel either trivial or impossible with little in between. I used to
feel this way about analysis, but it stings more to be struggling so much with
a subject so near to my heart.

All this to say I've been spending a lot of time reading about galois theory
and thinking about galois theory. I found [a paper][2][^1] which includes some
pretty pictures of roots of polynomials and how they permute. I know that the
"symmetries" we study in galois theory are more abstract than symmetries we
can obviously see by plotting roots in the complex plane, but I thought it
could be fun to make some pretty pictures of my own anyways. My undergraduate
advisor ([Klaus Sutner][3]) _loves_ making pictures of everything he studies, and
a lot of that has rubbed off on me. You never know when some picture will 
exhibit some pattern which you can make mathematically precise.

Of course, once you're making one or two sets of pictures, you might as well 
make a framework for making them. I also like showing off sage on this blog,
so it only makes sense to put my code here so that future students can play
around with these pictures. 

Keep in mind, though, though, that most polynomials have the whole symmetric
group as their group of symmetries! So when you plot those pictures you're 
likely to get factorially many in the degree!

<div class="linked_auto">
<script type="text/x-sage">
R.<x> = QQ[x]

def draw_arrow(p1,p2):
    """
    Draw a curved arrow connectiong two points
    

    @param p1 the tail of the arrow
    @param p2 the head of the arrow
    @return: a plot of the arrow

    """

    path = [p1, (p1+p2)/2 + (p2 - p1) * I / 3, p2]
    path = [(p.real(),p.imag()) for p in path]

    return arrow2d(path=[path], aspect_ratio=1)

def draw_all_actions(f):
    """
    Draw the action of each sigma in gal(f) on the roots of f
    

    @param f a polynomial whose galois group we want to study

    """
    f = R(f)

    # get the galois group of f
    K.<a> = f.splitting_field()
    G = K.galois_group()

    # get the roots of f in K
    roots = f.roots(multiplicities=False, ring=K)

    # fix an embedding K --> CC
    toCC = K.embeddings(CC)[0]

    # the basic plot of all the points we're drawing on
    pts = list_plot([(toCC(r).real(), toCC(r).imag()) for r in roots], size=30, aspect_ratio=1)

    # actually draw all of the pretty pictures
    for g in G:
        # turn g into a field homomorphism
        g = g.as_hom()

        out = pts
        for r in roots:
            out += draw_arrow(toCC(r), toCC(g(r)))
        show(out)

@interact
def _(f=input_box(x^2+1, width=20, label="$f$"), auto_update=False):
    f = R(f)
    draw_all_actions(f)
</script>
</div>

---

[^1]:
    Curtis Bright's _Computing the Galois Group of a Polynomial_.


[1]: https://en.wikipedia.org/wiki/Galois_theory
[2]: https://cs.uwaterloo.ca/~cbright/reports/computing-galois-group.pdf
[3]: www.cs.cmu.edu/~sutner/
