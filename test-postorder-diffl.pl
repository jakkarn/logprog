postorder(lf, L-L).

postorder(tr(T1, U, T2), A-B):-
	postorder(T1, A-C), C=[U|D], postorder(T2, D-B).

/*
    traverse tree in postorder, that is leftleaf->root->rightleaf->root(root)...

    example call:

        postorder(tr(tr(lf,a,tr(lf,cat, lf)),b,tr(lf,c,lf)), L-_X).
*/