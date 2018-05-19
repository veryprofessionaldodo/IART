%filtrar(HoteisAtuais, Suj-Tipo, NovaLista)
% hotel(IDHotel, Nome, 	Estrelas, Tel, IDMorada, IDCidade)

filtrar(HoteisAtuais, [Obj]-cidade, NovaLista) :-
    findall(IDHotel,
    (
        cidade(IDCidade, Obj, _IDPais),
        hotel(IDHotel, _Nome, _Estrelas, _Tel, _IDMorada, IDCidade),
        member(IDHotel, HoteisAtuais)
    ) , NovaLista).

filtrar(HoteisAtuais, Obj-estrelas, NovaLista) :-
    findall(IDHotel,
    (
        hotel(IDHotel, _Nome, Obj, _Tel, _IDMorada, _IDCidade),
        member(IDHotel, HoteisAtuais)
    ) , NovaLista).

filtrar(HoteisAtuais, Obj-maisestrelas, NovaLista) :-
    findall(IDHotel,
    (
        hotel(IDHotel, _Nome, Estrelas, _Tel, _IDMorada, _IDCidade),
        Estrelas > Obj,
        member(IDHotel, HoteisAtuais)
    ) , NovaLista).

filtrar(HoteisAtuais, Obj-menosestrelas, NovaLista) :-
    findall(IDHotel,
    (
        hotel(IDHotel, _Nome, Estrelas, _Tel, _IDMorada, _IDCidade),
        Estrelas < Obj,
        member(IDHotel, HoteisAtuais)
    ) , NovaLista).

filtrar(HoteisAtuais, Obj-hotel, NovaLista) :- 
    findall(IDHotel,
    (
        hotel(IDHotel, Obj, _Estrelas, _Tel, _IDMorada, _IDCidade),
        member(IDHotel, HoteisAtuais)
    ) , NovaLista),
    length(NovaLista, Comprimento), Comprimento > 0.

filtrar(HoteisAtuais, _Obj-hotel, HoteisAtuais).

% PARA A POSSIBILIDADE DE MULTIPLOS SUJEITOS
filtrar_append(HoteisAtuais, Obj-hotel, NovaLista) :- 
    findall(IDHotel,
    (
        hotel(IDHotel, Obj, _Estrelas, _Tel, _IDMorada, _IDCidade),
        \+ member(IDHotel, HoteisAtuais)
    ) , TmpList), append(HoteisAtuais, TmpList, NovaLista).

% FILTROS QUE INCLUEM VERBOS

filtrar(HoteisAtuais, ter-_Afirmativo, [Obj]-servico, NovaLista) :-
    findall(IDHotel,
    (
        hotel(IDHotel, _Nome, _Estrelas, _Tel, _IDMorada, _IDCidade),
        tem_servico(IDHotel, IDServico),
        servico(IDServico, Obj),
        member(IDHotel, HoteisAtuais)
    ) , NovaLista).
    
filtrar(HoteisAtuais, ter-_Afirmativo, Obj-estrelas, NovaLista) :-
    findall(IDHotel,
    (
        hotel(IDHotel, _Nome, Obj, _Tel, _IDMorada, _IDCidade),
        member(IDHotel, HoteisAtuais)
    ) , NovaLista).

filtrar(HoteisAtuais, ter-_Afirmativo, Obj-maisestrelas, NovaLista) :-
    findall(IDHotel,
    (
        hotel(IDHotel, _Nome, Estrelas, _Tel, _IDMorada, _IDCidade),
        Estrelas > Obj,
        member(IDHotel, HoteisAtuais)
    ) , NovaLista).

filtrar(HoteisAtuais, ter-_Afirmativo, Obj-menosestrelas, NovaLista) :-
    findall(IDHotel,
    (
        hotel(IDHotel, _Nome, Estrelas, _Tel, _IDMorada, _IDCidade),
        Estrelas < Obj,
        member(IDHotel, HoteisAtuais)
    ) , NovaLista).

filtrar(HoteisAtuais, ficar-_Afirmativo, Obj-cidade, NovaLista) :-
    findall(IDHotel,
    (
        cidade(IDCidade, Obj, _IDPais),
        hotel(IDHotel, _Nome, Estrelas, _Tel, _IDMorada, IDCidade),
        member(IDHotel, HoteisAtuais)
    ) , NovaLista).

filtrar(HoteisAtuais, ficar-_Afirmativo, Obj-pais, NovaLista) :-
    findall(IDHotel,
    (
        cidade(IDCidade, _Nome, IDPais),
        pais(IDPais, Obj, _IDContinente),
        hotel(IDHotel, _Nome, Estrelas, _Tel, _IDMorada, IDCidade),
        member(IDHotel, HoteisAtuais)
    ) , NovaLista).

filtrar(HoteisAtuais, ficar-_Afirmativo, Obj-continente, NovaLista) :-
    findall(IDHotel,
    (
        cidade(IDCidade, _Nome, IDPais),
        pais(IDPais, _Nome, IDContinente),
        continente(IDContinente, Obj),
        hotel(IDHotel, _Nome, Estrelas, _Tel, _IDMorada, IDCidade),
        member(IDHotel, HoteisAtuais)
    ) , NovaLista).