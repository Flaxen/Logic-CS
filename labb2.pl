
% used implementations from lab 1
% (InputList, RestList, LastElement)
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

% verifies that the last row of the proof is the goal of the sekvent.
% checks that the proof actually proofs what we want to prove.
% achieved by a simple comparison of the correct elements.
checkGoal(Goal, Proof) :-
  last(Proof, _, LastLine),
  lineResult(LastLine, Goal), !.

checkProof(_, []).
checkProof(Prems, [H|T]) :-
  checkLine(H, ValidPartProofs),
  checkProof([H|ValidPartProofs], T),
  % write(ValidPartProofs).




% Line operations
  % Line element extractions
lineRow([Nr, _, _], Nr).
lineResult([_, Result, _], Result).
lineOpertaion([_, _, Operation], Operation).

  % Line checks
checkLine([Nr, P, premise], [Nr, P, premise]) :-
  member(P, Prems), !.
























% this comment is intentional
