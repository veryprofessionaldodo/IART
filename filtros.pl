:-reconsult(utils).

% Para caso haja [e] manter qual é a pergunta a ser feita
:-dynamic pergunta/1.

% Para oferecer uma melhor resposta
:-dynamic tipo_pergunta/2.
:-dynamic hasErrors/0.


% Para caso seja para fazer [e] a perguntas ou a sujeitos
:-dynamic e_pergunta/0.

/* ------------------ */
/* 	  INTERROGAÇÕES   */
/* ------------------ */

% Servicos tem X e Y?
verificacaoInterrogacao(TipoQ, Hoteis, _Suj-servico, ter-Afirmativo) :-
	(TipoQ == que ; TipoQ == qual),
	findall(Servico, 
		(
			hotel(IDHotel, Hotel, _Estrelas, _Tlm, _IdMorada, _IDCidade),
			member(IDHotel, Hoteis),
			servico(IDServico, Servico),
			(
            Afirmativo == s -> 
                tem_servico(IDHotel, IDServico); 
                \+ tem_servico(IDHotel, IDServico)
            )
		), Resposta),
		escreverResposta(_,_,Resposta).

% Que quartos tem X e Y?
verificacaoInterrogacao(TipoQ, Hoteis, _Suj-quarto, ter-Afirmativo) :-
		findall(Quarto,
		(
			hotel(IDHotel, Hotel, _Estrelas, _Tlm, _IdMorada, _IDCidade),
			member(IDHotel, Hoteis),
			quarto(IDQuarto, Quarto, _Num),
			(
            Afirmativo == s -> 
                tem_quarto(IDHotel, IDQuarto, _Preco, _Propriedades); 
                \+ tem_quarto(IDHotel, IDQuarto, _Preco, _Propriedades)
            )
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

filtrar(HoteisAtuais, Obj-quarto, NovaLista) :-
    findall(IDHotel,
    (
        hotel(IDHotel, _Nome, _Estrelas, _Tel, _IDMorada, _IDCidade),
        tem_quarto(IDHotel, _IDQuarto, _Preco),
        member(IDHotel, HoteisAtuais)
    ) , NovaLista), 
    remover_pergunta.

filtrar(HoteisAtuais, _Obj-quarto, HoteisAtuais).

filtrar(HoteisAtuais, Obj-propriedade, NovaLista) :-
    findall(IDHotel,
    (
        hotel(IDHotel, _Nome, _Estrelas, _Tel, _IDMorada, _IDCidade),
        tem_quarto(IDHotel, IDQuarto, _Preco, ListaPropriedades),
        prop_quarto(IDProp, Obj),
        member(IDProp, ListaPropriedades),
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
%( condition -> then_clause ; else_clause )
filtrar(HoteisAtuais, ter-Afirmativo, Obj-servico, NovaLista) :-
    assert(tipo_pergunta(ter,servico)),
    findall(IDHotel,
    (
        hotel(IDHotel, _Nome, _Estrelas, _Tel, _IDMorada, _IDCidade),
        servico(IDServico, Obj),
        (
            Afirmativo == s -> 
                tem_servico(IDHotel, IDServico); 
                \+ tem_servico(IDHotel, IDServico)
        ),
        member(IDHotel, HoteisAtuais)
        
    ) , NovaLista),
    pergunta_atual(ter-Afirmativo).

filtrar(HoteisAtuais, ter-Afirmativo, Obj-quarto, NovaLista) :-
    assert(tipo_pergunta(ter,quarto)),
    % Verifica se é um quarto válido
    quarto(IDQuarto, Obj, _Num),
    findall(IDHotel,
    (
        hotel(IDHotel, _Nome, _Estrelas, _Tel, _IDMorada, _IDCidade),
        quarto(IDQuarto, Obj, _Num),
        (
            Afirmativo == s -> 
                tem_quarto(IDHotel, IDQuarto, Preco, _); 
                \+ tem_quarto(IDHotel, IDQuarto, Preco, _)
        ),
        member(IDHotel, HoteisAtuais)
    ) , NovaLista),
    pergunta_atual(ter-Afirmativo).

filtrar(HoteisAtuais, ter-Afirmativo, Obj-quarto, HoteisAtuais).

filtrar(HoteisAtuais, ter-Afirmativo, Obj-estrelas, NovaLista) :-
    assert(tipo_pergunta(ter,estrelas)),
    findall(IDHotel,
    (
        hotel(IDHotel, _Nome, Estrelas, _Tel, _IDMorada, _IDCidade),
        (
            Afirmativo == s -> 
                Estrelas == Obj; 
                \+ Estrelas == Obj
        ),
        member(IDHotel, HoteisAtuais)
    ) , NovaLista),
    pergunta_atual(ter-Afirmativo).

filtrar(HoteisAtuais, ter-Afirmativo, Obj-maisestrelas, NovaLista) :-
    assert(tipo_pergunta(ter,estrelas)),
    findall(IDHotel,
    (
        hotel(IDHotel, _Nome, Estrelas, _Tel, _IDMorada, _IDCidade),
        (
            Afirmativo == s -> 
                Estrelas > Obj; 
                Estrelas =< Obj
        ),

        member(IDHotel, HoteisAtuais)
    ) , NovaLista),
    pergunta_atual(ter-Afirmativo).

filtrar(HoteisAtuais, ter-Afirmativo, Obj-menosestrelas, NovaLista) :-
    assert(tipo_pergunta(ter,estrelas)),
    findall(IDHotel,
    (
        hotel(IDHotel, _Nome, Estrelas, _Tel, _IDMorada, _IDCidade),
        (
            Afirmativo == s -> 
                Estrelas < Obj; 
                Estrelas >= Obj
        ),
        member(IDHotel, HoteisAtuais)
    ) , NovaLista),
    pergunta_atual(ter-Afirmativo).

filtrar(HoteisAtuais, ficar-Afirmativo, Obj-morada, NovaLista) :-
    assert(tipo_pergunta(ficar, _)),
    findall(IDHotel,
    (
        morada(IDMorada, Obj, _IDCidade),
        hotel(IDHotel, _Nome, Estrelas, _Tel, Morada, _Cidade),
        (
            Afirmativo == s -> 
                IDMorada == Morada; 
                \+ IDMorada == Morada
        ),
        member(IDHotel, HoteisAtuais)
    ) , NovaLista),
    pergunta_atual(ficar-Afirmativo).

filtrar(HoteisAtuais, ficar-Afirmativo, Obj-cidade, NovaLista) :-
    assert(tipo_pergunta(ficar, _)),
    findall(IDHotel,
    (
        cidade(IDCidade, Obj, _IDPais),
        hotel(IDHotel, _Nome, Estrelas, _Tel, _IDMorada, Cidade),
        (
            Afirmativo == s -> 
                IDCidade == Cidade; 
                \+ IDCidade == Cidade
        ),
        member(IDHotel, HoteisAtuais)
    ) , NovaLista),
    pergunta_atual(ficar-Afirmativo).

filtrar(HoteisAtuais, ficar-Afirmativo, Obj-pais, NovaLista) :-
    assert(tipo_pergunta(ficar, _)),
    findall(IDHotel,
    (
        cidade(IDCidade, _NomeCidade, IDPais),
        pais(Pais, _NomePais, _IDContinente),
        hotel(IDHotel, _NomeHotel, Estrelas, _Tel, _IDMorada, IDCidade),
        (
            Afirmativo == s -> 
                IDPais == Pais; 
                \+ IDPais == Pais
        ),
        member(IDHotel, HoteisAtuais)
    ) , NovaLista),
    pergunta_atual(ficar-Afirmativo).

filtrar(HoteisAtuais, ficar-Afirmativo, Obj-continente, NovaLista) :-
    assert(tipo_pergunta(ficar, _)),
    findall(IDHotel,
    (
        cidade(IDCidade, _NomeCidade, IDPais),
        pais(IDPais, _NomePais, IDContinente),
        continente(Continente, Obj),
        hotel(IDHotel, _NomeHotel, Estrelas, _Tel, _IDMorada, IDCidade),
        (
            Afirmativo == s -> 
                Continente == IDContinente; 
                \+ Continente == IDContinente
        ),
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
    retract(e_pergunta).

% Caso não haja perguntas ainda
remover_pergunta.

/* ------------------------ */
/*        RESPOSTAS         */
/* -------------------------*/

% RESPOSTAS ESPECIFICAS
analise_lista(Quant, Lista) :-
	nonvar(Quant), 
    tipo_pergunta(Verbo, TipoInformacao),
	escreverResposta(Verbo, TipoInformacao, Lista).

% Para caso de pergunta iniciada com [e]
analise_lista(_, Lista) :-
    tipo_pergunta(Verbo, TipoInformacao),
    escreverResposta(Verbo, TipoInformacao, Lista).

% RESPOSTA GENÉRICA
analise_lista(Quant, Lista) :-
	nonvar(Quant), 
	nl,write('A resposta certa e : '), writeListHoteis(Lista).

analise_lista(Lista) :-
	retract(hasErrors),
	% É uma afirmação, nas está errrada
	write('A informacao nao esta de acordo com a nossa base de dados').
	
analise_lista(Lista) :-
	write('A informacao esta de acordo com a nossa base de dados').

analise_lista(quanto, Lista) :-
	write('A resposta certa e : '), length(Lista, Comprimento), write(Comprimento).

%Fica em cidade
escreverResposta(ficar,_, Lista) :-
    write('Os hoteis sao : '), nl,
    sort(Lista, Distinta),
    writeListHoteis(Distinta, ficar).

% Para caso a de cima falhe
escreverResposta(ficar,_,Lista) :-
    !,write('Nao ha nada com a descricao dada'), nl.

%Tem Servico
escreverResposta(_,_, [Head|Tail]) :-
    servico(_, Head),
    sort([Head|Tail], Distinta),
    write('Os servicos sao : '), nl,
    writeList(Distinta).

%Tem Quarto
escreverResposta(ter,quarto, Lista) :-
    quarto(_, Head, NumPessoas),
    sort(Lista, Distinta),
    write('Os quartos sao : '), nl,
    writeListQuartos(Distinta).


escreverResposta(_,_, []) :-
    !,write('Nao ha nada com a descricao dada.'), nl.