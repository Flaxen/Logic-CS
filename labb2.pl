
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

% checkProof(ValidPartProofs, [[H|T]|RestOfProof]) :-
%   checkAsusumption(H),
%   checkBox([H|ValidPartProofs],T),
%   checkProof(ValidPartProofs,RestOfProof).

  % Test komihåg början och slut på box
checkProof(ValidPartProofs, [[H|T]|RestOfProof]) :-
  checkAsusumption(H),
  checkBox([H|ValidPartProofs],T),
  last([H|T], Last),
  checkProof([[H|[Last]]|ValidPartProofs],RestOfProof).


% checks that the box is correct.
checkBox(_,[]).
checkBox(ValidPartProofs, [H|T]):-
  checkProof(ValidPartProofs,[H|T]).


% Line operations
  % Line element extractions
lineRow([Nr, _, _], Nr).
lineResult([_, Result, _], Result).
lineOpertaion([_, _, Operation], Operation).

% Assumption check
checkAsusumption([_, _, assumption]).

% Line checks
  % premise
checkLine([_, P, premise], ValidPartProofs) :-
  member(P, ValidPartProofs).

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
checkLine([_, A, orel(X,Y,U,V,W)], ValidPartProofs):-
  member([X, or(P,Q), _], ValidPartProofs),
  member([[Y, P, assumption], [U, A, _]], ValidPartProofs),
  member([[V, Q, assumption], [W, A, _]], ValidPartProofs).

  % impint
checkLine([_, imp(P,Q), impint(X,Y)], ValidPartProofs):-
  member([[X, P, assumption], [Y, Q, _]], ValidPartProofs).

  % impel
checkLine([_, P, impel(X,Y)], ValidPartProofs) :-!,
  member([X, Origin, _], ValidPartProofs),!,
  member([Y, imp(Origin,P), _], ValidPartProofs),!.

%  Inte testad!!!!!!
  % negint
% checkLine([_, neg(P), negint(X,Y)], ValidPartProofs):-
%   member([[X, P, assumption], [Y, cont, _]], ValidPartProofs).

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
