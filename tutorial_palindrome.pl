% append(X,Y,Y,Z,X,Z).
% append([a,b,c|A], A, [1,2|B], B, X, Y).
%
% append(X,Y,[X|Y])
%
% append([], A, [A]).
% append(L, A, [A|L]).
%
% palindrome([_]).
% palindrome([X|T]) :- palindome([T]),


app([], L2, L2).
app([H|T], L2, [H|R]) :-
    app(T, L2, R).

% [1,2,3], [a,b,c], [1,2,3,a,b,c]

% T must be a list! [H|[a,b,c]] is ok, [H|a,b,c] is not

% reverseList(L, RL). if L is a list, then RL is that list in reverse
reverseList([H|T], RL) :- reverseList(T, [H], RL).


reverseList([H|T], Acc, RL) :-
    reverseList(T, [H|Acc], RL).


reverseList([],Acc, Acc).
