/*----------------------*/
/* ESTRUTURA DAS FRASES */
/*----------------------*/

:-ensure_loaded([dados, lexico, filtro]).

frase(_,_):- retract(erroSem), write("Erro Semantico").
frase(_,_):- write("erro sintaxe").

frase(Acao,Suj,Obj) --> frase_interrogativa(Acao, Suj, Obj), [?].
frase(Acao,Suj,Obj) --> frase_afirmativa(Acao, Suj, Obj), [.].

frase_afirmativa(Acao,Suj,Obj) --> sintagma_nominal(Suj), sintagma_verbal(Acao, Obj).

% acrescentar mais tarde lista de sujeitos, separados com "e"
sintagma_nominal(Suj, N) --> determinante(N-G), nome()


frase_interrogativa(Acao, Suj, Obj).

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
