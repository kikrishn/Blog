---
published: true
---
... after Timothy Gowers'  [article](https://www.dpmms.cam.ac.uk/~wtg10/tensors3.html)

Let $F$ be a field and $V$ and $W$ be finite dimensional vector spaces over $F$. Any linear map from $V$ to $W$ is determined uniquely by its values on a set that is a basis of $V$, i.e. that which is linearly independent over $F$ and spans $V$. In other words, a given set of vectors in $V$ determines $f$ unambiguously if and only it is a basis of $V$. 

Likewise, any bilinear map from $V \times W$ to a finite dimensional vector space $X$ over $F$ is completely determined by a set of tuples $(v,w)$ where the $v$'s constitute a basis of $V$ and $w$'s constitute a basis of $W$. It is the converse question that leads to the notion of the tensor product, namely given a set of pairs $(v,w)$ we would like to investigate whether they determine $f$ uniquely or not. Taking cue from the linear case, we would like to come up notions of 'linear independence' and 'span' in the bilinear case. An example may clarify further:

**Example:** Let $V = W = F^2$ and $X = F$. Let $e_1, e_2$ be the standard basis of $V$. Then $f(e_1, e_1), f(e_2, e_2), f(e_1 + e_2, e_1 + e_2)$ and $f(e_1 + 2 e_2, e_1 + e_2)$ competely determines $f$, because $f(e_1, e_2)$ and $f(e_2, e_1)$ can be deduced from these values. Indeed, from 

$$
\begin{align}
f(e_1 + e_2, e_1 + e_2) &= f(e_1, e_1) + f(e_1, e_2) + f(e_2, e_1) + f(e_2, e_2) \\
f(e_1 + 2 e_2 , e_1 + e_2) &= f(e_1, e_1) + f(e_1, e_2) + 2 f(e_2, e_1) + 2 f(e_2, e_2)
\end{align}
$$

one obtains $f(e_1, e_2)$ and $f(e_2, e_1)$, which in turn determine $f$ completely. In contrast, the scalars $f(e_1, e_1), f(e_2, e_2), f(e_1 + e_2, e_1 + e_2)$, and $f(e_1 - e_2, e_1 - e_2)$ do \textit{not} determine $f$ unambiguously. In fact, if these values are defined to $0$, it follows that $f(e_1, e_2) = - f(e_2, e_1)$ so that if $f(e_1, e_2)$ is assigned $0$ then $f(e_2, e_1)$ is also $0$ and therefore $f$ is the $0$ map, but if $f(e_1, e_2) = 1$ then $f(e_2, e_1) = -1$ so that $f(ae_1 + be_2, ce_1 + de_2) = a d - b c $. Thus $f$ is not unambiguously determined from 
$f(e_1, e_1), f(e_2, e_2), f(e_1 + e_2, e_1 + e_2)$, and $f(e_1 - e_2, e_1 - e_2)$. 

In general, consider a bilinear form $f: V \times W \to X$, where $X$ is any vector space over $F$. Suppose we know $f(v_1, w_1), f(v_2, w_2), f(v_3, w_3)$ and $f(v_4, w_4)$. If, say, $v_1, v_2 $ and $v_3$ are multiples of a single vector in $V$ then some of the information is redundant, for $w_1, w_2$ and $w_3$ are not linearly dependent in $F^2$ so that if, say, $w_3$ is a linear combination of $w_1$ and $w_2$ then $f(v_3,w_3)$ can be obtained from $f(v_1, w_1)$ and $f(v_2, w_2)$. So assume that no three vectors in the set $\{v_1, v_2, v_3, v_4 \}$ is a scalar multiple of a vector in $V$ and $\{ w_1, w_2, w_3, w_4 \}$ is a scalar multiple of a vector in $W$. Clearly then there can be at most one zero vector in the set $\{v_1, v_2, v_3, v_4\}$, for otherwise if $v_1 = v_2 = 0$ then $v_1 = 0.v_3, v_2 = 0.v_3$ and $v_3 = 1. v_3$, so that the three vectors $v_1, v_2$ and $v_3$ is a scalar multiple of $v_3$, contrary to the hypothesis. Similarly for the set $\{w_1, w_2, w_3, w_4 \}$. So, in the degenerate case when at least one of $v_i$ is zero and at least one of $w_i$ is zero,  we may, with out loss of generality, relabel the vectors in such way that the $v_1, v_2, w_1$ and $w_2$ in the pairs $(v_1, w_1)$ and $(v_2, w_2)$ are all nonzero. If $v_1$ and $v_2$ is a multiple of a vector in $V$, in other words, if $v_2$ is a multiple of $v_1$ then together with the zero vector they violate the hypothesis, since $0 = 0 \cdot v_1$. Thus $v_1, v_2$, and likewise $w_1, w_2$ must be linearly independent. Let 

$$
\begin{align} 
v_3 &= a v_1 + b v_2, v_4 = c v_1 + d v_2 \\
w_3 &= \alpha w_1 + \beta w_2, w_4 = \gamma w_1 + \delta w_4
\end{align}
$$

Then 

$$
\begin{align}
f(v_3, w_3) &= f(a v_1 + b v_2, \alpha w_1 + \beta w_2) \\
&= a \alpha f(v_1, w_1) + a \beta f(v_1, w_2) + b \alpha f(v_2, w_1) + b \beta f(v_2, w_2)
\end{align}
$$

and 

$$
\begin{align}
f(v_4, w_4) &= f( c v_1 + d v_2, \gamma w_1 + \delta w_2) \\
&= c \gamma f(v_1, w_1) + c \delta f(v_1, w_2) + d \gamma f(v_2, w_1) + d \delta f(v_2, w_2)
\end{align}
$$

Since we know $f(v_1, w_1), f(v_2, w_2), f(v_3, w_3)$ and $f(v_4, w_4)$, from the above equations we can find $f(v_1, w_2)$ and $f(v_2,w_1)$, and hence determine $f$ completely, provided $(a \beta d \gamma) \neq (b \alpha c \delta)$. In the case when $a d \beta \gamma = b c \alpha \delta$ we have the following equation,

$$
d \gamma f(v_3, w_3) - a \beta f(v_4, w_4) =  (d \gamma a  \alpha - a \beta c \gamma) f(v_1, w_1) + (d \gamma b \beta - a \beta d \delta) f(v_2, w_2)
$$

The crucial point to note here that the above equations holds for any bilinear map $V \times W \to X$, where $X$ is an arbitrary vector space over $F$ (perhaps infinite-dimensional too). Here is the reformulation to avoid repetition of the phrase "valid for all bilinear maps $V \times W \to X$": Let $B_X$ denote the set of bilinear maps $V \times W \to X$, and for each $v \in V$ and $w \in W$ let $[v,w]$ denote the function

$$
[v,w] : B \to Xw, \hspace{0.5cm} f \mapsto f(v,w)
$$

Let $C$ denote the vector space of all functions $B_X \to X$ equipped with the usual addition and scalar multiplication.  Functions of the form $[v,w]$ form a $F$-linear subspace of $C$; let us denote it by $T$ (for "tensor"). In $C$ we can define the notion of linear independence and spanning of functions like $[v,w]$. Thus, "vectors"  $[v_i,w_i]$, $1 \leq i \leq r$ are linearly dependent if, there exist scalars $a_i \in F$, not all zero, such that 

\begin{equation}
a_1 [v_1,w_1] + \ldots + a_r [v_r,w_r] = 0 \iff
a_1f(v_1, w_1) + \ldots + a_r f(v_r, w_r) = 0 \textrm{ for all bilinear maps } f \in B_X
\end{equation}

This is the notion of linear independence that fits the above discussion. Similarly, the notion of "spanning set" makes sense in the subspace $T$. For example, we recognize the following dependence relations:

$$
\begin{align}
[v,w_1 + w_2] - [v,w_1] - [v,w_2] & = 0 \\
[v_1 + v_2, w] - [v_1, w] - [v_2,w] &= 0\\
[v, a w] - a[v,w] &= 0 \\
[a v, w] - a [v,w] &= 0 
\end{align}
$$

Clearly these relations are honored by each and every bilinear function $f \in B_X $. We may ask whether there are any other relations apart from the $F$-linear combinations of the left-hand side of the above equations satisfied by every element in $B_X$ and 
for all vector spaces $X$.  The answer is 'None'. Indeed, let $Z$ be the $F$-linear subspace of $\mathcal{T}$ spanned by the vectors $[v,w_1 + w_2] - [v, w_1] - [v, w_2]$, $[v_1 + v_2, w] - [v_1, w] - [v_2, w]$, $[v, a w] - a[v,w]$ and $[a v, w] - a [v,w]$. Consider the quotient vector space $T/ Z$ and construct the following bilinear map, which is an element in $B_{T/Z}$:

$$
V \times W \to T/Z, \hspace{0.5cm} (v,w) \mapsto [v,w] + Z
$$

Then if $a_1[v_1,w_1] + \ldots + a_k[v_k,w_k] \not \in Z$ then its image under the above map is nonzero. In other words, we constructed a vector space $T/Z$ and a bilinear map $f : V \times W \to T/Z$ so that 

$$
\left(a_1[v_1, w_1] + \ldots + a_k[v_k, w_k] \right)(f) = a_1 f(v_1, w_1) + \ldots + a_k f(v_k, w_k) \neq 0.
$$

Elements of $T/Z$ are called tensors, and an element $[v,w] + Z$ is usually denoted by $v \otimes w$. The above procedure may be used to verify whether an element, say $v \otimes w$ is nonzero in $T/Z$: it suffices to find a bilinear map $f: V \times W \to X$, where $X$ may be chosen arbitrarily so that $f(v,w) \neq 0$.

------------------------

We have seen that the $F$-linear combination of vectors (which are functions on $B_X$ for all vector spaces $X$) $a_1 [v_1, w_1] + \ldots + a_k [v_k, w_k]$ is $0$ if and only if for all vector spaces $X$ and for all bilinear maps $f: V \times W \to X$, $a_1f(v_1,w_1) + \ldots + a_k f(v_k, w_k) = 0$.


"It would be nice if there were a vector space $X$ and bilinear map $g: V \times W \to X$ that was so 'generic' that we could regard it as an 'arbitrary' bilinear map". Indeed there is, and we have already constructed one: let $X = T/Z$ and $g : V \times W \to X$ defined by $g(v,w) = v \otimes w$ . In other words, the vector space $X = T/Z$ together with the above map $g$ satisfies the universal property: every bilinear map $f: V \times W \to Y$, where $Y$ is any vector space, factors uniquely through the 'general' map $V \times W \to T/Z$ as $f = \widetilde{f} \circ g$ where $\widetilde{f} : V \otimes W \to Y$ is a linear map. This factorization is similar to the factorisation of natural numbers: $6 = 2 \times 3$, except that in the present case we have factorisation of maps. The general map is so 'general' that the 'remainder' is a unique linear map.





