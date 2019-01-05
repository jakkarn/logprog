/* 2.3 - an abstract machine */

/* commands:   */
/* skip        */
%skip

/* set(I, E) */
% set(I, E).


% if(B, Cmd1, Cmd2) :- B, call(Cmd1). % if B
% if(B, Cmd1, Cmd2) :- call(Cmd2).    % else

/* while(B, C) */
% while(B, C) :- B, call(C), while(B, C)..

/* id(I)       */
/* num(N)      */

/*
   binding environment for identifiers:
   [i = n, i2=n2,...]

   Key is nonvar and not a compound (can be a number), Data is a number.
*/
bind(Key, Data, S0, [Key-Data|S0]) :-
	atomic(Key), number(Data).

/* boolean expressions:
   tt, ff, E > E, ...                      */
/* arithmetic expressions:
   id(I), num(N), E + E, E - E, E * E, ... */
   
/*
   execute(S0, P, Sn)

   if S0 is a list representing the initial binding environment
   for identifiers and P is the command to run, then Sn is the
   resulting binding environment when the command P is run
*/
execute(_, skip, _). % TODO: bind environments

execute(S0, set(I, E), S1) :- bind(I, E, S0, S1).

/*
    seq(C1, C2)

    if C1 and C2 are callable symbols, then seq(C1, C2) is
    the relation describing a sequential execution of these
    two commands
*/
execute(S0, seq(Cmd1, Cmd2), S2) :-
	execute(S0, Cmd1, S1), execute(S1, Cmd2, S2).

/*
   if(B, C1, C2)

   if B is true, C1 and C2 are callable symbols, then C1 is called, if B is
   false, C2 is called.
*/
execute(S0, if(Bool, Cmd1, Cmd2), S1) :-
	Bool, execute(S0, Cmd1, S1)
	;
	execute(S0, Cmd2, S2).

execute(_, _, _) :- format("ERROR: no matching command found", []), nl.