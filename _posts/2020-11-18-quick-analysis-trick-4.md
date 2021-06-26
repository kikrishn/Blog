---
layout: post
title: Quantitative Cesaro Sums
tags:
  - quick-analysis-tricks
---

To the surprise of no one, I was on math stackexchange earlier and saw an 
interesting analysis question. I have a weird fascination with tricky limit
questions because I feel like I've always been bad at them. I like working
on them for the same reason I like practicing the difficult parts of 
pieces of music -- it makes me feel like I'm improving 
(in a "no pain no gain" kind of way).

Anyways, [the question][1] was as follows (paraphrased):

<div class=boxed markdown=1>
  Compute the following limit

  $$\lim_{n \to \infty} (1 + \sqrt{2} + \sqrt[3]{3} + \ldots + \sqrt[n]{n}) \ln \left ( \frac{2n+1}{2n} \right )$$
</div>

The beginning of the solution makes sense: We want to approximate the $\ln$, so we rewrite it as 
$\ln \left ( 1 + \frac{1}{2n} \right )$ and approximate that[^1] as $\frac{1}{2n} - O(\frac{1}{n^2})$.

[^1]:
    A notational quirk I picked up from [Ryan O'Donnell][2] that my brain likes: I will only ever
    write $O(f)$ when $f$ is a positive function. So I meaningfully distinguish between 
    $\text{blah} + O \left ( \frac{1}{n} \right )$ and $\text{blah} - O \left ( \frac{1}{n} \right )$.

    This is a pretty minor thing, but it's led to notably more comfort on my part, since my brain tends to
    implicitly make positivity assumptions when I'm not looking. Explicitly writing down when things can
    be negative forces my brain to pay extra attention to it.

Then (rewriting as a summation as well) we get

$$\lim_{n \to \infty} \left ( \sum_{k \leq n} k^\frac{1}{k} \right ) \left ( \frac{1}{2n} - O \left ( \frac{1}{n^2} \right )\right )$$

Now here's the clever idea: We use [Cesàro Averages][3] backwards! This is mentioned in a comment on the original mse question, and
it's a trick I'll absolutely have to remember!

To explain what I mean, let's take a quick detour into the world of Cesàro Averages:

---

<div class=boxed markdown=1>
  If $(x_n)$ is a sequence, then the <span class="defn">Cesàro Average</span> $a_k$ is the average of the
  first $k$ terms:

  $$a_k = \displaystyle \frac{1}{k} \displaystyle \sum_{j \leq k} x_j$$
</div>

People care about the Cesàro averages because it's possible for the Cesàro averages to converge even if the original series doesn't.
Moreover, the notion of "averaging" in this way comes up very naturally in Fourier Analysis (see [here][4]) and
Ergodic Theory (see [here][5]).

The fundamental theorem in this area is this:

<div class=boxed markdown=1>
  Whenever $x_n$ is already convergent, the sequence of Cesàro averages converges to the same limit.
</div>

So the notion of Cesàro convergence is a true generalization of the original notion of convergence.
It allows us to evaluate certain limits that used to be divergent, but it doesn't mess up any
limits that already converged.

---

And now we get to the application here:

We recognize $\frac{1}{n} \sum_{k \leq n} k^\frac{1}{k}$ as a Cesàro average of the sequence $k^\frac{1}{k}$.
Since we know $k^\frac{1}{k} \to 1$, we conclude the same is true of the Cesàro averages. So

$$
\begin{align*}
\lim_{n \to \infty} \left ( \sum_{k \leq n} k^\frac{1}{k} \right ) \left ( \frac{1}{2n} - O \left ( \frac{1}{n^2} \right )\right )
&= \lim_{n \to \infty} \frac{\sum_{k \leq n} k^\frac{1}{k}}{n} \left ( \frac{1}{2} - O \left ( \frac{1}{n} \right ) \right ) \\
&= \lim_{n \to \infty} 1 \left ( \frac{1}{2} - O \left ( \frac{1}{n} \right ) \right )\\
&\to \frac{1}{2}
\end{align*}
$$

---

So we did properly figure out what the limit should be... But I did a little bit of sleight of hand in the
above manipulation. Did you catch it?

As people interested in computer science, we have to be slightly pickier than a lot of mathematicians when
it comes to computing limits. It's often important exactly how quickly we get convergence[^2], and so
we kept track of the big-Oh for the whole problem.

[^2]:
    In fact, since I have Ryan O'Donnell on the brain, I audited his Theorist's Toolkit class during
    my year off. In one of the lectures, he asserted the [Central Limit Theorem][6] was the most 
    useless theorem in mathematics. Of course, he was being intentionally inflammatory. He prefaced
    that statement with some history -- the Central Limit Theorem got its name not (as I originally thought)
    because summing random variables "tends to lie at the center" of a gaussian. It's because Pólya thought
    it was the most important result in probability. It was _central_ to the field.

    Ryan went on to tell us about the [Berry-Esseen Theorem][7], which gives good error bounds on the 
    convergence guaranteed by the Central Limit Theorem.

But above we just substituted $n^\frac{1}{n} \to 1$. If we're careful, it's not too hard to get
error bounds for the convergence of this series... But who's to say what the error bounds will
be for the Cesàro averages? These averages keep track of terms earlier in the series. It's reasonable
to worry that the convergence might be slower, and this worry turns out to be legitimate:

Say $x_n = L \pm O(e(n))$. That is, $x_n$ converges to a limit $L$, and we can bound the _error_ by
$O(e)$. Then

$$
\begin{align*}
  \frac{ \sum_{k \leq n} x_k }{n} 
  &= \frac{ \sum_{k \leq n} L \pm O(e(k)) }{n} \\ 
  &= \frac{ nL \pm O \left ( \sum_{k \leq n} e(k) \right ) }{n} \\
  &= L \pm O \left ( \frac{1}{n} \sum_{k \leq n} e(k) \right )
\end{align*}
$$

So the error in the Cesàro averages is the average of the errors. 
Let's see how this comes up in our analysis of this particular problem.

---

First, we need to know the error bounds on $n^\frac{1}{n}$. This isn't too hard to figure out:

$$n^\frac{1}{n} = e^{\frac{1}{n}\ln(n)} = 1 + O \left ( \frac{\ln(n)}{n} \right )$$

Now we can find the error of the Cesàro averages:

$$
\frac{1}{n} \sum_{k \leq n} k^\frac{1}{k} 
= 
\frac{1}{n} \sum_{k \leq n} \left ( 1 + O \left ( \frac{\ln(n)}{n} \right ) \right )
=
1 + O \left ( \frac{1}{n} \sum_{k \leq n} \frac{\ln(k)}{k} \right )
$$

While this is technically _true_, I would argue it isn't _useful_ yet. We can clean it up.

The important observation is that, for $k \geq 4$, $\frac{\ln(k)}{k}$ is monotone decreasing.
Then we do the old "approximate by the nearest power of $2$" trick that we use to prove the
harmonic series diverges[^3]:

[^3]:
    As a quick exercise, why do we get an upper bound here? 
    We prove the harmonic series diverges by _lower_ bounding it...

$$
\begin{align*}
&\quad \frac{\ln(4)}{4} + \frac{\ln(5)}{5} + \frac{\ln(6)}{6} + \frac{\ln(7)}{7} + \frac{\ln(8)}{8} + \frac{\ln(9)}{9} + \ldots + \frac{\ln(15)}{15} + \frac{\ln(16)}{16} + \ldots \\
&\leq \frac{\ln(4)}{4} + \frac{\ln(4)}{4} + \frac{\ln(4)}{4} + \frac{\ln(4)}{4} + \frac{\ln(8)}{8} + \frac{\ln(8)}{8} + \ldots + \frac{\ln(8)}{8} + \frac{\ln(16)}{16} + \ldots \\
&= \ln(4) + \ln(8) + \ln(16) + \ldots
\end{align*}
$$

Notice we can safely assume $n$ is a power of $2$ by adding some extra terms. 
Since we're trying to upper bound the error anyways, this is no issue. Also,
since we're not interested in additive constants, we can go aheaed and approximate
$\frac{\ln(3)}{3}$ by $\frac{\ln(2)}{2}$ to make the sum more uniform.

$$
\begin{align*}
O \left ( \frac{1}{n} \sum_{k \leq n} \frac{\ln(k)}{k} \right )
&= O \left ( \frac{1}{n} \left ( \frac{\ln(2)}{2} + \frac{\ln(3)}{3} + \ln(4) + \ln(8) + \ldots + \ln(n) \right ) \right ) \\
&= O \left ( \frac{1}{n} \sum_{i \leq \log_2 n} \ln(2^i) \right ) \\
&= O \left ( \frac{1}{n} \sum_{i \leq \log_2 n} i \ln(2) \right ) \\
&= O \left ( \frac{1}{n} \sum_{i \leq \log_2 n} i \right ) \\
&= O \left ( \frac{ (\log n)^2 }{n} \right )
\end{align*}
$$

Importantly, this error bound is _different_ from the error bound of our original series! 
As expected, this converges slightly slower (by a log factor) because it's being
weighed down by earlier terms in the series.

Why go through this pain, though? Because now we can finally put a nice bow on things: 
How quickly does the limit converge?

<!-- 
  Note: We have the \pm here because I've glossed over the fact 
  that we need to multiply out (1 + O((log n)^2/n))(1/2 - O(1/n))
-->

$$
\left ( 1 + \sqrt{2} + \sqrt[3]{3} + \ldots + \sqrt[n]{n} \right ) \ln \left ( \frac{2n+1}{2n} \right ) 
= \frac{1}{2} \left ( 1 \pm O \left ( \frac{( \log n )^2}{n} \right ) \right )
$$

---

[1]: https://math.stackexchange.com/questions/3910478/limit-of-lim-n-to-infty-1-sqrt2-sqrt33-sqrtnn-l
[2]: http://www.cs.cmu.edu/~odonnell/
[3]: https://en.wikipedia.org/wiki/Ces%C3%A0ro_summation
[4]: https://en.wikipedia.org/wiki/Fej%C3%A9r%27s_theorem
[5]: https://en.wikipedia.org/wiki/Ergodic_theory#Ergodic_theorems
[6]: https://en.wikipedia.org/wiki/Central_limit_theorem
[7]: https://en.wikipedia.org/wiki/Berry%E2%80%93Esseen_theorem
