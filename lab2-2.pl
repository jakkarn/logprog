/*
    lab 2.2 - search middle
*/

/*  strategies (X, Xs) */
/* X is the middle element in the list Xs */
middle0(X, [X]).
middle0(X, [First|Xs]) :-
	append(Middle, [Last], Xs),
	middle(X, Middle).

/* works */
middle1(X, [X]).
middle1(X, [First|Xs]) :-
	middle(X, Middle),
	append(Middle, [Last], Xs).

/* works */
middle2(X, [First|Xs]) :-
	append(Middle, [Last], Xs),
	middle(X, Middle).
middle2(X, [X]).

/* works */
middle3(X, [First|Xs]) :-
	middle(X, Middle),
	append(Middle, [_Last], Xs).
middle3(X, [X]).

:- nl, middle0(X, [4,3,2,1,22,33,44]), format('middle0 says: ~d', [X]).
:- nl, middle2(Y, [4,3,2,1,22,33,44]), format('middle1 says: ~d', [Y]).
:- nl, middle1(Z, [4,3,2,1,22,33,44]), format('middle2 says: ~d', [Z]).
:- nl, middle3(W, [4,3,2,1,22,33,44]), format('middle3 says: ~d', [W]).