:- protocol(interval_arithmeticp).

    :- public([
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

:- end_protocol.
