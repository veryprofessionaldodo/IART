:-reconsult(utils).

% verifica frases afirmativas

% TODO FALTA FICAR RUA

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

verificacaoInterrogacaoTotal(Quant, LSuj, [List|_], Acao):-
	nl,write('Verificacao'),nl, write(LSuj) , write(' '), write(List), write(' '), write(Acao),nl,
	%listToString(List, '', Obj),
	verificacaoInterrogacao(Quant, LSuj, List, Acao).

verificacaoInterrogacaoTotal(Quant, LSuj, [Obj | RestoObj], [Acao | RestoAcao]):-
	verificacaoInterrogacao(Quant, LSuj, Obj, Acao),
	verificacaoInterrogacaoTotal(LSuj, RestoObj, RestoAcao).

% QUE 

% hotel(IDHotel, Nome, 	Estrelas, Tel, IDMorada, IDCidade, IDRegião). Regiao é do tipo Montanha, Praia...

% Que hoteis ficam X(cidade)?
verificacaoInterrogacao(que, Suj-hotel, [Obj], ficar) :-	
	cidade(IDCidade, Obj, _IDPais),
	findall(Nome, hotel(_IDHotel, Nome, _Estrelas, _Tlm, _IdMorada, IDCidade, _IDRegiao), Hoteis),
	write('A resposta a essa pergunta e : '), writeList(Hoteis).

% Que hoteis ficam X(pais)?
verificacaoInterrogacao(que, Suj-hotel, [Obj], ficar) :-	
	pais(IDPais, Obj, _IDContinente),
	findall(Nome, 
			(cidade(IDCidade, _, IDPais), hotel(_IDHotel, Nome, _Estrelas, _Tlm, _IdMorada, IDCidade, _IDRegiao)), 
			Hoteis),
	write('A resposta a essa pergunta e : '), writeList(Hoteis).

% Que hoteis ficam X(continente)?
verificacaoInterrogacao(que, Suj-hotel, [Obj], ficar) :-	
	continente(IDContinete, Obj),
	findall(Nome, 
			(pais(IDPais, _, IDContinente), cidade(IDCidade, _, IDPais), 
				hotel(_IDHotel, Nome, _Estrelas, _Tlm, _IdMorada, IDCidade, _IDRegiao)), 
			Hoteis),
	write('A resposta a essa pergunta e : '), writeList(Hoteis).

% Que serviços tem X?
verificacaoInterrogacao(que, Suj-servico, Obj, ter) :-
	findall(Servico, 
		(
			hotel(IDHotel, Obj, _Estrelas, _Tlm, _IdMorada, IDCidade, _IDRegiao), 
			tem_servico(IDHotel, IDServico), 
			servico(IDServico, Servico)
		), Servicos),
	nl, write('Os servicos sao : '), writeList(Servicos).

% Quantos são os hoteis de X?
verificacaoInterrogacao(quanto, Suj-hotel, [Obj], ter) :-
	nl,write('Yoooo'),
	findall(IDHotel, 
	(
		cidade(IDCidade, Obj, _IDPais),
		hotel(IDHotel, _Nome, _Estrelas, _Tlm, _IdMorada, IDCidade, _IDRegiao)
	), Hoteis),
	length(Hoteis, Contagem),
	nl, write('Existe(m) '), write(Contagem), write(' hotel(is) em '), write(Obj).


