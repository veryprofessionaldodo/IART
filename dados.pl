/*------------------------*/
/*        HOTEIS          */
/*------------------------*/

% hotel(IDHotel, Nome, Estrelas, Tel, IDMorada, IDCidade, IDRegião). Regiao é do tipo Montanha, Praia...
hotel(1, [Hotel, Tipton], 3, 278421134, 124, 1, 2).

/*------------------------*/
/*        QUARTOS         */
/*------------------------*/

%quarto(IDQuarto, Nome, NumPessoas).           

/*------------------------*/
/*   PROPRIEDADES HOTEL   */
/*------------------------*/

% prop_hotel(IDProp, NomePropriedade).
prop_hotel(1, 'piscina').
prop_hotel(2, 'praia').
prop_hotel(3, 'parque').
prop_hotel(4, 'natureza').
prop_hotel(5, 'montanha').
prop_hotel(6, 'centro da cidade').

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
pais(1, 'Albania', 1).
pais(2, 'Alemanha', 1).
pais(3, 'Belgica', 1).
pais(4, 'Croacia', 1).
pais(5, 'Dinamarca', 1).
pais(6, 'Estonia', 1).
pais(7, 'Finlandia', 1).
pais(8, 'Franca', 1).
pais(9, 'Grecia', 1).
pais(10, 'Islandia', 1).
pais(11, 'Lituania', 1).
pais(12, 'Macedonia', 1).
pais(13, 'Holanda', 1).
pais(14, 'Portugal', 1).
pais(15, 'Russia', 1).
pais(16, 'Ucrania', 1).
pais(17, 'Espanha', 1).

pais(18, 'Angola', 2).
pais(19, 'Cabo Verde', 2).
pais(20, 'Egito', 2).
pais(21, 'Guine', 2).
pais(22, 'Quenia', 2).
pais(23, 'Madagascar', 2).
pais(24, 'Mocambique', 2).
pais(25, 'Nigeria', 2).
pais(26, 'Uganda', 2).

pais(27, 'Bahamas', 3).
pais(28, 'Canada', 3).
pais(29, 'Haiti', 3).
pais(30, 'Jamaica', 3).
pais(31, 'Mexico', 3).
pais(32, 'Panama', 3).
pais(33, 'USA', 3).

pais(34, 'Argentina', 4).
pais(35, 'Bolivia', 4).
pais(36, 'Brazil', 4).
pais(37, 'Equador', 4).
pais(38, 'Peru', 4).
pais(39, 'Venezuela', 4).

pais(40, 'Australia', 5).
pais(41, 'Fiji', 5).
pais(42, 'Nova Zelandia', 5).
pais(43, 'Vanuatu', 5).

pais(44, 'Afeganistao', 6).
pais(45, 'Bangladesh', 6).
pais(46, 'China', 6).
pais(47, 'Georgia', 6).
pais(48, 'India', 6).
pais(49, 'Japao', 6).
pais(50, 'Laos', 6).
pais(51, 'Malasia', 6).
pais(52, 'Nepal', 6).
pais(53, 'Coreia do Norte', 6).
pais(54, 'Coreia do Sul', 6).
pais(55, 'Turquia', 6).
pais(56, 'Tailandia', 6).

/*------------------------*/
/*        CIDADES         */
/*------------------------*/

%cidade(IDCidade, NomeCidade, IDPais).
cidade(1, 'Tirana', 1).
cidade(2, 'Durres', 1).
cidade(3, 'Vlore', 1).
cidade(4, 'Berlim,', 2).
cidade(5, 'Hamburgo', 2).
cidade(6, 'Munique', 2).
cidade(7, 'Antuérpia', 3).
cidade(8, 'Bruges', 3).
cidade(9, 'Bruxelas', 3).
cidade(10, 'Zagreb', 4).
cidade(11, 'Rijeka', 4).
cidade(12, 'Split', 4).
cidade(13, 'Copenhaga', 5).
cidade(14, 'Aarhus', 5).
cidade(15, 'Odense', 5).
cidade(16, 'Tallinn', 6).
cidade(17, 'Tartu', 6).
cidade(18, 'Narva', 6).
cidade(19, 'Helsinquia', 7).
cidade(20, 'Tampere', 7).
cidade(21, 'Turku', 7).
cidade(22, 'Paris', 8).
cidade(23, 'Bordeus', 8).
cidade(24, 'Lyon', 8).
cidade(25, 'Nice', 8).
cidade(26, 'Cannes', 8).
cidade(27, 'Atenas', 9).
cidade(28, 'Fira', 9).
cidade(29, 'Rodes', 9).
cidade(30, 'Reikiavik', 10).
cidade(31, 'Keflavik', 10).
cidade(32, 'Seyoisfjorour', 10). %Seyoisfjörour
cidade(33, 'Vilnius', 11).
cidade(34, 'Kaunas', 11).
cidade(35, 'Klaipeda', 11). %Klaipèda
cidade(36, 'Skopje', 12).
cidade(37, 'Ohrid', 12).
cidade(38, 'Amesterdao', 13).
cidade(39, 'Roterdao', 13).
cidade(40, 'Kinderdijk', 13).
cidade(41, 'Haia', 13).
cidade(42, 'Delft', 13).
cidade(43, 'Lisboa', 14).
cidade(44, 'Porto', 14).
cidade(45, 'Guimaraes', 14).
cidade(46, 'Evora', 14).
cidade(47, 'Fatima', 14).
cidade(48, 'Coimbra', 14).
cidade(49, 'Albufeira', 14).
cidade(50, 'Portimao', 14).
cidade(51, 'Murmansk', 15).
cidade(52, 'Moscovo', 15).
cidade(53, 'Sao Petersburgo', 15).
cidade(54, 'Kiev', 16).
cidade(55, 'Lviv', 16).
cidade(56, 'Odessa', 16).
cidade(57, 'Madrid', 17).
cidade(58, 'Barcelona', 17).
cidade(58, 'Valencia', 17).
cidade(60, 'Sevilha', 17).
cidade(61, 'Granada', 17).
cidade(62, 'Salamanca', 17).
cidade(63, 'Luanda', 18).
cidade(64, 'Lubango', 18).
cidade(65, 'Malanje', 18).
cidade(66, 'Praia', 19).
cidade(67, 'Santa Maria', 19).
cidade(68, 'Mindelo', 19).
cidade(69, 'Cairo', 20).
cidade(70, 'Alexandria', 20).
cidade(71, 'Gizé', 20).
cidade(72, 'Bissau', 21).
cidade(73, 'Bafata', 21). %Bafatá
cidade(74, 'Gabu', 21). %Gabú
cidade(75, 'Nairobi', 22). %Nairóbi
cidade(76, 'Mombaca', 22). %Mombaça
cidade(77, 'Kisumu', 22).
cidade(78, 'Antananarivo', 23).
cidade(79, 'Antsiranana', 23).
cidade(80, 'Toamasina', 23).
cidade(81, 'Maputo', 24).
cidade(82, 'Inhambane', 24).
cidade(83, 'Tofo', 24).
cidade(84, 'Lagos', 25).
cidade(85, 'Calabar', 25).
cidade(86, 'Abuja', 25).
cidade(87, 'Kampala', 26).
cidade(88, 'Jinja', 26).
cidade(89, 'Tororo', 26).
cidade(90, 'Nassau', 27).
cidade(91, 'Freeport', 27).
cidade(92, 'West End', 27).
cidade(93, 'Toronto', 28).
cidade(94, 'Ottawa', 28).
cidade(95, 'Montreal', 28).
cidade(96, 'Vancouver', 28).
cidade(97, 'Banff', 28).
cidade(98, 'Porto Principe', 29).
cidade(99, 'Cabo Haitiano', 29).
cidade(100, 'Jacmel', 29).
cidade(101, 'Kingston', 30).
cidade(102, 'Negril', 30).
cidade(103, 'Montego Bay', 30).
cidade(104, 'Cancun', 31).
cidade(105, 'Acapulco', 31).
cidade(106, 'Cidade do Mexico', 31).
cidade(107, 'Los Cabos', 31).
cidade(108, 'Cidade do Panama', 32).
cidade(109, 'Bocas del Toro', 32).
cidade(110, 'San Miguelito', 32).
cidade(111, 'Nova Iorque', 33).
cidade(112, 'Los Angeles', 33).
cidade(113, 'Washington DC', 33).
cidade(114, 'Orlando', 33).
cidade(115, 'Las Vegas', 33).
cidade(116, 'Sao Francisco', 33).
cidade(117, 'Boston', 33).
cidade(118, 'Filadelfia', 33).
cidade(119, 'Buenos Aires', 34).
cidade(120, 'Cordoba', 34). 
cidade(121, 'Bariloche', 34).
cidade(122, 'Santa Cruz de la Sierra', 35).
cidade(123, 'Samaipata', 35).
cidade(124, 'Sucre', 35).
cidade(125, 'Rio de Janeiro', 36).
cidade(126, 'Florianopolis', 36). 
cidade(127, 'Sao Paulo', 36).
cidade(128, 'Salvador', 36).
cidade(129, 'Montanita', 37).
cidade(130, 'Cuenca', 37).
cidade(131, 'Quito', 37).
cidade(132, 'Arequipa', 38).
cidade(133, 'Cusco', 38).
cidade(134, 'Lima', 38).
cidade(135, 'Punta Sal', 38).
cidade(136, 'Caracas', 39).
cidade(137, 'Ilha Margarita', 39).
cidade(138, 'Los Llanos', 39).
cidade(139, 'Sydney', 40).
cidade(140, 'Brisbane', 40).
cidade(141, 'Melbourne', 40).
cidade(142, 'Suva', 41).
cidade(143, 'Nadi', 41).
cidade(144, 'Lautoka', 41).
cidade(145, 'Auckland', 42).
cidade(146, 'Wellington', 42).
cidade(147, 'Christchurch', 42).
cidade(148, 'Queenstown', 42).
cidade(149, 'Luganville', 43).
cidade(150, 'Lamap', 43).
cidade(151, 'Lakatoro', 43).

/*------------------------*/
/*        MORADAS         */
/*------------------------*/

% morada(IDMorada, NomeMorada, IDCidade).


/*------------------------*/
/*        SERVIÇOS        */
/*------------------------*/

% servico(Nome).
servico('babysitting').
servico('limpeza de quartos').
servico('garagem privativa').
servico('wifi').
servico('pequeno almoço').
servico('ginasio').
servico('spa').
servico('casino').

/*------------------------*/
/*       TEM QUARTO       */
/*------------------------*/

% tem_quarto(IDHotel, IDQuarto, Preço).

/*------------------------*/
/*       TEM SERVIÇO      */
/*------------------------*/

ter(hotel, servico).