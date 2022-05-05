# Linear Regression Algorithm
----
This algorithm filters the data set to eliminate outliers before calculating a linear regression from the filtered data set It then transforms the linear regression into slope-intercept format in order to find the line of best fit for the given data.

## Inputs:
* x: The x-values of the data set
* y: The y-values of the data set

*The algorithm will output an error if input vectors aren't equal lengths.*

---
## Outputs:
* fX: The x-values with outliers removed
* fY: The y-values with outliers removed
* slope: The slope(m) from the linear regression y=mx+b
* intercept: The intercept(b) from the linear regression y=mx+b
* Rsquared: R<sup>2</sup>, also known as the coefficient of determination
