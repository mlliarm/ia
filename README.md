# ia
An interval arithmetic library in Logtalk.

## Use
### Loading the library

To load the library simply start Logtalk ([example](https://logtalk.org/manuals/userman/programming.html#starting-logtalk)) from the library directory and type:

```
?- logtalk_load(loader).
```

### Run tests

To run the tests type:
```
?- logtalk_load(tester).
```

### Dependencies
- Logtalk 3.42.0 (tested).

## Supported Prolog backends
- [x] SWI-Prolog (threaded, 64 bits, version 7.6.4), ([see](https://github.com/mlliarm/ia/issues/10#issuecomment-1008954629)).
- [] GNU-Prolog 1.4.5 (64 bits), fails ([see](issue #11)).

### Examples
To do.

## References
* R. E. Moore, R. B. Kearfott, M. J. Cloud, Introduction to Interval Analysis, 2009, [(DOI)](https://doi.org/10.1137/1.9780898717716).
* E. Hansen, Global Optimization using Interval Analysis, 2003, [(Amazon)](https://www.amazon.com/Global-Optimization-Using-Interval-Analysis/dp/0824740599).
* A. Neumaier, Interval Methods for Systems of Equations, 2009, [(DOI)](https://doi.org/10.1017/CBO9780511526473).
* S. P. Shary, Randomized algorithms in interval global optimization, 2008, [(DOI)](https://doi.org/10.1134/S1995423908040083).

## Contributors
See [CONTRIBUTORS](CONTRIBUTORS.md).
