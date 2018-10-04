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

/* OUTPUT */

printpath([]).
printpath([X|T]) :- write(X), write(" -> "), printpath(T).

:- write("QUERY> path(X,Y). (is there a path?)"),
    nl, forall(path(X,Y), (write(X), write(" -> ... "), write(Y), nl)).

:- nl, write("QUERY> path(X,Y,P). (what are the paths?)"),
    nl, forall( path(X,Y,P),
    (       write(X), write(" -> "),
            printpath(P),
            write(Y), nl)).

:- halt(0).
