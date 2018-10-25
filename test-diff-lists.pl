/*
    Difference list:
    a list that represents a list paired with some rest X. It is interpreted
    as the list [t1, ... tn|X] without the X.

        [t1, ... tn|X]-X  is a difference list
*/

/* if X-Y and Y-Z are diff-lists then Z-X is the concatenation of the two */
append_dl( X-Y, Y-Z, Z-X).
