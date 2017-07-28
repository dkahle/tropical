**tropical** – Tropical Geometry in R
=====================================

[![CRAN\_Status\_Badge](http://www.r-pkg.org/badges/version/tropical)](https://cran.r-project.org/package=tropical)

Overview
--------

**tropical** is a new R package that provides users with methods and data structures for [tropical geometry in R](https://en.wikipedia.org/wiki/Tropical_geometry). Inside R, you load the package with

``` r
library(tropical)
# Using min-plus algebra.
```

See the bottom of this page for how to install **tropical**.

Basic usage
-----------

In tropical geometry, the ordinary operations of addition and multiplication are changed: the sum of two numbers is the minimum of those numbers, and the product of two numbers is their (classical) sum. To reflect this change, the ordinary plus sign +, representing classical addition, is changed to ⊕, and ordinary multiplication symbols, × or ⋅, are changed to ⊙. As an example, 1 ⊕ 5 = 1, and 1 ⊙ 5 = 6. Together, the set (ℝ ∪ ∞, ⊕, ⊙) forms the [algebraic structure](https://en.wikipedia.org/wiki/Algebraic_structure) of a semiring satisfying all ring, and even field, definitions except having additive inverses.

**tropical** implements ⊕ as `%+%` and ⊙ as `%.%`. For example:

``` r
1 %+% 5
# [1] 1
1 %.% 5
# [1] 6
```

As in base R, these operations are vectorized:

``` r
1:3 %+% 3:1
# [1] 1 2 1
1:3 %.% 3:1
# [1] 4 4 4
```

Exponentiation is also defined as iterated multiplication (⊕), but only when natural number exponents are given, so that 5<sup>3</sup> (sometimes written 5<sup>⊙3</sup>) is 5<sup>3</sup> = 5 ⊙ 5 ⊙ 5 = 5 + 5 + 5 = 3 × 5 = 15. Example:

``` r
5 %^% 3
# [1] 15
```

This operation is vectorized, too.

Matrix multiplication is also defined through inner products of vectors. For two vectors **x** and **y** of the same length, their inner product is **x**′**y** = ⨁*x*<sub>*k*</sub> ⊙ *y*<sub>*k*</sub> = min{*x*<sub>*k*</sub> + *y*<sub>*k*</sub>}. In **tropical**, this is given by `%..%` (which is the tropical analogue of R's ordinary matrix multiplication operator `%*%`):

``` r
1:3 %..% 4:6
# [1] 5
```

This is min{1 + 4, 2 + 5, 3 + 6}=5. From there, matrix multiplication is defined in the standard way, so that for two matrices **A** and **B**, their product **C** = **AB** has elements *c*<sub>*i*, *j*</sub> = **a**<sub>*i*</sub>′**b**<sub>*j*</sub>, where **a**<sub>*i*</sub> is the *i*th row of **A** and **b**<sub>*j*</sub> is the *j*th column of **B**. Example:

``` r
(m1 <- matrix(1:6, 2, 3))
#      [,1] [,2] [,3]
# [1,]    1    3    5
# [2,]    2    4    6
(m2 <- matrix(6:1, 3, 2))
#      [,1] [,2]
# [1,]    6    3
# [2,]    5    2
# [3,]    4    1
m1 %..% m2
#      [,1] [,2]
# [1,]    7    4
# [2,]    8    5
```

Sometimes tropical arithmetic is defined with ⊕ interpreted as the maximum of the two numbers, not the minimum. To change **tropical**'s default setting, just type:

``` r
set_plus_max()
# Using max-plus algebra.
1:3 %+% 3:1
# [1] 3 2 3
```

Once you use this function, all operations will have the appropriate corresponding changes. You can change it back with

``` r
set_plus_max()
# Using max-plus algebra.
1:3 %+% 3:1
# [1] 3 2 3
```

Acknowledgements
----------------

This material is based upon work supported by the National Science Foundation under Grant Nos. [1321794](https://nsf.gov/awardsearch/showAward?AWD_ID=1321794) and [1622449](https://nsf.gov/awardsearch/showAward?AWD_ID=1622449).

Installation
------------

Here's how you can install the current *developmental* version of **tropical**:

``` r
if(!requireNamespace("devtools")) install.packages("devtools")
devtools::install_github("dkahle/tropical")
```
