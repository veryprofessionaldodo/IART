/*-----------------------*/
/* INTERFACE DO PROGRAMA */
/*-----------------------*/
:-reconsult('gramatica.pl').

inicio:- 
    nl, write('Escreve a tua pergunta! Termina com \'.\' ou \'?\' para a questao ser valida.\nPergunta: '),
    read_line(user_input, X), 
    parse_input(X, [], [], ListWords), !,
    frase(ListWords, _), inicio.    

parse_input([], [], Words, Words).
parse_input([Head|Body], CurrWord, TmpList, Words) :-
    char_code(Char, Head),
    
    ( (Head == 32 ; Head == 46 ; Head == 63) -> 
        ( % Is a new Word
            atom_chars(TmpWord, CurrWord),
            append(TmpList, [TmpWord], NewList), 
            NewWord = [],
            
            is_ending_char(Head, NewList, FinalList)
        ) 
        ; 
        ( % Not a new Word, append
            append(CurrWord, [Char], NewWord),
            FinalList = TmpList
        )
    ),

    parse_input(Body, NewWord, FinalList, Words).
    
parse_input([],CurrWord, Words, List) :- 
    atom_chars(TmpWord, CurrWord),
    append(Words, [TmpWord], List).

is_ending_char(Head, NewList, FinalList) :-
    char_code(TmpWord2, Head),
    (Head == 46 ; Head == 63),
    append(NewList, [TmpWord2], FinalList).

is_ending_char(_, FinalList, FinalList).

