writeList([]).
writeList([Head|Tail]) :-
    nl, write(Head), 
    writeList(Tail).

writeArray([]).
writeArray([Head | Tail]) :-
    write(Head), write(' '), writeArray(Tail).

listToString([], String, String) :- write(String).
listToString([Head|[]], TmpString, String) :-
    atom_concat(TmpString, Head, TmpFinal),
    listToString(Tail, TmpFinal, String).
listToString([Head|Tail], TmpString, String) :-
    atom_concat(TmpString, Head, Tmp2),
    atom_concat(Tmp2, ' ', TmpFinal),
    listToString(Tail, TmpFinal, String).




