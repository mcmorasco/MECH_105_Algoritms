# Simpson's 1/3 Rule
----
Calculates the numerical integral of a given set of data using the cumulative Simpson's 1/3 rule.
If only two data points are given, trapezoidal will be applied.
If an odd number of inputs are given, trapezoidal rule will be applied for the final two segments.

## Inputs:
* x: The vector of equally spaced independent variables
* y: The vector of function values with respect to x

*The algorithm will output an error if input vectors aren't the same length and if "x" input vector isn't evenly spaced*

---
## Output:
* I: The calculated numerical integral
