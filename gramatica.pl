/*----------------------*/
/* ESTRUTURA DAS FRASES */
/*----------------------*/

frase(_,_):- retract(erroSem), write('Erro Semantico').
frase(_,_):- write('erro sintaxe').

frase(A, S, O, At) --> frase_interrogativa(_, A, S, O, At), [?].
frase(A, S, O, 1) --> frase_afirmativa(_, A, S, O), [.].

% Regular Sentences
frase_afirmativa(Numero, A, S, O) --> aditiva(_-Numero, S, A), sintagma_verbal(Numero, A, S, O).
frase_afirmativa(Numero, _, S, _) --> aditiva(_-Numero, S, _).

% Questions
frase_interrogativa(Numero, A, _, O, At) --> quantificador(_-Numero, At), sintagma_verbal(Numero, A, _, O).
frase_interrogativa(Numero, A, S, O, At) --> quantificador(Genero-Numero, At), sintagma_nominal(Genero-Numero, S), sintagma_verbal(Numero, A, S, O).

sintagma_nominal(LSuj, N) --> sn1(LSuj, N).
sintagma_nominal([Suj | O], P) --> sn1(Suj, _), [e], sn(O,_). % dois sujeitos

sn1([Suj], N) --> determinante(N-G), nome(N-G, Suj).
	
sintagma_verbal(Acao, Obj, N, LSuj) --> verbo(Acao, N), nome(_, Obj).
sintagma_verbal(gostar, Obj, N, LSuj) --> verbo(gostar, N), preposicao(G1-N1), nome(G1-N1, Obj).

resposta(Suj, Acao, Obj):-
	P = ..[Acao, Suj, Obj],
	(P, write('Sim') ; write('Nao')).


/* 
\item Quantos (são) os hotéis do Porto?
\item Quais (são) os hotéis de categoria superior a 3 estrelas em Lisboa?
\item E em Coimbra?
\item Que/Quais serviços disponibiliza o Hotel X?
\item Quais os hotéis parisienses que possuem serviço de babysitting?
\item Quais os hotéis de Faro que possuem categoria inferior a 4 e quartos com vista de mar? 
\item O Hotel X fica em Faro e possui 4 estrelas.
*/
