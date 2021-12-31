---
published: true
---
... after Timothy Gowers'[writeup](https://www.dpmms.cam.ac.uk/~wtg10/tensors3.html)

Let $F$ be a field and $V$ and $W$ be finite dimensional vector spaces over $F$. Any linear map from $V$ to $W$ is determined uniquely by its values on a set that is a basis of $V$, i.e. that which is linearly independent over $F$ and spans $V$. In other words, a given set of vectors in $V$ determines $f$ unambiguously if and only it is a basis of $V$. 

Likewise, any bilinear map from $V \times W$ to a finite dimensional vector space $X$ over $F$ is completely determined by a set of tuples $(v,w)$ where the $v$'s constitute a basis of $V$ and $w$'s constitute a basis of $W$. It is the converse question that leads to the notion of the tensor product, namely given a set of pairs $(v,w)$ we would like to investigate whether they determine $f$ uniquely or not. Taking cue from the linear case, we would like to come up notions of 'linear independence' and 'span' in the bilinear case. An example might clarify further. Let $V = W = F^2$ and $X = F$. Let $e_1, e_2$ be the standard basis of $V$. Then $f(e_1, e_1), f(e_2, e_2), f(e_1 + e_2, e_1 + e_2)$ and $f(e_1 + 2 e_2, e_1 + e_2)$ competely determines $f$, because $f(e_1, e_2)$ and $f(e_2, e_1)$ can be deduced from these values. Indeed, from 

$$
\begin{align}
f(e_1 + e_2, e_1 + e_2) &= f(e_1, e_1) + f(e_1, e_2) + f(e_2, e_1) + f(e_2, e_2) \\
f(e_1 + 2 e_2 , e_1 + e_2) &= f(e_1, e_1) + f(e_1, e_2) + 2 f(e_2, e_1) + 2 f(e_2, e_2)
\end{align}
$$

one obtains $f(e_1, e_2)$ and $f(e_2, e_1)$, which in turn determine $f$ completely. In contrast, the scalars $f(e_1, e_1), f(e_2, e_2), f(e_1 + e_2, e_1 + e_2)$, and $f(e_1 - e_2, e_1 - e_2)$ do \textit{not} determine $f$ unambiguously. In fact, if these values are defined to $0$, it follows that $f(e_1, e_2) = - f(e_2, e_1)$ so that if $f(e_1, e_2)$ is assigned $0$ then $f(e_2, e_1)$ is also $0$ and therefore $f$ is the $0$ map, but if $f(e_1, e_2) = 1$ then $f(e_2, e_1) = -1$ so that $f(ae_1 + be_2, ce_1 + de_2) = a d - b c $. Thus $f$ is not unambiguously determined from 
$f(e_1, e_1), f(e_2, e_2), f(e_1 + e_2, e_1 + e_2)$, and $f(e_1 - e_2, e_1 - e_2)$. 

In general, suppose we know $f(v_1, w_1), f(v_2, w_2), f(v_3, w_3)$ and $f(v_4, w_4)$. If, say, $v_1, v_2 $ and $v_3$ are multiples of a single vector in $V$ then some of the information is redundant, for $w_1, w_2$ and $w_3$ are not linearly dependent in $F^2$ so that if, say, $w_3$ is a linear combination of $w_1$ and $w_2$ then $f(v_3,w_3)$ can be obtained from $f(v_1, w_1)$ and $f(v_2, w_2)$. So assume that no three vectors in the set $\{v_1, v_2, v_3, v_4 \}$ is a scalar multiple of a vector in $V$ and $\{ w_1, w_2, w_3, w_4 \}$ is a scalar multiple of a vector in $W$. Clearly then there can be at most one zero vector in the set $\{v_1, v_2, v_3, v_4\}$, for otherwise if $v_1 = v_2 = 0$ then $v_1 = 0.v_3, v_2 = 0.v_3$ and $v_3 = 1. v_3$, so that the three vectors $v_1, v_2$ and $v_3$ is a scalar multiple of $v_3$, contrary to the hypothesis. Similarly for the set $\{w_1, w_2, w_3, w_4 \}$. So, let with out loss of generality, assume that we relabel the vectors in such way that $v_4$ and $w_4$ are possibly zero vectors and $v_1, v_2, v_3$ and likewise $w_1, w_2, w_3$ are nonzero vectors in $V$ and $W$ respectively. 


It follows easily that we can take two pairs, without loss of generality (s,t) and (u,v), and assume that s and u are linearly independent, and that so are t and v.












