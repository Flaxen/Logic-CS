% For SICStus, uncomment line below: (needed for member/2)
%:- use_module(library(lists)).



% Help functions

% AX
% CheckAdj
%  X - constant/påstående
%  L - sanningsvärdena för tilstånden
%   [H|T] - listan med granar
checkAdj(_, _, []).
checkAdj(X, L, [H|T]) :-
  check(_, L, H, [], X),
  checkAdj(X, L, T).

% AG
% CheckAdjB
checkAdjB(_, _, []).
checkAdjB(X, L, [H|T]) :-
  check(_, L, H, [], X),
  checkAdjB(X, L, T).



% Load model, initial state and formula from file.
verify(Input) :-
  see(Input), read(T), read(L), read(S), read(F), seen,
  check(T, L, S, [], F).

% check(T, L, S, U, F)
%     T - The transitions in form of adjacency lists
%     L - The labeling saningsvärden
%     S - Current state
%     U - Currently recorded states
%     F - CTL Formula to check.
%
% Should evaluate to true iff the sequent below is valid.
%
% (T,L), S  |-    F
%             U
% check(T,L,S,U,F) :-
%   write('T: '), write(T), nl,
%   write('L: '), write(L), nl,
%   write('S: '), write(S), nl,
%   write('U: '), write(U), nl,
%   write('F: '), write(F), nl.
%
%


% To execute: consult(’your_file.pl’). verify(’input.txt’).

% Literals
check(_, L, S, [], X) :-
  member([S, List], L),
  member(X, List),
  write(X), write(' part of List('), write(S), write(')'),nl,!.

check(_, L, S, [], neg(X)) :-
  member([S, List], L),
  \+member(X, List),
  write(X), write(' not part of List('), write(S), write(')'),nl,!.





% And
check(_, L, S, [], and(F,G)) :- % förut fanns T med. Kan orsaka problem sen?
  check(_, L, S, [], F),
  check(_, L, S, [], G).

% Or
  % or1
check(_, L, S, [], or(F,_)) :- % förut fanns T med. Kan orsaka problem sen?
  check(_, L, S, [], F),!.
  % or2
check(_, L, S, [], or(_,G)) :- % förut fanns T med. Kan orsaka problem sen?
  check(_, L, S, [], G).

% AX
check(T, L, S, [], ax(X)) :-
  member([S, List], T),
  checkAdj(X, L, List),!.

% EX
check(T, L, S, [], ex(X)) :-
  member([S, List], T),
  member(PartS, List),
  member([PartS, PartList], L),
  member(X, PartList),!.

% AG
% check(T, L, S, U, ag(X)) :-
%   findAllConnected(T, S, [], AllConnected),
%   member(Node, AllConnected),
%   check(_, L, Node, [], X).

% findAllConnected(T, S, Visited, [PartList|AllConnected]) :-
%   member([S, List], T),
%   member(PartList, List),
%   findAllConnected(T, S, [S|Visited], AllConnected).
%


% EG
check(_, _, S, U, eg(_)) :-
  member(S, U).
check(T, L, S, U, eg(X)) :-
  \+member(S,U),
  check(_, L, S, [], X),
  member([S, List], T),
  member(PartList, List),
  check(T, L, PartList, [S|U], eg(X)),!.


% EF
check(_, L, S, _, ef(X)) :-
  check(_, L, S, [], X).
check(T, L, S, U, ef(X)) :-
  \+member(S,U),
  member([S, List], T),
  member(PartList, List),
  check(T, L, PartList, [S|U], ef(X)),!.



% AF



























%
