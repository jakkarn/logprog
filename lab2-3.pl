/* 2.3 - an abstract machine */

/* commands:   */
/* skip        */
%skip

/* set(I, E)   */
set(I, E).

/* if(B, C, C) */
%if(B, C, C).

/* while(B, C) */
while(B, C).

/* seq(C, C)   */
seq(C, C).

/* id(I)       */
/* num(N)      */

/* binding environment for identifiers:
   [i = n, i2=n2,...]                      */
/* boolean expressions:
   tt, ff, E > E, ...                      */
/* arithmetic expressions:
   id(I), num(N), E + E, E - E, E * E, ... */
   
/*
   execute(S0, P, Sn)

   if S0 is a list representing the initial binding environment
   for identifiers and P is the command to run, then Sn is the
   resulting binding environment when the command P is run */
execute(_S0, P, _Sn) :- call(P).