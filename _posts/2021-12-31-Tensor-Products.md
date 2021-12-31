---
published: true
---
Let $F$ be a field and $V$ and $W$ be finite dimensional vector spaces over $F$. Any linear map from $V$ to $W$ is determined uniquely by its values on a set that is a basis of $V$, i.e. that which is linearly independent over $F$ and spans $V$. In other words, a given set of vectors in $V$ determines $f$ unambiguously if and only it is a basis of $V$. 

Likewise, any bilinear map from $V \times W$ to a finite dimensional vector space $X$ over $F$ is completely determined by a set of tuples $(v,w)$ where the $v$'s constitute a basis of $V$ and $w$'s constitute a basis of $W$. It is the converse question that leads to the notion of the tensor product, namely given a set of pairs $(v,w)$ we would like to investigate whether they determine $f$ uniquely or not. Taking cue from the linear case, we would like to come up notions of 'linear independence' and 'span' in the bilinear case. An example might clarify. Let $V = W = F^2$ and $X = F$. Let $e_1, e_2$ be the standard basis of $V$. Then $f(e_1, e_1), f(e_2, e_2), f(e_1 + e_2, e_1 + e_2)$ and $f(e_1 + 2 e_2, e_1 + e_2)$ competely determines $f$, because $f(e_1, e_2)$ and $f(e_2, e_1)$ can be deduced from these values. Indeed,

$$
\begin{align}
f(e_1 + e_2, e_1 + e_2) &= f(e_1, e_1) + f(e_1, e_2) + f(e_2, e_1) + f(e_2, e_2) \\
f(e_1 + 2 e_2 , e_1 + e_2) &= f(e_1, e_1) + f(e_1, e_2) + 2 f(e_2, e_1) + 2 f(e_2, e_2)
\end{align}
$$

In contrast, the scalars $f(e_1, e_1), f(e_2, e_2), f(e_1 + e_2, e_1 + e_2)$, and $f(e_1 - e_2, e_1 - e_2)$ do \textit{not} determine $f$ unambiguously. In fact, if these values are defined to $0$ then one may define $f(ae_1 + b e_2, c e_1 + d e_2)$ to be either $0$ or $ad- bc$.
