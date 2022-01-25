We set initial point $z_0=(5, 5)$.

1. GDA.m is the basic gradient descent ascent algorithm. We set the step-size $\alpha = 0.01$.

2. EAG.m refers to the extra anchored gradient (EAG) algorithms [<sup>1</sup>](#refer1). EAG-C refers to EAG with constant step-size $\alpha = 0.01$, and EAG-V refers to EAG with varying step-size $\alpha_k \in [\frac{0.437}{L}, \frac{0.618}{L}]$, where $L=100$ is a smooth parameter.

3. FEG.m refers to the fast extragradient algorithm[<sup>2</sup>](#refer2), and we set $\tau_{-1} = 0.5; \eta_0 = 2; \delta = 0.3;$.

4. EGDA.m is our algorithm. We set the step-size $\alpha = 0.1$, and  $\tau_0 = 0.5, \tau_1 = 0.9$. Moreover, in the first 5 iterations, we set $p_t$ with free coefficients.



<div id="refer1"></div>

[1] Accelerated Algorithms for Smooth Convex-Concave Minimax Problems with $\mathcal{O}(1/k^2)$ Rate on Squared Gradient Norm. (http://proceedings.mlr.press/v139/yoon21d/yoon21d.pdf)

<div id="refer2"></div>

[2] Fast Extra Gradient Methods for Smooth Structured Nonconvex-Nonconcave Minimax Problems. (https://arxiv.org/pdf/2106.02326.pdf)

