

ee([], [], []).

ee([H1|T1], [H2|T2], Acc) :-
	dif(H1, H2), ee(T1, T2, Acc).

ee([H|T1], [H|T2], [H|Acc]) :-
	ee(T1, T2, Acc).

eethree(L1, L2) :- ee(L1, L2, [_,_,_]).