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
