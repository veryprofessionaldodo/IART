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

/*------------------------*/
/*         PAÍSES         */
/*------------------------*/

% pais(IDPais, NomePais, IDContinente).

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

/*------------------------*/
/*       TEM QUARTO       */
/*------------------------*/

% tem_quarto(IDHotel, IDQuarto, Preço).

/*------------------------*/
/*       TEM SERVIÇO      */
/*------------------------*/

% tem_serviço(IDHotel, IDServiço).
