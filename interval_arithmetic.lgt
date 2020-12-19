:- object(interval_arithmetic,
    implements(interval_arithmeticp)).

    % new/3, creates an interval Interval.
    new(Start, End, Interval) :-
        Start =< End,
        Interval = (Start, End).

    % is_in/2, returns if a number Number is included in a closed interval (Xa, Xb).
    is_in((Xa, Xb), Number) :-
        Xa =< Number,
        Xb >= Number.

    % add/3, adds two intervals.
    add((Xa, Xb), (Ya, Yb), Sum) :-
        Za is Xa + Ya,
        Zb is Xb + Yb,
        Sum = (Za, Zb).

    % sub/3, subtracts two intervals.
    sub((Xa, Xb), (Ya, Yb), Sub) :-
        Za is Xa - Yb,
        Zb is Xb - Ya,
        Sub = (Za, Zb).

    % mul/3, multiplies two intervals.
    mul((Xa, Xb), (Ya, Yb), Mul) :-
        S = [Xa*Ya, Xa*Yb, Xb*Ya, Xb*Yb], 
        numberlist::min(S, Za),
        Zaa is Za,
        numberlist::max(S, Zb),
        Zbb is Zb,
        Mul = (Zaa, Zbb).

    % div/3, divides two intervals (X/Y)
    %        assuming that 0 isn't included in Y.
    div(X, (Ya, Yb), Div) :-
        \+is_in((Ya, Yb), 0),
        Za is 1.0/Yb,
        Zb is 1.0/Ya,
        mul(X, (Za, Zb), Div).

    % mid/2, calculates the midpoint of an interval (Xa, Xb).
    mid((Xa, Xb), Mid) :-
        Mid is (Xb + Xa)/2.0.

    % wid/2, calculates the width of an interval.
    wid((Xa, Xb), Wid) :-
        Wid is Xb - Xa.

    % mag/2, calculates the magnitude (absolute value) of an interval.
    mag((Xa, Xb), Mag) :-
        Mag is max(abs(Xa), abs(Xb)).

    % mig/2, calculates the mignitude of an interval.
    mig((Xa, Xb), Mig) :-
        Mig is min(abs(Xa), abs(Xb)).

    % intersection/3, calculates the intersection of two intervals.
    intersection((Xa, Xb), (Ya, Yb), Inter) :-
        Za is max(Xa, Ya),
        Zb is min(Xb, Yb),
        new(Za, Zb, Inter).

    % hull/3, calculates the interval hull of two intervals.
    hull((Xa, Xb), (Ya, Yb), Hull) :-
        Za is min(Xa, Ya),
        Zb is max(Xb, Yb),
        new(Za, Zb, Hull).

:- end_object.
