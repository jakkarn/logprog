/*
    1.2 recursion
*/

/* facts - the graph representation (edges as facts about nodes) */
edge(a,b). edge(a,c).
edge(b,c).
edge(c,d). edge(c,e).
edge(d,f). edge(d,h).
edge(e,f). edge(e,g).
edge(f,g).

/*  path(N1, N2)
if there is a path from N1 to N2, then N1 and N2 has a path */
path(N1, N2) :- path(N1, N2, _).

/*  path(N1, N2, P)
if there is an edge from N1 to N2, then there is an empty path from N1 to N2 */
path(N1, N2, []) :- edge(N1, N2).

/*  path(N1, N2, P)
if there is an edge between N1 and some other element X and there is a path
P2 from X to N2, then there is a path P from N1 and N2 */
path(N1, N2, [X|P2]) :- edge(N1, X), path(X, N2, P2).

/* npath(N1, N2, LEN)
if there is a path between N1 and N2 then LEN is the length of that path */
npath(N1, N2, LEN) :- path(N1, N2, P), length(P, LEN).

/* OUTPUT */
printpath([]) :- format(" -> ", []).
printpath([X]) :- format(" -> ", []), write(X), format(" -> ", []).
printpath([X|T]) :- format(" -> ", []), write(X), printpath(T).

:- tell('./lab1-2-out.txt').
% :- findall(P, path(X,Y,P), L), (foreach(E, L) do printpath(E), nl).
:- findall((X,Y,P), path(X,Y,P), L),
	(foreach((X1,Y1,P1), L) do write(X1), printpath(P1), write(Y1), nl).
:- told.

% :- (foreach(X, [1,2,3]) do write(X), nl).
% :- findall(P, path(X,Y,P), L).
% :- format(" print this as string ", []).

% :- halt(0).
