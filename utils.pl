writeList([]).
writeList([Head|Tail]) :-
    write(Head), nl,
    writeList(Tail).

