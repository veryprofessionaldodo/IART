:-reconsult(utils).

% verifica frases afirmativas

% TODO FALTA FICAR RUA

/* ------------------ */
/* 	    AFIRMAÇÕES    */
/* ------------------ */

verificacaoAfirmacaoTotal(LSuj, [Obj | []], Acao):-
	verificacaoAfirmacao(LSuj, Obj, Acao).

verificacaoAfirmacaoTotal(LSuj, [Obj | RestoObj], [Acao | RestoAcao]):-
	verificacaoAfirmacao(LSuj, Obj, Acao),
	verificacaoAfirmacaoTotal(LSuj, RestoObj, RestoAcao).

% FICAR Cidade - 1 ou mais sujeitos
verificacaoAfirmacao(Suj-Tipo, [Obj], ficar):-
    write('Ficar1 '),write(Suj), write(Tipo), write(' '), write(Obj),nl,
	hotel(_ID,Suj,_Estrelas, _Tlm, _Morada, IDCidade, IDRegiao),
	cidade(IDCidade, Obj, _IDPais),
	write('Os dados estao de acordo com as nossas base de dados'),nl.

verificacaoAfirmacao([Suj-Tipo | Resto], [Obj], ficar):-
    write('Ficar2 '),write(Suj), write(Tipo), write(' '), write(Obj),nl,
	hotel(_ID,Suj,_Estrelas, _Tlm, _Morada, IDCidade, IDRegiao),
	cidade(IDCidade, Obj, _IDPais),
	verificacaoAfirmacao(Resto, [Obj], ficar).

% FICAR País
verificacaoAfirmacao(Suj-Tipo, Obj, ficar):-
    write('Ficar3 '),write(Suj), write(Tipo), write(' '), write(Obj),nl,
	hotel(_ID,Suj,_Estrelas, _Tlm, _Morada, IDCidade, IDRegiao),
	cidade(IDCidade, _Cidade, IDPais),
    pais(IDPais, Obj, _IDContinente),
	write('Os dados estao de acordo com as nossas base de dados'),nl.

verificacaoAfirmacao([Suj-Tipo | Resto], Obj, ficar):-
    write('Ficar4 '),write(Suj), write(Tipo), write(' '), write(Obj),nl,
	hotel(_ID,Suj,_Estrelas, _Tlm, _Morada, IDCidade, IDRegiao),
	cidade(IDCidade, _Cidade, IDPais),
    pais(IDPais, Obj, _IDContinente),
	verificacaoAfirmacao(Resto, Obj, ficar).

% FICAR Continente
verificacaoAfirmacao(Suj-Tipo, Obj, ficar):-
    write('Ficar5 '),write(Suj), write(Tipo), write(' '), write(Obj),nl,
	hotel(_ID,Suj,_Estrelas, _Tlm, _Morada, IDCidade, IDRegiao),
	cidade(IDCidade, _Cidade, IDPais),
    pais(IDPais, _Pais, IDContinente),
    continente(IDContinente, Obj),
	write('Os dados estao de acordo com as nossas base de dados'),nl.

verificacaoAfirmacao([Suj-Tipo | Resto], Obj, ficar):-
    write('Ficar6 '),write(Suj), write(Tipo), write(' '), write(Obj),nl,
	hotel(_ID,Suj,_Estrelas, _Tlm, _Morada, IDCidade, IDRegiao),
	cidade(IDCidade, _Cidade, IDPais),
    pais(IDPais, _Pais, IDContinente),
    continente(IDContinente, Obj),
	verificacaoAfirmacao(Resto, Obj, ficar).


% TER

% TER Estrelas
verificacaoAfirmacao(Suj-Tipo, [Obj | _], ter):-
	hotel(_ID,Suj,Obj, _Tlm, _Morada, _IDCidade, _IDRegiao),
    write('Tem1 '),write(Suj), write(Tipo), write(Obj),nl,
	write('Os dados estao de acordo com as nossas base de dados'),nl.

verificacaoAfirmacao([Suj-Tipo | Resto], [Obj | Cont], ter):-
	hotel(_ID,Suj,Obj, _Tlm, _Morada, _IDCidade, _IDRegiao),
    write('Tem2 '),write(Suj), write(Tipo), write(Obj),nl,
	verificacaoAfirmacao(Resto, [Obj, Cont], ter).

verificacaoAfirmacao(_, _, _):-
	write('Esta informacao nao esta de acordo com a nossa base de dados.'),nl.


/* ------------------ */
/* 	  INTERROGAÇÕES   */
/* ------------------ */

%Questão com um unico elemento de verificação
verificacaoInterrogacaoTotal(Quant, LSuj, [List|_], Acao, []):-
	nl,write('Verificacao'),nl, write(LSuj) , write(' '), write(List), write(' '), write(Acao),nl,
	%listToString(List, '', Obj),
	verificacaoInterrogacao(Quant, LSuj, List, Acao, Resposta),
	escreverResposta(Quant, Resposta).

% Questão com vários elementos de verificação
verificacaoInterrogacaoTotal(Quant, LSuj, [Obj | RestoObj], [Acao | RestoAcao], []):-
	nl,write('Verificacao Lista []'),nl, write(LSuj) , write(' '), write([Obj | RestoObj]), write(' '), write([Acao | RestoAcao]),nl,
	verificacaoInterrogacao(Quant, LSuj, Obj, Acao, Resposta),
	verificacaoInterrogacaoTotal(Quant, LSuj, RestoObj, RestoAcao, Resposta).

verificacaoInterrogacaoTotal(Quant, LSuj, [Obj | RestoObj], [Acao | RestoAcao], Resposta):-
	nl,write('Verificacao Lista'),nl, write(LSuj) , write(' '), write([Obj | RestoObj]), write(' '), write([Acao | RestoAcao]),nl,
	verificacaoInterrogacao(Quant, LSuj, Obj, Acao, Resposta2),
	interLists(Resposta, Resposta2, NovaResposta),
	verificacaoInterrogacaoTotal(Quant, LSuj, RestoObj, RestoAcao, NovaResposta).

verificacaoInterrogacaoTotal(Quant, LSuj, [List|_], Acao, Resposta):-
	nl,write('Verificacao2'),nl, write(LSuj) , write(' '), write(List), write(' '), write(Acao),nl,
	verificacaoInterrogacao(Quant, LSuj, List, Acao, Resposta2),
	interLists(Resposta, Resposta2, RespostaFinal),
	escreverResposta(Quant, RespostaFinal).


% QUE / QUAL
% Que hoteis ficam X(cidade)?
verificacaoInterrogacao(TipoQ, Suj-hotel, [Obj], ficar, Resposta) :-
	(TipoQ == que ; TipoQ == qual),
	cidade(IDCidade, Obj, _IDPais),
	findall(Nome, hotel(_IDHotel, Nome, _Estrelas, _Tlm, _IdMorada, IDCidade, _IDRegiao), Resposta).

% Que hoteis ficam X(pais)?
verificacaoInterrogacao(TipoQ, Suj-hotel, [Obj], ficar, Resposta) :-	
	(TipoQ == que ; TipoQ == qual),
	pais(IDPais, Obj, _IDContinente),
	findall(Nome, 
			(cidade(IDCidade, _, IDPais), hotel(_IDHotel, Nome, _Estrelas, _Tlm, _IdMorada, IDCidade, _IDRegiao)), 
			Resposta).

% Que hoteis ficam X(continente)?
verificacaoInterrogacao(TipoQ, Suj-hotel, [Obj], ficar, Resposta) :-	
	(TipoQ == que ; TipoQ == qual),
	continente(IDContinente, Obj),
	findall(Nome, 
			(pais(IDPais, _, IDContinente), cidade(IDCidade, _, IDPais), 
				hotel(_IDHotel, Nome, _Estrelas, _Tlm, _IdMorada, IDCidade, _IDRegiao)), 
			Resposta).

% Hoteis que tem servico X?
verificacaoInterrogacao(TipoQ, Suj-hotel, [Obj], ter, Resposta) :-
	(TipoQ == que ; TipoQ == qual),
	findall(Hotel, 
		(
			servico(IDServico, Obj),
			tem_servico(IDHotel, IDServico),
			hotel(IDHotel, Hotel, _Estrelas, _Tlm, _IdMorada, IDCidade, _IDRegiao)
		), Resposta).

% Que serviços tem X?
verificacaoInterrogacao(TipoQ, Suj-servico, Obj, ter, Resposta) :-
	(TipoQ == que ; TipoQ == qual),
	findall(Servico, 
		(
			hotel(IDHotel, Obj, _Estrelas, _Tlm, _IdMorada, IDCidade, _IDRegiao), 
			tem_servico(IDHotel, IDServico), 
			servico(IDServico, Servico)
		), Resposta).

% Quantos são os hoteis de X?
verificacaoInterrogacao(quanto, [Cidade]-cidade, [Tipo], ter, Resposta) :-
	(Tipo == hotel ; Tipo == hoteis), % Estrutura varia porque nome está depois do verbo	
	findall(IDHotel, 
	(
		cidade(IDCidade, Cidade, _IDPais),
		hotel(IDHotel, _Nome, _Estrelas, _Tlm, _IdMorada, IDCidade, _IDRegiao)
	), Hoteis),
	length(Hoteis, Resposta).

% Quantos hoteis ficam em X?
verificacaoInterrogacao(quanto, Suj-hotel, [Obj], ficar, Resposta) :-
	findall(IDHotel, 
	(
		cidade(IDCidade, Obj, _IDPais),
		hotel(IDHotel, _Nome, _Estrelas, _Tlm, _IdMorada, IDCidade, _IDRegiao)
	), Hoteis),
	length(Hoteis, Resposta).

escreverResposta(quanto, Resposta):-
	nl,write('Resposta: '),nl,write(Resposta),nl.

escreverResposta(_, Resposta):-
	nl,write('Resposta: '),writeList(Resposta),nl.