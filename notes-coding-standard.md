# Recommended prolog coding standard

- variables begin with uppercase (required syntax)
```
Child
X
State_Marshal32
```
- atoms & predicates begin with lower case (required syntax)
```
foo(...) :- ...  % predicate
foo(cat).        % 'foo(cat)' and 'cat' are atoms
```
- no digit after the final name (`State` final, `StateX` intermediate)
```
foo(State0, State) :-
    foo_step(State0, State1),
    foo(State1, State)
```
- About `,`: space after args/params, no space after list elemen
```
[A,B,C]
foo(A, B, C).
```
- auxiliary predicates (help-predicates) should be suffixed using `_`.
```
foo(...) :- foo_aux(...), bar(...).
bar(...) :- bar_1(...), bar_2.
```
- predicates that tests a property or relation should have a name that is **not** a command to do something
```
has_sublists
sorted_matrix
contains_foo
```
- predicates that is best understood as an action, should have a name that **is** a command to do something
```
remove_first
output_as_str
```
