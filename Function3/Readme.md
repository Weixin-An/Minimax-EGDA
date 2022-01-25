**Problem description**

The solved Nonconvex-Nonconcave problem is:
$$
\begin{equation}
f(x, y) = \left\{
\begin{aligned}
& \frac{R}{4} &for\quad x < y - \sqrt{\frac{R}{L}}\\
& -\frac{L}{4}(x - y)^2 - \frac{\sqrt{RL}}{2}(x -y) &for\quad  y - \sqrt{\frac{R}{L}} \leq x < y\\
& \frac{L}{4}(x - y)^2 - \frac{\sqrt{RL}}{2}(x -y) &for\quad  y \leq x < y + \sqrt{\frac{R}{L}}  \\ 
& -\frac{R}{4} &for\quad y + \sqrt{\frac{R}{L}} < x,
\end{aligned}
\right.
\end{equation}
$$

where $L$ is a smooth parameter, and we set $R=L=1$. 
