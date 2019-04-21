---
geometry: margin=2cm
header-includes: 
    - \usepackage{mhchem}
---
## Equilbrium
\hfill{Sasha Hydrie}

#### Terms:
* equilibrium eonstant: $K$

>> Calculated in the same way as $Q$, but only at equilibrium conditions.  

* reaction quotient: $Q$

>> For a reaction \ce{aA + bB -> cC + dD}, $Q=\dfrac{\lbrack C\rbrack^c\lbrack D\rbrack^d}{\lbrack A\rbrack^a\lbrack B\rbrack^b}$. Remember K to Q comparison, if in alphabetical order the sign points, K > Q, reaction favors right.

* gas pressure constant: $K_p$

>> Related to $K_c$ by the formula $K_p=K_c(RT)^{\Delta n}$, given $\Delta n$ is the difference in moles of gas, products - reactants, $R$ is the ideal gas constant, and $T$ is temperature in Kelvin.

* acid dissociation constant: $K_a$, larger means stronger acid and more dissociation, only for weak acids since strong dissociate entirely. 

>> Derived from the reaction \ce{HA -> H^{+} + A^{-}}, $K_a=\dfrac{\ce{\lbrack H^{+}\rbrack \lbrack A^{-}\rbrack }}{\ce{\lbrack HA\rbrack }}$ equivalent is \ce{HA + H2O -> H3O^{+} + A-}.
>> Also, $\text{p}K_a = -\log{K_a}$

* base dissociation constant: $K_b$ 

>> Derived from the reaction \ce{HB + H2O -> OH^{-} + BH^{+}}, $K_a=\dfrac{\lbrack \ce{OH-}\rbrack \lbrack \ce{BH+}\rbrack }{\lbrack B\rbrack }$ 
>> Also, $\text{p}K_b = -\log{K_b}$

* autoionzation: the process of \ce{2H2O -> H3O^{+} + OH^{-}}
* Ion product consant: $K_w=10^{-14}=K_aK_b$ 

>> Equal to \ce{\lbrack H3O^{+}\rbrack \lbrack OH^{-}\rbrack }, hence if either ion is known pH can be derived.

* weak acid: only partially dissociates, proton donor

* strong acid: completely dissociates, proton donor

* weak base: partially dissociates, proton acceptor

* strong base: completely dissociates, proton acceptor

* conjugate acid base-pairs: differ only by a singel proton, ex: \ce{NH3} and \ce{NH4+}

* polyprotic acids: acids that can donate multiple protons, $K_a$ for the first dissociation is usually the only useful one.

* amphoteric: can function as an acid or base, depending on species. ex- water autoionzation.

* solubility product constant: $K_{sp}$ product of ion concentrations.
<!-- _t -->

>> $K_{sp}=\text{\lbrack Cation\rbrack \lbrack Anion\rbrack }$, the solid is excluded since its concentration is (by definition) 1. 
<!-- _t --> 

#### Le Chatelier's Principle:

**Think about value of Q for each**

1. Concentration increase &rarr; favors opposite side
2. Pressure increase &rarr; favors side with fewer moles of *gas* 
3. Temperature increase &rarr; favores endothermic direction
4. Catalyst &rarr; *Nope!* (catalyst speeds up mechanism both ways)
5. Completely remove solid &rarr; favors side with removed solid
6. Partially remove solid &rarr; *Nope!*

#### Acids and Bases:

Reactions involving weak acids or bases and water are *reversible*, while reactions involving strong acids or bases are *not*. As an example, 

> \ce{HCl + H2O -> Cl^{-} + H3O^{+}}

note the usage of the single arrow. Comparitively,

> \ce{CH3COOH + H2O <-> H3O^{+} + CH3COO^{-}}.

Since weak acids and bases do not dissociate completely there are factors that effect how much they dissociate. An example would be the **Common Ion Effect:**

<!--TODO, add more justification -->
> weak electrolytes dissociate less when there is a shared ion present, Le Chatelier's can be used as justification, looking at the net ionic equation. 

A strong base and a strong acid reacting in equal quantity yields a neutral solution:

> \ce{HCl + NaOH -> NaCl + H2O}  

A strong acid reacting with a weak base in equal quantity yields a weak acid, making the solution acidic overall:

> \ce{HCl + CH3COONa <-> NaCl + CH3COOH}, the reaction is reversible because the net ionic equation is \ce{H+ + CH3COO- -> CH3COOH}.

The converse is true when a strong base and a weak acid react. Weak acids do not react appreciably with weak bases, even in significant concentrations. (See **Buffers**.)

#### Salts:

The reaction of an acid and base produces a salt, the anion from the acid with the cation from the base. Inherently, cations are proton donors and anions are proton acceptors, making them acids and bases respectively.

They can be considered conjugate bases or acids, and since they correspond to strong acids or bases respectfully they do not dissociate meaningfully, and are neutral. The neutral cations are 

>\ce{Li+}, \ce{Na+}, \ce{K+}, \ce{Rb+}, \ce{Cs+}, \ce{Ca^{2+}}, and \ce{Sr^{2+}} 

and the neutral anions are 

> \ce{Cl-}, \ce{Br-}, \ce{I-}, \ce{NO3-}, \ce{ClO3-}, and \ce{ClO4-}.

To determine if a salt is acidic or basic look at the components:

| Cation | Anion | Salt
| :- | :- | -: |
| Strong Base | Strong Acid | Neutral |
| Strong Base | Weak Acid | Basic |
| Weak Base | Strong Acid | Acidic | 
| Weak Base | Weak  Acid | $K_a$ vs $K_b$ | 

#### Buffers:

Buffers are substances that resist change in pH. There are two types of buffers:

1. Weak acid + conjugate base, ex-\ce{HF} and \ce{F-}

>> The weak acid neutralizes any base added and the conjugate base neutralizes acid. 

2. Weak base + conjugate acid, ex-\ce{NH3} and \ce{NH4+} 

>> The weak base neutralizes any acid added and the conjugate acid neutralizes base. 

A common misconception is that a buffer can not be prepared with a strong base or acid, but if the weak counterpart is in excess then it will produce its conjugate while ultimately using all of the strong substance.

To calculate the pH of a buffer, use ICE as if calculating the pH of a weak acid to determine $K_a$. Left as an exercise to the reader. <!-- TODO --> 

It's unlikely that any reader did the aforementioned exercise, but the end result is the equation 

> $K_a = x\dfrac{\text{\lbrack base\rbrack }}{\text{\lbrack acid\rbrack }}$, which written in logarithmic form yields...

The **Henderson-Hasselbalch equation**:
$$\text{pH} = \text{p}K_a + \log{\dfrac{\ce{\lbrack A-\rbrack }}{\ce{\lbrack HA\rbrack }}},$$

similarly,

$$\ce{\lbrack OH-\rbrack } = K_b\times \dfrac{\ce{\lbrack B\rbrack }}{\ce{\lbrack HB+\rbrack }}\text{ and } \text{pOH}=\text{p}K_b + \log{\dfrac{\ce{\lbrack HB+\rbrack }}{\ce{\lbrack B\rbrack }}}.$$

Buffer capacity is based on the amount of strong acid or base that a buffer can absorb without a large pH change. Generally a buffer is only functional within a range of a buffer is within 0.5 pH of the p$K_a$ value.

#### Titration:

A titration is a procedure used to determine the concentration of an unknown solution. An **indicator** is used to signal when the equivalence point, when the solution has reached a certain pH threshold, is reached. The component added is the **titrant**.

A good rule of thumb is that strong acids have a pH less than two and strong bases have a pH greater than twelve. If a strong base is titrated with a weak acid or the converse then the equivalence point will be at 7 pH. Otherwise, it's skewed towards the pH of the strong. 

#### Solubility

There is not too much to this topic beyond the definition. However, when there are coefficients concentrations are exponential, as in all forms of equilibrium. As an example, \ce{MgF2} would have a constant of 

>> $K_{sp} =$\lbrack \ce{Mg^{2+}}\rbrack \lbrack \ce{F-}\rbrack $^2$ 



