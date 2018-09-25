path(N1, N2) :- path(N1, N2).
path(N1, N2) :- path(N1, _, N2).

path(N1, P, N2) :- path(N1, N2).
path(N1, p(N1, N2), N2) :- path(N1, )
