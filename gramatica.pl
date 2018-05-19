:-reconsult('dados.pl').
:-reconsult('lexico.pl').
:-reconsult('verificacoes.pl').
:-reconsult('filtros.pl').

:-dynamic lastData/4.

/*----------------------*/
/* ESTRUTURA DAS FRASES */
/*----------------------*/

/*
frase(_,_):- retract(erroSem), write("Erro Semantico").
frase(_,_):- write("erro sintaxe").*/

%frase(Acao,Suj,Obj) --> frase_interrogativa(Acao, Suj, Obj), [?].

/*
frase(Acao,Suj,Obj) --> frase_interrogativa(TipoP, Acao, Suj, Obj), ['?'], 
						%{write('FRASE: '),nl,write(TipoP),write(' '),write(Acao),write(' '),write(Suj),write(' '),write(Obj),nl,
						verificacaoInterrogacaoTotal(TipoP, Suj, Obj, Acao, [])}.
*/
frase(_Acao, _Suj, _Obj) --> 
	recursive_assis.

frase(Acao,Suj,Obj) --> frase_afirmativa(Acao, Suj, Obj), [.].

frase_interrogativa(TipoP, Acao, Suj, Obj) -->
	interrogativa_assis(TipoP, Acao, Suj, Obj).

/* 
	PERGUNTAS COM O CONTEXTO DA PERGUNTA ANTERIOR
*/

%Começa por E - lugar
interrogativa_assis(TipoP, Acao, LSuj, [NovoSuj]) -->
	conjuncao(_),
	novo_sujeito_l(NovoSuj),
	{retract((lastData(TipoP, LSuj, _Suj, Acao)))}.

%Começa por E - hotel
interrogativa_assis(TipoP, Acao, LSuj, [NovosSujs]) -->
	conjuncao(_),
	novo_sujeito_s(NovosSujs),
	{retract((lastData(TipoP, LSuj, Suj, Acao))), 
		write('retract: '), write(TipoP), write(' '), write(LSuj), write(' '), write(Suj), write(' '), write(Acao),nl}.

/*
	PERGUNTAS SEM CONTEXTO DA PERGUNTA ANTERIOR
*/

% Ex : Que/Quais serviços disponibiliza o Hotel X?

interrogativa_assis(TipoP, Acao, LSuj, Obj) -->
	% quantificador indica que tipo de pergunta está a ser feita
	quantificador(TipoP, N), 
	sintagma_nominal(LSuj, N),
	sintagma_verbal(Acao, Obj, _N2, LSuj),
	{write('2Final result is '), write(Acao), write(' '), write(Obj), write(' '), write(LSuj)},
	{assert((lastData(TipoP, LSuj, Obj, Acao)))}.

%Ex : Quais os hotéis parisienses que possuem ...
interrogativa_assis(TipoP, [Acao1 | Acao], LSuj, [Obj1 | Suj]) -->
	% quantificador indica que tipo de pergunta está a ser feita
	quantificador(TipoP, N), 
	sintagma_nominal(LSuj, N),
	adjetivo(N,Obj1-_Tipo, Acao1),
	sintagma_verbal(Acao, Suj, _N2, LSuj),
	 % adicionar lista ao assert
	{write('Final result is '), write([Acao1 | Acao]), write(' '), write([Obj1 | Suj]), write(' '), write(LSuj)}.

%Ex: Quais os hoteis parisienses?
interrogativa_assis(TipoP, Acao, LSuj, [Obj]) -->
	% quantificador indica que tipo de pergunta está a ser feita
	quantificador(TipoP, N), 
	sintagma_nominal(LSuj, N),
	adjetivo(N,Obj-_Tipo, Acao),
	{write('Final result is '), write(Acao), write(' '), write(Obj), write(' '), write(LSuj)},
	{assert((lastData(TipoP, LSuj, Obj, Acao)))}.

% Ex : Quantos são os hoteis que ficam em X?
interrogativa_assis(TipoP, Acao, LSuj, Obj) -->
	% quantificador indica que tipo de pergunta está a ser feita
	quantificador(TipoP, N), 
	sintagma_verbal(Acao, Obj, N, LSuj),
	sintagma_nominal(LSuj, _N2),
	%{write('Final result is '), write(Acao), write(' '),write(N), write(' '), write(Obj), write(' '), write(LSuj)},
	{assert((lastData(TipoP, LSuj, Obj, Acao)))}.

% Ex : Quais os hotéis de categoria superior a 3 estrelas em Lisboa? 
recursive_assis -->
	{findall(IDHotel, hotel(IDHotel, _, _, _, _, _), Hoteis)},
	recursive_assis1(Hoteis, ListaFinal), [.], {analise_lista(_TipoP, ListaFinal)}.

recursive_assis -->
	quantificador(TipoP, _N), 
	{findall(IDHotel, hotel(IDHotel, _, _, _, _, _), Hoteis)},
	recursive_assis1(Hoteis, ListaFinal), [?], {analise_lista(TipoP, ListaFinal)}.

recursive_assis1(HoteisAtuais, ListaFinal) -->
	sintagma_nominal(Suj-Tipo, _N),
	{filtrar(HoteisAtuais, Suj-Tipo, NovaLista), write(NovaLista)},
	recursive_assis1(NovaLista, ListaFinal).

	%{assert((lastData(TipoP, LSuj, Obj, Acao)))}.
	
recursive_assis1(ListaFinal, ListaFinal) --> {true}.
/* 
Quantos (são) os hotéis do Porto? (feito)
Quais os hotéis de categoria superior a 3 estrelas em Lisboa? (feito)
E em Coimbra? (feito)
Que/Quais serviços disponibiliza o Hotel X? (feito)
Quais os hotéis parisienses que possuem serviço de babysitting? (feito)
Quais os hotéis de Faro que possuem categoria inferior a 4 e quartos com vista de mar? 
O Hotel X fica em Faro e possui 4 estrelas. (feito)
*/

/* ------------------------ */
/*		FRASE AFIRMATIVA 	*/
/* -------------------------*/

frase_afirmativa(Acao,LSuj,Obj) --> afirmativa_assis(Acao, LSuj, Obj).

afirmativa_assis(LAcao, LSuj, LObj) --> 
	sintagma_nominal(LSuj, N-_G),
	sintagma_verbal(LAcao, LObj, N, LSuj, Tipo2),
	{write('AfiAssis: '),write(LAcao),write(' '),write(LSuj),write(' '),write(LObj),write(' '),write(Tipo2),nl},
	{verificacaoAfirmacaoTotal(LSuj, LObj, LAcao, Tipo2)}.

/* ------------------------ */
/*		   SINTAGMAS 		*/
/* -------------------------*/

% Nverbo é 'p' pois são dois ou mais sujeitos, daí ser plural
sintagma_nominal([Suj-Tipo | O], p-G) --> sintagma_nominal_aux(Suj-Tipo, N-G), [e], sintagma_nominal(O, N-G). 
sintagma_nominal(Suj-Tipo, N-G) --> sintagma_nominal_aux(Suj-Tipo, N-G).

sintagma_nominal_aux(Suj-Tipo, N-G) --> determinante(N-G), nome(N-G, Suj-Tipo).
sintagma_nominal_aux(Suj-Tipo, N-G) --> preposicao(N-G), nome(N-G, Suj-Tipo).
sintagma_nominal_aux(Suj-Tipo, N-G) --> nome(N-G, Suj-Tipo).

% TODO: verificação semantica que todos os tipos correspondem ao verbo

%varios sujeitos e varios sintagmas verbais
sintagma_verbal([Acao | OAcao], [Obj | OObj], N, [_-Tipo | O], Tipo2) -->
	[que], verbal_assis(Acao, Obj, N, Tipo, Tipo2), [e], sintagma_verbal(OAcao, OObj, N, [_-Tipo | O], Tipo2).

sintagma_verbal([Acao | OAcao], [Obj | OObj], N, [_-Tipo | O], Tipo2) -->
	verbal_assis(Acao, Obj, N, Tipo, Tipo2), {write('here '), write(Acao),nl}, [e], sintagma_verbal(OAcao, OObj, N, [_-Tipo | O], Tipo2).

%varios sujeitos e um sintagma verbal
sintagma_verbal(Acao, [Obj], N, [_-Tipo | _O], Tipo2) -->  
	[que], verbal_assis(Acao,  Obj, N, Tipo, Tipo2).

sintagma_verbal(Acao, [Obj], N, [_-Tipo | _O], Tipo2) -->  
	verbal_assis(Acao,  Obj, N, Tipo, Tipo2), {write('here2 '), write(Acao),nl}.

%um sujeito e varios sintagmas verbais
sintagma_verbal([Acao | OAcao], [Obj | OObj], N, _-Tipo, Tipo2) -->
	[que], verbal_assis(Acao, Obj, N, Tipo, Tipo2), [e], sintagma_verbal(OAcao, OObj, N, _-Tipo, Tipo2).

sintagma_verbal([Acao | OAcao], [Obj | OObj], N, _-Tipo, Tipo2) -->
	verbal_assis(Acao, Obj, N, Tipo, Tipo2), [e], sintagma_verbal(OAcao, OObj, N, _-Tipo, Tipo2).

%um sujeito e um sintagma verbal
sintagma_verbal(Acao, [Obj], N, _-Tipo, Tipo2) -->
	[que], verbal_assis(Acao, Obj, N, Tipo, Tipo2).

sintagma_verbal(Acao, [Obj], N, _-Tipo, Tipo2) -->
	verbal_assis(Acao, Obj, N, Tipo, Tipo2).

verbal_assis(Acao, Obj, N, Tipo, Tipo2) --> 
	{nonvar(Tipo)}, % Tipo já está instanciado
	forma_verbal(N, Acao-_P), 
	determinante(N2),
	nome(N2, Obj-Tipo2),
	{write('VerbAssis: '),write(Acao),nl,teste_semantico(Acao, Tipo,Tipo2)}. 

% Tipo não está instanciado, por isso não é efetuado um teste semântico aqui. 
% Só feito depois (caso especial do quanto sao os hoteis, hoteis esta depois da forma verbal)
verbal_assis(Acao, Obj, N, _Tipo, Tipo2) --> 
	forma_verbal(N, Acao-_P), 
	determinante(N2),
	nome(N2, Obj-Tipo2). 

verbal_assis(Acao, Obj, N, Tipo, Tipo2) -->
	{nonvar(Tipo)}, % Tipo já está instanciado
	forma_verbal(N, Acao-_P), 
	nome(_, Obj-Tipo2),
	{write('here AA: '), write(Obj), nl,teste_semantico(Acao, Tipo,Tipo2)}. 

verbal_assis(Acao, Obj, N, _Tipo, Tipo2) -->
	forma_verbal(N, Acao-_P), 
	nome(_, Obj-Tipo2). 

verbal_assis(Acao, Obj, N, Tipo, Tipo2) --> 
	{nonvar(Tipo)}, % Tipo já está instanciado
	forma_verbal(N, Acao-_P), 
	preposicao(N2),
	nome(N2, Obj-Tipo2),
	{teste_semantico(Acao, Tipo,Tipo2)}. 
	
verbal_assis(Acao, Obj, N, _Tipo, Tipo2) --> 
	forma_verbal(N, Acao-_P), 
	preposicao(N2),
	nome(N2, Obj-Tipo2). 
	
verbal_assis(Acao, Obj, N, Tipo, Tipo2) --> 
	{nonvar(Tipo)},
	forma_verbal(N, Acao-_P), 
	preposicao(N2),
	nome(N2, Obj-Tipo2),
	{teste_semantico(Acao, Tipo,Tipo2)}. 	

verbal_assis(Acao, Obj, N, _Tipo, Tipo2) --> 
	forma_verbal(N, Acao-_P), 
	preposicao(N2),
	nome(N2, Obj-Tipo2). 	

%lugar
novo_sujeito_l(NovoSuj) --> %incluir teste semantico!
	nome(_, NovoSuj-Tipo),
	{write('novo_sujeito: '), write(NovoSuj-Tipo)}.

novo_sujeito_s(Suj) -->
	determinante(N), nome(N, Suj-_Tipo).

/*novo_sujeito_s([Suj | O]) --> %incluir teste semantico!
	novo_sujeito_aux(Suj), [e], novo_sujeito_s(O, N). 

novo_sujeito_aux(Suj) -->
	determinante(N-G), nome(N-G, Suj-_Tipo).*/

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

