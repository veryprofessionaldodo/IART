/*------------------------*/
/*        HOTEIS          */
/*------------------------*/

% hotel(IDHotel, Nome, Estrelas, Tel, IDMorada, IDCidade, IDRegião). 
hotel(1, [Hotel, Tipton], 3, 278421134, )

/*------------------------*/
/*        QUARTOS         */
/*------------------------*/

%quarto(IDQuarto, Nome, NumPessoas).           

/*------------------------*/
/*   PROPRIEDADES HOTEL   */
/*------------------------*/

% prop_hotel(IDProp, NomePropriedade).
prop_hotel(1, "piscina").
prop_hotel(2, "praia").
prop_hotel(3, "parque").
prop_hotel(4, "natureza").
prop_hotel(5, "montanha").
prop_hotel(6, "centro da cidade").

/*------------------------*/
/*   PROPRIEDADES QUARTO  */
/*------------------------*/

% prop_quarto(IDProp, NomePropriedade).

/*------------------------*/
/*      CONTINENTES       */
/*------------------------*/

% continente(IDContinente, Nome).
continente(1, Europa).
continente(2, Africa).
continente(3, America_Norte).
continente(4, America_Sul).
continente(5, Oceania).
continente(6, Asia).

/*------------------------*/
/*         PAÍSES         */
/*------------------------*/

% pais(IDPais, NomePais, IDContinente).
pais(1, "Albania", 1).
pais(2, "Alemanha", 1).
pais(3, "Belgica", 1).
pais(4, "Croacia", 1).
pais(5, "Dinamarca", 1).
pais(6, "Estonia", 1).
pais(7, "Finlandia", 1).
pais(8, "Franca", 1).
pais(9, "Grecia", 1).
pais(10, "Islandia", 1).
pais(11, "Lituania", 1).
pais(12, "Macedonia", 1).
pais(13, "Holanda", 1).
pais(14, "Portugal", 1).
pais(15, "Russia", 1).
pais(16, "Ucrania", 1).
pais(17, "Espanha", 1).

pais(17, "Angola", 2).
pais(18, "Cabo Verde", 2).
pais(19, "Egito", 2).
pais(20, "Guine", 2).
pais(21, "Quenia", 2).
pais(22, "Madagascar", 2).
pais(23, "Mocambique", 2).
pais(24, "Nigeria", 2).
pais(25, "Uganda", 2).

pais(26, "Bahamas", 3).
pais(27, "Canada", 3).
pais(28, "Haiti", 3).
pais(29, "Jamaica", 3).
pais(30, "Mexico", 3).
pais(31, "Panama", 3).
pais(32, "USA", 3).

pais(33, "Argentina", 4).
pais(34, "Bolivia", 4).
pais(35, "Brazil", 4).
pais(36, "Equador", 4).
pais(37, "Peru", 4).
pais(38, "Venezuela", 4).

pais(39, "Australia", 5).
pais(39, "Fiji", 5).
pais(39, "Nova Zelandia", 5).
pais(39, "Vanuatu", 5).

pais(49, "Afeganistao", 6).
pais(49, "Bangladesh, 6).
pais(49, "China", 6).
pais(49, "Georgia", 6).
pais(49, "India", 6).
pais(49, "Japao", 6).
pais(49, "Laos", 6).
pais(49, "Malasia", 6).
pais(49, "Nepal", 6).
pais(49, "Coreia do Norte", 6).
pais(49, "Coreia do Sul", 6).
pais(49, "Turquia", 6).
pais(49, "Tailandia", 6).


/*------------------------*/
/*        CIDADES         */
/*------------------------*/

% cidade(IDCidade, NomeCidade, IDPais).

/*------------------------*/
/*        MORADAS         */
/*------------------------*/

% morada(IDMorada, NomeMorada, IDCidade).

/*------------------------*/
/*        SERVIÇOS        */
/*------------------------*/

% servico(Nome).
serviço("babysitting").
serviço("limpeza de quartos").
serviço("garagem privativa").
serviço("wifi").
serviço("pequeno almoço").
serviço("ginasio").
serviço("spa").
serviço("casino").

/*------------------------*/
/*       TEM QUARTO       */
/*------------------------*/

% tem_quarto(IDHotel, IDQuarto, Preço).

/*------------------------*/
/*       TEM SERVIÇO      */
/*------------------------*/

% tem_serviço(IDHotel, IDServiço).
