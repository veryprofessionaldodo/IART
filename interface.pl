/*-----------------------*/
/* INTERFACE DO PROGRAMA */
/*-----------------------*/
:-reconsult('gramatica.pl').

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
    append(NewList, [TmpWord2], FinalList).

is_ending_char(_, FinalList, FinalList).

parse_input([],CurrWord, Words, List) :- 
    atom_chars(TmpWord, CurrWord),
    append(Words, [TmpWord], List).

%Quantos (são) os hotéis do Porto?

/*
FRASES QUE FUNCIONAM
    frase(Acao, Suj, Obj, ['Que', 'hoteis','ficam','em','Tirana','?'],_).
    frase(Acao, Suj, Obj, ['O', 'Hotel', 'Tipton', 'fica', 'em', 'Tirana', '.'],_).
    frase(Acao, Suj, Obj, ['O', 'Hotel', 'Tipton', 'tem', 'categoria', '3', '.'],_).
    frase(Acao, Suj, Obj, ['O','Hotel','Tipton','tem','categoria','superior','a','3', '.'],_).
    frase(Acao, Suj, Obj, ['Que', 'servicos','tem','o','Hotel','Tipton','?'],_).
    frase(Acao, Suj, Obj, ['Quantos','sao','os','hoteis','de','Tirana','?'],_).
    frase(Acao, Suj, Obj, ['O', 'Hotel', 'Tipton', 'tem', '3', 'estrelas', 'e', 'fica', 'em', 'Tirana', '.'],_).
    frase(Acao, Suj, Obj, ['Que', 'hoteis','ficam','na','Albania','?'],_).
    frase(Acao, Suj, Obj, ['Que', 'hoteis','ficam','na','Europa','?'],_).
    frase(Acao, Suj, Obj, ['Quantos','sao','os','hoteis','de','Tirana','?'],_).
    frase(Acao, Suj, Obj, ['Quais', 'os', 'hoteis', 'parisienses','?'],_).
*/

/*
FRASES QUE FUNCIONAM MAS ESTÃO INCORRETAS
    frase(Acao, Suj, Obj, ['O', 'Hotel', 'Tipton', 'e', 'o', 'Hotel', 'Axis', 'tem', '3', 'estrelas', '.'],_).
    frase(Acao, Suj, Obj, ['O', 'Hotel', 'Tipton', 'e', 'o', 'Hotel', 'Tipton', 'tem', '3', 'estrelas', 'e', 'ficam', 'em', 'Tirana', '.'],_).
    frase(Acao, Suj, Obj, ['O', 'Hotel', 'Tipton', 'e', 'o', 'Hotel', 'Tipton', 'ficam', 'em', 'Tirana', 'e', 'tem', '3', 'estrelas', '.'],_).
*/

/*
FRASES QUE NÃO FUNCIONAM
    frase(Acao, Suj, Obj, ['Quais', 'os', 'hoteis', 'parisienses', 'que', 'possuem', 'babysitting', 'e', 'pequeno','almoco', '?'],_).
    frase(Acao, Suj, Obj, ['Quais', 'os', 'hoteis', 'parisienses', 'que', 'possuem', 'babysitting', '?'],_).
    frase(Acao, Suj, Obj, ['O', 'Hotel', 'Vila', 'Gale', 'e', 'o', 'Hotel', 'Axis', 'ficam', 'na', 'Antuerpia', 'e', 'tem', '4', 'estrelas', '.'],_).
    frase(Acao, Suj, Obj, ['O', 'Hotel', 'Vila', 'Gale', 'e', 'o', 'Hotel', 'Axis', 'tem', '4', 'estrelas', 'e', 'ficam', 'na', 'Antuerpia', '.'],_).
*/

teste:-
    frase(Acao, Suj, Obj, ['Quais', 'os', 'hoteis', 'de', 'categoria', 'superior',
         'a', '2', 'estrelas', 'em', 'Tirana', '?'],_).

teste2:-
    %frase(Acao, Suj, Obj, ['E', 'em','Africa','?'],_).
    %frase(Acao, Suj, Obj, ['E', 'na','Antuerpia','?'],_).
    frase(Acao, Suj, Obj, ['E','o','Hotel','Axis','?'],_).