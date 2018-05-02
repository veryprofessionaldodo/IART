% MIEIC 2014/15 -- FEUP
% IART TP -- D3 - Hotel information in Natural Language

% Developed by Pedro Castro aka RGeneral24

% file: common.pl
%       -> Common Project rules and predicates

% Loaded Files

% Modules
:- use_module(library(lists)).
:- use_module(library(system)).

% Intersect two lists
intersect(R, A, F) :- 
        intersect(R, A, [], F).
intersect(_, [], L, L).
intersect(R, [HA|TA], L, F) :-
        (member(HA, R),
                append(L, [HA], NL),
                intersect(R, TA, NL, F)
                ;
                intersect(R, TA, L, F)
        ).

% Get types
getval_S(S, R) :-
        getval_S(S, [], R).
getval_S([], R, R).
getval_S([HI-_|T], L, R) :-
        append(L, HI, NL),
        getval_S(T, NL, R).

%% S-type
gettype_S([_-HT|_], HT).

%% A-verb
getval_A(A, R) :-
        getval_A(A, [], R).
getval_A([], R, R).
getval_A([HI-_|T], L, R) :-
        append(L, HI, NL),
        getval_A(T, NL, R).

%% A-type
gettype_A(A, R) :-
        gettype_A(A, [], R).
gettype_A([], R, R).
gettype_A([_-HT|T], L, R) :-
        append(L, HT, NL),
        gettype_A(T, NL, R).

%% O-val
getval_O(O, R) :-
        getval_O(O, [], R).
getval_O([], R, R).
getval_O([HI-_|T], L, R) :-
        append(L, HI, NL),
        getval_O(T, NL, R).

%% O-type
gettype_O(O, R) :-
        gettype_O(O, [], R).
gettype_O([], R, R).
gettype_O([_-HT|T], L, R) :-
        (\+member(HT, L),
                append(L, [HT], NL),
                gettype_O(T, NL, R)
                ;
                gettype_O(T, L, R)
        ).

%% O-sametype
getsametype_O(OV, OT, R) :-
        getsametype_O(OV, OT, [], R).
getsametype_O([], _, R, R).
getsametype_O([HI-HT|T], OT, L, R) :-
        (HT = OT,
                !,
                append(L, [HI], NL),
                getsametype_O(T, OT, NL, R)
                ;
                !,
                getsametype_O(T, OT, L, R)
        ).

% Type checker for S       
check_S([HI-HT|T], HT) :-
        checkequal_S(HI, [HI-HT|T]), 
        !,
        checktype_S(T, HT).

checktype_S([], _).
checktype_S([_-HT|T], Type) :-
        HT = Type,
        checktype_S(T, Type).

checkequal_S(_, []).
checkequal_S(Info, [HI-_|T]) :-
        \+member(Info-_, T),
        checkequal_S(HI, T).

% niv check
niv_check(S, E, _, _, _) :- S > E.
niv_check(S, E, AT, ST, OT) :-
        nth1(S, AT, X),
        nth1(S, OT, Y),
        P =.. [X, ST, Y],
        (P,
                !,
                NS is S + 1,
                niv_check(NS, E, AT, ST, OT)
                ; 
                !,
                write('A frase nao faz sentido! '), write(ST), write(' '), write(X), write(' '), write(Y), nl,
                fail
        ).

% © RGeneral24 -- 2015 --