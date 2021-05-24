---
layout: post
title: A wild arctan formula
tags:
  - 
---

Yesterday a good friend of mine sent me the following bizarre formula:

$$
4^{1/\pi} = \lim_{n \to \infty} \frac{\pi}{2 \arctan(n)} \frac{\pi}{2 \arctan(n+1)} \frac{\pi}{2 \arctan(n+2)} \cdots \frac{\pi}{2 \arctan(2n)}
$$

This is listed as formula $(130)$ at the bottom of the wolfram mathworld page on 
[formulas for $\pi$](https://mathworld.wolfram.com/PiFormulas.html),
where it is called "A fascinating result due to Gosper".
There are $3$ citations for Gosper on that page, but I can't actually figure
out how to _see_ any of them. That's fine, though. We'll just have to prove 
it ourselves. I ended up heavily using computer tools 
(by which, of course, I mean [sage](https://sagemath.org)) to crack this,
and it almost felt like cheating (since I knew my friend was doing it by hand).
But I hope that, in addition to showing off a cool formula, this blog post
can showcase how one might use sage to solve problems in the wild
(even though I really didn't do anything special for this problem).

---

First let's rewrite this product a little bit more compactly.
We want to show

$$
\lim_{n \to \infty} \prod_{k=n}^{2n} \frac{\pi}{2 \arctan(k)} = 4^{1/\pi}.
$$

I only know one way to handle limits of products, so let's hit everything
in sight with $\log$ and work with a sum instead. We now want to show

$$
\lim_{n \to \infty} \sum_{k = n}^{2n} \log \left ( \frac{\pi}{2 \arctan(k)} \right ) = \log(4^{1 / \pi}) = \frac{\log(4)}{\pi}.
$$

We know that as $k \to \infty$, $\arctan(k) \approx \frac{\pi}{2}$, so the thing
we're logging is getting close to $1$, and so our summands are getting close to $0$.
That's a good sign, but if we want to really compute these things we need to 
understand quantitatively how close to $0$ we really are.

My first instinct is to taylor expand at infinity. That is, let's write

$$f(x) = \log \left ( \frac{\pi}{2 \arctan(1/x)} \right )$$

and expand _this_ at $x = 0$. This corresponds to taylor expanding our
actual summand "near $k = \infty$" since $x = 1/k \approx 0$ when $k \approx \infty$. 
I have a custom function[^2] in my `init.sage` to automatically compute a 
series expansion at $0$, but for some reason it doesn't work with this[^1]:

<img src="/assets/images/wild-arctan-formula/error-message.png">

So we do some googling for $\arctan(1/x)$, and we land on the following 
really fun formula:

$$\arctan(x) + \arctan(1/x) = \pi / 2 \quad \quad (\text{for $x > 0$)}).$$

This is really neat (and has a [nice geometric proof](https://math.stackexchange.com/a/2147689/655547)),
and lets us rewrite our function as

$$
f(x) = \log \left ( \frac{\pi}{2 (\pi /2 - \arctan(x))} \right ).
$$

Sage will happily give us a series expansion of _this_ and we learn

$$
f(x) = \frac{2x}{\pi} + O(x^2),
$$

so our sum becomes

$$
\lim_{n \to \infty} \sum_{k=n}^{2n} f(1/k) = \lim_{n \to \infty} \sum_{k=n}^{2n} \left ( \frac{2}{\pi k} + O(1/k^2) \right ).
$$

But now we're basically done! Our error term vanishes in the limit, since
$\sum_{k=n}^{2n} 1/k^2$ is bounded by the tail of a convergent sequence.
Then we pull out the factor of $2 / \pi$, and we find our sum is

$$
\frac{2}{\pi} \lim_{n \to \infty} \sum_{k=n}^{2n} \frac{1}{k} = \frac{2}{\pi} \lim_{n \to \infty} H_{2n} - H_n
$$

where $H_n$ is the $n$th [harmonic number](https://en.wikipedia.org/wiki/Harmonic_number).

We know that $H_n \sim \log(n)$, and so $H_{2n} - H_n \sim \log(2n) - \log(n) = \log(2)$ in the limit.

This, at last, tells us that our sum is

$$
\frac{2}{\pi} \log(2) = \log(4^{1/\pi})
$$

and so our product is

$$4^{1/\pi}$$

as desired.

---

Notice nothing we did was _hard_. Not only does this show the power of 
calculus (I feel like the more math I learn the more I respect basic calculus),
it also shows the power of sage to quickly and easily do things like taylor
expansions for us. Of course, with some extra time to think about the problem,
I've come up with a way you _could_ see this without needing to taylor expand
anything too tricky[^3], but before you polish the edges of a proof, it's 
nice to have _something_, and sage really makes that "first draft" 
version of a proof easier to find.

---

[^1]:
    While writing this blog post, I tried the taylor series implementation,
    and it actually _did_ work! 

    <img src="/assets/images/wild-arctan-formula/it-works.png">

    This would have made the whole process go a bit more smoothly, but we
    wouldn't have learned the fun formula, so I'm weirdly glad that the 
    power series implemtation has slightly different behavior from the 
    taylor series implementation... Presumably because one is formal, while
    one is analytic?

    It is nice that sage could have directly told us that our summand looks
    like $\frac{2x}{\pi} + O(x^2)$, though, and I guess this means I'll have 
    to modify my series code to call the taylor command if calling series 
    throws an error.

[^2]:
    Which you can find in my [dotfiles](https://github.com/HallaSurvivor/dotfiles/blob/master/init.sage)

[^3]:
    It's pretty clear that near $0$ we should have $\arctan(x) \sim x$.
    You can basically read this off a graph, or you could remember 
    $\frac{d}{dx} \arctan(x) = \frac{1}{1+x^2}$ and evaluate at $0$.

    Next we'll need the fun fact from above, that 
    $\arctan(x) + \arctan(1/x) = \pi/2$ for positive $x$, as well as a 
    famous generating function that in hindsight I actually have memorized:

    $$
    \log \left ( \frac{1}{1-x} \right ) = 0 + \frac{1}{1} x + \frac{1}{2} x^2 + \frac{1}{3} x^3 + \ldots
    $$

    Putting these facts together, we can pretty quickly get

    $$
    \begin{align}
    f(x) 
    &= \log \left ( \frac{\pi}{2 (\pi/2 - \arctan(x))} \right ) \\
    &= \log \left ( \frac{\pi}{\pi - 2 \arctan(x)} \right ) \\
    &= \log \left ( \frac{1}{1 - \frac{2}{\pi} \arctan(x)} \right ) \\
    &\sim \log \left ( \frac{1}{1 - \frac{2}{\pi} x} \right ) \\
    &= \frac{2x}{\pi} \pm O(x^2)
    \end{align}
    $$

    and we could finish off the proof from here. 

    Note, though, that even though
    we avoided sage (or otherwise computing an awful taylor expansion by hand),
    the price we paid was more background knowledge. I happened to know this 
    series, as well as this trick for swapping $\arctan(x)$ with $\arctan(1/x)$,
    but there are lots of places where I definitely would _not_ know the 
    relevant tricks. Obviously it's still good to know lots of these little
    tricks, and computer algebra systems are no excuse for a familiarity with
    the objects you're studying. But it can be really helpful for mindless
    computation all the same.

    Alright, I'll get off my soapbox now :P
