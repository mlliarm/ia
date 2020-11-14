:- initialization((
    set_logtalk_flag(report, warnings),
    logtalk_load(lgtunit(loader)),
    logtalk_load([interval_arithmeticp, interval_arithmetic], [source_data(on), debug(on)]),
    logtalk_load(tests, [hook(lgtunit)]),
    tests::run
)).
