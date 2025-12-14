## 古巴比伦算法

### 算法原理（简述）

>$x_{k+1} = \frac{1}{2} \left( x_k + \frac{a}{x_k} \right)$

This is the Babylonian method (also known as Heron's method) for approximating square roots. Let me explain the geometric intuition and mathematical reasoning behind this formula.


The formula $x_{k+1} = \frac{1}{2} \left( x_k + \frac{a}{x_k} \right)$ works by iteratively refining an estimate of $\sqrt{a}$:

1. **Initial estimate**: Start with any positive guess $x_0$ for $\sqrt{a}$

2. **Error correction**: If $x_k$ is too high (overestimate), then $\frac{a}{x_k}$ will be too low (underestimate), and vice versa

3. **Averaging**: Taking the average of these two values gives a better estimate that converges rapidly toward the true square root

## Mathematical Reasoning

The method finds the positive root of the equation $f(x) = x^2 - a = 0$ using Newton's method:

- Derivative: $f'(x) = 2x$
- Newton's iteration: $x_{k+1} = x_k - \frac{f(x_k)}{f'(x_k)} = x_k - \frac{x_k^2 - a}{2x_k}$
- Simplifying: $x_{k+1} = x_k - \frac{x_k}{2} + \frac{a}{2x_k} = \frac{1}{2} \left( x_k + \frac{a}{x_k} \right)$

## Convergence Properties

- **Quadratic convergence**: The number of correct digits roughly doubles with each iteration
- **Self-correcting**: Even with a poor initial guess, the method converges quickly
- **Stable**: Works well for all positive numbers $a > 0$

## Example

To find $\sqrt{2}$ starting with $x_0 = 1$:
- $x_1 = \frac{1}{2}(1 + 2/1) = 1.5$
- $x_2 = \frac{1}{2}(1.5 + 2/1.5) ≈ 1.4167$
- $x_3 = \frac{1}{2}(1.4167 + 2/1.4167) ≈ 1.4142$

The method converges rapidly to the true value $\sqrt{2} ≈ 1.41421356$.