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


interLists([], _, []).

interLists([H1|T1], L2, [H1|Res]) :-
    member(H1, L2),
    interLists(T1, L2, Res).

interLists([_|T1], L2, Res) :-
    interLists(T1, L2, Res).

% hotel(IDHotel, Nome, 	Estrelas, Tel, IDMorada, IDCidade)
writeListHoteis([]).
writeListHoteis([Head|Tail]) :-
    nl, hotel(Head, Nome, _,_,_,_), listToString(Nome,'', String), 
    writeListHoteis(Tail).


