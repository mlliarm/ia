%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%  Sample tester file
%  Last updated on May 21, 2017
%
%  This file is part of Logtalk <https://logtalk.org/>
%  Copyright 1998-2020 Paulo Moura <pmoura@logtalk.org>
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


%  This is a sample test suite file to help you get started. Test suite files
%  are Logtalk source files defining a set of tests. The tests are usually
%  run with the help of a loader file, usually named "tester.logtalk" or
%  "tester.lgt", that loads the unit testing framework, the code to be tested,
%  and the test suite file. See the "tester-sample.lgt" file for details.

%  The unit testing framework can be found in the "tools/lgtunit" directory.
%  For an overview of its features, see the "tools/lgtunit/NOTES.md" file.
%  For API details, open the "docs/index.html" file in your web browser.
%  See also the "testing" example, which illustrates the tests dialects
%  supported by default by the "lgtunit" tool


%  test suite objects are defined as prototypes extending the "lgtunit" object
%  which implements the unit test framework; parametric objects can be used
%  in order to define parametrizable tests

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

	% if you want to collect code coverage information, add one clause
	% for the cover/1 predicate for which entity that should be covered
	% and compile the code that is being tested in debug mode

	cover(interval_arithmetic).

	% several test dialects are supported with the most simple one being
	% test/1; its argument is the test name, which must be unique in a
	% test suite object; the test goal must succeed for the test to be
	% successful


    % new/3 tests
	test(interval_arithmetic_new_3_01, deterministic) :-
		new(1, 2, _).

	test(interval_arithmetic_new_3_02, fail) :-
		new(1, 1, _).

    test(interval_arithmetic_new_3_03, fail) :-
        new(3, 1, _).

	% the "lgtunit" tool supports other, more expressive, test dialects
	% allowing e.g. testing for expected errors, determinism, defining
	% setup and cleanup goals, etc; see its documentation for details

:- end_object.