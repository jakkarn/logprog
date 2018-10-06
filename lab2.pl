/*
    lab 2.1 - sorting
*/

/* if L is a list of numbers, then L is sorted */
issorted([]).
%one element though...
issorted([X1,X2|T]) :- X1@<X2, issorted([X2|T]).
