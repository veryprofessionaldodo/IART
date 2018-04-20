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
continente(5, Australia).
continente(6, Asia).

/*------------------------*/
/*         PAÍSES         */
/*------------------------*/

% pais(IDPais, NomePais, IDContinente).
pais(1, Albania, 1).
pais(2, Alemanha, 1).
pais(3, Belgica, 1).
pais(4, Croacia, 1).
pais(5, Dinamarca, 1).
pais(6, Estonia, 1).
pais(7, Finlandia, 1).
pais(8, Franca, 1).
pais(9, Grecia, 1).
pais(10, Islandia, 1).
pais(11, Lituania, 1).
pais(12, Macedonia, 1).
pais(13, Holanda, 1).
pais(14, Portugal, 1).
pais(15, Russia, 1).
pais(16, Ucrania, 1).

pais(17, Angola, 2).
pais(18, Cabo_Verde, 2).
pais(19, Egito, 2).
pais(20, Guine, 2).
pais(21, Quenia, 2).
pais(22, Madagascar, 2).
pais(23, Mocambique, 2).
pais(24, Nigeria, 2).
pais(25, Uganda, 2).

pais(26, Bahamas, 3).
pais(27, Canada, 3).
pais(28, Haiti, 3).
pais(29, Jamaica, 3).
pais(30, Mexico, 3).
pais(31, Panama, 3).
pais(32, USA, 3).

pais(33, Argentina, 4).
pais(34, Bolivia, 4).
pais(35, Brazil, 4).
pais(36, Equador, 4).
pais(37, Peru, 4).
pais(38, Venezuela, 4).

/*------------------------*/
/*        CIDADES         */
/*------------------------*/

% cidade(IDCidade, NomeCidade, IDPais).
cidade(1, 'Tirana', 1).
cidade(2, 'Durres', 1).


/*------------------------*/
/*        MORADAS         */
/*------------------------*/

% morada(IDMorada, NomeMorada, IDCidade).

/*------------------------*/
/*        SERVIÇOS        */
/*------------------------*/

% servico(Nome).
servico(babysitting).
servico(limpeza_de_quartos).
servico(garagem_privativa).
servico(wifi).
servico(pequeno_almoço).
servico(ginasio).

/*------------------------*/
/*       TEM QUARTO       */
/*------------------------*/

% tem_quarto(IDHotel, IDQuarto, Preço).

/*------------------------*/
/*       TEM SERVIÇO      */
/*------------------------*/

% tem_serviço(IDHotel, IDServiço).
