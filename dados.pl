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

pais(18, "Angola", 2).
pais(19, "Cabo Verde", 2).
pais(20, "Egito", 2).
pais(21, "Guine", 2).
pais(22, "Quenia", 2).
pais(23, "Madagascar", 2).
pais(24, "Mocambique", 2).
pais(25, "Nigeria", 2).
pais(26, "Uganda", 2).

pais(27, "Bahamas", 3).
pais(28, "Canada", 3).
pais(29, "Haiti", 3).
pais(30, "Jamaica", 3).
pais(31, "Mexico", 3).
pais(32, "Panama", 3).
pais(33, "USA", 3).

pais(34, "Argentina", 4).
pais(35, "Bolivia", 4).
pais(36, "Brazil", 4).
pais(37, "Equador", 4).
pais(38, "Peru", 4).
pais(39, "Venezuela", 4).

pais(40, "Australia", 5).
pais(41, "Fiji", 5).
pais(42, "Nova Zelandia", 5).
pais(43, "Vanuatu", 5).

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

%cidade(IDCidade, NomeCidade, IDPais).
cidade(1, 'Tirana', 1).
cidade(2, 'Durres', 1).
cidade(2, 'Vlore', 1).
cidade(2, 'Berlim,', 2).
cidade(2, 'Hamburgo', 2).
cidade(2, 'Munique', 2).
cidade(2, 'Antuérpia', 3).
cidade(2, 'Bruges', 3).
cidade(2, 'Bruxelas', 3).
cidade(2, 'Zagreb', 4).
cidade(2, 'Rijeka', 4).
cidade(2, 'Split', 4).
cidade(2, 'Copenhaga', 5).
cidade(2, 'Aarhus', 5).
cidade(2, 'Odense', 5).
cidade(2, 'Tallinn', 6).
cidade(2, 'Tartu', 6).
cidade(2, 'Narva', 6).
cidade(2, 'Helsinquia', 7).
cidade(2, 'Tampere', 7).
cidade(2, 'Turku', 7).
cidade(2, 'Paris', 8).
cidade(2, 'Bordeus', 8).
cidade(2, 'Lyon', 8).
cidade(2, 'Nice', 8).
cidade(2, 'Cannes', 8).
cidade(2, 'Atenas', 9).
cidade(2, 'Fira', 9).
cidade(2, 'Rodes', 9).
cidade(2, 'Reikiavik', 10).
cidade(2, 'Keflavik', 10).
cidade(2, 'Seyoisfjorour', 10). %Seyoisfjörour
cidade(2, 'Vilnius', 11).
cidade(2, 'Kaunas', 11).
cidade(2, 'Klaipeda', 11). %Klaipèda
cidade(2, 'Skopje', 12).
cidade(2, 'Ohrid', 12).
cidade(2, 'Amesterdao', 13).
cidade(2, 'Roterdao', 13).
cidade(2, 'Kinderdijk', 13).
cidade(2, 'Haia', 13).
cidade(2, 'Delft', 13).
cidade(2, 'Lisboa', 14).
cidade(2, 'Porto', 14).
cidade(2, 'Guimaraes', 14).
cidade(2, 'Evora', 14).
cidade(2, 'Fatima', 14).
cidade(2, 'Coimbra', 14).
cidade(2, 'Albufeira', 14).
cidade(2, 'Portimao', 14).
cidade(2, 'Murmansk', 15).
cidade(2, 'Moscovo', 15).
cidade(2, 'Sao Petersburgo', 15).
cidade(2, 'Kiev', 16).
cidade(2, 'Lviv', 16).
cidade(2, 'Odessa', 16).
cidade(2, 'Madrid', 17).
cidade(2, 'Barcelona', 17).
cidade(2, 'Valencia', 17).
cidade(2, 'Sevilha', 17).
cidade(2, 'Granada', 17).
cidade(2, 'Salamanca', 17).
cidade(2, 'Luanda', 18).
cidade(2, 'Lubango', 18).
cidade(2, 'Malanje', 18).
cidade(2, 'Praia', 19).
cidade(2, 'Santa Maria', 19).
cidade(2, 'Mindelo', 19).
cidade(2, 'Cairo', 20).
cidade(2, 'Alexandria', 20).
cidade(2, 'Gizé', 20).
cidade(2, 'Bissau', 21).
cidade(2, 'Bafata', 21). %Bafatá
cidade(2, 'Gabu', 21). %Gabú
cidade(2, 'Nairobi', 22). %Nairóbi
cidade(2, 'Mombaca', 22). %Mombaça
cidade(2, 'Kisumu', 22).
cidade(2, 'Antananarivo', 23).
cidade(2, 'Antsiranana', 23).
cidade(2, 'Toamasina', 23).
cidade(2, 'Maputo', 24).
cidade(2, 'Inhambane', 24).
cidade(2, 'Tofo', 24).
cidade(2, 'Lagos', 25).
cidade(2, 'Calabar', 25).
cidade(2, 'Abuja', 25).
cidade(2, 'Kampala', 26).
cidade(2, 'Jinja', 26).
cidade(2, 'Tororo', 26).
cidade(2, 'Nassau', 27).
cidade(2, 'Freeport', 27).
cidade(2, 'West End', 27).
cidade(2, 'Toronto', 28).
cidade(2, 'Ottawa', 28).
cidade(2, 'Montreal', 28).
cidade(2, 'Vancouver', 28).
cidade(2, 'Banff', 28).
cidade(2, 'Porto Principe', 29).
cidade(2, 'Cabo Haitiano', 29).
cidade(2, 'Jacmel', 29).
cidade(2, 'Kingston', 30).
cidade(2, 'Negril', 30).
cidade(2, 'Montego Bay', 30).
cidade(2, 'Cancun', 31).%Cancún
cidade(2, 'Acapulco', 31).
cidade(2, 'Cidade do Mexico', 31).
cidade(2, 'Los Cabos', 31).
cidade(2, 'Cidade do Panama', 32).
cidade(2, 'Bocas del Toro', 32).
cidade(2, 'San Miguelito', 32).
cidade(2, 'Nova Iorque', 33).
cidade(2, 'Los Angeles', 33).
cidade(2, 'Washington DC', 33).
cidade(2, 'Orlando', 33).
cidade(2, 'Las Vegas', 33).
cidade(2, 'Sao Francisco', 33).
cidade(2, 'Boston', 33).
cidade(2, 'Filadelfia', 33).
cidade(2, 'Buenos Aires', 34).
cidade(2, 'Cordoba', 34). %Córdoba
cidade(2, 'Bariloche', 34).
cidade(2, 'Santa Cruz de la Sierra', 35).
cidade(2, 'Samaipata', 35).
cidade(2, 'Sucre', 35).
cidade(2, 'Rio de Janeiro', 36).
cidade(2, 'Florianopolis', 36). %Florianópolis
cidade(2, 'Sao Paulo', 36).
cidade(2, 'Salvador', 36).
cidade(2, 'Montanita', 37).
cidade(2, 'Cuenca', 37).
cidade(2, 'Quito', 37).
cidade(2, 'Arequipa', 38).
cidade(2, 'Cusco', 38).
cidade(2, 'Lima', 38).
cidade(2, 'Punta Sal', 38).
cidade(2, 'Caracas', 39).
cidade(2, 'Ilha Margarita', 39).
cidade(2, 'Los Llanos', 39).
cidade(2, 'Sydney', 40).
cidade(2, 'Brisbane', 40).
cidade(2, 'Melbourne', 40).
cidade(2, 'Suva', 41).
cidade(2, 'Nadi', 41).
cidade(2, 'Lautoka', 41).
cidade(2, 'Auckland', 42).
cidade(2, 'Wellington', 42).
cidade(2, 'Christchurch', 42).
cidade(2, 'Queenstown', 42).
cidade(2, 'Luganville', 43).
cidade(2, 'Lamap', 43).
cidade(2, 'Lakatoro', 43).
cidade(2, '', ).


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
