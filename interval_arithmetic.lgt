:- object(interval_arithmetic,
		implements(interval_arithmeticp)).

	new(Start, End, Interval) :-
		Interval = [Start, End].

    	is_in([Xa, Xb], Number) :-
        	Xa <= Number,
        	Xb >= Number.

	add([Xa, Xb], [Ya, Yb], Sum) :-
		Wa is Xa + Ya,
		Wb is Xb + Yb,
		Sum = [Wa, Wb].

	sub([Xa, Xb], [Ya, Yb], Sub) :-
		Wa is Xa - Yb,
		Wb is Xb - Ya,
		Sub = [Wa, Wb].

	mul([Xa, Xb], [Ya, Yb], Mul) :-
		Wa is min(min(Xa*Ya, Xa*Yb), min(Xb*Ya, Xb*Yb)),
		Wb is max(max(Xa*Ya, Xa*Yb), max(Xb*Ya, Xb*Yb)),
		Mul = [Wa, Wb].

	div(X, [Ya, Yb], Div) :-
		not(is_in([Ya, Yb], 0)),
		Za is 1.0/Yb,
		Zb is 1.0/Ya,
		mul(X, [Za, Zb], Div).

:- end_object.
