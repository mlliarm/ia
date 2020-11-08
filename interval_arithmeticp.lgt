:- protocol(interval_arithmeticp).

    :- public([
        new/3,
        is_in/2,
        add/3,
        sub/3,
        mul/3,
        div/3
    ]).

:- end_protocol.
