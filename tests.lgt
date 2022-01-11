%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%  Copyright 2020-2022 Michail Liarmakopoulos <mlliarm@yandex.com>
%  Copyright 2020-2022 Paulo Moura <pmoura@logtalk.org>
%  SPDX-License-Identifier: Apache-2.0
%
%  Licensed under the Apache License, Version 2.0 (the "License");
%  you may not use this file except in compliance with the License.
%  You may obtain a copy of the License at
%
%      http://www.apache.org/licenses/LICENSE-2.0
%
%  Unless required by applicable law or agreed to in writing, software
%  distributed under the License is distributed on an "AS IS" BASIS,
%  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
%  See the License for the specific language governing permissions and
%  limitations under the License.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


:- object(tests,
	extends(lgtunit)).

	:- info([
		version is 0:2:0,
		author is 'Michail Liarmakopoulos and Paulo Moura',
		date is 2022-01-11,
		comment is 'Tests for the interval arithmetic library.'
	]).

	:- uses(interval_arithmetic, [
		new/3,
		is_in/2,
		add/3,
		subtract/3,
		multiply/3,
		divide/3,
		midpoint/2,
		width/2,
		magnitude/2,
		mignitude/2,
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

	% subtract/3 tests
	test(interval_arithmetic_subtract_3_01, deterministic(Sub == (-3, -1))) :-
		new(1, 2, X),
		new(3, 4, Y),
		subtract(X, Y, Sub).

	test(interval_arithmetic_subtract_3_02, fail) :-
		new(1, 2, X),
		new(3, 4, Y),
		subtract(X, Y, Sub),
		Sub == (5, 6).

	% multiply/3 tests
	test(interval_arithmetic_multiply_3_01, deterministic(Mul == (3, 8))) :-
		new(1, 2, X),
		new(3, 4, Y),
		multiply(X, Y, Mul).

	test(interval_arithmetic_multiply_3_02, fail) :-
		new(1, 2, X),
		new(3, 4, Y),
		multiply(X, Y, Mul),
		Mul == (1, 4).

	% divide/3 tests
	test(interval_arithmetic_divide_3_01, deterministic(Div == (0.2, 0.5))) :-
		new(1, 2, X),
		new(4, 5, Y),
		divide(X, Y, Div).

	test(interval_arithmetic_divide_3_02, fail) :-
		new(1, 2, X),
		new(4, 5, Y),
		divide(X, Y, Div),
		Div == (0.2, 0.25).

	test(interval_arithmetic_divide_3_03, fail) :-
		new(1, 2, X),
		new(-1, 1, Y),
		divide(X, Y, _).

	% midpoint/2 tests
	test(interval_arithmetic_midpoint_2_01, deterministic) :-
		new(1, 2, X),
		midpoint(X, Mid),
		number::approximately_equal(Mid, 1.5, 0.01).

	test(interval_arithmetic_midpoint_2_02, fail) :-
		new(1, 2, X),
		midpoint(X, Mid),
		number::approximately_equal(Mid, 1.3, 0.01).

	% width/2 tests
	test(interval_arithmetic_width_2_01, deterministic(Wid == 2)) :-
		new(1, 3, X),
		width(X, Wid).

	test(interval_arithmetic_width_2_02, fail) :-
		new(1, 3, X),
		width(X, Wid),
		Wid == 1.

	% magnitude/2 tests
	test(interval_arithmetic_magnitude_2_01, deterministic(Mag == 3)) :-
		new(-3, 2, X),
		magnitude(X, Mag).

	test(interval_arithmetic_magnitude_2_02, fail) :-
		new(-3, 2, X),
		magnitude(X, Mag),
		Mag == 2.

	% mignitude/2 tests
	test(interval_arithmetic_mignitude_2_01, deterministic(Mig == 2)) :-
		new(-3, 2, X),
		mignitude(X, Mig).

	test(interval_arithmetic_mignitude_2_02, fail) :-
		new(-3, 2, X),
		mignitude(X, Mig),
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
