
:- initialization((
	logtalk_load(types(loader)),
	logtalk_load([
		interval_arithmeticp,
		interval_arithmetic
	], [
		optimize(on)
	])
)).
