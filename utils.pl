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

% hotel(IDHotel, Nome, 	Estrelas, Tel, IDMorada, IDCidade)
writeListHoteis([]).
writeListHoteis([Head|Tail]) :-
    nl, hotel(Head, Nome, _,_,IDMorada,IDCidade), listToString(Nome,'', String),
    writeListHoteis(Tail).

writeListHoteis([], _).
writeListHoteis([Head|Tail], ficar) :-
    hotel(Head, Nome, Estrelas,_,IDMorada,IDCidade), 
    morada(IDMorada, Morada, IDCidade),
    cidade(IDCidade, Cidade, _IDPais),
    writeList(Nome), write(', que fica na morada '), writeList(Morada), write(', '), 
    writeList(Cidade), write('.'), write(' Tem '), write(Estrelas), write(' estrela(s).') nl,
    writeListHoteis(Tail, ficar).

writeListQuartos([]).
writeListQuartos([Head|Hotel]) :-
    hotel(Head, NomeHotel, _,_,_,_), 
    quarto(IDQuarto, Nome, NumPessoas),
    tem_quarto(Head, IDQuarto, Preco, Propriedades),
    writeList(Nome), write(', do '), writeList(NomeHotel), write(', que custa '), write(Preco),
    write('euros, com as propriedades'), writePropriedades(Propriedades), nl,
    writeListQuartos(Tail).

writePropriedades([]).
writePropriedades([Head|[]]) :-
    prop_quarto(Head, Nome),  writeList(Nome), writePropriedades([]).
writePropriedades([Head|Tail]) :- 
    prop_quarto(Head, Nome),  writeList(Nome), write(', '), writePropriedades(Tail).