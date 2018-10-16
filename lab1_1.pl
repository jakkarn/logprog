/*
    1.1 deductive database in definite clause form
*/

/* female facts */
female(ulrika).
female(anne).

/* male facts */
male(nisse).
male(peter).
male(bosse).

/* Beautiful facts */
beautiful(ulrika).
beautiful(nisse).
beautiful(peter).

/* rich facts */
rich(nisse).
rich(anne).

/* strong facts */
strong(anne).
strong(peter).
strong(bosse).

/* kind facts */
kind(bosse).

/* 7. all rich people are happy */
happy(X) :- rich(X).

/* 8. All men who like a woman who likes him are happy */
happy(X) :- male(X), female(X), likes(X, Y), likes(Y, X).

/* 9. all women who like a man who likes her are happy */
happy(X) :- female(X), male(Y), likes(X, Y), likes(Y, X).

/* 6. all men likes beautiful women */
likes(X, Y) :- male(X), female(Y), beautiful(Y).

/* 10. nisse likes all women who like him */
likes(nisse, X) :-  female(X), likes(X, nisse).

/* 11. peter likes everyone who is kind */
likes(peter, X) :- kind(X).

/*12. ulrika likes all men who likes her, provided that they are either:
    a. rich and kind
    b. beautiful and strong */
likes(ulrika, X) :- male(X), rich(X), kind(X), likes(X, ulrika).        % a
likes(ulrika, X) :- male(X), beautiful(X), strong(X), likes(X, ulrika). % b

:- tell('./lab1-1-out.txt').
:- format("QUERY (who is happy?) 'happy(X)':", []), nl.
:- findall(X, happy(X), L),
	(foreach(E, L) do format("~a is happy", [E]), nl).
:- nl, format("QUERY (who likes whom?) 'likes(X, Y)':", []), nl.
:- findall((X,Y), likes(X,Y), L),
	(foreach((X1,Y1), L) do format("~a likes ~a", [X1, Y1]), nl).
:- nl, format("QUERY (who likes ulrika?) 'likes(X, ultika)':", []), nl.
:- findall(X, likes(X,ulrika), L),
	(foreach(E, L) do format("~a likes Ulrika", [E]), nl).
:- told.
