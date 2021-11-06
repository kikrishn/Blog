---
layout: post
title: Visualizing Hyperbolic Isometries
tags:
  - sage
  - pretty-pictures
---

Welcome to the inaugural post of this blog! As a quick preface, I plan
to post about math, particularly math that I'm struggling with, and hopefully
we can work through some stuff together ^_^.

I've noticed there can be a lack of examples for certain topics,
and I hope to use this blog in part to catalogue some examples that I
struggled to find elsewhere.

I also spend a lot of time thinking about math, and sometimes I have thoughts
that I'm particularly excited about. Some of the posts here will be about
those. These posts might be about research, classwork, or general observations
that I want to make sure I write somewhere.

Whenever possible, I'll try to include [sage](https://sagemath.org) code with
computational examples of whatever we're discussing. I think sage is a
fantastic resource for learning and doing mathematics, but I haven't seen
many people talking about how they actually use it in the wild. One notable
example is [sheaves.github.io](https://sheaves.github.io), which is a
(tragically inactive) blog that gave me the idea to put sage code in my own
blog. I'm far from a sage expert, but hopefully we can learn together.

Lastly, this post is being written before the design of this website is
complete. I'm able to do that because I know the phenomenal
[Remy Davison](https://remydavison.com/) will make this site look great
by the time you're reading this. I'm super grateful for both his friendship
and his Design Skills. Ok - onto the math.

---

Let's say you're working with Möbius Transformations and you want to
"understand what they do". Getting visual intuition for what's happening
seems like a great place to start!
You know that they act nicely
(i.e. by isometries) on the hyperbolic plane, but you want to actually _see_
the action of a particular transformation $M$.
Some cursory googling shows you're out of luck
(or maybe in the future, some cursory googling led you here...)
unless you're willing to write up a visualizer yourself.

This is the situation I found myself in, and it seems like a perfect
place to start off this blog. Möbius Transformations provide a wealth
of examples in hyperbolic geometry and complex analysis, and I think there
should be a place to just play with them. Moreover, writing the code to
actually _do_ that isn't particularly hard, so it lets us ease into
the world of sage. We'll start off easy:

<div class="linked_auto">
<script type="text/x-sage">
from sage.geometry.hyperbolic_space.hyperbolic_model import moebius_transform
H2 = HyperbolicPlane().UHP() # the Upper Half Plane model

# How many (vertical) geodesics should we actually show?
# I think showing from -2 to 10 seems sensible to start, but
# if you're working with transformations that do stuff far
# from the origin you might want to change this.
l = -2
r = 10

# We should also choose how high we want our plot to be. Again,
# I chose something sensible for small examples, but you might want
# to change this depending on what you're working with.
yMin = 0
yMax = 5


# Now we start the real work:
def basicPlot(M=None, showAxes=True):
    if M == None:
        M = matrix([[1,0],[0,1]])

    # We're going to plot geodesics (in different colors) so that we
    # can follow the transformation.
    # What colors should we interpolate between?
    colorL = Color("#16365D") # This is a slate blue
    colorR = Color("#09B811") # This is a light green


    toShow = plot([])
    for n in range(r-l):
        color = colorL.blend(colorR, n/(r-l))

        # The image of the vertical geodesic at point n
        p1 = moebius_transform(M, l+n) # hit the point l+n with the transformation M
        p2 = moebius_transform(M, Infinity)

        g = H2.get_geodesic(p1,p2)
        toShow += g.plot(color=color, axes=showAxes)

        # The image of a geodesic between points n and n+1
        p1 = moebius_transform(M, l+n)
        p2 = moebius_transform(M, l+n+1)
        g = H2.get_geodesic(p1,p2)

        # We darken the color of these geodesics to distinguish them
        # from the vertical ones after applying the transformation.
        toShow += g.plot(color=color.darker(), axes=showAxes)

    toShow.set_axes_range(l,r,yMin,yMax)

    return toShow

# Finally, we'll use an interactive wrapper so that we don't have
# to manually edit this code to do stuff with the visualizer!
@interact
def _(M = input_grid(2,2, default = [[1,0],[0,1]], label='M=', to_value=matrix), axes=True):
  basicPlot(matrix(M), showAxes=axes).show()
</script>
</div>

This cell is simple. It draws the geodesics from integer points on the boundary
to infinity (these are the vertical lines). It also draws geodesics connecting
adjacent integers. If you modify the matrix to $M$, it will show where these
geodesics map to under $M$ instead. This is a coarse visualization that
lets you see where things start and end... But can we do better?

<div class="boxed">
  As a fun exercise to see that you understand the code,
  can you modify it to show what happens to the geodesics connecting
  each $n$ to $n+2$?
</div>

---

One way to make this better would be to actually _animate_ the transformation.
The idea here will be to interpolate between the identity transformation and $M$,
and display some number of transformations from this interpolation. Then we
can package all these images into a gif, and watch the transformation unfold!

As a fun mathematical aside, this works because the space of
hyperbolic isometries, $\mathsf{PSL}_2 (\mathbb{R})$, is connected, and its
action on the upper half plane is continuous in the choice of transformation.
Actually *performing* a transformation $M$ corresponds to moving along some
path from the identity to $M$. This is why we can't perform a
reflection in $\mathbb{R}^3$, even though it's a perfectly good symmetry.
Reflecting through a plane and the identity lie in different path components,
so there's no continuous way to realize the transformation!

Ok, let's actually implement this:

<div class="linked_auto">
<script type="text/x-sage">

# If you're playing along at home, this code relies on the code from the
# previous block. So make sure to copy that as well.

def animateTransformation(M,showAxes=True):
    # n is how many interpolations for the animation.
    # higher numbers <--> smoother animations <--> longer computation.
    # I wouldn't recommend going too high on this site, but I've found 50
    # is a good number when rendering it on a dedicated computer.
    n = 25
    I = matrix([[1,0],[0,1]])

    plots = [basicPlot(I + (i/n) * (M-I), showAxes) for i in range(n)]

    # Let's actually add some extra frames of the ending position so we can
    # focus on it better.
    plots += [basicPlot(M, showAxes) for i in range(5)]
    return animate(plots)

@interact
def _(M = input_grid(2,2, default = [[1,0],[0,1]], label='M=', to_value=matrix), axes=True):
  animateTransformation(M,axes).show()

</script>
</div>

<div class="boxed">
As another little game, you may have heard elements of
$\mathsf{PSL}_2(\mathbb{R})$ called <em> elliptic </em>, <em> parabolic </em>,
or <em> hyperbolic </em> based on their trace. These are typically illustrated
"without loss of generality"
by showing what they look like after conjugating their fixed points to $0$ or
$\infty$. If you've seen these pictures before, you might want to
play around with some other examples. Predict what it will look like
if you put the fixed points of a hyperbolic action at, say, $-2$ and $2$.
Were you right? What about elliptic and parabolic actions?
</div>

---

The reason I started working on these visualizations is because I was
playing with fundamental domains of
[Fuchsian Groups](https://en.wikipedia.org/wiki/Fuchsian_group). Often
you want to know how the fundamental domain gets moved around by various
transformations. Additionally, there might be some points of interest whose
motion you want to follow. This is the most taxing graphic of them all,
but let's add a shaded region and marked points!

<div class="linked_auto">
<script type="text/x-sage">
def advancedPlot(M, showAxes, markedPoints, shadedRegion):
    p = basicPlot(M, showAxes)

    # Start by adding the marked points

    colors = rainbow(len(markedPoints)) # get different colors for each pt

    def mkPoint(i):
        p = markedPoints[i]
        new_pt = moebius_transform(M,p)
        # make the point big, add a legend saying where it started, and make sure
        # it ends up _above_ the shading (that's what zorder is for)
        return point(CC(new_pt), size=50, legend_label=p, color=colors[i], zorder=2)

    marked = sum([mkPoint(i) for i in range(len(markedPoints))])

    # Next we shade the region which was mapped to by the given region.
    # That's another way of saying that a point p should be shaded whenever
    # M^{-1}(p) was in the region. This turns out to be slightly easier to
    # implement.

    x,y = var('x,y')
    Mi = M.inverse()

    ptOld = moebius_transform(Mi,x+I*y)
    (xOld, yOld) = (ptOld.real_part(), ptOld.imag_part())

    # Substitute the preimage of (x,y) into the inequality
    newRegion = [ineq.subs(x=xOld, y=yOld) for ineq in shadedRegion]

    # Now for the expensive bit. You can change "plot_points" to a smaller
    # value to make the computation more efficient, but you lose out on
    # how precise the shading looks surprisingly quickly. Alternatively,
    # if you're running this locally and your region doesn't look quite right,
    # you can bump it a little to get some more definition.
    shaded = region_plot(newRegion, (x,l,r), (y,yMin,yMax), incol='lightblue', bordercol='gray', plot_points=100)      

    # actually draw the figure
    return p + marked + shaded

@interact
def _(M = input_grid(2,2, default = [[5,-4],[1,3]], label='M=', to_value=matrix),
showAxes=True,
markedPoints=input_box([1,2+I], width=20, label='Marked Points'),
shadedRegion=input_box([0 < x, x < 1], width=20, label='Shaded Region'),
auto_update=False):
  # This is much more expensive, so actually animating it is out of the question.
  # It's a pretty easy exercise to combine this code with the previous cell
  # to make an animated version locally, though ^_^

  advancedPlot(M, showAxes, markedPoints, shadedRegion).show()
</script>
</div>
