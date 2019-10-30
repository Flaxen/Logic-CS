
:- initialization main.

main :-
    current_prolog_flag(argv, [Arg1, Arg2]),
    [labb2],
    Arg2='invalid',
    \+verify(Arg1),

    write(Arg1),
    truePrint, halt.

main :-
    current_prolog_flag(argv, [Arg1, Arg2]),
    [labb2],
    Arg2='invalid',
    verify(Arg1),

    write(Arg1),
    falsePrint, halt.

main :-
  current_prolog_flag(argv, [Arg1, Arg2]),
  [labb2],
  Arg2='valid',
  verify(Arg1),

  write(Arg1),
  truePrint, halt.

main :-
  current_prolog_flag(argv, [Arg1, Arg2]),
  [labb2],
  Arg2='valid',
  \+verify(Arg1),

  write(Arg1),
  falsePrint, halt.


truePrint :-
  write(': passed'), nl.

falsePrint :-
  write(': failed'), nl.

























%
