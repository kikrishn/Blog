---
layout: post
title: Rational Canonical Form
tags:
  - Linear Algebra
published: true
---

We want to understand the structure of finitely generated modules $M$ over a principal ideal domain $R$. Simplest among such modules are free modules of finite "rank", $M \cong R^n$ for some finite $n$. Note that the $R$-module structure on $R^n$ is clear unlike that of $M$, and it is this feature that aids in understanding the structure of $M$ via $R^n$. It is intuitively clear that $R^n$ has a "basis" of $n$ elments analogous to the case of vector spaces. Vector spaces are torsion-free, i.e. no nonzero element of the vector space is annihilated by an element of the base ring. On the contrary, the uniquely nonzero element of the $\mathbb{Z}$-module $\mathbb{Z}/ 2 \mathbb{Z}$ is annihilated by $2$ of the base ring $\mathbb{Z}$. This additional feature of modules that are not vector spaces leads one to consider the notion of linearly independence and spanning separately; recall that in the case of vector spaces, a maximal linearly independent set is also a spanning set, and a spanning set contains a maximal linearly independent set, while in the case of modules a spanning set need not contains a linearly independent set. Indeed the subset $\{ 1 + 2 \mathbb{Z} \}$ spans $\mathbb{Z}/2 \mathbb{Z}$ over $\mathbb{Z}$ but it is not linearly independent for $2 \cdot (1 + 2 \mathbb{Z}) = 0$. Similarly a maximal linearly independent set need not span the module: the element $2$ of the $\mathbb{Z}$-module $\mathbb{Z}$ is linearly independent over $\mathbb{Z}$ but it does not span the module. For another example, consider the ring $R := \mathbb{Z}\[x\]$ considered as a module over itself, and consider the module $(2,x)$. Clearly the element $2, x$ span the module $(2,x)$ over $R$ but they are not linearly indendent for there is a nontrivial dependence relation $x \cdot 2 + (-2) \cdot x = 0$ between them. Thus a spanning set may contain a linearly independent set but may not contain a maximal linearly independent set.

**Rank of an $R$-module**: Let $M$ be a free $R$-module, so that $M \cong R^n$ for some integer $n$. Any $n+1$ elements of $M$ is not linearly independent over $R$, i.e. if $y_1, \ldots, y_{n+1}$ are elements of $M$ then there exists $n+1$ elements $r_1, \ldots, r_{n+1}$ not all zero such that $r_1 y_1 + \ldots + r_{n+1} y_{n+1} = 0$. 

**Proof**: (**Embedding Trick**) Let $F$ be the field of fractions of $R$. Consider $R^n$ as a subset of $F^n$ which is a $n$-dimensional vector space over $F$. The $n+1$ elements $y_i$ considered as elements of $F^n$ are not linearly dependent over $F$ so that a relation of the above form exists with $r_i$ in $F$ and not all zero. Taking common denominator of the coefficients gives a corresponding nontrivial relation over $R$. For example, if we have $\frac{2}{3} x + \frac{4}{5} y = 0$ over $F$ then we have $10 x + 12 y = 0$ over $R$.

(**Determinant Trick**) First recall the Cramer's rule for solving a system of equations, say in the form $Ax = b$ where $A$ is an $n \times n$ matrix over $F$, and $b$ is a column vector over $F$ and $x = \[ x_1, \ldots, x_n \]^T$ the solution column vector. The determinant is an alternating $n$-linear map $\textrm{ det } : V \ldots V \to F$ where $V = F^n$, and the determinant of a matrix $A$ is, by definition, the value of the determinant with $A$ considered as an element of $V^n$ where each column of $A$ is considered as an element of $V$. The equation $Ax = b$ can be written in the vector form as $x_1 A_1 + \ldots + x_n A_n = b$ where $A_i$ is the $i$th column of $A$; in other words, is the vector $b$ in the column space of $A$? Consider the determinant of $A$ viewed as the value of the function $\textrm{ det }$ at the "point" $(A_1, \ldots, A_n)$ and let $B_i =  (A_1, \ldots,A_{i-1}, b, A_{i+1} \cdots, A_n)$ be the matrix obtained by replacing the $i$th column of $A$ by $b$. Since the determinant function is multilinear and alternating,

$$
\begin{align*}
det(B_i) &= det \left( A_1, \ldots, A_{i-1}, \sum x_k A_k, A_{i+1}, \ldots, A_n \right)
\\
&= x_i \cdot det \left(A_1, \ldots , A_{i-1}, A_i, A_{i+1}, \ldots, A_n \right) \\
&= x_i \cdot det(A).
\end{align*}
$$

So, if the columns are not linearly dependent \underline{over $R$}, hence over $F$, then $Ax = 0$ has a nontrivial solution $\[x_1, \ldots, x_n \]^T$, with $x_i$ nonzero for some $i$. Replacing the $i$th column of $A$ by $0$ and expanding its determinant in two ways as above we see that $x_i \cdot det(A)$ is $0$ for all $i$. Since $R$ is a domain and $x_i$ is nonzero for some $i$ it follows that the determinant of $A$ is $0$. Conversely, suppose that the columns of $A$ are linearly dependent over $R$. Then they are linearly independent over $F$ too, otherwise any linear dependence relation over $F$ yields one over $R$ by multiplying the relation over $F$ by the common denominator of its coefficients. Therefore the columns of $A$ form a basis of $F^n$ over $F$. In particular, the standard basis vectors can be expressed as a linear combination of the columns over $F$. Now expanding the determinant $\textrm{ det }(e_1, \cdots, e_n)$ in terms of the columns of $A$, we see that $1 = x \textrm{ det } (A)$ for some $x$ in $F$, so that the determinant of $A$ is nonvanishing.

In summary, if $R$ is an integral domain and $A$ is a $n\times n$ matrix over $R$ then the determinant of $A$ is vanishing if and only if its columns are linearly dependent over $R$. Now we proceed to prove that in the free $R$-module $R^n$ any $n+1$ elements are linearly dependent over $R$. Choose a basis $e_1, \ldots, e_n$ of $M$ and let $y_1, \ldots, y_{n+1}$ be the given $n+1$ elements. Then each $y_i$ is a linear combination of $e_i$ over $R$ (since $e_i$ is a \underline{basis}) and the corresponding coefficient matrix obtained by writing the coefficients of $y_i$ in the expansion as the $i$th column is an $n \times (n+1)$ matrix. By padding this matrix with an extra row consisting of all zeros, we obtain an $(n+1) \times (n+1)$ matrix with determinant $0$. By the above discussion, it follows that the columns of the matrix are linearly dependent, and clearly any such dependence relation gives a dependence relation among $y_i$s. Indeed, if $\sum \alpha_i \[ a_{1i}, a_{2i}, \cdots a_{ni}, 0 ]^T = 0$ then $\sum_{j =1}^n \alpha_i a_{j i} = 0$ for all $1 \leq i \leq n$, so that 

$$
\sum_{i =1}^n \alpha_i y_i = \sum_{i=1}^n \alpha_i \sum_{j = 1}^n a_{j i} e_j = \sum_{j = 1}^n  \left( \sum_{i=1}^n \alpha_i a_{ji} \right) e_j = 0.
$$

**Rank**: Let $M$ be a finitely generated module over an integral domain $R$. The rank of $M$ is the maximal number of elements that are linearly independent over $R$. By the above discussion, it is clear that the rank is a well-defined notion. 


**Theorem:** Let $R$ be a PID,  $M$ be a free module of rank $n$ over $R$ and $N$ be a submodule of $M$. Then $N$ is a free $R$-module of rank at most $n$. Furthermore there exists a basis $y_1, \ldots, y_n$ of $M$ and elements $a_1, \ldots, a_m$ of $R$ satisfying the divisibility conditions $a_1 \mid \ldots \mid a_m$ such that $a_1 y_1, \cdots a_m y_m$ is a basis of $N$.

**Proof:**

1. Fix a basis $x_1, \ldots, x_n$ of $M$. Assuming that $N$ is nontrivial, consider the set of $R$-linear functionals $M \to R$, and the family of ideals $\{ \phi(N) : \phi \in Hom(M,R) \}$ in $R$. Since $R$ is Noetherian (every ideal of $R$ is finitely generated, n fact by a single element) it follows that the set contains a maximal element, say $(a_1)$ with $\nu(y) = a_1$ for some linear functional $\nu: M \to R$. Since $N$ is nonzero, at least one of the ideals $\pi_i(N)$ is nonzero, where $\pi_i$ is the canonical projections with respect to the above choice of basis of $M$. In particular, $a_1$ is nonzero, hence $y$ is nonzero. 

2. Now show that $a_1$ divides the generator of $\phi(N)$ for all linear functionals $\phi: N \to R$. In particular, it divides $\pi_i(N)$ so that $\pi_i(N) = a_1 b_i$ for some $b_i$ in $R$. Define the "partitions-of-unity" 
$$
y_1 = b_1 x_1 + \ldots  + b_n x_n, a_1 y_1 = y , \nu(y_1) = 1
$$

3. Now show that $M = Ry_1 \oplus ker \nu$ and $N = a_1 y_1 \oplus (ker \nu) \cap N$. 

4. We shall prove that $\ker \nu$ has rank $n-1$ below; for a while accept this and proceed and apply the induction hypothesis to conclude that $ker(\nu)$ has a basis $y_2, \ldots, y_n$ and there exists elements $a_2, \ldots, a_m$  satisyfing $a_2 \mid \ldots \mid a_m$ such that $a_2 y_2, \ldots, a_m y_m$ is a basis of $ker(\nu) \cap N$. 

5. By considering the $R$-linear functional $\psi$ that sends $y_1$ and $y_2$ to $1$ and the remaining $y_i$ to $0$, show that $a_1 \mid a_2$.













