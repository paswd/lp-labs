%Main predicates
prof(Persons, Professions, Res):-
	length(Persons, PersonsLen),
	length(Professions, ProfLen),
	PersonsLen == 4,
	ProfLen == 4,
	permutation(Professions, ProfLen, ProfPerm),
	isListCorrect(Persons, ProfPerm, 1, 2),
	Res = ProfPerm.


permutation(_List, 0, []).
permutation(List, PermutationLength, [Head|PermutationTail]):-
  select(Head, List, ListTail), 
  PermutationTailLength is PermutationLength - 1,
  permutation(ListTail, PermutationTailLength, PermutationTail).

getElement(List, Pos, Res):-
	append(Head, Tail, List), 
	PosTmp is Pos - 1,
	length(Head, PosTmp),
	Tail = [Res | _].


знакомы('Корнеев', 'Докшин').
знакомы('Докшин', 'Корнеев').
знакомы('Корнеев', 'Скобелев').
знакомы('Скобелев', 'Корнеев').

незнакомы('милиционер', 'инженер').
незнакомы('инженер', 'милиционер').

старше('Докшин', 'Мареев').
старше('милиционер', 'врач').
старше('милиционер', 'пекарь').
младше('Мареев', 'Докшин').
младше('врач', 'милиционер').
младше('пекарь', 'милиционер').

ездит('Докшин').
ездит('Корнеев').
пешком('пекарь').

condition1(Person1, Person2, Prof1, Prof2):-
	not(знакомы(Person1, Person2));
	not(незнакомы(Prof1, Prof2)).

condition2(Person, Prof):-
	not(ездит(Person));
	not(пешком(Prof)).

condition3(Person1, Person2, Prof1, Prof2):-
	not(старше(Person1, Person2));
	not(младше(Prof1, Prof2)).

isListCorrect(Person, Prof, Num, 5).
isListCorrect(Person, Prof, 5, Num).

isListCorrect(Person, Prof, Num, Num):-
	NNum is Num + 1,
	isListCorrect(Person, Prof, Num, NNum),
	isListCorrect(Person, Prof, NNum, Num).

isListCorrect(Person, Prof, Num1, Num2):-
	getElement(Person, Num1, Person1),
	getElement(Person, Num2, Person2),
	getElement(Prof, Num1, Prof1),
	getElement(Prof, Num2, Prof2),
	condition1(Person1, Person2, Prof1, Prof2),
	condition2(Person1, Prof1),
	condition3(Person1, Person2, Prof1, Prof2),
	NNum1 is Num1 + 1,
	NNum2 is Num2 + 1,
	isListCorrect(Person, Prof, Num1, NNum2),
	isListCorrect(Person, Prof, NNum1, Num2).

%Predicates for debugging
condNum1(Person, Prof, Num1, Num2):-
	Num1 \== Num2,
	Num1 =< 4,
	Num2 =< 4,
	getElement(Person, Num1, Person1),
	getElement(Person, Num2, Person2),
	getElement(Prof, Num1, Prof1),
	getElement(Prof, Num2, Prof2),
	condition1(Person1, Person2, Prof1, Prof2).

condNum2(Person, Prof, Num):-
	Num =< 4,
	getElement(Person, Num, Person1),
	getElement(Prof, Num, Prof1),
	condition2(Person1, Prof1).

condNum3(Person, Prof, Num1, Num2):-
	Num1 \== Num2,
	Num1 =< 4,
	Num2 =< 4,
	getElement(Person, Num1, Person1),
	getElement(Person, Num2, Person2),
	getElement(Prof, Num1, Prof1),
	getElement(Prof, Num2, Prof2),
	condition3(Person1, Person2, Prof1, Prof2).