
% used implementations from lab 1
% (InputList, RestList, LastElement)
last([First|[]], First).
last([_|T], X) :-
  last(T, X).



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
  last(Proof, LastLine),
  lineResult(LastLine, Goal), !.

checkProof(_, []).
checkProof(ValidPartProofs, [H|T]) :-
  checkLine(H, ValidPartProofs),
  checkProof([H|ValidPartProofs], T).
  % write(ValidPartProofs),!.

% checks that the box is correct.
checkBox(ValidPartProofs, [[H|T]]):-
  checkLine(H, ValidPartProofs),
  checkBox([H,ValidPartProofs],[[T]]).


% Line operations
  % Line element extractions
lineRow([Nr, _, _], Nr).
lineResult([_, Result, _], Result).
lineOpertaion([_, _, Operation], Operation).

% Line checks

  % premise
checkLine([_, P, premise], ValidPartProofs) :-
  member(P, ValidPartProofs).

  % assumption
checkLine([[_, _, assumption]], _).

  % copy
checkLine([_, P, copy(X)], ValidPartProofs) :-
member([X, P, _], ValidPartProofs).

  % andint
checkLine([_, and(P,Q), andint(X,Y)], ValidPartProofs):-
  member([X, P, _], ValidPartProofs),
  member([Y, Q, _], ValidPartProofs).

  % andel1
checkLine([_, P, andel1(X)], ValidPartProofs) :-
  member([X, and(P,_), _], ValidPartProofs).

  % andel2
checkLine([_, P, andel2(X)], ValidPartProofs) :-
  member([X, and(_,P), _], ValidPartProofs).

  % orint1
checkLine([_, or(P,_), orint1(X)], ValidPartProofs):-
  member([X, P, _], ValidPartProofs).

  % orint2
checkLine([_, or(_,Q), orint2(X)], ValidPartProofs):-
  member([X, Q, _], ValidPartProofs).

  % orel

  % impint

  % impel
checkLine([_, P, impel(X,Y)], ValidPartProofs) :-!,
  member([X, Origin, _], ValidPartProofs),!,
  member([Y, imp(Origin,P), _], ValidPartProofs),!.

  % negint

  % negel
checkLine([_, cont, negel(X,Y)], ValidPartProofs):-
  member([X, P, _], ValidPartProofs),
  member([Y, neg(P), _], ValidPartProofs).

  %contel
checkLine([_, _, contel(X)], ValidPartProofs) :-
  member([X, cont, _], ValidPartProofs).

  % negnegint
checkLine([_, P, negnegint(X)], ValidPartProofs):-
  member([X, neg(neg(P)), _], ValidPartProofs).

  %negnegel
checkLine([_, P, negnegel(X)], ValidPartProofs) :-
  member([X, neg(neg(P)), _], ValidPartProofs).

  %MT
checkLine([_, neg(P), mt(X,Y)], ValidPartProofs) :-
  member([X, imp(P,Grej), _], ValidPartProofs),
  member([Y, neg(Grej), _], ValidPartProofs).

  % PBC

  %LEM
checkLine([_, or(P, neg(P)), lem], _).






























% this comment is intentional
