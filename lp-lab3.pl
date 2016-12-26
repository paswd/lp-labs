%Variant 8

isUncorrect(blue, white).
isUncorrect(blue, red).
isUncorrect(white, red).

bblSort(List, ListNew):-
	exchange(List, ListTmp),
	bblSort(ListTmp, ListNew).

bblSort(List, List).

exchange([X, Y | Tail], [Y, X | Tail]):-
	isUncorrect(X, Y).

exchange([Head | Tail], [Head | TailNew]):-
	exchange(Tail, TailNew).
