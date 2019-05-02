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

## Calculus 3, Semester 2, Section 5.4-5.5, Week 14

\hfill{Sasha Hydrie}

#### Logistics

- All homework is due at the study session
- Graduation is right after the final exam
- 90-95% attend graduation
- oof. 

#### Triple Integrals

\begin{equation*}\iiint_{W} f\, dV = \lim_{\Delta x,\Delta y,\Delta z\to 0}\sum f(x_{i},y_{j},z_{k})\Delta x\Delta y\Delta z\end{equation*}

Simplest explanation is hypervolume. Easier to grasp is to imagine that $f$ is the density and the integral is the mass.

Fubini just about still exists, free to choose order. Properties still exist. Integrating 1 is the volume. Are you surprised?

Regions are hard, use pictures or you have the dumb. Projections onto planes make it easier.`Don't split into multiple pieces if it can be avoided.h

#### Coordinate Systems

Volume expansion factor instead of area, equivalent to the absolute value of the Jacobian. Fudge factor for spherical coordinates is $\rho^2\sin{\phi}$. Fudge factor for cylindrical coordinates is $r$.

