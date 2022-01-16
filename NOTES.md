________________________________________________________________________
Copyright 2020-2022 Michail Liarmakopoulos <mlliarm@yandex.com>

Copyright 2020-2022 Paulo Moura <pmoura@logtalk.org>

SPDX-License-Identifier: Apache-2.0

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
________________________________________________________________________

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
- 1 entity declared as covered containing 20 clauses.
    - 1 out of 1 entity covered, `100.000000% entity coverage`.
    - 20 out of 20 clauses covered, `100.000000% clause coverage`.

### Examples

All examples have been taken from the book of R. E. Moore et al (see the first reference).

#### Introduction
- TBD

#### The Interval Arithmetic System
- TBD

#### First Applications
- TBD

---
## References
1. R. E. Moore, R. B. Kearfott, M. J. Cloud, Introduction to Interval Analysis, 2009, [(DOI)](https://doi.org/10.1137/1.9780898717716).
2. E. Hansen, Global Optimization using Interval Analysis, 2003, [(DOI)](https://doi.org/10.1201/9780203026922).
3. A. Neumaier, Interval Methods for Systems of Equations, 1990, [(DOI)](https://doi.org/10.1017/CBO9780511526473).
4. D. Ratz, Inclusion isotone extended interval arithmetic. A toolbox update, 1997 [(DOI, open access)](https://publikationen.bibliothek.kit.edu/67997).
5. S. P. Shary, Randomized algorithms in interval global optimization, 2008, ([DOI](https://doi.org/10.1134/S1995423908040083), [author's site](http://www.nsc.ru/interval/shary/Papers/InRandAlgs.pdf)).
6. R.B. Kearfott, M.T. Nakao, Arnold Neumaier, S.M. Rump, S. P. Shary, P. Van Hentenryck, Standardized notation in interval analysis, Вычислительные технологии. 2010. Т. 15. № 1. С. 7-13 , [(Full article)](https://web.archive.org/web/20220115215222/https://www.tuhh.de/ti3/paper/rump/KeNaNeRuShHe10.pdf),[(Link to the magazine published)](https://web.archive.org/web/20220115215444/http://www.ict.nsc.ru/jct/annotation/1345).

## Contributors
See [CONTRIBUTORS](CONTRIBUTORS.md).
