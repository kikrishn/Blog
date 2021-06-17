---
layout: post
title: How Many Group Structures on a Set?
tags:
  - 
---

And so ends my first year of grad school. I'm pretty tired, and my mental
health has taken a turn for the worse, though it's hard to piece together if
the last few weeks were tiring because my mental health was declining, or if
my mental health is in decline because the last few weeks were tiring. Probably
a little bit of both. Anyways, I have some free time again and a backlog of
ideas for blog posts. Speaking of, now that my life update is out of the way, 
let's see a kind of cute computation!

So the other day someone on mse [asked][1]:

<div class=boxed markdown=1>
Given a random binary operation on a finite set $G$, what is the probability 
that it makes $G$ into a group?
</div>

The answer is, of course, vanishingly small. But it's interesting to see 
_how_ vanishingly small. The answer is actually quite memorable!

We can get a lower bound by assuming $|G| = n$ is prime. After all, there is only
one group structure that will work in this case, so this is the lowest possible.
The only thing we can do is rename the elements, so there are $n!$ many group 
operations on $G$.

We can get an upper bound if we assume $|G| = 2^n$. We also have to assume the
(widely believed) conjecture that "most groups are $2$ groups" in order to know
that this is an upper bound. At the very least, it is an upper bound for groups
of size at most $2000$, since [$99\%$ of these groups have order $1024$][2].

The same mse question I just linked provides an asymptotic formula for the 
number of group structures on a set of size $N = 2^n$. Multiplying by $N!$
because we are interested in all group structures, not just groups up to 
isomorphism, we find an upper bound of (very roughly) $N! \ N^{\frac{2}{27} \log(N)^2}$

Putting our upper and lower bounds together, we see

$$
N! \leq 
\text{ \# group structures on a set of size $N$ } \leq 
N! \ N^{\frac{2}{27} \log(N)^2}
$$

But by approximating $N! \approx \left ( \frac{N}{e} \right )^N$, we get

$$
e^{-N} N^N \leq
\text{ \# group structures on a set of size $N$ } \leq 
e^{-N} N^{N + \frac{2}{27} \log(N)^2}
$$

logging everything in sight shows the number of group structures is 
$\Theta(N \log(N))$. We can write this as the (rather memorable)

$$
\text{\# group structures on a set of size $N$} = N^{\Theta(N)}
$$

and to finally answer the problem, there are $N^{N^2}$ many distinct binary
operations on a set of size $N$. So the probability that a random one is a 
group operation decays like $N^{- \Theta(N^2)}$, which is vanishingly small,
as promised.


[1]: https://math.stackexchange.com/q/4166508/655547
[2]: https://math.stackexchange.com/q/241369/655547
