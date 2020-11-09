
:- object(tests,
	extends(lgtunit)).

    :- uses(interval_arithmetic, [
        new/3,
        is_in/2,
        add/3,
        sub/3,
        mul/3,
        div/3,
        mid/2,
        wid/2,
        abs/2
    ]).

	cover(interval_arithmetic).

    % new/3 tests
	test(interval_arithmetic_new_3_01, deterministic) :-
		new(1, 2, _).

	test(interval_arithmetic_new_3_02, fail) :-
		new(1, 1, _).

    test(interval_arithmetic_new_3_03, fail) :-
        new(3, 1, _).

    % is_in/2 tests

    % add/3 tests

    % sub/3 tests

    % mul/3 tests

    % div/3 tests

    % mid/2 tests

    % wid/2 tests

    % abs/2 tests

:- end_object.
