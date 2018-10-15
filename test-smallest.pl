/** base case **/
smallest([], Small, Res) :- Res = Small.

/* if w. two clauses (exclusive or) */
% smallest([H|T], Small, Res) :-
%     H@=<Small, smallest(T, H, Res).
% smallest([H|T], Small, Res) :-
%     H@>Small, smallest(T, Small, Res);

/* if with logical or (beware of both true) */
% smallest([H|T], Small, Res) :-
%     H@=<Small, smallest(T, H, Res);
%     H@>Small, smallest(T, Small, Res).

/* if-else with syntactic sugar (beware of three or more cases) */
smallest([H|T], Small, Res) :-
    H@=<Small ->    smallest(T, H, Res);
                    smallest(T, Small, Res).

/** top wrapper **/
smallest([H|T], Res) :- smallest(T, H, Res).
