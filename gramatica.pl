:-reconsult('dados.pl').
:-reconsult('lexico.pl').
:-reconsult('verificacoes.pl').

/*----------------------*/
/* ESTRUTURA DAS FRASES */
/*----------------------*/

/*
frase(_,_):- retract(erroSem), write("Erro Semantico").
frase(_,_):- write("erro sintaxe").*/

%frase(Acao,Suj,Obj) --> frase_interrogativa(Acao, Suj, Obj), [?].

frase(Acao,Suj,Obj) --> frase_interrogativa(Acao, Suj, Obj), ['?'].
frase(Acao,Suj,Obj) --> frase_afirmativa(Acao, Suj, Obj), [.].

frase_interrogativa(Acao, Suj, Obj) -->
	interrogativa_assis(Acao, Suj, Obj).

% Ex : Que/Quais serviços disponibiliza o Hotel X?
interrogativa_assis(Acao, Suj, Obj) -->
	% quantificador indica que tipo de pergunta está a ser feita
	quantificador(TipoP, N), 
	sintagma_nominal(LSuj, N),
	sintagma_verbal(Acao, Suj, N2, LSuj),
	{write('Final result is '), write(Acao), write(' '), write(Suj), write(' '), write(LSuj)},
	{verificacaoInterrogacaoTotal(TipoP, LSuj, Suj, Acao)}.

% Ex : Quantos são os hoteis que ficam em X?
interrogativa_assis(Acao, Suj, Obj) -->
	% quantificador indica que tipo de pergunta está a ser feita
	quantificador(TipoP, N-G), 
	sintagma_verbal(Acao, Suj, N-G, LSuj),
	sintagma_nominal(LSuj, N2),
	{write('Final result is '), write(Acao), write(' '), write(Suj), write(' '), write(LSuj)},
	{verificacaoInterrogacaoTotal(TipoP, LSuj, Suj, Acao)}.

frase_afirmativa(Acao,Suj,Obj) --> afirmativa_assis(Acao, LSuj, Obj).

afirmativa_assis(Acao, LSuj, Obj) --> 
	sintagma_nominal(LSuj, N), 
	sintagma_verbal(LAcao, LObj, N, LSuj),
	{verificacaoAfirmacaoTotal(LSuj, LObj, LAcao)}.

% Nverbo é 'p' pois são dois ou mais sujeitos, daí ser plural
sintagma_nominal([Suj-Tipo | O], N) --> sintagma_nominal_aux(Suj-Tipo, N), [e], sintagma_nominal(O, N, _). 
sintagma_nominal(Suj-Tipo, N) --> sintagma_nominal_aux(Suj-Tipo, N).

sintagma_nominal_aux(Suj-Tipo, N-G) --> determinante(N-G), nome(N-G, Suj-Tipo).
sintagma_nominal_aux(Suj-Tipo, N-G) --> preposicao(N-G), nome(N-G, Suj-Tipo).
sintagma_nominal_aux(Suj-Tipo, N-G) --> nome(N-G, Suj-Tipo).

/* 
Quantos (são) os hotéis do Porto?
Quais (são) os hotéis de categoria superior a 3 estrelas em Lisboa?
E em Coimbra?
Que/Quais serviços disponibiliza o Hotel X? (feito)
Quais os hotéis parisienses que possuem serviço de babysitting? (fazer um novo predicado de lexico deLocal, que liga palavra a IDCidade)
Quais os hotéis de Faro que possuem categoria inferior a 4 e quartos com vista de mar? 
O Hotel X fica em Faro e possui 4 estrelas. (feito)
*/


% TODO: verificação semantica que todos os tipos correspondem ao verbo
%varios sujeitos e varios sintagmas verbais
sintagma_verbal([Acao | OAcao], [Obj | OObj], N, [_-Tipo | O]) -->
	verbal_assis(Acao, Obj, p-G, Tipo), {write(Acao),write('-1L-'), write(Obj),nl},  [e], sintagma_verbal(OAcao, OObj, N, [_-Tipo | O]).

%varios sujeitos e um sintagma verbal
sintagma_verbal(Acao, [Obj], N, [_-Tipo | O]) -->  
	verbal_assis(Acao,  Obj, p-G, Tipo), {write(Acao),write('L-'), write(Obj),nl}.

%um sujeito e varios sintagmas verbais
sintagma_verbal([Acao | OAcao], [Obj | OObj], N, _-Tipo) -->
	verbal_assis(Acao, Obj, p-G, Tipo), {write(Acao),write('-2L-'), write(Obj),nl}, [e], sintagma_verbal(OAcao, OObj, N, _-Tipo).

%um sujeitos e um sintagma verbal
sintagma_verbal(Acao, [Obj], N, _-Tipo) -->  %se existem varios sujeitos, as formas verbais têm de estar no plural
	verbal_assis(Acao, Obj, N-G, Tipo), {write(Acao),write('L-'), write(Obj),nl}.

verbal_assis(Acao, Obj, N-G, Tipo) --> 
	forma_verbal(N-G, Acao-P), 
	determinante(N2-G2),
	nome(N2-G2, Obj-Tipo2),
	{teste_semantico(Acao, Tipo,Tipo2)}. 

verbal_assis(Acao, Obj, N-G, Tipo) -->
	forma_verbal(N, Acao-P), 
	nome(_, Obj-Tipo2),
	{teste_semantico(Acao, Tipo,Tipo2)}. 

verbal_assis(Acao, Obj, N-G, Tipo) --> 
	forma_verbal(N-G, Acao-P), 
	preposicao(N2-G2),
	nome(N2-G2, Obj-Tipo2),
	{teste_semantico(Acao, Tipo,Tipo2)}. 

% Ex: o hotel FICA EM TIRANA
teste_semantico(Acao, Tipo1, Tipo2):-
	P=..[Acao, Tipo1, Tipo2],
	P.

% Ex: que SERVICOS TEM
teste_semantico(Acao, Tipo1, Tipo2):-
	P=..[Acao, Tipo2, Tipo1],
	P.
