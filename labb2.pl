
% used implementations from lab 1

last([First|[]], [], First).
last([H|T], [H|R], X) :-
  last(T, R, X).



% Labb 2

verify(InputFileName) :-
  see(InputFileName),
  read(Prems), read(Goal), read(Proof),
  seen,
  valid_proof(Prems, Goal, Proof).

valid_proof(Prems, Goal, Proof) :-
  checkGoal(Goal, Proof),
  checkProof(Prems, Proof).


checkGoal(Goal, Proof) :-
  last(Proof, _, LastLine),
  lineResult(LastLine, Goal), !.

checkProof(Prems, Proof) :-
  % TODO: Implement plz
  true.



% Line operations

lineRow([Nr, _, _], Nr).
lineResult([_, Result, _], Result).
lineOpertaion([_, _, Operation], Operation).


























% this comment is instentional
