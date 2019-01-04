/*
    lab 2.2 - search strategies
*/

/* middle(X, Xs) */
/* X is the middle element in the list Xs */
middle0(X, [X]).
middle0(X, [First|Xs]) :-
	append(Middle, [Last], Xs),
	middle0(X, Middle).

/* didn't finish nine elem list */
middle1(X, [X]).
middle1(X, [First|Xs]) :-
	middle1(X, Middle),
	append(Middle, [Last], Xs).

/* works */
middle2(X, [First|Xs]) :-
	append(Middle, [Last], Xs),
	middle2(X, Middle).
middle2(X, [X]).

/* didn't finish nine elem list */
middle3(X, [First|Xs]) :-
	middle3(X, Middle),
	append(Middle, [Last], Xs).
middle3(X, [X]).