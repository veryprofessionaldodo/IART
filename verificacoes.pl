:-reconsult(utils).

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
		escreverResposta(TipoQ,Resposta).

% Que quartos tem X e Y?
verificacaoInterrogacao(TipoQ, Hoteis, _Suj-quarto, ter) :-
		findall(Quarto,
		(
			hotel(IDHotel, Hotel, _Estrelas, _Tlm, _IdMorada, _IDCidade),
			member(IDHotel, Hoteis),
			quarto(IDQuarto, Quarto, _Num),
			tem_quarto(IDHotel, IDQuarto)
		), Resposta),
		escreverResposta(TipoQ,Resposta).

escreverResposta(quanto, Resposta):-
	nl,write('Resposta: '),nl,length(Resposta, Comp), write(Comp),nl.

escreverResposta(_, Resposta):-
	nl,write('Resposta: '),writeList(Resposta),nl.

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


% Para análise recursiva
verifica_filtro(HoteisAtuais, NovaLista) :-
	length(HoteisAtuais, L1),
	length(NovaLista, L2),
	L1 == L2.

% SE FOR AFIRMACAO, ESTA
verifica_filtro(_,_) :- assert(hasErrors). 

analise_lista(Lista) :-
	retract(hasErrors),
	% É uma afirmação, nas está errrada
	write('A informacao nao esta de acordo com a nossa base de dados').
	
analise_lista(Lista) :-
	write('A informacao esta de acordo com a nossa base de dados').

analise_lista(quanto, Lista) :-
	nl,write('A resposta certa e : '), length(Lista, Comprimento), write(Comprimento).

analise_lista(Quant, Lista) :-
	nonvar(Quant), 
	nl,write('A resposta certa e : '), writeListHoteis(Lista).
:-dynamic hasErrors/0.