---
layout: post
title: Two Sage Visuals
tags:
  - sage
  - geometry

---

I'm in a reading group with Elliott Vest and Jacob Garcia 
(supervised by [Matt Durham][1]) where we're talking about 
CAT(0) Cube Complexes. We're reading a set of lecture notes 
by sageev (pdf [here][2], for the interested) and we came across
a fairly simple problem that we wanted to draw. In a completely
different vein, [Russell Phelan][3] asked a fun topological question
in the UCR math discord, and to solve it I ended up needing to draw
something else. I figured I would write up a quick post about both
visualizations, since these things can be a bit tricky to get right.

---

## Hyperbolic Circles

Let's start with the cube complexes. One of the exercises in Sageev's 
notes[^sageev-ex] asks a question which uses circles in the hyperbolic
plane $H^2$. We had an intuitive idea why this should be true, but 
to really visualize it, I asked a question (which in hindsight was silly):

We know that in the [disk model][4] hyperbolic circles and euclidean 
circles agree (albeit the centers might not be where they appear). 
By this I mean a hyperbolic circle 

$$C(r,x_0) = \{x \mid d_\text{hyperbolic}(x_0,x) = r \}$$

_looks_ like a euclidean circle when you draw it. I didn't know of any
such fact for the [upper half plane model][5], though, and I asked if
anyonne knew what circles look like there. We didn't, so I went on a
quest to just... draw a bunch of hyperbolic circles in [sage][6].

According to [wikipedia][7], the hyperbolic distance in the upper half plane 
is given by

$$
d \big ( (x_1,y_1),(x_2,y_2) \big ) = 
2 \text{arcsinh} 
\left ( 
\frac{1}{2}
\sqrt{\frac{(x_2 - x_1)^2 + (y_2 - y_1)^2}{y_1 y_2}}
\right )
$$

So let's go ahead and plot a circle in this metric! The relevant function
for this is `implicit_plot`, which does what it says on the tin.

<div class="auto">
<script type="text/x-sage">
x,y = var('x,y')
d(x1,y1,x2,y2) = 2 * arcsinh(1/2 * sqrt(((x2-x1)^2 + (y2-y1)^2) / (y1*y2)))

# plot a circle of radius 1/2 centered at (0,1)
implicit_plot(d(x,y,0,1) - 1/2, (-5,5), (0,5)) 
</script>
</div>

You can see this _looks_ like a regular circle. Of course, we know that
distances should be distorted -- just look at the notion of distance! 
The distortion, it turns out, is in the apparent location of the center
and the apparent _size_ of the circle.

To see exactly what I mean by this, let's plot a bunch of circles 
(with their centers marked) each of radius $1$.

<div class="auto">
<script type="text/x-sage">
x,y = var('x,y')
d(x1,y1,x2,y2) = 2 * arcsinh(1/2 * sqrt(((x2-x1)^2 + (y2-y1)^2) / (y1*y2)))

colors = ["blue", "red", "green", "maroon", "olive", "pink", "silver", "navy"]

def draw_circle(x0,y0,r, c):
    """
    Draw a circle with center (x0,y0), radius r, and color c
    """

    # draw the circle
    p1 = implicit_plot(d(x,y,x0,y0) - r, (-5,5), (0,5), color=c)

    # draw the center
    p2 = point((x0,y0), color=c)

    return p1 + p2

out = Graphics()
for i in range(1,8):
  # draw a sequence of circles, all of radius 1,
  # but with centers moving closer to the x axis
  # (which we think of as a line at infinity)
  out += draw_circle(-3 + i, 1/i, 1, colors[i])

out.show()
</script>
</div>

You can tell that the true center of the circle is not where one might
think. This is because distances near the $x$-axis are longer than they appear, 
and so our center must be closer to points near the $x$-axis to compensate.

<div class=boxed markdown=1>
As an aside, it might seem magical that this wild distance formula makes
circles look like euclidean circles. But like a good magic trick, there's
a shockingly simple explanation under the surface.

If we take for granted that circles in the disk model are euclidean circles,
can you show that this must be true for the upper half plane model as well?

As a (possibly too helpful) hint, you might consider [mobius transformations][8].
</div>

To really have fun experimenting, let's make the above graphic interactive,
and let's throw in an interactive disk model graphic as well, just for fun.

Be a bit careful with the disk model -- because I'm using the same sliders
as the upper half plane model, you need to make sure that your center 
stays in the unit circle.

<div class="auto">
<script type="text/x-sage">

x,y = var('x,y')
dUHP(x1,y1,x2,y2) = 2 * arcsinh(1/2 * sqrt(((x2-x1)^2 + (y2-y1)^2) / (y1*y2)))
dPD(x1,y1,x2,y2) = arccosh(1 + (2 * ((x2-x1)^2 + (y2-y1)^2))/((1 - (x1^2 + y1^2))*(1 - (x2^2 + y2^2))))

@interact
def _(model=selector(['upper half plane', 'poincare disk'], buttons=True),
      x0=slider(-5,5,step_size=0.1, default=0), 
      y0=slider(0.1,5,step_size=0.1, default=1/2), 
      r=slider(0,3,step_size=0.1, default=1)):

  if model == "upper half plane":
    show("Upper Half Plane Circles")

    # draw the circle
    p1 = implicit_plot(dUHP(x,y,x0,y0) - r, (-5,5), (0,5))

    # draw the center
    p2 = point((x0,y0))

    show(p1+p2)
  else:
    show("Poincare Disk Circles")

    # draw the boundary circle of the poincare disk
    p1 = implicit_plot(x^2 + y^2 - 1, (-1.5,1.5), (-1.5,1.5), color="black")

    # draw the circle
    p2 = implicit_plot(dPD(x,y,x0,y0) - r, (-1.5,1.5), (-1.5,1.5))

    # draw the center
    p3 = point((x0,y0))

    show(p1+p2+p3)

</script>
</div>

---

## A Topological Problem

<br>

<img src="/assets/images/two-sage-visuals/completely-different.gif">

In the second half of this post we'll go over a fun problem that Russell
put in the UCR discord. It's Question 1 from Example 3.1.10 in Burago, Burago,
and Ivanov's [A Course in Metric Geometry][9]:

<div class=boxed markdown=1>
  What topological space do you get when you quotient $\mathbb{R}^2$ by
  $(x,y) \sim (-y,2x)$?
</div>

I encourage you to give this a go by yourself before reading ahead! It took
me a few days to be really confident in my answer, and it was a
_lot_ of fun to work through ^_^.

After a bit of looking for low hanging fruit (which, as far as I can tell, 
wasn't there), I decided to just hunker down and look for a fundamental domain.
It's easy to see that this quotient space is the orbit space of the action 
of $\mathbb{Z}$ on $\mathbb{R}^2$ where the generator acts by
$$T = \begin{pmatrix} 0 & -1 \\ 2 & 0 \end{pmatrix}$$.

A little bit of experimentation lets you find a fundamental domain. 
We know that we scale things by a factor of $2$ each time we apply $T$, 
so that clues us in to look around the anulus between $1/2$ and $1$.

<div class="auto">
<script type="text/x-sage">

x,y = var('x,y')
xr = (x,-2,2)
yr = (y,-2,2)

out = Graphics()

# the first anulus
region = [1/4 < x^2 + y^2, x^2 + y^2 < 1, x > 0, y > 0]
out += region_plot(region, xr, yr, incol="purple")

# the second anulus
region = [1/16 < x^2 + y^2, x^2 + y^2 < 1/4, x > 0, y > 0]
out += region_plot(region, xr, yr, incol="cyan")

out.show()
</script>
</div>

We can convince ourselves that this really is a fundamental domain by 
plotting the orbit of all of these regions and checking that they cover the
whole plane 
(barring the origin, of course. Do you see why we have to treat it specially?).

<div class="linked_auto">
<script type="text/x-sage">
x,y = var('x,y')

N = 5
T = matrix([[0,-1],[2,0]])

xr = (x,-2,2)
yr = (y,-2,2)

def drawRegion(n):
    [v1,v2] = T^n * matrix([x,y]).transpose()

    # janky hack mate
    # I have no idea why we need to do this
    v1 = eval(str(v1))
    v2 = eval(str(v2))

    out = Graphics()
    
    # the first anulus
    region = [1/4 < v1^2 + v2^2, v1^2 + v2^2 < 1, v2 > 0, v1 > 0]
    out += region_plot(region, xr, yr, incol="purple")

    # the second anulus
    region = [1/16 < v1^2 + v2^2, v1^2 + v2^2 < 1/4, v2 > 0, v1 > 0]
    out += region_plot(region, xr, yr, incol="cyan")

    return out

out = Graphics()
for n in range(-N,N+1):
    out += drawRegion(n)

out.show()

</script>
</div>

From this information we can piece together the quotient space! 
The pretty picture tells us that we have a (topological) hexagon 
from the two cyan sides, the two purple sides, the purple top and the
cyan bottom. 

<div class=boxed markdown=1>
  As a quick exercise, write down the hexagon above and figure out 
  which sides are identified. Why is this a torus?
</div>

So we understand $$\mathbb{R}^2 \setminus \{ 0 \} \bigg / \langle T \rangle$$, 
and the day of reckoning is upon us. We need to handle the origin. 
It's easy to see that our equivalence relation is not closed in 
$\mathbb{R}^2 \times \mathbb{R}^2$, so our quotient space _cannot_ be
hausdorff. 
Notice also that any neighborhood of the origin contains a tail of fundamental 
domains. That tells us that every neighborhood in the quotient should do the same.

So our picture is of a torus, plus one _really big_ "generic" point. 
Any neighborhood of this point contains the entire torus. 

What a bizarre space, right? I had a _lot_ of fun working this out!
Before I typed this up I was feeling a bit insecure about the solution
(I also had a much grosser fundamental domain at first), and asked about it
on [mse][10]. It doesn't have an answer yet, but I'm feeling more confident
in my computation now, so I'm posting this anyways. I can always edit this post
if someone leaves an answer that totally changes how I think about the problem,
and you can always follow that link if you (in the future) want to see what
people had to say.

Finally, if you want to think about some similar things, I have a fun problem
for you ^_^

<div class=boxed markdown=1>
Let's look at the action of $T^2$ and $T^4$ on $\mathbb{R}^2$ instead. 
These matrices are much easier to understand (they're diagonal, for instance).

What are the quotient spaces of these actions? They generate subgroups of
$\langle T \rangle$, so (at least morally) we expect them to correspond to 
covering spaces of $\mathbb{R}^2 \big / \langle T \rangle$. Do they? 
If so, what does the covering action look like? If not, what goes wrong?
</div>


---

[^sageev-ex]: 
    Exercise 2.15, for the curious

[1]: https://sites.google.com/view/mgdurham/
[2]: http://www.math.utah.edu/pcmi12/lecture_notes/sageev.pdf
[3]: https://github.com/russphelan
[4]: https://en.wikipedia.org/wiki/Poincar%C3%A9_disk_model
[5]: https://en.wikipedia.org/wiki/Poincar%C3%A9_half-plane_model
[6]: https://www.sagemath.org/
[7]: https://en.wikipedia.org/wiki/Poincar%C3%A9_half-plane_model#Distance_calculation
[8]: https://en.wikipedia.org/wiki/M%C3%B6bius_transformation
[9]: https://bookstore.ams.org/gsm-33
[10]: https://math.stackexchange.com/q/4117907/655547
