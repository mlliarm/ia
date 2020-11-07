%:- multifile(logtalk_library_path/2).
%:- dynamic(logtalk_library_path/2).

:- initialization(
	%logtalk_library_path(ia, '/home/milia/Documents/dev/logtalk/ia').
	logtalk_load([interval_arithmetic, interval_arithmeticp], [optimize(on)]
).
