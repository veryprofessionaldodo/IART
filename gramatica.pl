:-reconsult('dados.pl').
:-reconsult('lexico.pl').
:-reconsult('filtros.pl').

:-dynamic lastData/4.

/*----------------------*/
/* ESTRUTURA DAS FRASES */
/*----------------------*/

/*
frase(_,_):- retract(erroSem), write("Erro Semantico").
frase(_,_):- write("erro sintaxe").*/

frase --> 
	recursive_assis.


% Criado para casos especiais
frase --> frase_interrogativa, ['?'].

frase_interrogativa -->
	interrogativa_assis.

%Estruturas simples e específicas para o contexto do trabalho, com menos foco na recursividade
interrogativa_assis -->
	% quantificador indica que tipo de pergunta está a ser feita
	quantificador(TipoP, N), 
	sintagma_nominal(Suj-Tipo, N),
	forma_verbal(N, Acao-Afirmativo),
	{findall(IDHotel, hotel(IDHotel,_,_,_,_,_), HoteisAtuais)},
	recursive_assis1(HoteisAtuais, ListaFinal), 
	{!, verificacaoInterrogacao(TipoP, ListaFinal, Suj-Tipo, Acao)},
	{assert((lastData(TipoP, LSuj, Obj, Acao)))}.


% Ex : Quais os hotéis de categoria superior a 3 estrelas em Lisboa? 
recursive_assis -->
	quantificador(TipoP, _N), 
	{findall(IDHotel, hotel(IDHotel, _, _, _, _, _), Hoteis)},
	recursive_assis1(Hoteis, ListaFinal), [?], {!, analise_lista(TipoP, ListaFinal)}.

% O Com Erros apenas é usado nas afirmações porque só aqui é que são feitas comparações diretas
recursive_assis -->
	{findall(IDHotel, hotel(IDHotel, _, _, _, _, _), Hoteis)},
	recursive_assis1(Hoteis, ListaFinal), terminal(ListaFinal).

recursive_assis -->
	{findall(IDHotel, hotel(IDHotel, _, _, _, _, _), Hoteis)},
	[e], recursive_assis1(Hoteis, ListaFinal), terminal(ListaFinal).

terminal(ListaFinal) --> [.], {!, analise_lista(ListaFinal)}.
terminal(ListaFinal) --> [?], {!, analise_lista(_, ListaFinal)}.

recursive_assis1(HoteisAtuais, ListaFinal) -->
	[que], forma_verbal(N, TipoV-A), %Afirmativo ou negativo
	sintagma_nominal(Suj-Tipo, N2),
	{filtrar(HoteisAtuais, TipoV-A, Suj-Tipo, NovaLista)},
	recursive_assis1(NovaLista, ListaFinal).
	
recursive_assis1(HoteisAtuais, ListaFinal) -->
	[e], forma_verbal(N, TipoV-A), %Afirmativo ou negativo
	sintagma_nominal(Suj-Tipo, N2),
	{filtrar(HoteisAtuais, TipoV-A, Suj-Tipo, NovaLista)},
	{verifica_filtro(HoteisAtuais, NovaLista)},
	recursive_assis1(NovaLista, ListaFinal).

recursive_assis1(HoteisAtuais, ListaFinal) -->
	forma_verbal(N, TipoV-A), %Afirmativo ou negativo
	sintagma_nominal(Suj-Tipo, N2),
	{filtrar(HoteisAtuais, TipoV-A, Suj-Tipo, NovaLista)},
	{verifica_filtro(HoteisAtuais, NovaLista)},
	recursive_assis1(NovaLista, ListaFinal).

recursive_assis1(HoteisAtuais, ListaFinal) -->
	[e], sintagma_nominal(Suj-Tipo, _N),
	{filtrar_append(HoteisAtuais, Suj-Tipo, NovaLista)},
	recursive_assis1(NovaLista, ListaFinal).

recursive_assis1(HoteisAtuais, ListaFinal) -->
	sintagma_nominal(Suj-Tipo, _N),
	{filtrar(HoteisAtuais, Suj-Tipo, NovaLista)},
	recursive_assis1(NovaLista, ListaFinal).

% Frases contem adjetivos que podem servir de verbos (ex: parisiense)
recursive_assis1(HoteisAtuais, ListaFinal) -->
	[e], sintagma_nominal(_Suj-_Tipo, N),
	adjetivo(N,Obj-TipoV, Acao),
	{filtrar(HoteisAtuais, Acao-A, Obj-Tipo, NovaLista)},
	{verifica_filtro(HoteisAtuais, NovaLista)},
	recursive_assis1(NovaLista, ListaFinal).

recursive_assis1(HoteisAtuais, ListaFinal) -->
	sintagma_nominal(Suj-Tipo, _N),
	adjetivo(N,Obj-TipoV, Acao),
	{filtrar(HoteisAtuais, Acao-A, Obj-TipoV, NovaLista)},
	{verifica_filtro(HoteisAtuais, NovaLista)},
	recursive_assis1(NovaLista, ListaFinal).

recursive_assis1(HoteisAtuais, ListaFinal) -->
	[e], [que], forma_verbal(N, TipoV-A), %Afirmativo ou negativo
	sintagma_nominal(Suj-Tipo, N-G),
	{filtrar(HoteisAtuais, TipoV-A, Suj-Tipo, NovaLista)},
	% Se no caso de uma afiramação respostas tenham sido filtradas, implica que estava com erros
	{verifica_filtro(HoteisAtuais, NovaLista)},
	recursive_assis1(NovaLista, ListaFinal).
 

recursive_assis1(ListaFinal, ListaFinal) --> {true}.

/* ------------------------ */
/*		   SINTAGMAS 		*/
/* -------------------------*/

% Nverbo é 'p' pois são dois ou mais sujeitos, daí ser plural
sintagma_nominal([Suj-Tipo | O], p-G) --> sintagma_nominal_aux(Suj-Tipo, N-G), [e], sintagma_nominal(O, N-G). 
sintagma_nominal(Suj-Tipo, N-G) --> sintagma_nominal_aux(Suj-Tipo, N-G).

sintagma_nominal_aux(Suj-Tipo, N-G) --> determinante(N-G), nome(N-G, Suj-Tipo).
sintagma_nominal_aux(Suj-Tipo, N-G) --> preposicao(N-G), nome(N-G, Suj-Tipo).
sintagma_nominal_aux(Suj-Tipo, N-G) --> nome(N-G, Suj-Tipo).

%Sintagma verbal não é utilizado, pois apenas a forma_verbal importa