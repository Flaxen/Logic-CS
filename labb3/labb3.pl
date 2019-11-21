% For SICStus, uncomment line below: (needed for member/2)
%:- use_module(library(lists)).

% Load model, initial state and formula from file.
verify(Input) :-
  see(Input), read(T), read(L), read(S), read(F), seen,
  check(T, L, S, [], F).

% check(T, L, S, U, F)
%     T - The transitions in form of adjacency lists
%     L - The labeling
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





% EX
% AG
% EG
% EF
% AF



























%
