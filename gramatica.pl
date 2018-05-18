:-reconsult('dados.pl').
:-reconsult('lexico.pl').
:-reconsult('verificacoes.pl').

:-dynamic lastData/4.

/*----------------------*/
/* ESTRUTURA DAS FRASES */
/*----------------------*/

/*
frase(_,_):- retract(erroSem), write("Erro Semantico").
frase(_,_):- write("erro sintaxe").*/

%frase(Acao,Suj,Obj) --> frase_interrogativa(Acao, Suj, Obj), [?].

frase(Acao,Suj,Obj) --> frase_interrogativa(TipoP, Acao, Suj, Obj), ['?'], 
						{	write('FRASE: '),nl,write(TipoP),write(' '),write(Acao),write(' '),write(Suj),write(' '),write(Obj),nl,
							verificacaoInterrogacaoTotal(TipoP, Suj, Obj, Acao, [])}.

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
	{retract((lastData(TipoP, LSuj, Suj, Acao)))}.

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
	sintagma_verbal(Acao, Obj, N2, LSuj),
	{write('2Final result is '), write(Acao), write(' '), write(Obj), write(' '), write(LSuj)},
	{assert((lastData(TipoP, LSuj, Obj, Acao)))}.

%Ex : Quais os hotéis parisienses que possuem ...
interrogativa_assis(TipoP, [Acao1 | Acao], LSuj, [Obj1 | Suj]) -->
	% quantificador indica que tipo de pergunta está a ser feita
	quantificador(TipoP, N), 
	sintagma_nominal(LSuj, N),
	adjetivo(N,Obj1-Tipo, Acao1),
	sintagma_verbal(Acao, Suj, N2, LSuj),
	{write('Final result is '), write([Acao1 | Acao]), write(' '), write([Obj1 | Suj]), write(' '), write(LSuj)}. % adicionar lista ao assert

%Ex: Quais os hoteis parisienses?
interrogativa_assis(TipoP, Acao, LSuj, [Obj]) -->
	% quantificador indica que tipo de pergunta está a ser feita
	quantificador(TipoP, N), 
	sintagma_nominal(LSuj, N),
	adjetivo(N,Obj-Tipo, Acao),
	{write('Final result is '), write(Acao), write(' '), write(Obj), write(' '), write(LSuj)},
	{assert((lastData(TipoP, LSuj, Obj, Acao)))}.

% Ex : Quantos são os hoteis que ficam em X?
interrogativa_assis(TipoP, Acao, LSuj, Obj) -->
	% quantificador indica que tipo de pergunta está a ser feita
	quantificador(TipoP, N-G), 
	sintagma_verbal(Acao, Obj, N-G, LSuj),
	sintagma_nominal(LSuj, N2),
	{write('Final result is '), write(Acao), write(' '),write(N-G), write(' '), write(Obj), write(' '), write(LSuj)},
	{assert(TipoP, LSuj, Obj, Acao)}.



/* 
Quantos (são) os hotéis do Porto?
Quais (são) os hotéis de categoria superior a 3 estrelas em Lisboa?
E em Coimbra?
Que/Quais serviços disponibiliza o Hotel X? (feito)
Quais os hotéis parisienses que possuem serviço de babysitting? (fazer um novo predicado de lexico deLocal, que liga palavra a IDCidade)
Quais os hotéis de Faro que possuem categoria inferior a 4 e quartos com vista de mar? 
O Hotel X fica em Faro e possui 4 estrelas. (feito)
*/


/* ------------------------ */
/*		FRASE AFIRMATIVA 	*/
/* -------------------------*/


frase_afirmativa(Acao,Suj,Obj) --> afirmativa_assis(Acao, LSuj, Obj).

afirmativa_assis(Acao, LSuj, Obj) --> 
	sintagma_nominal(LSuj, N-G),
	sintagma_verbal(LAcao, LObj, N, LSuj),
	{verificacaoAfirmacaoTotal(LSuj, LObj, LAcao)}.


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
sintagma_verbal([Acao | OAcao], [Obj | OObj], N, [_-Tipo | O]) -->
	verbal_assis(Acao, Obj, N, Tipo), [e], sintagma_verbal(OAcao, OObj, N, [_-Tipo | O]).

%varios sujeitos e um sintagma verbal
sintagma_verbal(Acao, [Obj], N, [_-Tipo | O]) -->  
	verbal_assis(Acao,  Obj, N, Tipo).

%um sujeito e varios sintagmas verbais
sintagma_verbal([Acao | OAcao], [Obj | OObj], N, _-Tipo) -->
	verbal_assis(Acao, Obj, N, Tipo), [e], sintagma_verbal(OAcao, OObj, N, _-Tipo).

%um sujeitos e um sintagma verbal
sintagma_verbal(Acao, [Obj], N, _-Tipo) -->
	verbal_assis(Acao, Obj, N, Tipo).

verbal_assis(Acao, Obj, N, Tipo) --> 
	forma_verbal(N-G, Acao-P), 
	determinante(N2-G2),
	nome(N2-G2, Obj-Tipo2),
	{teste_semantico(Acao, Tipo,Tipo2)}. 

verbal_assis(Acao, Obj, N, Tipo) -->
	forma_verbal(N, Acao-P), 
	nome(_, Obj-Tipo2),
	{teste_semantico(Acao, Tipo,Tipo2)}. 

verbal_assis(Acao, Obj, N, Tipo) --> 
	forma_verbal(N-G, Acao-P), 
	preposicao(N2-G2),
	nome(N2-G2, Obj-Tipo2),
	{teste_semantico(Acao, Tipo,Tipo2)}. 

%lugar
novo_sujeito_l(NovoSuj) --> %incluir teste semantico!
	nome(N-G, NovoSuj-Tipo),
	{write('novo_sujeito: '), write(NovoSuj-Tipo)}.

novo_sujeito_s(Suj) -->
	determinante(N-G), nome(N-G, Suj-_Tipo).

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