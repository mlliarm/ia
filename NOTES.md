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
- [x] Logtalk 3.36.0 or later version.

## Supported Prolog backends
- [x] SWI-Prolog (threaded, 64 bits, version 8.5.5-3-gb856d332c-DIRTY), works ([see](https://github.com/mlliarm/ia/issues/10#issuecomment-1009255385)).
- [x] GNU-Prolog 1.5.0 (64 bits), works ([see](https://github.com/mlliarm/ia/issues/10#issuecomment-1009268552)).
- [X] ECLiPSe 7.0_54, works.

## Known issues
- Ciao Prolog (tested with version 1.20.0) cannot be used due to lack of support for the `min/2` and `max/2` arithmetic functions.

## Code coverage
- One (1) entity declared as covered containing 20 clauses.
    - 1 out of 1 entity covered, `100.000000% entity coverage`.
    - 20 out of 20 clauses covered, `100.000000% clause coverage`.

### Examples

All examples have been taken or influenced by the book of R. E. Moore et al (see the first reference).

Also, in all the examples it's assumed that the library `ia` has already been loaded in the REPL session, as mentioned earlier.

#### 1. Introduction
- The need for creating a system that bounds the solutions of algebraic equations is pretty old. 
  - As we read in [Mathworld](https://mathworld.wolfram.com/Pi.html), Archimedes used a bounding method to estimate `pi`, by circumscribing and inscribing `6*2^n`-gons on a circle using the [Archimedes algorithm](https://mathworld.wolfram.com/ArchimedesAlgorithm.html). Using `n = 4` (a 96-gon), Archimedes obtained a lower bound of `3 + (10/71)`, and an upper bound of `3 + (1/7)`, In other words, Archimedes by doing so he created the interval named `PI` which was equal to `[3 + (10/71), 3 + (1/7)]`. Let's use Logtalk to calculate how much this is, as a first example of using the library.

    ```logtalk
    ?- Pi_low is 3 + 10/71, Pi_high is 3 + 1/7, 
       interval_arithmetic::(
         new(Pi_low, Pi_high, PI), 
         mig(PI, Mignitude),
         mag(PI, Magnitude), 
         wid(PI, Width),
         mid(PI, Midpoint)
       ).
    Pi_low = Mignitude, Mignitude = 3.140845070422535,
    Pi_high = Magnitude, Magnitude = 3.142857142857143,
    PI =  i(3.140845070422535, 3.142857142857143),
    Width = 0.00201207243460777,
    Midpoint = 3.141851106639839.
    ```

    So we see that the midpoint of the interval that Archimedes created with his ingenious method is `i(3.140845070422535, 3.142857142857143)`, and the midpoint of that interval (the center of it) is `3.141851106639839`. The 'i' shows that this isn't just a tuple, but an interval data structure. We can calculate how far this midpoint is from the value of pi:

    ```logtalk
    ?- Diff is abs(3.141851106639839 - pi), Diff_perc is 100*Diff.
    Diff = 0.0002584530500460147,
    Diff_perc = 0.02584530500460147.
    ```

    So we can notice the interesting result that even if the `Width` of the interval we calculated above is about `0.002`, the real difference of the midpoint of the interval from the value of Pi we can calculate from the internal functions of our backend Prolog (in this example I've used SWI-Prolog as a backend), is ten times smaller, `0.0002`, about `0.02%`. 

- A last simple example we'll see here is the `is_in` predicate. This predicate is of arity two, `is_in/2`, which means that it has two arguments. The first argument is a number `N` and the second argument an interval `Interval`. It returns a boolean, so to speak, which means that it succeeds when the number `N` is enclosed in `Interval` and fails when it's not. An example:

    ```logtalk
    ?- interval_arithmetic::is_in(pi, i(1,2)).
    false.
    ```

    We see that the above query fails as the number pi is not enclosed inside the closed interval `i(1,2)`. 

    Now if we do a similar query but for a different interval:

    ```logtalk
    ?- PI_interval = i(3.140845070422535, 3.142857142857143),
       interval_arithmetic::is_in(pi, PI_interval).
    PI_interval =  i(3.140845070422535, 3.142857142857143).
    ```

    We see that this time the query didn't through out a `fail`, and thus it has succeeded, plus we can see the values of `PI_interval` and `Machine_PI`.

    The symbols used to denote the interval shouldn't confuse you. I know that in mathematics an open interval for numbers between `a` and `b` is written as `(a,b)` or `]a,b[`, but in Prolog we're using `i/2` compound terms, e.g. `i(a,b)`.

    This library, and interval arithmetic in general, operates in closed intervals only. So, whenever we type `i(a,b)` using `ia`, we should think that such intervals mathematically are written as `[a,b]`, that is, they are closed intervals.

#### 2. The Interval Arithmetic System
- As mentioned earlier, in interval arithmetic we work only with closed intervals. So mathematically an interval `[a,b]` in interval arithmetic is defined as: `[a,b] = {x \in \R: a <= x <= b}`. Which pretty much defines the interval constructively saying that it's the set where every element is between `a` and `b` both included.
- This library also supports what is called *degenerate intervals*. This means that you can write `i(1,1)`, and use the predicates defined by this library to calculate things. Such intervals pretty much substitute the numbers used in equations such as `2 + i(1,1)`, so that one gets always an interval as a result. Some examples:

    ```logtalk
    ?- Deg = i(1,1), interval_arithmetic::wid(Deg, Width).
    Deg =  i(1, 1),
    Width = 0.
    ```

    So we just saw that a degenerate interval has width zero, something that is apparent from the look of it. But can we do any other operations with it?

    How about doing addition, with a second interval `i(1,2)`?

    ```logtalk
    ?- Deg = i(1,1), Int2 = i(1,2), interval_arithmetic::add(Deg, Int2, Sum).
    Deg =  i(1, 1),
    Int2 =  i(1, 2),
    Sum =  i(2, 3).
    ```

    Let's use the predicate `add_n/3`, that is for adding numbers to intervals:

    ```logtalk
    ?- Int = i(1,2), interval_arithmetic::add_n(1, Int, Sum).
    Int =  i(1, 2),
    Sum =  i(2, 3).
    ```

    Let's calculate the midpoint of the degenerate interval `(1,1)`:

    ```logtalk
    ?- interval_arithmetic::mid(i(1,1), Midpoint).
    Midpoint = 1.0.
    ```
    As expected, the midpoint is the same number.

    Another interesting predicate we can test is the `rad/2`, that calculates the radius of an interval. We can prove experimentally that `rad(X) = wid(X)/2`:

    ```logtalk
    ?- interval_arithmetic::(wid(i(1,3), Wid),rad(i(1, 3), Rad)), Wid =:= 2*Rad.
    Wid = 2,
    Rad = 1.0.
    ```

    The above query didn't fail, so this means that every expression of the query was true, so was the last one `Wid =:= 2*Rad`. QED.

    We can also subtract two intervals:

    ```logtalk
    ?- X = i(1,2), Y = i(2,3), interval_arithmetic::sub(X, Y, Sub).
    X =  i(1, 2),
    Y =  i(2, 3),
    Sub =  i(-2, 0).
    ```

    We can multiply two intervals:

    ```logtalk
    ?- X = i(1,2), Y = i(2,3), interval_arithmetic::mul(X, Y, Mul).
    X =  i(1, 2),
    Y =  i(2, 3),
    Sub =  i(2, 6).
    ```

    Calculate the magnitude (absolute value) of an interval:

    ```logtalk
    ?- X = i(1,2), interval_arithmetic::mag(X, Mag).
    X =  i(1, 2),
    Mag = 2.
    ```

    Calculate the mignitude of an interval:

    ```logtalk
    ?- X = i(1,2), interval_arithmetic::mig(X, Mig).
    X =  i(1, 2),
    Mig = 1.
    ```

    But let's see what happens when zero is included in the interval:

    ```logtalk
    ?- X = i(-1,2), interval_arithmetic::mig(X, Mig).
    X =  (-1, 2),
    Mig = 0.
    ```

    Finally, we have interval division, X/Y:

    ```logtalk
    ?- X = i(1,2), Y = i(2,3), interval_arithmetic::div(X, Y, Div).
    X =  i(1, 2),
    Y =  i(2, 3),
    Div = i(0.3333333333333333, 1.0).
    ```

    But what happens when zero is included in the second interval `Y`, i.e. in the denominator? Can we divide by zero?

    ```logtalk
    ?- X = i(1,2), Y = i(-2,3), interval_arithmetic::div(X, Y, Div).
    false.
    ```

    Nope. In this version of the current implementation dividing by intervals that contain zero isn't supported. We'd like to extend our library to support this feature though, because the mathematical definitions have already been thought of (see Ratz's 1997 paper).

    Finally we have two more predicates.

    The intersection of two intervals:

    ```logtalk
    ?- X = i(1,2), Y = i(1.5,3), interval_arithmetic::inter(X, Y, Inter).
    X =  i(1, 2),
    Y =  i(1.5, 3),
    Inter =  i(1.5, 2).
    ```

    ```logtalk
    ?- X = i(1,2), Y = i(-1,3), interval_arithmetic::inter(X, Y, Inter).
    X = Inter, Inter =  i(1, 2),
    Y =  i(-1, 3).
    ```

    ```logtalk
    ?- X = i(1,2), Y = i(3,4), interval_arithmetic::inter(X, Y, Inter).
    false. % they don't intersect
    ```

    And the interval hull predicate:

    ```logtalk
    ?- X = i(1,2), Y = i(-1,3), interval_arithmetic::hull(X, Y, Hull).
    X =  i(1, 2),
    Y = Hull, Hull =  i(-1, 3).

    ?- X = i(1,2), Y = i(3,4), interval_arithmetic::hull(X, Y, Hull).
    X =  i(1, 2),
    Y =  i(3, 4),
    Hull =  i(1, 4).
    ```

---
## References
1. R. E. Moore, R. B. Kearfott, M. J. Cloud, Introduction to Interval Analysis, 2009, ([DOI](https://doi.org/10.1137/1.9780898717716)).
2. E. Hansen, Global Optimization using Interval Analysis, 2003, ([DOI](https://doi.org/10.1201/9780203026922)).
3. A. Neumaier, Interval Methods for Systems of Equations, 1990, ([DOI](https://doi.org/10.1017/CBO9780511526473)).
4.  L. Jaulin, M. Kieffer, O. Didrit, E. Walter, Applied Interval Analysis, 2001, ([Amazon.com](https://www.amazon.com/Applied-Interval-Analysis-Luc-Jaulin/dp/1852332190)).
5. S. P. Shary,  Finite Dimensional Interval Analysis (Kонечномерный Интервальный Анализ), 2021, ([PDF, 5.2MB](www.nsc.ru/interval/Library/InteBooks/SharyBook.pdf)).
6. D. Ratz, Inclusion isotone extended interval arithmetic. A toolbox update, 1997 ([DOI](https://publikationen.bibliothek.kit.edu/67997), [PDF](https://publikationen.bibliothek.kit.edu/67997/2183)).
7. S. P. Shary, Randomized algorithms in interval global optimization, 2008, ([DOI](https://doi.org/10.1134/S1995423908040083), [PDF from author's site](http://www.nsc.ru/interval/shary/Papers/InRandAlgs.pdf)).
8. R.B. Kearfott, M.T. Nakao, Arnold Neumaier, S.M. Rump, S. P. Shary, P. Van Hentenryck, Standardized notation in interval analysis, Вычислительные технологии. 2010. Т. 15. № 1. С. 7-13 , ([PDF](https://web.archive.org/web/20220115215222/https://www.tuhh.de/ti3/paper/rump/KeNaNeRuShHe10.pdf), [link to the journal published)](https://web.archive.org/web/20220115215444/http://www.ict.nsc.ru/jct/annotation/1345)).

## Contributors
See [CONTRIBUTORS](CONTRIBUTORS.md).
