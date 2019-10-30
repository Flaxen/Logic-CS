
:- initialization main.

main :-
    current_prolog_flag(argv, [Arg1, Arg2]),
    [labb2],
    Arg2='invalid',
    write(Arg1),nl,
    write('nej'), nl,

    \+verify(Arg1) 
main :-
  current_prolog_flag(argv, [Arg1, Arg2]),
  [labb2],
  Arg2='valid',
  write(Arg1),nl,
  write('validlol'), nl,

  verify(Arg1) -> truePrint, halt; falsePrint, halt.



truePrint :-
  write(': passed'), nl.

falsePrint :-
  write(': failed'), nl.

























%
