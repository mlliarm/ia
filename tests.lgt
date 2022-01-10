
:- object(tests,
    extends(lgtunit)).

    :- uses(interval_arithmetic, [
        new/3,
        is_in/2,
        add/3,
        sub/3,
        mul/3,
        (div)/3,
        mid/2,
        wid/2,
        mag/2,
        mig/2,
        intersection/3,
        hull/3
    ]).

    cover(interval_arithmetic).

    % new/3 tests
    test(interval_arithmetic_new_3_01, deterministic) :-
        new(1, 2, _).

    test(interval_arithmetic_new_3_02, deterministic) :-
        new(1, 1, _).

    test(interval_arithmetic_new_3_03, fail) :-
        new(3, 1, _).

    % is_in/2 tests
    test(interval_arithmetic_is_in_2_01, deterministic) :-
        new(1, 3, X),
        is_in(X, 2).

    test(interval_arithmetic_is_in_2_02, fail) :-
        new(1, 3, X),
        is_in(X, 0).

    test(interval_arithmetic_is_in_2_03, fail) :-
        new(1, 3, X),
        is_in(X, 4).

    % add/3 tests
    test(interval_arithmetic_add_3_01, deterministic(Sum == (4, 6))) :-
        new(1, 2, X),
        new(3, 4, Y),
        add(X, Y, Sum).

    test(interval_arithmetic_add_3_02, fail) :-
        new(1, 2, X),
        new(3, 4, Y),
        add(X, Y, Sum),
        Sum == (6, 7).

    % sub/3 tests
    test(interval_arithmetic_sub_3_01, deterministic(Sub == (-3, -1))) :-
        new(1, 2, X),
        new(3, 4, Y),
        sub(X, Y, Sub).

    test(interval_arithmetic_sub_3_02, fail) :-
        new(1, 2, X),
        new(3, 4, Y),
        sub(X, Y, Sub),
        Sub == (5, 6).

    % mul/3 tests
    test(interval_arithmetic_mul_3_01, deterministic(Mul == (3, 8))) :-
        new(1, 2, X),
        new(3, 4, Y),
        mul(X, Y, Mul).

    test(interval_arithmetic_mul_3_02, fail) :-
        new(1, 2, X),
        new(3, 4, Y),
        mul(X, Y, Mul),
        Mul == (1, 4).

    % div/3 tests
    test(interval_arithmetic_div_3_01, deterministic(Div == (0.2, 0.5))) :-
        new(1, 2, X),
        new(4, 5, Y),
        div(X, Y, Div).

    test(interval_arithmetic_div_3_02, fail) :-
        new(1, 2, X),
        new(4, 5, Y),
        div(X, Y, Div),
        Div == (0.2, 0.25).

    test(interval_arithmetic_div_3_03, fail) :-
        new(1, 2, X),
        new(-1, 1, Y),
        div(X, Y, _).

    % mid/2 tests
    test(interval_arithmetic_mid_2_01, deterministic) :-
        new(1, 2, X),
        mid(X, Mid),
        number::approximately_equal(Mid, 1.5, 0.01).

    test(interval_arithmetic_mid_2_02, fail) :-
        new(1, 2, X),
        mid(X, Mid),
        number::approximately_equal(Mid, 1.3, 0.01).

    % wid/2 tests
    test(interval_arithmetic_wid_2_01, deterministic(Wid == 2)) :-
        new(1, 3, X),
        wid(X, Wid).

    test(interval_arithmetic_wid_2_02, fail) :-
        new(1, 3, X),
        wid(X, Wid),
        Wid == 1.

    % mag/2 tests
    test(interval_arithmetic_mag_2_01, deterministic(Mag == 3)) :-
        new(-3, 2, X),
        mag(X, Mag).

    test(interval_arithmetic_mag_2_02, fail) :-
        new(-3, 2, X),
        mag(X, Mag),
        Mag == 2.

    % mig/2 tests
    test(interval_arithmetic_mig_2_01, deterministic(Mig == 2)) :-
        new(-3, 2, X),
        mig(X, Mig).

    test(interval_arithmetic_mig_2_02, fail) :-
        new(-3, 2, X),
        mig(X, Mig),
        Mig == 3.

    % intersection/3 tests
    test(interval_arithmetic_intersection_3_01, deterministic(Inter == (1, 2))) :-
        new(1, 2, X),
        new(0, 4, Y),
        intersection(X, Y, Inter).

    test(interval_arithmetic_intersection_3_02, fail) :-
        new(1, 2, X),
        new(3, 4, Y),
        intersection(X, Y, _).

    % hull/3 tests
    test(interval_arithmetic_hull_3_01, deterministic(Hull == (1, 4))) :-
        new(1, 2, X),
        new(3, 4, Y),
        hull(X, Y, Hull).

    test(interval_arithmetic_hull_3_02, deterministic(Hull == (0, 4))) :-
        new(1, 2, X),
        new(0, 4, Y),
        hull(X, Y, Hull).

:- end_object.
