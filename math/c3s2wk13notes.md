---
title: "Stokes Theorem"
author: "Sasha Hydrie"
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

## Calculus 3, Semester 2, Week 13: 

#### Stokes Theorem: 
Let $S$ be an *oriented*, piecewise smooth surface, $\vv{F}$ a $C'$ vector field whose domain includes $S$, and $\delta S$ the positively oriented boundary of $S$, consisting of finitely many smooth curves. Then $$\oint_{\delta S} \vv{F}\cdot\,d\vv{s}=\iint_{S} \text{curl} \vv{F}\cdot\,d\vv{S}$$

Think Green's Theorem in 3 dimensions.  

Boundary orientation can be determined using the right-hand rule. Thumb in the direction of normal vector and fingers follow the boundary.

Stokes Theorem shows that curl vector fields are surface independnet, so any surface can be used for the integral if they share a boundary.
