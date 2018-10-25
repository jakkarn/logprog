
/* checking with helper funciton */
ee([], [], []).

ee([H1|T1], [H2|T2], Acc) :-
	dif(H1, H2), ee(T1, T2, Acc).

ee([H|T1], [H|T2], [H|Acc]) :-
	ee(T1, T2, Acc).

eethree(L1, L2) :- ee(L1, L2, [_,_,_]).

/* binding the result in ~'declaration'? not working. */
% ee3([], [], []).
%
% ee3([H1|T1], [H2|T2], [_,_,_]) :-
% 	dif(H1, H2), ee3(T1, T2, ).
%
% ee3([H|T1], [H|T2], [H,_,_]) :-
% 	ee3(T1, T2, [_,_]).
