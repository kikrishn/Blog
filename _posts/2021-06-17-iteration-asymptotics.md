---
layout: post
title: Iteration Asymptotics
tags:
  - sage
---

I really like recurrences, and the kind of asymptotic
analysis that shows up in combinatorics and computer science. I think I'm drawn
to it because it melds something I enjoy (combinatorics and computer science)
with something I historically struggle with (analysis). 

My usual tool for handling reccurences (particularly for getting asymptotic
information about their solutions) is [generating functions][1]. They slaughter
linear recurrences (which nowadays I just solve with [sage][3]), but through
functional equations, [lagrange inversion][4], and complex analysis, they form
an extremely sophisticated theory[^2]. Plus, I would be lying if I didn't say
I was drawn to them because of how cool they are conceptually. I'm a sucker for
applying one branch of math to another, so the combination of complex analysis
and enumerative combinatorics is irresistable.

Unfortunately, you can't solve all asymptotics problems with generating 
functions, and it's good to have some other tools around as well. Today
we'll be working with the following question:

<div class=boxed markdown=1>
  If $f$ is some function, what are the asymptotics of 

  $$x_{n+1} = f(x_n)$$

  where we allow $x_0$ and $n$ to vary?
</div>

If $f$ is continuous and $x_n \to r$, it's clear that $r$ must be a fixed
point of $f$. If moreover, $f'(r)$ exists, and $|f'(r)| \lt 1$, then anything
which starts out near $r$ will get pulled into $r$. Also, we might as well 
assume $r = 0$, since we can replace $f$ by $f(x+r) - r$ without loss of 
generality. 

These observations tell us we should restrict attention to
those systems where $f(x) = a_1 x + a_2 x^2 + \ldots$ is 
analytic at $0$ with $f(0) = 0$ and $|a_1| \lt 1$. Indeed, we'll focus
on exactly this case for the rest of the post[^4].

As a case study, let's take a simple problem I found on mse the other day.
I can't actually find the question I saw anymore, or else I'd link it. 
It looks like it's been asked [a few times now][6], but none of the options
are recent enough to be the one I saw. Oh well.

<div class=boxed markdown=1>
  Define $x_0 = 2$, $x_{n+1} = \frac{x_n + 3}{3 x_n + 1}$. What is 
  $\lim_{n \to \infty} x_n$?
</div>

The original problem is fairly routine, and we can solve it using 
[cobweb diagrams][8]. The asymptotics are more interesting, though.
It turns out we can read the asymptotics right off of $f$, which is 
super cool! I guess I hadn't seen any examples because people who are in the 
know feel like it's too obvious to talk about, but that makes it the perfect 
topic for a blog post!

Notice $f(x) = \frac{x+3}{3x+1}$ has a fixed point at $1$, so we'll need to
translate it to the origin. We'll replace $f$ by 
$g(x) = f(x+1) - 1 = \frac{-2x}{3x+4}$, remembering to replace $x_0 = 2$
by $y_0 = x_0 - 1 = 1$ as well.

Notice $g(x) = - \frac{1}{2} x + \frac{3}{8}x^2 - O(x^3)$ is analytic at $0$
with $| - \frac{1}{2} | \lt 1$. 

Let's get started!

---

## Simple Asymptotics

<br>

We'll be following de Bruijn's _Asymptotic Methods in Analysis_ in both
this section and the next. In the interest of showcasing how to actually 
_use_ these tools, I'm going to gloss over a lot of details. You can find
everything made precise in chapter $8$.

First, if $x \approx 0$, then $f(x) \approx f'(0) \cdot x$. Since we are 
assuming $|f'(0)| \lt 1$, if $x_n \approx 0$, then 
$x_{n+1} \approx f'(0) x_n \approx 0$ too. An easy induction then shows that

$$
x_n \approx (f'(0))^n x_0.
$$

But now we have our asymptotics! If we formalize all of the $\approx$ signs
above, we find

<div class=boxed markdown=1>
For each $|f'(0)| \lt b \lt 1$, there is a radius $\delta$ so that as long
as $x_0 \in (-\delta, \delta)$ we're guaranteed

$$|x_n| \lt b^n |x_0|$$
</div>

Since $x_n \to 0$, we're guaranteed that eventually our $x_n$s will be inside
however tight a radius we want! Since big-oh notation ignores the first
finitely many terms anyways, this tells us

<div class=boxed markdown=1>
Life Pro Tip:

If $x_n \to r$ (a fixed point of $f$) with $\lvert f'(r) \rvert \lt 1$, then
$x_n \to r$ exponentially quickly. More precisely, for any $\epsilon$ you want[^5]

$$x_n = r \pm O((\lvert a_1 \rvert + \epsilon)^n)$$
</div>

What about our concrete example? We know $f$ has $1$ as a fixed point,
and $f'(1) = - \frac{1}{2}$. Then for $x_0 = 2$, we get 
(by choosing $\epsilon = 0.00001$) that $x_n = 1 \pm O ( 0.50001^n )$.
Which is fast enough convergence for most practical purposes.


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
we also show that $\omega$ is analytic whenever $f$ is!
Then using [lagrange inversion][4], we can find an analytic $\Omega$ so that 
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
give us accuracy up to $\tilde{O}(a_1^{5n})$. There are also some lower order terms
which come from how much of $\omega$ we use, but I'm sweeping under the $\tilde{O}$.

How do we actually do this in practice, though? The answer is "with sage"!

This code will take a function $f$ like we've been discussing, and will
recursively compute the first $N$ coefficients of $\omega$. It turns out
the $j$th coefficient of $\omega$ depends only on the first $j-1$ coefficients plus
equation $(\star)$. Then it will lagrange invert to get the first $N$
terms of $\Omega$, and it will use these to compute an asymptotic expansion
for $x_n$ in terms of $n$ and $x_0$ (which it's writing as $x$).

Since I had to (rather brutally) convert back and forth between symbolic
and ordinary power series, sage wasn't able to keep track of the error
term for us. Thankfully, it's pretty easy to see that the error term is
always $O(a_1^n x_0^N)$, so I just manually wrote it in.

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

  avg_diff = mean([abs(t) for t in tests])
  max_diff = max([abs(t) for t in tests])
  median_diff = median([abs(t) for t in tests])
  show("maximum error: ", max_diff)
  show("mean error:    ", avg_diff)
  show("median error:  ", median_diff)

  show(histogram(tests, bins=50, title="frequency of various signed errors (actual $-$ approximation)"))

show(html("Type in $f$ with fixed point $0$ and $0 < |f'| < 1$"))

@interact
def _(f=input_box(-2*x / (3*x + 4), width=20, label="$f$"), 
      n=input_box(100, width=20, label="$n$"),
      N=input_box(3, width=20, label="$N$")):

  f(x) = f
  a1 = f.series(x,2).coefficient(x,1)() 

  # we have to show things in this weird way to get things on one line
  # it's convenient, though, because it also lets us modify the latex
  # to print the error bounds

  show(html(f"$$f = {latex(f().series(x,N).power_series(QQbar))}$$"))

  show(html(f"$$\\omega = {latex(omega(f,x,N).power_series(QQbar))}$$"))

  series = f"x_n = {latex(iterationAsymptotics(f,N).truncate())}"
  error = f"O \\left ( \\left ( {latex(abs(a1))} \\right )^n x^{N} \\right )"
  show(html("$$" + series + " \\pm " + error + "$$"))

  show("How good is this approximation?")
  stats(f,n,N)
</script>
</div>

<div class=boxed markdown=1>
As a nice exercise, you might try to modify the above code to work with
functions with a fixed point at $r \neq 0$. You can do this either by
taylor expanding at $r$ directly, or by translating $r$ to $0$, then using
this code, then translating back.

Be careful, though! We get much more numerical precision near $0$, so if you
do things near $r$ you might want to work with [arbitrary precision reals][9].
</div>

So, in our last moments together, let's finish up that concrete example in
far more detail than anyone ever wanted. The default function that I put in
the code above is our function translated to $0$. If you look at the first $10$
terms of the sequence (that is, set $N=5$) and work with $x_0 - 1 = 1$ 
(since we translated everything left by $1$) we find

$$
x_n - 1 \approx
\frac{5}{8} \left ( \frac{-1}{2} \right )^{n} +
\frac{3}{8} \left ( \frac{-1}{2} \right )^{2n} -
\frac{1}{8} \left ( \frac{-1}{2} \right )^{3n} +
\frac{1}{8} \left ( \frac{-1}{2} \right )^{4n}
$$

For $n = 10$, say, we would expect 

$$x_n \approx 1.0006107$$

the actual answer is 

$$x_n = 1.0006512$$

which, seeing as $x_0 = 2$ is pretty far away from $1$ (the limit), 
$5$ is a pretty small number of terms to use, 
and $10$ really isn't _that_ many iterations, is good enough for me.

Of course, you should look at the statistics in the output of the code above 
to see how close we get for $n=100$, or any other number you like ^_^.


---

[^2]:
    I know the basics, but there's some real black magic people are 
    able to do by considering what type of singularities your function has. 
    This seems to be outlined in Flajolet and Sedgewick's _Analytic Combinatorics_,
    but every time I've tried to read that book I've gotten quite lost quite 
    quickly. I want to find some other references at some point, ideally at a
    slower pace, but if I never do I'll just have to write up a post about it
    once I finally muster up the energy to really understand that book.

[^3]:
    Which is apparently called [Schröder's equation][7]

[^4]:
    It turns out you can sometimes say things if $|a_1| = 1$. But convergence
    is slow (if you get it at all) and the entire discussion is a bit more 
    delicate. You should see de Bruijn's _Asymptotic Methods in Analysis_
    (chapter $8$) for more details.

[^5]:
    Notice these techniques can't remove the $\epsilon$. For instance, 
    $n C^n = O((C+\epsilon)^n)$ for each $\epsilon$, but is _not_ $O(C^n)$.

[1]: https://en.wikipedia.org/wiki/Generating_function
[2]: https://en.wikipedia.org/wiki/Formal_language
[3]: https://sagemath.org
[4]: https://en.wikipedia.org/wiki/Lagrange_inversion_theorem
[5]: https://en.wikipedia.org/wiki/Regular_language
[6]: https://approach0.xyz/search/?q=%24a_%7Bn%2B1%7D%20%3D%20%5Cfrac%7Ba_n%20%2B%203%7D%7B3a_n%20%2B%201%7D%24&p=1
[7]: https://en.wikipedia.org/wiki/Schr%C3%B6der%27s_equation
[8]: https://en.wikipedia.org/wiki/Cobweb_plot
[9]: https://doc.sagemath.org/html/en/reference/rings_numerical/sage/rings/real_mpfr.html
