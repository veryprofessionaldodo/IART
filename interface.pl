/*-----------------------*/
/* INTERFACE DO PROGRAMA */
/*-----------------------*/

inicio:- 
    write('Escreve a tua pergunta! Termina com "." ou "?" para a questão ser válida.\nPergunta: '),
    read_line(user_input, X), 
    parse_input(X, [], [], L), 
    write(L).

parse_input([Head|Body], CurrWord, TmpList, Words) :-
    char_code(Char, Head),
    ( (Head == 32 ; Head == 46 ; Head == 63) -> 
        ( % Is a new Word
            atom_chars(TmpWord, CurrWord),
            append(TmpList, [TmpWord], NewList), 
            NewWord = []
        ) 
        ; 
        ( % Not a new Word, append
            append(CurrWord, [Char], NewWord),
            NewList = TmpList
        )
    ),

    parse_input(Body, NewWord, NewList, Words).

parse_input([], [], Words, Words).

parse_input([],CurrWord, Words, List) :- 
    atom_chars(TmpWord, CurrWord),
    append(Words, [TmpWord], List).
