---
geometry: margin=2cm
header-includes: |
    \usepackage{esvect}
    \usepackage{bm}
    \usepackage{amsmath}
    \newcommand{\R}{\mathbb{R}}
    \newcommand*\mtrix[1]{\begin{bmatrix}#1\end{bmatrix}}
    \newcommand*\algn[1]{\begin{align*}#1\end{align*}}
    \newcommand*\circled[1]{\tikz[baseline=(char.base)]{
                \node[shape=circle,draw,inner sep=2pt] (char) {#1};}}
    \newcommand*\df[2]{\dfrac{\partial #1}{\partial #2}}
---

## Calculus 3, Semester 2, Section , Week 15

\hfill{Sasha Hydrie}

Last calculus lecture ever!

#### Boundary

Given a solid region $W\in\R^3$, $\delta W$ is the positively oriented boundary surface, using the outward pointing normal vector if $W$ has no holes. In the case that there are holes, the surface can be split. 

#### Boundary Curve

A surface is **closed** if it has no boundary curves. Examples of closed surfaces are spheres and cubes. Conversely, a disk is not closed.

#### Dstrogradsky's Thm (Divergence Thm or Gauss' Thm)

The **Divergence Theorem**: Let $D$ be a solid bounded region in $\R^3$ whose boundary $\delta D$ consists of finitely many piecewise smooth, closed, orientable surfaces, oriented with normal vectors pointing away from $D$. Let $\vv{F}$ be a $C'$ vector field on $D$. Then, 
$$ \iint_{\deltaD} = \iiint_D \text{div} \vv{F}\, dV.$$

Notably, the hypotheses just say that it has a boundary that is not insane, and can normally be ignored.

Flux integrals over closed surfaces are denoted by $\oiint_S \vv{F}\cdot\,d\vv{S}.$

Let $D$ be region $x^2+y^2+z^2\leq4$, and 

$$\vv{F}(x,y,z)=(e^{yz}\cos{z^2},e^{x^2\sin{z}},x^{47}y^{19}+z).$$ Compute $\iint_{\delta D} \vv{F}\cdot\,d\vv{S}$. 

Notably, the divergence is simply one, so it's just the integral over the sphere of one, the volume. Hence, the answer is $\dfrac{32\pi}{3}$.
<!-- _t -->

Generally, if a function looks extreme you should think before integrating. If asked to integrate something like $\oint_C \vv{F}\cdot\,d\vv{s}$ or $\oiint_S \vv{F}\cdot\,d\vv{S}$ for a "totally bonkers" (-Rogness) vector field, then:

1. Convert $\oint_C \vv{F}\cdot\,d\vv{s}$ to $\iint_S \text{curl}\vv{F}\cdot\,d\vv{S}$, given that $C=\delta S$ and the curl is nice.

2. Convert $\oiint_S \vv{F}\cdot\,d\vv{S}$ to $\iiint_D \text{div}\vv{F}\,dV$ given that the divergence is nice.

3. Discover that's it's actually nice.




