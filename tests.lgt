%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%  Tester file
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
