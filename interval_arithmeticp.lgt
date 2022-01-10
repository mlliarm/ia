:- protocol(interval_arithmeticp).

    :- public([
        new/3,
        is_in/2,
        add/3,
        sub/3,
        mul/3,
        (div)/3,
        mid/2,
        wid/2,
        mag/2,
        mig/2,
        intersection/3,
        hull/3
    ]).

:- end_protocol.
