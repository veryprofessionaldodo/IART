%filtrar(HoteisAtuais, Suj-Tipo, NovaLista)
% hotel(IDHotel, Nome, 	Estrelas, Tel, IDMorada, IDCidade)

:-dynamic pergunta/1.

filtrar(HoteisAtuais, Obj-cidade, NovaLista) :-
    findall(IDHotel,
    (
        cidade(IDCidade, Obj, _IDPais),
        hotel(IDHotel, _Nome, _Estrelas, _Tel, _IDMorada, IDCidade),
        member(IDHotel, HoteisAtuais)
    ) , NovaLista),
    remover_pergunta.

filtrar(HoteisAtuais, Obj-estrelas, NovaLista) :-
    findall(IDHotel,
    (
        hotel(IDHotel, _Nome, Obj, _Tel, _IDMorada, _IDCidade),
        member(IDHotel, HoteisAtuais)
    ) , NovaLista),
    remover_pergunta.

filtrar(HoteisAtuais, Obj-maisestrelas, NovaLista) :-
    findall(IDHotel,
    (
        hotel(IDHotel, _Nome, Estrelas, _Tel, _IDMorada, _IDCidade),
        Estrelas > Obj,
        member(IDHotel, HoteisAtuais)
    ) , NovaLista),
    remover_pergunta.

filtrar(HoteisAtuais, Obj-menosestrelas, NovaLista) :-
    findall(IDHotel,
    (
        hotel(IDHotel, _Nome, Estrelas, _Tel, _IDMorada, _IDCidade),
        Estrelas < Obj,
        member(IDHotel, HoteisAtuais)
    ) , NovaLista), 
    remover_pergunta.

filtrar(HoteisAtuais, Obj-hotel, NovaLista) :- 
    findall(IDHotel,
    (
        hotel(IDHotel, Obj, _Estrelas, _Tel, _IDMorada, _IDCidade),
        member(IDHotel, HoteisAtuais)
    ) , NovaLista),
    length(NovaLista, Comprimento), Comprimento > 0,
    remover_pergunta.

filtrar(HoteisAtuais, _Obj-hotel, HoteisAtuais) :- remover_pergunta.

% PARA A POSSIBILIDADE DE MULTIPLOS SUJEITOS
% Em caso de haver uma pergunta anterior
filtrar_append(HoteisAtuais, Obj-Tipo, NovaLista) :- 
    pergunta(Verbo-Afirmativo),
    filtrar(HoteisAtuais,Verbo-Afirmativo, Obj-Tipo, NovaLista).

% Caso não haja
filtrar_append(HoteisAtuais, Obj-hotel, NovaLista) :- 
    findall(IDHotel,
    (
        hotel(IDHotel, Obj, _Estrelas, _Tel, _IDMorada, _IDCidade),
        \+ member(IDHotel, HoteisAtuais)
    ) , TmpList), append(HoteisAtuais, TmpList, NovaLista).

% FILTROS QUE INCLUEM VERBOS
filtrar(HoteisAtuais, ter-Afirmativo, Obj-servico, NovaLista) :-
    findall(IDHotel,
    (
        hotel(IDHotel, _Nome, _Estrelas, _Tel, _IDMorada, _IDCidade),
        tem_servico(IDHotel, IDServico),
        servico(IDServico, Obj),
        member(IDHotel, HoteisAtuais)
    ) , NovaLista),
    pergunta_atual(ter-Afirmativo).

filtrar(HoteisAtuais, ter-Afirmativo, Obj-quarto, NovaLista) :-
    findall(IDHotel,
    (
        hotel(IDHotel, _Nome, _Estrelas, _Tel, _IDMorada, _IDCidade),
        quarto(IDQuarto, Obj, _Num),
        tem_quarto(IDHotel, IDQuarto, Preco),
        member(IDHotel, HoteisAtuais)
    ) , NovaLista),
    pergunta_atual(ter-Afirmativo).
    
filtrar(HoteisAtuais, ter-Afirmativo, Obj-estrelas, NovaLista) :-
    findall(IDHotel,
    (
        hotel(IDHotel, _Nome, Obj, _Tel, _IDMorada, _IDCidade),
        member(IDHotel, HoteisAtuais)
    ) , NovaLista),
    pergunta_atual(ter-Afirmativo).

filtrar(HoteisAtuais, ter-Afirmativo, Obj-maisestrelas, NovaLista) :-
    findall(IDHotel,
    (
        hotel(IDHotel, _Nome, Estrelas, _Tel, _IDMorada, _IDCidade),
        Estrelas > Obj,
        member(IDHotel, HoteisAtuais)
    ) , NovaLista),
    pergunta_atual(ter-Afirmativo).

filtrar(HoteisAtuais, ter-Afirmativo, Obj-menosestrelas, NovaLista) :-
    findall(IDHotel,
    (
        hotel(IDHotel, _Nome, Estrelas, _Tel, _IDMorada, _IDCidade),
        Estrelas < Obj,
        member(IDHotel, HoteisAtuais)
    ) , NovaLista),
    pergunta_atual(ter-Afirmativo).

filtrar(HoteisAtuais, ficar-Afirmativo, Obj-cidade, NovaLista) :-
    findall(IDHotel,
    (
        cidade(IDCidade, Obj, _IDPais),
        hotel(IDHotel, _Nome, Estrelas, _Tel, _IDMorada, IDCidade),
        member(IDHotel, HoteisAtuais)
    ) , NovaLista),
    pergunta_atual(ficar-Afirmativo).

filtrar(HoteisAtuais, ficar-Afirmativo, Obj-pais, NovaLista) :-
    findall(IDHotel,
    (
        cidade(IDCidade, _NomeCidade, IDPais),
        pais(IDPais, Obj, _IDContinente),
        hotel(IDHotel, _NomeHotel, Estrelas, _Tel, _IDMorada, IDCidade),
        member(IDHotel, HoteisAtuais)
    ) , NovaLista),
    pergunta_atual(ficar-Afirmativo).

filtrar(HoteisAtuais, ficar-Afirmativo, Obj-continente, NovaLista) :-
    findall(IDHotel,
    (
        cidade(IDCidade, _NomeCidade, IDPais),
        pais(IDPais, _NomePais, IDContinente),
        continente(IDContinente, Obj),
        hotel(IDHotel, _NomeHotel, Estrelas, _Tel, _IDMorada, IDCidade),
        member(IDHotel, HoteisAtuais)
    ) , NovaLista),
    pergunta_atual(ter-Afirmativo).

% Importante para multiplos sujeitos após forma verbal (ex: tem 3 estrelas e babysitting).
pergunta_atual(NovoVerbo-Afirmativo) :- 
    retract(pergunta(_-_)),
    assert(pergunta(NovoVerbo-Afirmativo)).

% Não havia pergunta anterior
pergunta_atual(NovoVerbo-Afirmativo) :- 
    assert(pergunta(NovoVerbo-Afirmativo)).

remover_pergunta :-
    retract(pergunta(_-_)).

% Caso não haja perguntas ainda
remover_pergunta.