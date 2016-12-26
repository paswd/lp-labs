#!/usr/bin/gprolog --consult-file

setElement(List, Elem, Pos, Res):-
	append(Head, Tail, List), 
	PosTmp is Pos - 1,
	length(Head, PosTmp),
	Tail = [_ | TailTmp],
	append(Head, [Elem], NewHead),
	append(NewHead, TailTmp, Res).

firstNegative(List, Res):-
	append(Head, _, List),
	reverse(Head, RevHead),
	RevHead = [Elem | _],
	Elem < 0,
	length(Head, Res).
	
getElement(List, Pos, Res):-
	append(Head, Tail, List), 
	PosTmp is Pos - 1,
	length(Head, PosTmp),
	Tail = [Res | _].