:- object(interval_arithmetic,
		implements(interval_arithmeticp)).

	new(Start, End, Interval) :-
        Start \= End,
        Start < End,
		Interval = [Start, End].

    	is_in([Xa, Xb], Number) :-
        	Xa =< Number,
        	Xb >= Number.

	add([Xa, Xb], [Ya, Yb], Sum) :-
		Za is Xa + Ya,
		Zb is Xb + Yb,
		Sum = [Za, Zb].

	sub([Xa, Xb], [Ya, Yb], Sub) :-
		Za is Xa - Yb,
		Zb is Xb - Ya,
		Sub = [Za, Zb].

	mul([Xa, Xb], [Ya, Yb], Mul) :-
        numberlist::min([Xa*Ya, Xa*Yb, Xb*Ya, Xb*Yb], Za),
        Zaa is Za,
        numberlist::max([Xa*Ya, Xa*Yb, Xb*Ya, Xb*Yb], Zb),
        Zbb is Zb,
		Mul = [Zaa, Zbb].

	div(X, [Ya, Yb], Div) :-
		\+is_in([Ya, Yb], 0),
		Za is 1.0/Yb,
		Zb is 1.0/Ya,
		mul(X, [Za, Zb], Div).

    mid([Xa, Xb], Mid) :-
        Mid is (Xb + Xa)/2.0.

    wid([Xa, Xb], Wid) :-
        Wid is Xb - Xa.

    abs([Xa, Xb], Abs) :-
        Abs is max(abs(Xa), abs(Xb)).

:- end_object.
