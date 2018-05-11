% verifica frases afirmativas

% TODO FALTA FICAR RUA

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


% TER

% TER Estrelas
verificacaoAfirmacao(Suj-Tipo, [Obj | _], ter):-
	hotel(_ID,Suj,Obj, _Tlm, _Morada, _IDCidade, _IDRegiao),
    write('Tem '),write(Suj), write(Tipo), write(Obj), write('\n'),
	write('Os dados estao de acordo com as nossas base de dados').

verificacaoAfirmacao([Suj-Tipo | Resto], [Obj | Cont], ter):-
	hotel(_ID,Suj,Obj, _Tlm, _Morada, _IDCidade, _IDRegiao),
    write('Tem '),write(Suj), write(Tipo), write(Obj),  write('\n'),
	verificacaoAfirmacao(Resto, [Obj, Cont], ficar).

verificacaoAfirmacao([_], _, _):-
	write('Esta informacao nao esta de acordo com a nossa base de dados.'),nl.
