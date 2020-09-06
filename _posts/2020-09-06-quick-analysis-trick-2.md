---
layout: post
title: Quick Analysis Trick 2
tags:
  - quick analysis trick
  - fixed point theorems
---

While watching [this](https://www.youtube.com/watch?v=dpBb55MtbPs&list=PLLq_gUfXAnkmC-VWIJ_HW8cdOZLEtHfXJ&index=11)
lecture (in case the link breaks one day: Steffano Luzzatto teaching Dynamical Systems at ICTP, lecture 11),

TODO: finish intro - talk about what exactly we're going to prove.

---

TODO: Say this is a background theorem, which we'll apply in a clever way. 
Allude to what this theorem does: it lets us conclude that 
fixed points vary continuously.

<div class="boxed" markdown=1>
  Let $\Omega$ and $X$ be metric spaces, with $X$ complete. 
  Let $f : \Omega \times X \to X$ be continuous so that each $f(\omega,-)$ 
  is contracting with the same constant $\lambda$. Then the fixed point
  $p_\omega$ of $f(\omega,-)$ (guaranteed by the 
  [contraction mapping theorem](https://en.wikipedia.org/wiki/Banach_fixed-point_theorem))
  varies continuously in $\omega$.
</div>

In the interest of completeness (pun intended), the proof goes as follows
(this is taken straight from the linked video):

For any $x \in X$, we have 
$|x - p_\omega| \leq |x - f_\omega(x)| + |f_\omega(x) - p_\omega|$,
then since $p_\omega = f_\omega(p_\omega)$ we see this is the same as
$|x - p_\omega| \leq |x - f_\omega(x)| + |f_\omega(x) - f_\omega(p_\omega)|$.
Then by the contracting-ness of $f_\omega$, 
$|x - p_\omega| \leq |x - f_\omega(x)| + \lambda|x - p_\omega|$,
which we rearrange to $|x - p_\omega| \leq \frac{|x - f_\omega(x)|}{1-\lambda}$.

Then by specializing to $x = p_{\tilde{\omega}}$, we see
$|p_{\tilde{\omega}} - p_\omega| \leq \frac{|p_{\tilde{\omega}}-f_\omega(p_{\tilde{\omega}})|}{1-\lambda}$.
But as $\tilde{\omega} \to \omega$, the right hand side goes to $0$ 
(by the continuity of $f$) so $|p_{\tilde{\omega}} - p_\omega|$ goes to $0$ too,
showing $\omega \mapsto p_\omega$ is continuous.

Notice that the above proof uses the notation of a Banach Space, but never uses
anything more than $|x-y|$ is a metric. The proof goes through for arbitrary
metric spaces, despite what the notation might lead you to believe.

---

Now for the surprising application! We want to show that if you perturb an
invertible linear transformation, it remains a homeomorphism. The clever idea
that I want to highlight in this post is this: by recognizing a hypothetical
inverse of a point $y$ would have to be a fixed point of some function $f_y$,
then we win as soon as we show $f_y$ is a contraction. Moreover, since these
$f_y$ will depend continuously on $y$, by the above theorem our choice of 
inverse will depend continuously on $y$! This is the first time I've seen a 
fixed point theorem cleverly applied in analysis. Since leveraging fixed 
point theorems is a common (powerful!) idea in algebra and logic, this stands 
out to me as an idea worth remembering.

So here's the actual theorem proven in the lecture:

<div class="boxed" markdown=1>
  Let $E$ be a Banach Space, and let $T : E \to E$ be an 
  invertible linear contraction. Let $e : E \to E$ (for <b>e</b>rror)
  be lipschitz with constant $\lambda \leq ||T^{-1}||^{-1}$. Then 
  $T + e$ is still a homeomorphism.
</div>

The condition on $T$ makes sense. We clearly want to use the contraction 
mapping theorem, so if $T$ is supposed to be the "main term" of this function,
it had better be a contraction. It's not immediately clear why this condition
on $e$ means that it is a "small" perturbation. However, if we unwind the
definition of the [operator norm](https://en.wikipedia.org/wiki/Operator_norm),
this condition says that $e$ has lipschitz constant less than 
$\inf_{||v||=1} ||Tv||$. So if I wiggle $x$ a little, $ex$ is wiggled by 
less than $\inf ||Tv||$, in particular, $ex$ is wiggled by less than $||Tx||$.
So the amount of extra wiggle incurred by $e$ is small compared to the wiggle
that $T$ already has.

Primed by the idea that we'll be exploiting the contraction mapping theorem, 
this proof becomes almost obvious. We want to find a continuous inverse for
$T+e$, but what must such an inverse look like? 

$$
\begin{align*}
(T+e)x = y 
&\iff Tx + ex = y\\
&\iff Tx = y-ex\\
&\iff x = T^{-1}y - T^{-1}ex
\end{align*}
$$

So a hypothetical inverse $x$ must be a fixed point of $f_y(x) = T^{-1}(y-ex)$.
Notice $f_y(x)$ is jointly continuous in $y$ and $x$, since subtraction is. 
So by our previous theorem, it suffices to show each $f_y$ is a contraction,
and that there is a uniform contraction constant. Of course (independtly of $y$)

$$
\begin{align*}
||f_y(x) - f_y(x')|| 
&= ||T^{-1}ex' - T^{-1}ex||\\
&= ||T^{-1}(ex' - ex)||\\
&\leq ||T^{-1}|| ||ex' - ex||\\
&\leq ||T^{-1}|| \lambda ||x' - x||\\
&\leq ||x' - x||
\end{align*}
$$

Here the last inequality came from our (previously mysterious) condition on
the lipschitz constant of $e$. Putting ourselves in the shoes of someone trying
to prove this in their research, it is now clear how that condition arose
in the first place. It is _exactly_ what is needed to make this proof go 
through!
