# False Position Algorithm
---
This algorithm estimates the root of a given function using the false position method
False position works by drawing a secant line between the upper and lower guess. The point of intersection of this line with the x-axis is the improved root estimate. This root estimate replaces one of the guesses and the process is repeated until the root is adequately estimated.
## Inputs:
* func: the function being evaluated [^1]
* xl: the lower guess
* xu: the upper guess
* es: the desired relative error
* maxit: the maximum number of iterations to use

*If only the function, lower guess, and upper guess are defined, desired relative error will default to 0.0001% and max iterations will default to 200.*

*If max iteration is not defined but everything else including desired relative error is, the number of max iterations will default to 200.*

---
## Outputs:
* root: this is the estimated root location
* fx: the function evaluated at the root location
* ea: the approximate relative error percentage
* iter: the number of iterations that were performed
---
Note: This algorithm will also produce an error if the initial guesses do not bracket the root.
[^1]: The function needs to be defined as an anonymous function.
