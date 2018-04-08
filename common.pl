/*------------------------*/
/* MAIN PROGRAM INTERFACE */
/*------------------------*/

start:- 
    write('Write your query! End with "." or "?" for a valid question.\n Query: '),
    read_line(user_input, X), 
    parse_line(X, [], [], L), 
    write(L).

parse_line([Head|Body], CurrWord, TmpList, Words) :-
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

    parse_line(Body, NewWord, NewList, Words).

parse_line([], [], Words, Words).

parse_line([],CurrWord, Words, List) :- 
    atom_chars(TmpWord, CurrWord),
    append(Words, [TmpWord], List).
