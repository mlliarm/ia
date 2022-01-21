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
%	  http://www.apache.org/licenses/LICENSE-2.0
%
%  Unless required by applicable law or agreed to in writing, software
%  distributed under the License is distributed on an "AS IS" BASIS,
%  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
%  See the License for the specific language governing permissions and
%  limitations under the License.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


:- object(interval_arithmetic,
	implements(interval_arithmetic_protocol)).

	:- info([
		version is 0:6:0,
		author is 'Michail Liarmakopoulos and Paulo Moura',
		date is 2022-01-21,
		comment is 'Interval arithmetic library predicates.'
	]).

	:- alias(interval_arithmetic_protocol, [
		subtract/3  as sub/3,
		multiply/3  as mul/3,
		divide/3    as (div)/3,
		midpoint/2  as mid/2,
		radius/2    as rad/2,
		width/2     as wid/2,
		magnitude/2 as mag/2,
		mignitude/2 as mig/2,
		intersection/3 as inter/3
	]).

	sub(Interval1, Interval2, Interval) :-
		subtract(Interval1, Interval2, Interval).

	mul(Interval1, Interval2, Interval) :-
		multiply(Interval1, Interval2, Interval).

	div(Interval1, Interval2, Interval) :-
		divide(Interval1, Interval2, Interval).

	mid(Interval, Midpoint) :-
		midpoint(Interval, Midpoint).

	rad(Interval, Radius) :-
		radius(Interval, Radius).

	wid(Interval, Width) :-
		width(Interval, Width).

	mag(Interval, Magnitude) :-
		magnitude(Interval, Magnitude).

	mig(Interval, Mignitude) :-
		mignitude(Interval, Mignitude).

	inter(Interval1, Interval2, Interval) :-
		intersection(Interval1, Interval2, Interval).

	% new/3, creates an interval Interval.
	new(Start, End, Interval) :-
		Start =< End,
		Interval = i(Start, End).

	% is_in/2, returns if a number Number is included in a closed interval i(Xa, Xb).
	is_in(Number, i(Xa, Xb)) :-
		Xa =< Number,
		Xb >= Number.

	% add/3, adds two intervals.
	add(i(Xa, Xb), i(Ya, Yb), Sum) :-
		Za is Xa + Ya,
		Zb is Xb + Yb,
		new(Za, Zb, Sum).

	% add_n/3, adds a number and an interval.
	add_n(N, i(Xa, Xb), Sum) :-
		Za is N + Xa,
		Zb is N + Xb,
		new(Za, Zb, Sum).

	% subtract/3, subtracts two intervals.
	subtract(i(Xa, Xb), i(Ya, Yb), Sub) :-
		Za is Xa - Yb,
		Zb is Xb - Ya,
		new(Za, Zb, Sub).

	% mul/3, multiplies two intervals.
	multiply(i(Xa, Xb), i(Ya, Yb), Mul) :-
		S = [Xa*Ya, Xa*Yb, Xb*Ya, Xb*Yb],
		numberlist::min(S, Za),
		Zaa is Za,
		numberlist::max(S, Zb),
		Zbb is Zb,
		new(Zaa, Zbb, Mul).

	% divide/3, divides two intervals (X/Y)
	%		assuming that 0 isn't included in Y.
	divide(X, i(Ya, Yb), Div) :-
		\+ is_in(0, i(Ya, Yb)),
		Za is 1.0/Yb,
		Zb is 1.0/Ya,
		mul(X, i(Za, Zb), Div).

	% midpoint/2, calculates the midpoint of an interval (Xa, Xb).
	midpoint(i(Xa, Xb), Mid) :-
		Mid is (Xb + Xa)/2.0.

	% radius/2, calculates the radius of an interval.
	radius(i(Xa, Xb), Rad) :-
		Rad is (Xb - Xa)/2.0.

	% width/2, calculates the width of an interval.
	width(i(Xa, Xb), Wid) :-
		Wid is Xb - Xa.

	% magnitude/2, calculates the magnitude (absolute value) of an interval.
	magnitude(i(Xa, Xb), Mag) :-
		Mag is max(abs(Xa), abs(Xb)).

	% mignitude/2, calculates the mignitude of an interval.
	mignitude(i(Xa, Xb), Mig) :-
		\+ is_in(0, i(Xa, Xb)),
		Mig is min(abs(Xa), abs(Xb)),!.

	mignitude(i(Xa, Xb), Mig) :-
		is_in(0, i(Xa, Xb)),
		Mig is 0.

	% intersection/3, calculates the intersection of two intervals.
	intersection(i(Xa, Xb), i(Ya, Yb), Inter) :-
		Za is max(Xa, Ya),
		Zb is min(Xb, Yb),
		new(Za, Zb, Inter).

	% hull/3, calculates the interval hull of two intervals.
	hull(i(Xa, Xb), i(Ya, Yb), Hull) :-
		Za is min(Xa, Ya),
		Zb is max(Xb, Yb),
		new(Za, Zb, Hull).

:- end_object.
