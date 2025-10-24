# Teaching Demonstration

## Euler's Method, Shortcomings, and Higher-Order Methods 

The files in this repo serve as an introduction to numerical 
methods for ordinary differential equations. We will review 
(forward) Euler's method; discuss its error and shortcomings; and 
then discuss higher-order methods that aim to improve on 
these shortcomings. 

The lecture slides may be found in `teaching\_demo.pdf`. The .m files are:

- `fwd\_euler`: Forward Euler method. 
- `bck\_euler`: Backward Euler method. 
- `rk2`: Order 2 Runge-Kutta method. 
- `rk4`: Order 4 Runge-Kutta method. 
- `exponential_model`: Solves the exponential growth/decay problem 
$y'(x) = ky(x)$. 
- `harmonic_oscillator`: Solves the second order ODE $x''(t) + x(t) = 0$ 
subject to the initial conditions $x(0)=1$ and $x'(0)=0$. 
