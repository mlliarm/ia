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


:- protocol(interval_arithmetic_protocol).

	:- info([
		version is 0:3:0,
		author is 'Michail Liarmakopoulos and Paulo Moura',
		date is 2022-01-11,
		comment is 'Interval arithmetic protocol.'
	]).

	:- public(new/3).
	:- mode(new(@number, @number, -interval), zero_or_one).
	:- info(new/3, [
		comment is 'Constructs a new interval given start and end points. The start point must precede the end point.',
		argnames is ['Start', 'End', 'Interval']
	]).

	:- public(midpoint/2).
	:- mode(midpoint(@interval, -number), zero_or_one).
	:- info(midpoint/2, [
		comment is 'Computes the midpoint of the given interval.',
		argnames is ['Interval', 'Midpoint']
	]).

	:- public(width/2).
	:- mode(width(@interval, -number), zero_or_one).
	:- info(width/2, [
		comment is 'Computes the width of the given interval.',
		argnames is ['Interval', 'Width']
	]).

	:- public(magnitude/2).
	:- mode(magnitude(@interval, -number), zero_or_one).
	:- info(magnitude/2, [
		comment is 'Computes the magnitude of the given interval.',
		argnames is ['Interval', 'Magnitude']
	]).

	:- public(mignitude/2).
	:- mode(mignitude(@interval, -number), zero_or_one).
	:- info(mignitude/2, [
		comment is 'Computes the mignitude of the given interval.',
		argnames is ['Interval', 'Mignitude']
	]).

	:- public(intersection/3).
	:- mode(intersection(@interval, @interval, -interval), zero_or_one).
	:- info(intersection/3, [
		comment is 'Computes the intersection of two intervals.',
		argnames is ['Interval1', 'Interval2', 'Intersection']
	]).

	:- public(hull/3).
	:- mode(hull(@interval, @interval, -interval), zero_or_one).
	:- info(hull/3, [
		comment is 'Computes the the interval hull of two intervals.',
		argnames is ['Interval1', 'Interval2', 'Hull']
	]).

	:- public([
		is_in/2,
		add/3,
		subtract/3,
		multiply/3,
		divide/3
	]).

:- end_protocol.
