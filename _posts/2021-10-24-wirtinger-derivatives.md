---
layout: post
title: What Do Wirtinger Derivatives Do?
tags:
  - 
---

I was chatting with a friend about complex analysis earlier today, and I 
realized that I was never really told why we should care about 
[Wirtinger Deritatives][1], at least in one complex variable[^1].
I figured I would write up a quick blog post about them, and explain how they
can help explain (intuitively) which functions are holomorphic.

First, what are they? Wirtinger derivatives are almost always introduced in
the following context:

If $f(x,y) = u(x,y) + i v(x,y) : \mathbb{R}^2 \to \mathbb{C}$, 
we can view $f$ as a complex function by setting 
$f(z) = f(\mathfrak{Re}(z), \mathfrak{Im}(z))$. It's then reasonable to ask 
how the _real_ differentiability of $f$ relates to the (stronger)
_complex_ differentiability of $f$.

We find that $f$ is complex differentiable exactly when it satisfies a pair
of partial differential equations called the [Cauchy-Riemann Equations][2]:

$$
\frac{\partial u}{\partial x} = \frac{\partial v}{\partial y} 
\quad \quad 
\frac{\partial u}{\partial y} = - \frac{\partial v}{\partial x} 
$$

Many sources then introduce the [Wirtinger derivatives][1],

$$
\frac{\partial}{\partial z} 
= \frac{1}{2} \left ( \frac{\partial}{\partial x} - i \frac{\partial}{\partial y} \right )
$$

and[^5]

$$
\frac{\partial}{\partial z^\ast} 
= \frac{1}{2} \left ( \frac{\partial}{\partial x} + i \frac{\partial}{\partial y} \right ),
$$

then reformulate the Cauchy-Riemann equations in the much simpler form:

<div class=boxed markdown=1>

$$\frac{\partial f}{\partial z^\ast} = 0$$

</div>

The benefit of this is that $$\frac{\partial f}{\partial z^\ast} = 0$$
is very memorable. The difficult part is that, formally, this doesn't make 
much sense. I've known many students who were confused by this notation[^2], 
since how a function depends on $z$ is intimately related to how it depends on 
$$z^\ast$$. After all, we can recover $$z$$ and $$z^\ast$$ from each other,
so they aren't obviously independent in the same way $x$ and $y$ are[^3]! 

Here, though, I think it's helpful to take a simpler, more utilitarian stance.
Before asking what these derivatives _mean_, let's just see what they _do_.
After working with them for a while, you can decide for yourself whether they're
merely a formal tool (which you're welcome to do away with) or if they have
some deeper meaning[^4].

First, we need to say how to compute with them. Thankfully, they satisfy all
the nice formulas you expect! 

<div class=boxed markdown=1>

As a nice exercise, you should show 
(some subset of) the following:

$\frac{\partial}{\partial z} z = 1$ and 
$\frac{\partial}{\partial z^\ast} z = 0$

$\frac{\partial}{\partial z} z^\ast = 0$ and 
$\frac{\partial}{\partial z^\ast} z^\ast = 1$

Both $\frac{\partial}{\partial z}$ and $\frac{\partial}{\partial z^\ast}$
are linear 
(so, e.g. 
$\frac{\partial}{\partial z}(f + g) 
= \frac{\partial}{\partial z}f + \frac{\partial}{\partial z}g$)

Both $\frac{\partial}{\partial z}$ and $\frac{\partial}{\partial z^\ast}$
satisfy the power rule, product rule, chain rule, and quotient rule

$$\overline{\frac{\partial}{\partial z} f} 
= \frac{\partial}{\partial z^\ast} \overline{f}$$
and
$$\overline{\frac{\partial}{\partial z^\ast} f}
= \frac{\partial}{\partial z} \overline{f}$$

Notice that, perhaps counterintuitively, $z^\ast$ gets treated like a constant
when we use $\frac{\partial}{\partial z}$ (and vice versa)! 

</div>

Now we're finally in a place to see how these can help us!

Consider $f(z) = \mathfrak{Re}(z)$, which picks out the real part of $z$. 
Naively, it seems reasonable that this should be holomorphic. But notice:

$$
\frac{\partial}{\partial z^\ast} \mathfrak{Re}(z) 
= \frac{\partial}{\partial z^\ast} \frac{z + z^\ast}{2}
= \frac{1}{2}
\neq 0.
$$

Since a function is holomorphic if and only if 
$\frac{\partial}{\partial z^\ast} f = 0$, we see that
$\mathfrak{Re}(z)$ is _not_ holomorphic after all!

Similarly, let's look at $|z|$. In this case, we _expect_ it to not be
differentiable, since this fails even in the real case. And as predicted:

$$
\frac{\partial}{\partial z^\ast} |z|
= 
\frac{\partial}{\partial z^\ast} \sqrt{z z^\ast}
=
\frac{z}{2 \sqrt{z z^\ast}}
\neq 0.
$$

For polynomials, however, we find that they're all holomorphic!
By linearity it suffices to consider $z^n$, and for those we see

$$
\frac{\partial}{\partial z^\ast} z^n = 0.
$$

Informally, then, we see how this can be useful. To check if a function
is holomorphic, we find a way to write it in terms of $z$s and $z^\ast$s,
and then compute a single derivative. In many cases of interest, there are
simply no $z^\ast$s in sight, which means we get holomorphicity "for free".
For instance, notice

$$
\frac{\partial}{\partial z^\ast} e^z
= \frac{\partial}{\partial z^\ast} \left ( 1 + z + \frac{z^2}{2} + \ldots \right )
= \frac{\partial}{\partial z^\ast} 1 
+ \frac{\partial}{\partial z^\ast} z
+ \frac{\partial}{\partial z^\ast} \frac{z^2}{2}
+ \ldots
= 0
$$

since there are no $z^\ast$s in this expression at all!

This makes it extremely quick to check if a given function is holomorphic
in practice.

---

A genuinely quick post today! I have some longer form stuff in the works,
but I've been busy hosting for the past little while. It seems I have too
many friends who want to visit me! 

I don't have much else to say about
Wirtinger derivatives. I would be interested in hearing about other uses
or reasons to care. I think they get used for optimization,
where we view $f : \mathbb{C} \to \mathbb{C}$ instead as a function
$\mathbb{C} \to \mathbb{R}^2$, but I haven't looked into it at all...
Feel free to leave information about this or other uses in the comments!

See you all soon ^_^

---

[^1]:
    Any more than one complex variable scares me senseless, at least at
    time of writing. I haven't actually _tried_ to learn any complex analysis
    in several varaibles, but I've heard horror stories, and I know it's still
    an area of active research.

[^2]:
    Indeed, I was personally a student confused by this for a while

[^3]:
    That said, they _are_ still linearly independent when viewed over $\mathbb{R}$.
    After all, if $z = x + iy$, then we can recover $x$ and $y$ as

    $$
    x = \frac{z + z^\ast}{2}
    \quad
    \text{ and }
    \quad
    y = \frac{z - z^\ast}{2i}
    $$

    in fact, these motivate the definition of $\frac{\partial}{\partial z}$
    and $\frac{\partial}{\partial z^\ast}$. Do you see how?
    
[^4]:
    Personally, I'm still agnostic on this point. I currently view them as
    as useful mnemonic, and not much more. Though as I understand it, they
    become more useful and meaningful when working with several complex 
    variables, so I'm keeping an open mind as to their "true meaning" until
    I learn more.

[^5]:
    Here I'm using $$z^\ast$$ to mean the complex conjugate. I'm TAing a class
    right now and I misinterpreted $\overline{X}$ to mean the _closure_ of
    a set $X$ in the plane, when in fact the professor meant it to 
    mean the _complement_ of $X$. Because of this experience I'm a bit twitchy 
    when it comes to overloading the overline right now,
    and $z^\ast$ is pretty unambiguous.

[1]: https://en.wikipedia.org/wiki/Wirtinger_derivatives
[2]: https://en.wikipedia.org/wiki/Cauchy%E2%80%93Riemann_equations
