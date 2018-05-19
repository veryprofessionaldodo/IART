/*------------------------*/
/*        HOTEIS          */
/*------------------------*/

% hotel(IDHotel, Nome, 	Estrelas, Tel, IDMorada, IDCidade).
hotel(1, ['Hotel', 'Tipton'], 3, '278421134', 124, 1).
hotel(2, ['Hotel', 'Vila', 'Gale'], 3, '278421189', 124, 1).
hotel(3, ['Hotel', 'Axis'], 3, '278421189', 124, 1). 
hotel(4, ['Hotel', 'Continental'], 4, '278421189', 124, 28).
hotel(5, ['Hotel', 'Ibis'], 4, '278421189', 124, 8).
hotel(6, ['Hotel', 'Village'], 4, '278421189', 124, 17).
hotel(7, ['Hotel', 'Lusitano'], 4,'278421189', 124, 43).
hotel(8, ['Hotel', 'Angolano'], 4,'278421189', 124, 55).
hotel(9, ['Hotel', 'Merci'], 3,'278421189', 124, 22).
hotel(10, ['Hotel', 'Louvre'], 4,'278421189', 124, 22).

/*------------------------*/
/*        QUARTOS         */
/*------------------------*/

%quarto(IDQuarto, Nome, NumPessoas).   
quarto(1, ['casal'], 2).
quarto(2, ['solteiro'], 1).
quarto(3, ['familia'], 3).
quarto(4, ['familia'], 4).
quarto(5, ['suite'], 5).

/*------------------------*/
/*   PROPRIEDADES QUARTO  */
/*------------------------*/

% prop_quarto(IDProp, NomePropriedade).
prop_quarto(1,['vista','para','o','mar']).
prop_quarto(2,['ar', 'condicionado']).

/*------------------------*/
/*      CONTINENTES       */
/*------------------------*/

% continente(IDContinente, Nome).
continente(1, ['Europa']).
continente(2, ['Africa']).
continente(3, ['America', 'do', 'Norte']).
continente(4, ['America','do','Sul']).
continente(5, ['Oceania']).
continente(6, ['Asia']).

/*------------------------*/
/*         PAÍSES         */
/*------------------------*/

% pais(IDPais, NomePais, IDContinente).
pais(1, ['Albania'], 1).
pais(2, ['Alemanha'], 1).
pais(3, ['Belgica'], 1).
pais(4, ['Croacia'], 1).
pais(5, ['Dinamarca'], 1).
pais(6, ['Estonia'], 1).
pais(7, ['Finlandia'], 1).
pais(8, ['Franca'], 1).
pais(9, ['Grecia'], 1).
pais(10, ['Islandia'], 1).
pais(11, ['Lituania'], 1).
pais(12, ['Macedonia'], 1).
pais(13, ['Holanda'], 1).
pais(14, ['Portugal'], 1).
pais(15, ['Russia'], 1).
pais(16, ['Ucrania'], 1).
pais(17, ['Espanha'], 1).
pais(18, ['Estados','Unidos','da','America'], 3).

pais(18, 'Angola', 2).
/*pais(19, 'Cabo Verde', 2).
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
pais(56, 'Tailandia', 6).*/

/*------------------------*/
/*        CIDADES         */
/*------------------------*/

%cidade(IDCidade, NomeCidade, IDPais).
cidade(1, ['Tirana'], 1).
cidade(2, ['Durres'], 1).
cidade(3, ['Vlore'], 1).
cidade(4, ['Berlim'], 2).
cidade(5, ['Hamburgo'], 2).
cidade(6, ['Munique'], 2).
cidade(7, ['Antuerpia'], 3).
cidade(8, ['Bruges'], 3).
cidade(9, ['Bruxelas'], 3).
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
cidade(22, ['Paris'], 8).
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
cidade(43, ['Lisboa'], 14).
cidade(44, ['Porto'], 14).
cidade(45, ['Guimaraes'], 14).
cidade(46, ['Evora'], 14).
cidade(47, ['Fatima'], 14).
cidade(48, ['Coimbra'], 14).
cidade(49, ['Albufeira'], 14).
cidade(50, ['Portimao'], 14).
cidade(51, ['Murmansk'], 15).
cidade(52, ['Moscovo'], 15).
cidade(53, ['Sao','Petersburgo'], 15).
cidade(54, ['Kiev'], 16).
cidade(55, ['Luanda'], 18).


/*------------------------*/
/*        MORADAS         */
/*------------------------*/

% morada(IDMorada, NomeMorada, IDCidade).
morada(1, ['Rua','Bouca','da','Cavadinha'], 1).

/*------------------------*/
/*        SERVIÇOS        */
/*------------------------*/

% servico(ID,Nome).
servico(1,['babysitting']).
servico(2,['limpeza','de','quartos']).
servico(3,['garagem','privativa']).
servico(4,['wifi']).
servico(5,['pequeno','almoco']).
servico(6,['ginasio']).
servico(7,['spa']).
servico(8,['casino']).
servico(9,['piscina']).

/*------------------------*/
/*       TEM QUARTO       */
/*------------------------*/

% tem_quarto(IDHotel, IDQuarto, Preço).
tem_quarto(1, 2, 100).

/*------------------------*/
/*       TEM SERVIÇO      */
/*------------------------*/

% tem_servico(IDHotel, IDServico).
tem_servico(1,1).
tem_servico(1,2).
tem_servico(1,5).
tem_servico(3,5).
tem_servico(9,1).
tem_servico(9,5).
tem_servico(1,4).
tem_servico(5,8).
