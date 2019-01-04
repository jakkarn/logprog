/*
    Difference list:
    a list that represents a list paired with some rest X. It is interpreted
    as the list [t1, ... tn|X] without the X.

        [t1, ... tn|X]-X  is a difference list

   example: call append_dl

        append_dl([a,b,c|_A]-_A, [1,2|_B]-_B, X-_Y).
                        X     Y      Y     Z

   example: call append_dl (generate a real list)

       append_dl([a,b,c|_A]-_A, [1,2|[]]-_B, X-_Y).
*/

/* if X-Y and Y-Z are diff-lists then X-Z is the concatenation of the two */
append_dl(X-Y, Y-Z, X-Z).