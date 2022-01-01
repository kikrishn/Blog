---
published: true
---
... after Timothy Gowers'  [article](https://www.dpmms.cam.ac.uk/~wtg10/tensors3.html)

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

In general, suppose we know $f(v_1, w_1), f(v_2, w_2), f(v_3, w_3)$ and $f(v_4, w_4)$. If, say, $v_1, v_2 $ and $v_3$ are multiples of a single vector in $V$ then some of the information is redundant, for $w_1, w_2$ and $w_3$ are not linearly dependent in $F^2$ so that if, say, $w_3$ is a linear combination of $w_1$ and $w_2$ then $f(v_3,w_3)$ can be obtained from $f(v_1, w_1)$ and $f(v_2, w_2)$. So assume that no three vectors in the set $\{v_1, v_2, v_3, v_4 \}$ is a scalar multiple of a vector in $V$ and $\{ w_1, w_2, w_3, w_4 \}$ is a scalar multiple of a vector in $W$. Clearly then there can be at most one zero vector in the set $\{v_1, v_2, v_3, v_4\}$, for otherwise if $v_1 = v_2 = 0$ then $v_1 = 0.v_3, v_2 = 0.v_3$ and $v_3 = 1. v_3$, so that the three vectors $v_1, v_2$ and $v_3$ is a scalar multiple of $v_3$, contrary to the hypothesis. Similarly for the set $\{w_1, w_2, w_3, w_4 \}$. So, in the degenerate case when at least one of $v_i$ is zero and at least one of $w_i$ is zero,  we may, with out loss of generality, relabel the vectors in such way that the $v_1, v_2, w_1$ and $w_2$ in the pairs $(v_1, w_1)$ and $(v_2, w_2)$ are all nonzero. If $v_1$ and $v_2$ is a multiple of a vector in $V$, in other words, if $v_2$ is a multiple of $v_1$ then together with the zero vector they violate the hypothesis, since $0 = 0 \cdot v_1$. Thus $v_1, v_2$, and likewise $w_1, w_2$ must be linearly independent. Let 

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

The crucial point to note here that the above equations holds for any bilinear map $V \times W \to X$. Here is the reformulation to avoid repetition of the phrase "valid for all bilinear maps $V \times W \to X$": Let $\mathcal{B}_X$ denote the set of bilinear maps $V \times W \to X$, and for each $v \in V$ and $w \in W$ let $[v,w]$ denote the function

$$
[v,w] : \mathcal{B} \to F, \hspace{0.5cm} f \mapsto f(v,w)
$$

The set $\mathcal{C}$ of all functions $\mathcal{B}_X \to F$ is a vector space over $F$ under the usual additional and scalar multiplication, and the functions of the form $[v,w]$ form a $F$-linear subspace $\mathcal{T}$ of $\mathcal{C}$. Now, in $\mathcal{C}$ we can define the notion of linear independence and spanning of functions like $[v,w]$. Thus, "vectors" (which are functions) $[v_i,w_i]$, $1 \leq i \leq r$ are linearly dependent if, there exist scalars $a_i \in F$, not all zero, such that 

$$
a_1 [v_1,w_1] + \ldots + a_r [v_r,w_r] = 0 
$$

equivalently,

$$
a_1f(v_1, w_1) + \ldots + a_r f(v_r, w_r) = 0 \textrm{ for all bilinear maps } f \in \mathcal{B}_X
$$

This is the notion of linear independence that fits the above discussion. Similarly, the notion of spanning can be defined. For example, we recognize the following dependence relations:

$$
\begin{align}
[v,w_1 + w_2] - [v,w_1] - [v,w_2] & = 0 \\
[v_1 + v_2, w] - [v_1, w] - [v_2,w] &= 0\\
[v, a w] - a[v,w] &= 0 \\
[a v, w] - a [v,w] &= 0 
\end{align}
$$

Clearly these relations are honored by each and every bilinear function $f \in \mathcal{B}$. We may ask whether there are any other relations apart from the $F$-linear combinations of the left-hand side of the above equations, satisfied by every bilinear function $\mathcal{B}_X$
for all vector spaces $X$.

The answer is 'None'. Indeed, let $\mathcal{Z}$ be the $F$-linear subspace of $\mathcal{T}$ spanned by the vectors $[v , w_1 + w_2] - [v, w_1] - [v, w_2]$, $[v_1 + v_2, w] - [v_1, w] - [v_2, w]$, $[v, a w] - a[v,w]$ and $[a v, w] - a [v,w]$. Consider the quotient vector space $\mathcal{T}/ \mathcal{Z}$ and construct the bilinear map in 
$\mathcal{B}_{\mathcal{T}/\mathcal{Z}}$

$$
V \times W \to T/Z, (v,w) \mapsto [v,w] + Z
$$

