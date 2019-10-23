
:- initialization main.

main :-
    current_prolog_flag(argv, [Arg|_]),
    [labb2],

    write(Arg),
    verify(Arg) -> truThing, halt ; falsThing, halt.



truThing :-
  write(': passed'), nl.


falsThing :-
  write(': failed'), nl.

























%
