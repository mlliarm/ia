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
- [x] Logtalk `3.52.0-1`.

## Supported Prolog backends
- [x] SWI-Prolog (threaded, 64 bits, version 8.5.5-3-gb856d332c-DIRTY), works ([see](https://github.com/mlliarm/ia/issues/10#issuecomment-1009255385)).
- [x] GNU-Prolog 1.5.0 (64 bits), works ([see](https://github.com/mlliarm/ia/issues/10#issuecomment-1009268552)).

## Know issues
- Ciao Prolog (tested with version 1.20.0) cannot be used due to lack of support for the `min/2` and `max/2` arithmetic functions.

## Code coverage
- `Entity coverage:` 1/1 (100%).
- `Clause coverage`: 13/18 (72.2%), see [issue #7](https://github.com/mlliarm/ia/issues/7#issuecomment-1011539142).

### Examples
[TODO](https://github.com/mlliarm/ia/issues/10#issue-745885381).

## References
1. R. E. Moore, R. B. Kearfott, M. J. Cloud, Introduction to Interval Analysis, 2009, [(DOI)](https://doi.org/10.1137/1.9780898717716).
2. E. Hansen, Global Optimization using Interval Analysis, 2003, [(Amazon)](https://www.amazon.com/Global-Optimization-Using-Interval-Analysis/dp/0824740599).
3. A. Neumaier, Interval Methods for Systems of Equations, 2009, [(DOI)](https://doi.org/10.1017/CBO9780511526473).
4. D. Ratz, Inclusion isotone extended interval arithmetic. A toolbox update, 1997 [(DOI, open access)](https://publikationen.bibliothek.kit.edu/67997).
5. S. P. Shary, Randomized algorithms in interval global optimization, 2008, [(DOI)](https://doi.org/10.1134/S1995423908040083).

## Contributors
See [CONTRIBUTORS](CONTRIBUTORS.md).
