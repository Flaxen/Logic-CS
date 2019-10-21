
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
  write(ValidPartProofs),!.




% Line operations
  % Line element extractions
lineRow([Nr, _, _], Nr).
lineResult([_, Result, _], Result).
lineOpertaion([_, _, Operation], Operation).

  % Line checks

  % premise
checkLine([Nr, P, premise], [Nr, P, premise]) :-
  member(P, Prems).

  % assumption
% checkLine([[Nr, P, assumption]|_], [Nr, P , assumption]).

  % andint
checkLine([Nr, and(P,Q), andint(X,Y)], [Nr, and(P,Q), andint(X,Y)]):-
  member([X, P, _], ValidPartProofs),
  member([Y, Q, _], ValidPartProofs).

  % copy
checkLine([Nr, P, copy(X)], [Nr, P, copy(X)]) :-
  member([X, P, _], ValidPartProofs).

  % andel1
checkLine([Nr, P, andel1(X)], [Nr, P, andel1(X)]) :-
  member([X, and(P,_), _], ValidPartProofs).

  % andel2
checkLine([Nr, P, andel2(X)], [Nr, P, andel2(X)]) :-
  member([X, and(_,P), _], ValidPartProofs).

  % orint1
checkLine([Nr, or(P,Q), orint1(X)], [Nr, or(P,Q), orint1(X)]):-
  member([X, P, _], ValidPartProofs).

  % orint2
checkLine([Nr, or(P,Q), orint2(X)], [Nr, or(P,Q), orint2(X)]):-
  member([X, Q, _], ValidPartProofs).

% trasig
%   % negel
% checkLine([Nr, cont, negel(X,Y)], [Nr, cont, negel(X,Y)]):-
%   member([X, P, _], ValidPartProofs),
%   member([Y, P, _], ValidPartProofs).

  % negnegint
checkLine([Nr, P, negnegint(X)], [Nr, P, negnegint(X)]):-
  member([X, not(not(P)), _], ValidPartProofs).



















% this comment is intentional
