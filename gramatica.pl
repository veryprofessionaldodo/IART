:-reconsult('dados.pl').
:-reconsult('lexico.pl').

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

afirmativa_assis(Acao, LSuj, Obj) --> sintagma_nominal(LSuj, N, NVerbo), 
	sintagma_verbal(Acao, Obj, NVerbo, LSuj)
	, {verificacaoAfirmacao(LSuj, Obj, Acao)}.

frase_interrogativa(Acao, Suj, Obj) -->
	/*{write('pica')},*/quantificador(Num-Gen, Tipo).

% acrescentar mais tarde lista de sujeitos, separados com "e"
sintagma_nominal([Suj-Tipo | O], N, p) --> sintagma_nominal_aux(Suj-Tipo, N), [e], sintagma_nominal(O, N).
sintagma_nominal(LSuj, N, _) --> sintagma_nominal_aux(LSuj, N).

sintagma_nominal_aux(Suj-Tipo, N) --> determinante(N-G), nome(N-G, Suj-Tipo).
/* 
\item Quantos (são) os hotéis do Porto?
\item Quais (são) os hotéis de categoria superior a 3 estrelas em Lisboa?
\item E em Coimbra?
\item Que/Quais serviços disponibiliza o Hotel X?
\item Quais os hotéis parisienses que possuem serviço de babysitting?
\item Quais os hotéis de Faro que possuem categoria inferior a 4 e quartos com vista de mar? 
\item O Hotel X fica em Faro e possui 4 estrelas.
*/

sintagma_verbal(Acao, Obj, N, [_-Tipo | O]) -->  %missing some stuff here
	verbal_assis(Acao, Obj, N, Tipo).

verbal_assis(Acao, Obj, N, Tipo) -->
	forma_verbal(N, Acao-P), 
	nome(_, Obj-Tipo2),
	{teste_semantico(Acao, Tipo,Tipo2)}. 

verbal_assis(Acao, Obj, N, Tipo) --> 
	forma_verbal(N, Acao-P), 
	preposicao(N-G),
	nome(N-G, Obj-Tipo2),
	{teste_semantico(Acao, Tipo,Tipo2)}. 


%P pode ser afirmativo ou negativo 
teste_semantico(Acao, Suj, Tipo):-
	P=..[Acao, Suj, Tipo],
	P.

% verifica frases afirmativas
verificacaoAfirmacao(Suj-Tipo, [Obj], ficar):-
	hotel(_ID,Suj,_Estrelas, _Tlm, _Morada, IDCidade, IDRegiao),
	cidade(IDCidade, Obj, _IDPais),
	write('Os dados estao de acordo com as nossas base de dados').

verificacaoAfirmacao([Suj-Tipo | Resto], [Obj], ficar):-
	hotel(_ID,Suj,_Estrelas, _Tlm, _Morada, IDCidade, IDRegiao),
	cidade(IDCidade, Obj, _IDPais),
	verificacaoAfirmacao(Resto, [Obj], ficar).

verificacaoAfirmacao([_], _, _):-
	write('Esta informação nao esta de acordo com a nossa base de dados.'),nl.



%frase_interrogativa(Acao, Suj, Obj) --> .

/*
frase(LWords, Response) --> sintagma_nominal(LSuj, N), 
			sintagma_verbal(Acao, Obj, N, LSuj), 
			{resposta(Suj, Acao, Obj)}.

sintagma_nominal(LSuj, N) --> sn1(LSuj, N).
sintagma_nominal([Suj | O], P) --> sn1(Suj, _), [e], sn(O,_). % dois sujeitos

sn1([Suj], N) --> determinante(N-G), nome(N-G, Suj).
	
sintagma_verbal(Acao, Obj, N, LSuj) --> verbo(Acao, N), nome(_, Obj).
sintagma_verbal(gostar, Obj, N, LSuj) --> verbo(gostar, N), preposicao(G1-N1), nome(G1-N1, Obj).

resposta(Suj, Acao, Obj):-
	P = ..[Acao, Suj, Obj],
	(P, write('Sim') ; write('Nao')).*/
