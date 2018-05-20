writeList([]).
writeList([[Head]|Tail]) :-
    listToString([Head], '', _),
    writeList(Tail).

writeList([Head|Tail]) :-
    listToString(Head, '', _),
    writeList(Tail).

writeList([Head|Tail]) :-
    listToString([Head|Tail], '', _).

writeArray([]).
writeArray([Head | Tail]) :-
    write(Head), write(' '), writeArray(Tail).

listToString([], String, String) :- write(String).
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
    nl, hotel(Head, Nome, _,_,IDMorada,IDCidade), listToString(Nome,'', String),
    writeListHoteis(Tail).

writeListHoteis([], _).
writeListHoteis([Head|Tail], ficar) :-
    hotel(Head, Nome, _,_,IDMorada,IDCidade), 
    morada(IDMorada, Morada, IDCidade),
    cidade(IDCidade, Cidade, _IDPais),
    writeList(Nome), write(', que fica na morada '), write(Morada), 
    write(Cidade), write('.'),
    writeListHoteis(Tail, ficar).
