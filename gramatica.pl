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

frase(Acao,Suj,Obj) --> frase_afirmativa(Acao, Suj, Obj), [.].
frase(Acao,Suj,Obj) --> frase_interrogativa(Acao, Suj, Obj), ['?'].

frase_afirmativa(Acao,Suj,Obj) --> afirmativa_assis(Acao, LSuj, Obj).

afirmativa_assis(Acao, LSuj, Obj) --> 
	sintagma_nominal(LSuj, N), 
	sintagma_verbal(Acao, Obj, N, LSuj),
	{verificacaoAfirmacao(LSuj, Obj, Acao)}.

frase_interrogativa(Acao, Suj, Obj) -->
	interrogativa_assis(Acao, Suj, Obj).

% Ex : Que/Quais serviços disponibiliza o Hotel X?
interrogativa_assis(Acao, Suj, Obj) -->
	% quantificador indica que tipo de pergunta está a ser feita
	quantificador(TipoP, N), 
	sintagma_nominal(Suj-TipoS, N),
	sintagma_verbal(Acao, Suj, N2, TipoS),
	sintagma_nominal(_N, N2).


sintagma_nominal([Suj-Tipo | O], N) --> sintagma_nominal_aux(Suj-Tipo, N-G), [e], sintagma_nominal(O, N, _). % Nverbo é 'p' pois são dois ou mais sujeitos, daí ser plural
sintagma_nominal(Suj-Tipo, N) --> sintagma_nominal_aux(Suj-Tipo, N-G).

sintagma_nominal_aux(Suj-Tipo, N-G) --> determinante(N-G), nome(N-G, Suj-Tipo).
sintagma_nominal_aux(Suj-Tipo, N-G) --> preposicao(N-G), nome(N-G, Suj-Tipo).
sintagma_nominal_aux(Suj-Tipo, N-G) --> nome(N-G, Suj-Tipo).

/* 
Quantos (são) os hotéis do Porto?
Quais (são) os hotéis de categoria superior a 3 estrelas em Lisboa?
E em Coimbra?
Que/Quais serviços disponibiliza o Hotel X?
Quais os hotéis parisienses que possuem serviço de babysitting?
Quais os hotéis de Faro que possuem categoria inferior a 4 e quartos com vista de mar? 
O Hotel X fica em Faro e possui 4 estrelas.
*/

sintagma_verbal(Acao, Obj, N, [_-Tipo | O]) -->  %missing some stuff here
	verbal_assis(Acao, Obj, p-G, Tipo). % TODO: verificação semantica que todos os tipos correspondem ao verbo

sintagma_verbal(Acao, Obj, N, _-Tipo) -->  %se existem varios sujeitos, as formas verbais têm de estar no plural
	verbal_assis(Acao, Obj, N-G, Tipo).

verbal_assis(Acao, Obj, N-G, Tipo) -->
	forma_verbal(N, Acao-P), 
	nome(_, Obj-Tipo2),
	{teste_semantico(Acao, Tipo,Tipo2)}. 

verbal_assis(Acao, Obj, N-G, Tipo) --> 
	forma_verbal(N-G, Acao-P), 
	preposicao(N-G),
	nome(N-G, Obj-Tipo2),
	{teste_semantico(Acao, Tipo,Tipo2)}. 

%P pode ser afirmativo ou negativo 
teste_semantico(Acao, Tipo1, Tipo2):-
	P=..[Acao, Tipo1, Tipo2],
	P.
