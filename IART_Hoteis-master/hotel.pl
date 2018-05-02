% MIEIC 2014/15 -- FEUP
% IART TP -- D3 - Hotel information in Natural Language

% Developed by Pedro Castro aka RGeneral24

% file: hotel.pl
%       -> Main Project File

% Loaded Files
:-  ensure_loaded([database, grammar, common, keywords, search]).

% Modules

% Phrase Semantic check
semantic(A, S, O) :-
        gettype_S(S, ST),
        getval_A(A, AT),
        gettype_O(O, OT),
        length(AT, AV),
        length(OT, OV),
        (AV = OV,
                !,
                niv_check(1, AV, AT, ST, OT)
                ;
                !,
                write('A frase não faz sentido! Repetição!'), nl,
                fail
        ).

% Search Methods

%% Search Selector
select_search(C, SV, ST, AT, OV, OT, R) :- 
        !,
        start_search(SV, ST, AT, OV, OT).

start_search([], _, _, _, _).
start_search([SVH|SVT], ST, AT, OV, OT) :-
        !,
        search_S(SVH, ST, AT, OV, OT),
        start_search(SVT, ST, AT, OV, OT). 

%% Search via S -> get ID
search_S(_, _, [], _, []).
search_S(SH, hotel, [ATH|ATT], OV, [OTH|OTT]) :-
        !,
        hotel_name(SH, ID),
        getsametype_O(OV, ATH, NOV),
        !,
        search_AO(ID, ATH, NOV, OTH),
        search_S(SH, hotel, ATT, OV, OTT).

%% Search via AO -> all atributes related to that S
search_AO(_, _, [], _).
search_AO(ID, y, [HNOV|TNOV], rating) :-
        hotel_rating(HNOV, 0, L),
        !,
        member(ID, L),
        search_AO(ID, y, TNOV, rating).
search_AO(ID, n, [HNOV|TNOV], rating) :-
        hotel_rating(HNOV, 0, L),
        !,
        \+member(ID, L),
        search_AO(ID, y, TNOV, rating).
        
%% Afirmative Sentences
search(A, S, O, 1) :-
        getval_S(S, SV),
        gettype_S(S, ST),
        gettype_A(A, AT),
        getval_O(O, OV),
        gettype_O(O, OT),
        select_search(check, SV, ST, AT, OV, OT, R),
        (length(R,0),
                !,
                true % somthing good
                ;
                fail % banana
        ).

% Phrase Analisys 

%% Afirmative Sentences
analyse(A, S, O, 1) :-
        check_S(S, ST),
        semantic(A, S, O).
        %search(A, S, O, 1).

go :-
        frase(A, S, O, At, [o, hotel, maria, josefina, fica, em, setubal, e, nao, tem, piscina, mas, fica, piscina, .], _),
        %frase(A, S, O, At, [o, hotel, maria, josefina, tem, o, servico, de, babysiting, e, video, on, demand, e, fica, na, praia, .], _),
        write(A), nl, write(S), nl, write(O), nl,
        !,
        analyse(A, S, O, At).

% © RGeneral24 -- 2015 --