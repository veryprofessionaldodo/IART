% verifica frases afirmativas

% FICAR Cidade
verificacaoAfirmacao(Suj-Tipo, [Obj], ficar):-
    write('Ficar '),write(Suj), write(Tipo), write('\n'),
	hotel(_ID,Suj,_Estrelas, _Tlm, _Morada, IDCidade, IDRegiao),
	cidade(IDCidade, Obj, _IDPais),
	write('Os dados estao de acordo com as nossas base de dados').

verificacaoAfirmacao([Suj-Tipo | Resto], [Obj], ficar):-
    write('Ficar '),write(Suj), write(Tipo), write('\n'),
	hotel(_ID,Suj,_Estrelas, _Tlm, _Morada, IDCidade, IDRegiao),
	cidade(IDCidade, Obj, _IDPais),
	verificacaoAfirmacao(Resto, [Obj], ficar).

% FICAR País
verificacaoAfirmacao(Suj-Tipo, [Obj], ficar):-
    write('Ficar '),write(Suj), write(Tipo), write('\n'),
	hotel(_ID,Suj,_Estrelas, _Tlm, _Morada, IDCidade, IDRegiao),
	cidade(IDCidade, _Cidade, IDPais),
    pais(IDPais, Obj, _IDContinente),
	write('Os dados estao de acordo com as nossas base de dados').

verificacaoAfirmacao([Suj-Tipo | Resto], [Obj], ficar):-
    write('Ficar '),write(Suj), write(Tipo), write('\n'),
	hotel(_ID,Suj,_Estrelas, _Tlm, _Morada, IDCidade, IDRegiao),
	cidade(IDCidade, _Cidade, IDPais),
    pais(IDPais, Obj, _IDContinente),
	verificacaoAfirmacao(Resto, [Obj], ficar).

% FICAR Continente
verificacaoAfirmacao(Suj-Tipo, [Obj], ficar):-
    write('Ficar '),write(Suj), write(Tipo), write('\n'),
	hotel(_ID,Suj,_Estrelas, _Tlm, _Morada, IDCidade, IDRegiao),
	cidade(IDCidade, _Cidade, IDPais),
    pais(IDPais, _Pais, IDContinente),
    continente(IDContinente, Obj),
	write('Os dados estao de acordo com as nossas base de dados').

verificacaoAfirmacao([Suj-Tipo | Resto], [Obj], ficar):-
    write('Ficar '),write(Suj), write(Tipo), write('\n'),
	hotel(_ID,Suj,_Estrelas, _Tlm, _Morada, IDCidade, IDRegiao),
	cidade(IDCidade, _Cidade, IDPais),
    pais(IDPais, _Pais, IDContinente),
    continente(IDContinente, Obj),
	verificacaoAfirmacao(Resto, [Obj], ficar).


% TEM 
% verifica frases afirmativas
verificacaoAfirmacao(Suj-Tipo, [Obj], ter):-
    write('Tem '),write(Suj), write(Tipo), write('\n'),
	cidade(IDCidade, Obj, _IDPais),
	hotel(_ID,Suj,_Estrelas, _Tlm, _Morada, IDCidade, IDRegiao),
	write('Os dados estao de acordo com as nossas base de dados').

verificacaoAfirmacao([Suj-Tipo | Resto], [Obj], ter):-
    write('Tem '),write(Suj), write(Tipo), write('\n'),
	cidade(IDCidade, Obj, _IDPais),
	hotel(_ID,Suj,_Estrelas, _Tlm, _Morada, IDCidade, IDRegiao),
	verificacaoAfirmacao(Resto, [Obj], ficar).

verificacaoAfirmacao([_], _, _):-
	write('Esta informação nao esta de acordo com a nossa base de dados.'),nl.
