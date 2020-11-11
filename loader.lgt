:- use_module(library(numberlist), []).

:- initialization(
	logtalk_load([
		interval_arithmeticp,
		interval_arithmetic
	], [
		optimize(on)
	])
).
