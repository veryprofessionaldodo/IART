/*-----------------------*/
/* INTERFACE DO PROGRAMA */
/*-----------------------*/

:-consult('gramatica.pl').

inicio:- 
    write('Escreve a tua pergunta! Termina com \'.\' ou \'?\' para a questao ser valida.\nPergunta: '),
    read_line(user_input, X), 
    parse_input(X, [], [], ListWords), 
    write(ListWords),write('\n'),!,
    frase(Acao, Suj, Obj, ListWords, _).    

    %write(Response).

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

is_ending_char(Head, NewList, FinalList) :-
    char_code(TmpWord2, Head),
    (Head == 46 ; Head == 63),
    append(NewList, [TmpWord2], FinalList),
    write(FinalList).

is_ending_char(_, FinalList, FinalList).

parse_input([],CurrWord, Words, List) :- 
    atom_chars(TmpWord, CurrWord),
    append(Words, [TmpWord], List).


teste:-
    frase(Acao, Suj, Obj, ['o', 'Hotel', 'Tipton', 'e', 'o', 'Hotel', 'Tipton', 'ficam', 'em', 'Tirana', '.'],_).
