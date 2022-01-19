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
		version is 0:5:0,
		author is 'Michail Liarmakopoulos and Paulo Moura',
		date is 2022-01-19,
		comment is 'Tests for the interval arithmetic library.'
	]).

	:- uses(interval_arithmetic, [
		new/3,
		is_in/2,
		add/3,
		add_n/3,
		sub/3,
		mul/3,
		(div)/3,
		mid/2,
		rad/2,
		wid/2,
		mag/2,
		mig/2,
		inter/3,
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
		is_in(2, X).

	test(interval_arithmetic_is_in_2_02, fail) :-
		new(1, 3, X),
		is_in(0, X).

	test(interval_arithmetic_is_in_2_03, fail) :-
		new(1, 3, X),
		is_in(4, X).

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

	% add_n/3 tests
	test(interval_arithmetic_add_n_3_01, deterministic(Sum == (4, 5))) :-
		new(3, 4, Y),
		add_n(1, Y, Sum).

	test(interval_arithmetic_add_n_3_02, fail) :-
		new(3, 4, Y),
		add_n(1, Y, Sum),
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

	% (div)/3 tests
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

	% rad/2 tests
	test(interval_arithmetic_rad_2_01, deterministic) :-
		new(1, 2, X),
		rad(X, Rad),
		number::approximately_equal(Rad, 0.5, 0.01).

	test(interval_arithmetic_rad_2_02, fail) :-
		new(1, 2, X),
		rad(X, Rad),
		number::approximately_equal(Rad, 0.3, 0.01).

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
	test(interval_arithmetic_mig_2_01, deterministic(Mig == 0)) :-
		new(-3, 2, X),
		mig(X, Mig).

	test(interval_arithmetic_mig_2_02, fail) :-
		new(-3, 2, X),
		mig(X, Mig),
		Mig == 3.

	test(interval_arithmetic_mig_2_03, deterministic(Mig == 0)) :-
		new(-3, 2, X),
		mig(X, Mig).

	test(interval_arithmetic_mig_2_04, fail) :-
		new(1, 2, X),
		mig(X, Mig),
		Mig == 0.

	% inter/3 tests
	test(interval_arithmetic_inter_3_01, deterministic(Inter == (1, 2))) :-
		new(1, 2, X),
		new(0, 4, Y),
		inter(X, Y, Inter).

	test(interval_arithmetic_inter_3_02, fail) :-
		new(1, 2, X),
		new(3, 4, Y),
		inter(X, Y, _).

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
