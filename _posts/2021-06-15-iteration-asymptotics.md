---
layout: post
title: Iteration Asymptotics
tags:
  - sage
---

And so ends my first year of grad school. I'm pretty tired, and my mental
health has taken a turn for the worse, though it's hard to piece together if
the last few weeks were tiring because my mental health was declining, or if
my mental health is in decline because the last few weeks were tiring. Probably
a little bit of both. Anyways, I have some free time again and a backlog of
ideas for blog posts. I also have a paper to revise, but hopefully I'm able to
put up some more of my ramblings here. I really enjoy it, and maybe someday 
it will be interesting for someone.

What is today about, then? I really like recurrences, and the kind of asymptotic
analysis that shows up in combinatorics and computer science. I think I'm drawn
to it because it melds something I enjoy (combinatorics and computer science)
with something I historically struggle with (analysis). 

Lots of recurrences can be solved with [generating functions][1], 
from basic tools for linear recurrences[^1] (which nowadays I just solve with [sage][3])
to quite sophisticated tools involving functional equations, 
[lagrange inversion][4], etc. Plus, even if your sequence doesn't admit a nice
closed form, you can often get a good handle on the asymptotics by doing
complex analysis to the generating function[^2].

Because of their flexibility (and also because 
they're very cool conceptually), generating functions are my goto approach
for solving a lot of recurrence and enumeration problems. Unfortunately,
it seems like they're less amenable to solving another kind of recurrence,
which is going to be the topic of today's post.

Let's take a simple problem I found on mse the other day. I can't actually find
the original question I saw, but it looks like it's been asked [a few times now][6]:

<div class=boxed markdown=1>
  Define $x_0 = 2$, $x_{n+1} = \frac{x_n + 3}{3 x_n + 1}$. What is 
  $\lim_{n \to \infty} x_n$?

  Of course, we care about more than just the limit. What are the asymptotics like?
</div>

I've seen these sorts of problems a handful of times, but only now am I really
feeling like I understand how to actually tackle them. I haven't found many
worked out examples of a problem like this, so here we are ^_^.

As a helpful way of reframing the question, we start by considering
$f(x) = \frac{x + 3}{3x + 1}$. Then $x_{n+1} = f(x_n)$, and understanding
$f$ will be a good first step towards understanding this recurrence. This is
actually enough to solve the problem, since if the limit exists, then by 
taking limits of both sides we find $x_\infty = f(x_\infty)$, and our limit
is a fixed point of $f$. Solving this equation immediately gives us $x_\infty = 1$,
and it's not hard to see that starting at $x_0 = 2$ we really do limit to $1$.
Can we say anything about _how quickly_ $x_n \to 1$, though? 

More generally, we're going to be ineterested in studying the asymptotics of 
recurrences of the form $x_{n+1} = f(x_n)$ for our favorite function $f$. 
We're going to be implementing the approach described in chapter $8$ of 
de Bruijn's _Asymptotic Methods in Analysis_, and de Bruijn makes some 
simplifying assumptions. Namely:

1. The fixed point of $f$ should be $0$
2. $f$ should be analytic at $0$, given by $f(x) = 0 + a_1 x + a_2 x^2 + \ldots$
3. $ \lvert a_1 \rvert \lt 1$

The first assumption is without loss of generality, since we can always replace
$f(x)$ with fixed point $c$ by $f(x+c) - c$ to move the fixed point to $0$.

The second assumption is mainly helpful in obtaining an asymptotic expansion
for $x_n$. In the "Simple Asymptotics" section, you'll see we only need 
$C^1$-ness of $f$. We use analyticity in order to get progressively more
powerful asymptotic approximations in the "Asymptotic Expansion" section.

The third assumption tells us that $f$ is contracting near $0$, which is 
necessary if we want to get any kind of convergence at all. In his book,
de Bruijn treats the $|a_1| = 1$ case as well, but it's more delicate and we
won't go into it here.

Let's get started!

---

## Simple Asymptotics

<br>

For us, then, we'll replace our function
$f(x) = \frac{x + 3}{3x + 1}$ by $g(x) = f(x+1) - 1 = \frac{-2x}{3x+4}$.
Next, we taylor expand (or more likely, have sage taylor expand for us)
and we find $g(x) = \frac{-1}{2} x + \frac{3}{8}x^2 - O(x^3)$. Notice 
$|a_1| = \left | \frac{-1}{2} \right | \lt 1$, so we're happy.

To start, choose $b$ so that $|a_1| \lt b \lt 1$. For concreteness, 
let's work with $b = \frac{3}{4}$, though $b = \frac{1}{2} + \epsilon$ 
will work for any small $\epsilon$.

Now since $x^{-1} g = a_1 + a_2 x + \ldots$, for $ \lvert x \rvert \ll 1$ we must have
$|x^{-1} g(x)| \lt b$. That is, $|x_1| = |g(x_0)| \lt b |x_0|$. An easy induction 
shows $|x_n| \lt b^n |x_0|$, and so we've solved the basics of our problem!

Let's return to our concrete example. We had $y_0 = 2$ before we translated
$f$ to move the fixed point from $1$ to $0$, so with respect to this _new_
function we should have $x_0 = y_0 - 1 = 1$. Then 

$$
|x_n| \lt |x_0| \left ( \frac{3}{4} \right )^n = \left ( \frac{3}{4} \right )^n
$$

and translating this back _away_ from the origin now, we get the answer to our
original problem:

$$
|y_n - 1| \lt \left ( \frac{3}{4}  \right )^n.
$$

Equivalently,

$$y_n = 1 \pm O \left ( \left ( \frac{3}{4} \right )^n \right )$$

where actually we can take any $\frac{1}{2} + \epsilon$ instead of $\frac{3}{4}$.

Morally, what have we learned from this? 

<div class=boxed markdown=1>
Life Pro Tip:

Let $f$ have a fixed point $r$ with $0 \lt \lvert f'(r) \rvert \lt 1$. 
Consider the recurrence $x_{n+1} = f(x_n)$, and pick $x_0 \approx r$.
Then $x_n \to r$ with exponential decay governed by $f'(r)$:

$$x_n \approx r \pm O_{x_0} \left ( (f'(r))^n \right )$$
</div>

---

## Asymptotic Expansion

<br>

But what if you're a real masochist, and the exponential convergence above
isn't enough for you? Well don't worry, becaue de Bruijn has more to say.

If $x_0$ is fixed, then $x_n a_1^{-n}$ converges to a limit, which we'll call
$\omega(x_0)$. But since $x_{n+1} = f(x_n)$, we get an important restriction
on $\omega$ by considering $x_1$ as the start of its own iteration[^3]:

$$
\omega(f(x)) = a_1 \omega(x) \quad \quad \quad \quad (\star)
$$

In the proof that $\omega$ exists (which you can find in de Bruijn's book),
it is clear that it is actually analytic whenever $f$ is. Then using
[lagrange inversion][4], we can find an analytic $\Omega$ so that 
$\Omega(\omega(x)) = x$.

But now we can get a great approximation for $x_n$! By repeatedly applying
$(\star)$ we find

$$
\omega(x_n) = a_1^n \omega(x_0)
$$

which we can then invert to find

$$
x_n = \Omega(a_1^n \omega(x_0)).
$$

If we use the first, say, $5$ terms of the expansion of $\Omega$, this will
give us accuracy up to $\tilde{O}(a_1^{5n})$. There are some lower order terms
which come from how much of $\omega$ we use, which I'm sweeping under the $\tilde{O}$.

How do we actually do this in practice, though? The answer is "with sage"!

<div class="linked_auto">
<script type="text/x-sage">
"""
This is super sloppy because sage actually has two 
different kinds of power series:
  - symbolic power series
  - "ordinary" power series

the ordinary power series are better in almost every way, except they 
don't allow variables inside them! Since we need variables to build the
recurrence that we solve for the next coefficient, this is a problem.

The only way I was able to get this working is by hacking back and
forth between the two types of power series. If anyone has a better way
to do this PLEASE let me know.
"""

def omega(f, x, N):
  """
  Compute the first N terms of omega(x)
  """

  # this is a symbolic power series
  f = f.series(x,N)
  a1 = f.coefficient(x,1)

  # initialize omega (as a symbolic power series)
  o = (0 + x).series(x,N)

  d = var('d')
  for j in range(2,N+1):

    # set up the linear recurrence that defines the jth coefficient.
    # if you didn't believe symbolic series are more cumbersome than 
    # "ordinary" series, hopefully you do now.
    #
    # this comes from looking at the jth coefficient of the equation
    # omega(f(x)) == a1 * omega(x)

    eqn = (o + d * x^j).subs(x=f).series(x,N).coefficient(x,j) == a1 * d
    o = (o + solve(eqn, d)[0].rhs() * x^j).series(x,N)

  # this is a symbolic power series
  return o

def iterationAsymptotics(f,N=5):
  """
  Compute the first N many terms of an asymptotic expansion for x_n
  """
  n = var('n')

  # for some reason extracting the coefficient gives us a constant function
  # and it only breaks things here? Oh well, we'll evaluate it to make
  # sage happy.
  a1 = f.series(x,2).coefficient(x,1)() 

  # we convert o to an ordinary power series, since there's no way
  # to do lagrange inversion to a symbolic power series
  o = omega(f,x,N).power_series(QQbar)

  O = o.reverse() # lagrange inversion

  # dirty hack to convert back to a symbolic series
  return O.truncate().subs(x=(a1^n * o.truncate())).expand().series(x,N)


def stats(f,n=10,N=5):
  """
  Run 1000 tests to see how well the asymptotic expansion
  agrees with the expected output.
  """

  approx = iterationAsymptotics(f,N).truncate().subs(n=n)

  tests = []
  for _ in range(1000):
    x0 = random()

    # compute the exact value of xn
    cur = x0
    for _ in range(n):
      cur = f(cur)

    # compute the approximate value of xn
    guess = approx.subs(x=x0)

    tests += [cur - guess]

  avg_diff = sum([abs(t) for t in tests]) / 1000
  max_diff = max([abs(t) for t in tests])
  show("maximum error: ", max_diff)
  show("average error: ", avg_diff)

  show(histogram(tests, bins=50, title="frequency of various signed errors (actual $-$ approximation)"))

show("Type in $f$ with fixed point $0$ and $0 < |f'| < 1")

@interact
def _(f=input_box(-2*x / (3*x + 4), width=20, label="$f$"), 
      n=input_box(100, width=20, label="$n$"),
      N=input_box(3, width=20, label="$N$")):

  f(x) = f
  a1 = f.series(x,2).coefficient(x,1)() 

  # we have to show things in this weird way to get things on one line
  # it's convenient, though, because it also lets us modify the latex
  # to print the error bounds

  show(f"$$f = {latex(f().series(x,N).power_series(QQbar))}")

  show(f"$$\\omega = {latex(omega(f,x,N).power_series(QQbar))}$$")

  series = f"x_n = {latex(iterationAsymptotics(f,N).truncate())}"
  error = f"O \\left ( \\left ( {latex(abs(a1))} \\right )^n x^{N} \\right )"
  show("$$" + series + " \\pm " + error + "$$")

  show("How good is this approximation?")
  stats(f,n,N)
</script>
</div>


---

[^1]:
    There's actually a really cool connection with [formal languages][2] here
    as well. My undergrad research was in automata theory, and I've always loved
    formal languages, so I'm definitely planning to talk about this in the 
    near future. As a teaser, the fact that some people call 
    [regular languages][5] "rational" is not a coincidence! There's actually
    no sage package for working with regular languages and rational series,
    and I'm considering writing a package to do some of the basics. Obviously
    if this happens, I'll talk all about it in another post!

[^2]:
    I know the basics of this, but there's some real black magic people are 
    able to do by considering what type of singularities your function has. 
    This seems to be outlined in Flajolet and Sedgewick's _Analytic Combinatorics_,
    but every time I've tried to read that book I've gotten quite lost quite 
    quickly. I want to find some other references at some point, ideally at a
    slower pace, but if I never do I'll just have to write up a post about it
    once I finally muster up the energy to really understand that book.

[^3]:
    Which is apparently called [Schröder's equation][7]


[1]: https://en.wikipedia.org/wiki/Generating_function
[2]: https://en.wikipedia.org/wiki/Formal_language
[3]: https://sagemath.org
[4]: https://en.wikipedia.org/wiki/Lagrange_inversion_theorem
[5]: https://en.wikipedia.org/wiki/Regular_language
[6]: https://approach0.xyz/search/?q=%24a_%7Bn%2B1%7D%20%3D%20%5Cfrac%7Ba_n%20%2B%203%7D%7B3a_n%20%2B%201%7D%24&p=1
[7]: https://en.wikipedia.org/wiki/Schr%C3%B6der%27s_equation
