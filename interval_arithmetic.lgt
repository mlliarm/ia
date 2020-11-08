:- object(interval_arithmetic,
		implements(interval_arithmeticp)).

	new(Start, End, Interval) :-
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
		Za is min(min(Xa*Ya, Xa*Yb), min(Xb*Ya, Xb*Yb)),
		Zb is max(max(Xa*Ya, Xa*Yb), max(Xb*Ya, Xb*Yb)),
		Mul = [Za, Zb].

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
