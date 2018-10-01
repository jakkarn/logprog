path(a,b).
path(b,c).


path(X, X, []).

% jonas: don't need this line
path(N1, N2, [N1, N2]) :- path(N1, N2).

path(N1, N2, [X|P2]) :- path(N1, X), path(X, N2, P2).
%              ^return
