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
- [x] Logtalk `3.42.0`.

## Supported Prolog backends
- [x] SWI-Prolog (threaded, 64 bits, version 8.5.5-3-gb856d332c-DIRTY), works ([see issue #10](https://github.com/mlliarm/ia/issues/10#issuecomment-1009255385)).
- [x] GNU-Prolog 1.5.0 (64 bits), works ([see issue #10](https://github.com/mlliarm/ia/issues/10#issuecomment-1009268552)).

### Examples
[TODO](https://github.com/mlliarm/ia/issues/10#issue-745885381).

## References
* R. E. Moore, R. B. Kearfott, M. J. Cloud, Introduction to Interval Analysis, 2009, [(DOI)](https://doi.org/10.1137/1.9780898717716).
* E. Hansen, Global Optimization using Interval Analysis, 2003, [(Amazon)](https://www.amazon.com/Global-Optimization-Using-Interval-Analysis/dp/0824740599).
* A. Neumaier, Interval Methods for Systems of Equations, 2009, [(DOI)](https://doi.org/10.1017/CBO9780511526473).
* S. P. Shary, Randomized algorithms in interval global optimization, 2008, [(DOI)](https://doi.org/10.1134/S1995423908040083).

## Contributors
See [CONTRIBUTORS](CONTRIBUTORS.md).
