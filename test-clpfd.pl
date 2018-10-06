:- use_module(library(clpfd)).

ans(X, Y):- X#<Y, [X,Y] ins 1..2.

:- forall(ans(X,2), (write(X), nl)).
:- halt(0).
