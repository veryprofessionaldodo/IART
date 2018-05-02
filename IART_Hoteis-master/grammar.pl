% MIEIC 2014/15 -- FEUP
% IART TP -- D3 - Hotel information in Natural Language

% Developed by Pedro Castro aka RGeneral24

% file: grammar.pl
%       -> DCG declaration and main rules

% Loaded Files
:-  ensure_loaded([common, database, keywords]).

% Modules

% DCG Declaration -- Using the base Portuguese Grammar definitions and names
frase(A, S, O, At) --> frase_interrogativa(_, A, S, O, At), [?].
frase(A, S, O, 1) --> frase_afirmativa(_, A, S, O), [.].

% Regular Sentences
frase_afirmativa(Numero, A, S, O) --> aditiva(_-Numero, S, A), sintagma_verbal(Numero, A, S, O).
frase_afirmativa(Numero, _, S, _) --> aditiva(_-Numero, S, _).

% Questions
frase_interrogativa(Numero, A, _, O, At) --> quantificador(_-Numero, At), sintagma_verbal(Numero, A, _, O).
frase_interrogativa(Numero, A, S, O, At) --> quantificador(Genero-Numero, At), sintagma_nominal(Genero-Numero, S), sintagma_verbal(Numero, A, S, O).

%% Sentence adition
aditiva(Genero-Numero, [S|OS], A) --> sintagma_nominal(Genero-Numero, S), aditiva1(_, OS, A).
aditiva1(_-Numero, S, [A|OA]) --> [e], verbo(Numero, S, A), aditiva(_-Numero, S, OA).
aditiva1(_-Numero, [S|OS], A) --> [e], sintagma_nominal(_-Numero, S), aditiva1(_, OS, A).
aditiva1(_, S, A) --> adversativa1(_, S, A).
aditiva1(_, S, A) --> alternativa1(_, S, A).
aditiva1(_, [], []) --> { true }.
aditiva1(_, [], _) --> { true }.

%% Sentence Contradiction
adversativa(Genero-Numero, [S|OS], A) --> sintagma_nominal(Genero-Numero, S), adversativa1(_, OS, A).
adversativa1(_-Numero, S, [A|OA]) --> [mas], verbo(Numero, S, A), adversativa(_-Numero, S, OA).
adversativa1(_-Numero, [S|OS], A) --> [mas], sintagma_nominal(_-Numero, S), adversativa1(_, OS, A).
adversativa1(_, [], []) --> { true }.
adversativa1(_, [], _) --> { true }.

%% Sentence Option
alternativa(Genero-Numero, [S|OS], A) --> sintagma_nominal(Genero-Numero, S), alternativa1(_, OS, A).
alternativa1(_-Numero, S, [A|OA]) --> [ou], verbo(Numero, S, A), alternativa(_-Numero, S, OA).
alternativa1(_-Numero, [S|OS], A) --> [ou], sintagma_nominal(_-Numero, S), alternativa1(_, OS, A).
alternativa1(_, [], []) --> { true }.
alternativa1(_, [], _) --> { true }.

%% Base of "Sintagma_Nominal"
sintagma_nominal(Genero-Numero, S) --> nome(Genero-Numero, S).
sintagma_nominal(Genero-Numero, S) --> determinante(Genero-Numero), nome(Genero-Numero, S).
sintagma_nominal(Genero-Numero, S) --> preposicao(Genero-Numero), nome(Genero-Numero, S).

%% Base of "Sintagma_Verbal"
sintagma_verbal(Numero, [A|OA], S, O) --> verbo(Numero, S, A), aditiva(_, O, OA).

%%% Quantifiers for questions
quantificador(_-s, quanto) --> [quanto].
quantificador(m-p, quanto) --> [quantos].
quantificador(f-p, quanto) --> [quantas].
quantificador(_-s, qual) --> [qual].
quantificador(_-p, qual) --> [quais].
quantificador(_, que) --> [que].
quantificador(_, onde) --> [onde].

%%% "Determinantes" for names
determinante(m-s) --> [o].
determinante(f-s) --> [a].
determinante(m-p) --> [os].
determinante(f-p) --> [as].

%%% Prepositions
preposicao(_) --> [em].
preposicao(_-s) --> [num].
preposicao(_-p) --> [nuns].
preposicao(m-s) --> [no].
preposicao(f-s) --> [na].
preposicao(m-p) --> [nos].
preposicao(f-p) --> [nas].
preposicao(_) --> [com].
preposicao(_) --> [sem].
preposicao(_) --> [por].
preposicao(_-s) --> [de].
preposicao(m-s) --> [do].
preposicao(f-s) --> [da].
preposicao(m-p) --> [dos].
preposicao(f-p) --> [das].

%%% Verbs % Afirmative
verbo(_, _, [ter]-y) --> [tem].
verbo(s, _, [ficar]-y) --> [fica].
verbo(p, _, [ficar]-y) --> [ficam].
verbo(s, _, [conter]-y) --> [contem].
verbo(p, _, [conter]-y) --> [conteem].
verbo(s, _, [possuir]-y) --> [que, possui].
verbo(p, _, [possuir]-y) --> [que, possuem].
verbo(s, _, [existir]-y) --> [existe].
verbo(p, _, [existir]-y) --> [existem].

%%% Verbs % Negative
verbo(_, _, [ter]-n) --> [nao, tem].
verbo(s, _, [ficar]-n) --> [nao, fica].
verbo(p, _, [ficar]-n) --> [nao, ficam].
verbo(s, _, [conter]-n) --> [nao, contem].
verbo(p, _, [conter]-n) --> [nao, conteem].
verbo(s, _, [possuir]-n) --> [nao, possui].
verbo(p, _, [possuir]-n) --> [nao, possuem].
verbo(s, _, [existir]-n) --> [nao, existe].
verbo(p, _, [existir]-n) --> [nao, existem].

% � RGeneral24 -- 2015 -- All rights reserved.