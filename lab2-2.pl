/*  middle (X, Xs) */
/* X is the middle element in the list Xs */
% middle(X, [X]).
% middle(X, [First|Xs]) :-
% 	middle(X, Middle),
% 	append(Middle, [Last], Xs).

/* this order loops indefinitely */
% middle(X, [X]).
% middle(X, [First|Xs]) :-
% 	middle(X, Middle),
% 	append(Middle, [Last], Xs).

/*  */
middle(X, [First|Xs]) :-
	append(Middle, [Last], Xs),
	middle(X, Middle).
middle(X, [X]).

/*  */
% middle(X, [First|Xs]) :-
% 	middle(X, Middle),
% 	append(Middle, [Last], Xs).
% middle(X, [X]).

:- nl, middle(X, [5,9,6,404,7,2,3]), format("middle element: ~a", [X]).