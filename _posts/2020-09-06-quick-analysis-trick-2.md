---
layout: post
title: Quick Analysis Trick 2
tags:
  - quick analysis trick
  - fixed point theorems
---

While watching [this](https://www.youtube.com/watch?v=dpBb55MtbPs&list=PLLq_gUfXAnkmC-VWIJ_HW8cdOZLEtHfXJ&index=11)
lecture (in case the link breaks one day: Steffano Luzzatto teaching Dynamical Systems at ICTP, lecture 11),
I saw my first clever use of fixed-point theorems in analysis. In particular,
we used a leveled-up version of the 
[contraction mapping theorem](https://en.wikipedia.org/wiki/Banach_fixed-point_theorem)
to show that a certain map was actually a homeomorphism. The main takeaway
is that by rearranging what you _want_ to be true into a statement that
some object is a fixed point, we can show that our dreams can be realized.
This mode of argument is extremely common in algebra and logic, so it's
like a friendly face in the often stressful world of analysis.

---

We start with the leveled-up contraction mapping theorem. This theorem 
lets us take a _family_ of contractions (parametrized by some metric space)
and conclude that the fixed points vary continuously in the parameter.

<div class="boxed" markdown=1>
  Let $\Omega$ and $X$ be metric spaces, with $X$ complete. 
  Let $f : \Omega \times X \to X$ be continuous so that each $f(\omega,-)$ 
  is contracting with the same constant $\lambda$. Then the fixed point
  $p_\omega$ of $f(\omega,-)$ varies continuously in $\omega$.
</div>

In the interest of completeness (pun intended), the proof goes as follows
(this is basically taken straight from the linked video):

We will write $f_\omega(x)$ for $f(\omega,x)$. For any $x \in X$, we have 
$|x - p_\omega| \leq |x - f_\omega(x)| + |f_\omega(x) - p_\omega|$.
Then since $p_\omega = f_\omega(p_\omega)$, we see this is the same as
$|x - p_\omega| \leq |x - f_\omega(x)| + |f_\omega(x) - f_\omega(p_\omega)|$.
Lastly, since $f_\omega$ is a contraction, 
$|x - p_\omega| \leq |x - f_\omega(x)| + \lambda|x - p_\omega|$,
which we rearrange to $|x - p_\omega| \leq \frac{|x - f_\omega(x)|}{1-\lambda}$.

Then by specializing to $x = p_{\eta}$, we see
$|p_{\eta} - p_\omega| \leq \frac{|p_{\eta}-f_\omega(p_{\eta})|}{1-\lambda}$.
But as $\eta \to \omega$, the right hand side goes to $0$ 
(by the continuity of $f$). So $|p_{\eta} - p_\omega|$ goes to $0$ too,
showing $\omega \mapsto p_\omega$ is continuous.

Notice that the above proof uses the notation of a Banach Space, but never uses
anything more than the metric-ness of $|x-y|$. This is a proof for arbitrary
metric spaces, despite what the notation might lead you to believe.

---

Now for the surprising application! We want to show that if you perturb an
invertible linear transformation, it remains a homeomorphism. Again, the clever 
idea that I want to highlight in this post is this: by recognizing a hypothetical
inverse of a point $y$ would have to be a fixed point of some function $f_y$,
then we win as soon as we show $f_y$ is a contraction. Moreover, since these
$f_y$ will depend continuously on $y$, the previous theorem tells us that 
our inverse will depend continuously on $y$! 

So here's the actual theorem proven in the lecture:

<div class="boxed" markdown=1>
  Let $E$ be a Banach Space, and let $T : E \to E$ be an 
  invertible linear contraction. Let $e : E \to E$ 
  be lipschitz with constant $\lambda < ||T^{-1}||^{-1}$. Then 
  $T + e$ is still a homeomorphism.
</div>

The condition on $T$ makes sense. We clearly want to use the contraction 
mapping theorem, so if $T$ is supposed to be the "main term" of this function,
it had better be a contraction. It's not immediately clear why this condition
on $e$ means that it is a "small" perturbation. However, if we unwind the
definition of the [operator norm](https://en.wikipedia.org/wiki/Operator_norm),
this condition says that $e$ has lipschitz constant less than 
$\inf_{||v||=1} ||Tv||$. So if I wiggle $x$ a little, $ex$ is wiggled by 
less than $\inf ||Tv||$. In particular, $ex$ is wiggled by less than $||Tx||$.
So the amount of extra wiggle incurred by $e$ is small compared to the wiggle
that $T$ already has.

Primed by the idea that we'll be exploiting the contraction mapping theorem, 
the proof becomes almost obvious. We want to find a continuous inverse for
$T+e$, but what must such an inverse look like? 

$$
\begin{align*}
(T+e)x = y 
&\iff Tx + ex = y\\
&\iff Tx = y-ex\\
&\iff x = T^{-1}y - T^{-1}ex
\end{align*}
$$

So a hypothetical inverse $x$ must be a fixed point of $f_y(x) = T^{-1}y - T^{-1}ex$.
Notice $f_y(x)$ is jointly continuous in $y$ and $x$, since subtraction is. 
So by our previous theorem, it suffices to show each $f_y$ is a contraction,
and that there is a uniform contraction constant. Of course (independtly of $y$)

$$
\begin{align*}
||f_y(x) - f_y(x')|| 
&= ||T^{-1}ex' - T^{-1}ex||\\
&= ||T^{-1}(ex' - ex)||\\
&\leq ||T^{-1}|| \; ||ex' - ex||\\
&\leq ||T^{-1}|| \; \lambda \; ||x' - x||\\
&\leq ||x' - x||
\end{align*}
$$

Here the last inequality came from our (previously mysterious) condition on
the lipschitz constant of $e$. Putting ourselves in the shoes of someone trying
to prove this in their research, it is now clear how that condition arose
in the first place. We might try to work through this proof, and in the last
step realize that we need this condition on $e$. Then we add it as a hypothesis,
and pretend we knew in advance that this was the right condition. Aren't we smart?
