/*----------------------*/
/* FILTRAR POR ATRIBUTO */
/*----------------------*/

% hotel(IDHotel, Nome, Estrelas, Tel, IDMorada, IDCidade, IDRegião). 
hotelName(Nome, ListaHoteis) :-
    findall(IDHotel, hotel(IDHotel,Nome,_,_,_,_,_), ListaHoteis).

hotelMaisQueEstrelas(Estrelas,ListaHoteis) :-
    findall(IDHotel, (hotel(IDHotel,_,EstrelasHotel,_,_,_,_), EstrelasHotel > Estrelas), ListaHoteis).

hotelMenosQueEstrelas(Estrelas,ListaHoteis) :-
    findall(IDHotel, (hotel(IDHotel,_,EstrelasHotel,_,_,_,_), EstrelasHotel < Estrelas), ListaHoteis).

hotelComEstrelas(Estrelas,ListaHoteis) :-
    findall(IDHotel, hotel(IDHotel,_,Estrelas,_,_,_,_, ListaHoteis).