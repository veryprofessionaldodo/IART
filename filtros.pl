:-reconsult(utils).

% Para caso seja para fazer [e] a perguntas ou a sujeitos
:-dynamic pergunta/1.

% Para oferecer uma melhor resposta
:-dynamic tipo_pergunta/2.
:-dynamic hasErrors/0.

/* ------------------ */
/* 	  INTERROGAÇÕES   */
/* ------------------ */

% Servicos tem X e Y?
verificacaoInterrogacao(TipoQ, Hoteis, _Suj-servico, ter) :-
	(TipoQ == que ; TipoQ == qual),
	findall(Servico, 
		(
			hotel(IDHotel, Hotel, _Estrelas, _Tlm, _IdMorada, _IDCidade),
			member(IDHotel, Hoteis),
			servico(IDServico, Servico),
			tem_servico(IDHotel, IDServico)
		), Resposta),
		escreverResposta(_,_,Resposta).

% Que quartos tem X e Y?
verificacaoInterrogacao(TipoQ, Hoteis, _Suj-quarto, ter) :-
		findall(Quarto,
		(
			hotel(IDHotel, Hotel, _Estrelas, _Tlm, _IdMorada, _IDCidade),
			member(IDHotel, Hoteis),
			quarto(IDQuarto, Quarto, _Num),
			tem_quarto(IDHotel, IDQuarto)
		), Resposta),
		escreverResposta(_,_,Resposta).

/* ------------------------ */
/*		TESTES SEMANTICOS 	*/
/* -------------------------*/

teste_semantico(Acao, Tipo1, Tipo2):-
	P=..[Acao, Tipo1, Tipo2],
	P.

% Ex: que SERVICOS TEM
teste_semantico(Acao, Tipo1, Tipo2):-
	P=..[Acao, Tipo2, Tipo1],
	P.

/* ------------------------ */
/*          FILTROS         */
/* -------------------------*/

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
    assert(tipo_pergunta(ter,servico)),
    findall(IDHotel,
    (
        hotel(IDHotel, _Nome, _Estrelas, _Tel, _IDMorada, _IDCidade),
        tem_servico(IDHotel, IDServico),
        servico(IDServico, Obj),
        member(IDHotel, HoteisAtuais)
    ) , NovaLista),
    pergunta_atual(ter-Afirmativo).

filtrar(HoteisAtuais, ter-Afirmativo, Obj-quarto, NovaLista) :-
    assert(tipo_pergunta(ter,quarto)),
    findall(IDHotel,
    (
        hotel(IDHotel, _Nome, _Estrelas, _Tel, _IDMorada, _IDCidade),
        quarto(IDQuarto, Obj, _Num),
        tem_quarto(IDHotel, IDQuarto, Preco),
        member(IDHotel, HoteisAtuais)
    ) , NovaLista),
    pergunta_atual(ter-Afirmativo).
    
filtrar(HoteisAtuais, ter-Afirmativo, Obj-estrelas, NovaLista) :-
    assert(tipo_pergunta(ter,estrelas)),
    findall(IDHotel,
    (
        hotel(IDHotel, _Nome, Obj, _Tel, _IDMorada, _IDCidade),
        member(IDHotel, HoteisAtuais)
    ) , NovaLista),
    pergunta_atual(ter-Afirmativo).

filtrar(HoteisAtuais, ter-Afirmativo, Obj-maisestrelas, NovaLista) :-
    assert(tipo_pergunta(ter,estrelas)),
    findall(IDHotel,
    (
        hotel(IDHotel, _Nome, Estrelas, _Tel, _IDMorada, _IDCidade),
        Estrelas > Obj,
        member(IDHotel, HoteisAtuais)
    ) , NovaLista),
    pergunta_atual(ter-Afirmativo).

filtrar(HoteisAtuais, ter-Afirmativo, Obj-menosestrelas, NovaLista) :-
    assert(tipo_pergunta(ter,estrelas)),
    findall(IDHotel,
    (
        hotel(IDHotel, _Nome, Estrelas, _Tel, _IDMorada, _IDCidade),
        Estrelas < Obj,
        member(IDHotel, HoteisAtuais)
    ) , NovaLista),
    pergunta_atual(ter-Afirmativo).

filtrar(HoteisAtuais, ficar-Afirmativo, Obj-cidade, NovaLista) :-
    assert(tipo_pergunta(ficar, _)),
    findall(IDHotel,
    (
        cidade(IDCidade, Obj, _IDPais),
        hotel(IDHotel, _Nome, Estrelas, _Tel, _IDMorada, IDCidade),
        member(IDHotel, HoteisAtuais)
    ) , NovaLista),
    pergunta_atual(ficar-Afirmativo).

filtrar(HoteisAtuais, ficar-Afirmativo, Obj-pais, NovaLista) :-
    assert(tipo_pergunta(ficar, _)),
    findall(IDHotel,
    (
        cidade(IDCidade, _NomeCidade, IDPais),
        pais(IDPais, Obj, _IDContinente),
        hotel(IDHotel, _NomeHotel, Estrelas, _Tel, _IDMorada, IDCidade),
        member(IDHotel, HoteisAtuais)
    ) , NovaLista),
    pergunta_atual(ficar-Afirmativo).

filtrar(HoteisAtuais, ficar-Afirmativo, Obj-continente, NovaLista) :-
    assert(tipo_pergunta(ficar, _)),
    findall(IDHotel,
    (
        cidade(IDCidade, _NomeCidade, IDPais),
        pais(IDPais, _NomePais, IDContinente),
        continente(IDContinente, Obj),
        hotel(IDHotel, _NomeHotel, Estrelas, _Tel, _IDMorada, IDCidade),
        member(IDHotel, HoteisAtuais)
    ) , NovaLista),
    pergunta_atual(ter-Afirmativo).

/* ------------------------ */
/*          CHECKS          */
/* -------------------------*/

% Para análise recursiva
verifica_filtro(HoteisAtuais, NovaLista) :-
	length(HoteisAtuais, L1),
	length(NovaLista, L2),
	L1 == L2.

% SE FOR AFIRMACAO, ESTA
verifica_filtro(_,_) :- assert(hasErrors). 

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

/* ------------------------ */
/*        RESPOSTAS         */
/* -------------------------*/

analise_lista(Lista) :-
	retract(hasErrors),
	% É uma afirmação, nas está errrada
	write('A informacao nao esta de acordo com a nossa base de dados').
	
analise_lista(Lista) :-
	write('A informacao esta de acordo com a nossa base de dados').

analise_lista(quanto, Lista) :-
	nl,write('A resposta certa e : '), length(Lista, Comprimento), write(Comprimento).

% RESPOSTAS ESPECIFICAS
analise_lista(Quant, Lista) :-
	nonvar(Quant), 
    retract(tipo_pergunta(Verbo, TipoInformacao)),
	escreverResposta(Verbo, TipoInformacao, Lista).

%Tem Servico
escreverResposta(_,_, [Head|Tail]) :-
    servico(_, Head),
    write('Os servicos sao : '), nl,
    writeList([Head|Tail]).

%Tem Quarto
escreverResposta(_,_, [Head|Tail]) :-
    quarto(_, Head, _NumPessoas),
    write('Os quartos sao : '), nl,
    writeList([Head|Tail]).

%Tem Quarto
escreverResposta(ficar,_, [Head|Tail]) :-
    write('Os hoteis sao : '), nl,
    writeListHoteis([Head|Tail], ficar).

% RESPOSTA GENÉRICA
analise_lista(Quant, Lista) :-
	nonvar(Quant), 
	nl,write('A resposta certa e : '), writeListHoteis(Lista).
