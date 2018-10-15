/*
    lab 2.1 - sorting
*/

/* if L is a list of numbers, then L is sorted */
issorted([_]).
issorted([X1,X2|T]) :- X1@=<X2, issorted([X2|T]).

/** if there are no elements then the smallest found element is the resulting s
    mallest **/
smallest([], Small, Smallest, AccRest) :- Smallest = Small, AccRest = [].

smallest([H|T], Small, Smallest, [NotSmall|AccRest]) :-
    H@=<Small ->
        smallest(T, H, Smallest, AccRest),      NotSmall=Small;
        smallest(T, Small, Smallest, AccRest),  NotSmall=H.

smallest([H|T], Smallest, AccRest) :- smallest(T, H, Smallest, AccRest).

/** Selection sort **/

selsort([], []).

selsort(Mixed, [Smallest|Sorted]) :-
    smallest(Mixed, Smallest, Rest),
    selsort(Rest, Sorted).

/* quicksort */
partition([], _Pivot, [], []).

partition([H|T], Pivot, Left, Right) :-
    H@=<Pivot,
        append([H], SubLeft, Left),
        partition(T, Pivot, SubLeft, Right);
    H@>Pivot,
        append([H], SubRight, Right),
        partition(T, Pivot, Left, SubRight).

quicksort([], []).

quicksort(Mixed, Sorted) :-
    random_member(Pivot, Mixed),
    partition(Mixed, Pivot, Left, Right),
    quicksort(Left, SortedLeft),
    quicksort(Right, SortedRight),
    append(SortedLeft, SortedRight, Sorted).
