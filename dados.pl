/*------------------------*/
/*        HOTEIS          */
/*------------------------*/

% hotel(IDHotel, Nome, 	Estrelas, Tel, IDMorada, IDCidade).
hotel(1, ['Hotel', 'Tipton'], 3, '222333444', 1, 43).
hotel(2, ['Hotel', 'Vila', 'Gale'], 3, '5554234123', 2, 44).
hotel(3, ['Hotel', 'Axis'], 3, '1234191234', 3, 45). 
hotel(4, ['Hotel', 'Continental'], 4, '9123451234', 4, 46).
hotel(5, ['Hotel', 'Ibis'], 4, '12341512351', 5, 47).
hotel(6, ['Hotel', 'Village'], 4, '1345143661', 6, 48).
hotel(7, ['Hotel', 'Lusitano'], 4,'12381234912', 7, 49).
hotel(8, ['Hotel', 'Angolano'], 4,'123415123', 8, 50).
hotel(9, ['Hotel', 'Merci'], 2,'12351235', 9, 22).
hotel(10, ['Hotel', 'Louvre'], 4,'1384129341', 10, 22).
hotel(11, ['Hotel', 'Avante'], 4,'8345634956', 11, 21).
hotel(12, ['Hotel', 'Mariatis'], 4,'9123822352', 12, 4).
hotel(13, ['Hotel', 'Haissulen'], 5,'1223452345', 13, 9).

/*------------------------*/
/*        QUARTOS         */
/*------------------------*/

%quarto(IDQuarto, Nome, NumPessoas).   
quarto(1, ['casal'], 2).
quarto(2, ['solteiro'], 1).
quarto(3, ['familia'], 3).
quarto(4, ['suite', 'junior'], 3).
quarto(5, ['suite'], 4).
quarto(6, ['apartamento'], 5).

/*------------------------*/
/*   PROPRIEDADES QUARTO  */
/*------------------------*/

% prop_quarto(IDProp, NomePropriedade).
prop_quarto(1,['vista','de','mar']).
prop_quarto(2,['ar', 'condicionado']).
prop_quarto(3,['cofre']).
prop_quarto(4,['televisao']).
prop_quarto(5,['banheira', 'hidromassagem']).
prop_quarto(6,['minibar']).

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
pais(19, ['Angola'], 2).

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
cidade(10, ['Zagreb'], 4).
cidade(11, ['Rijeka'], 4).
cidade(12, ['Split'], 4).
cidade(13, ['Copenhaga'], 5).
cidade(14, ['Aarhus'], 5).
cidade(15, ['Odense'], 5).
cidade(16, ['Tallinn'], 6).
cidade(17, ['Tartu'], 6).
cidade(18, ['Narva'], 6).
cidade(19, ['Helsinquia'], 7).
cidade(20, ['Tampere'], 7).
cidade(21, ['Turku'], 7).
cidade(22, ['Paris'], 8).
cidade(23, ['Bordeus'], 8).
cidade(24, ['Lyon'], 8).
cidade(25, ['Nice'], 8).
cidade(26, ['Cannes'], 8).
cidade(27, ['Atenas'], 9).
cidade(28, ['Fira'], 9).
cidade(29, ['Rodes'], 9).
cidade(30, ['Reikiavik'], 10).
cidade(31, ['Keflavik'], 10).
cidade(32, ['Seyoisfjorour'], 10). %Seyoisfjörour
cidade(33, ['Vilnius'], 11).
cidade(34, ['Kaunas'], 11).
cidade(35, ['Klaipeda'], 11). %Klaipèda
cidade(36, ['Skopje'], 12).
cidade(37, ['Ohrid'], 12).
cidade(38, ['Amesterdao'], 13).
cidade(39, ['Roterdao'], 13).
cidade(40, ['Kinderdijk'], 13).
cidade(41, ['Haia'], 13).
cidade(42, ['Delft'], 13).
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

morada(1, ['Rua','Bouca','da','Cavadinha'], 43).
morada(2, ['Avenida','Fernando','da','Costa','Silva'], 44).
morada(3, ['Rua','da','Liberdade'], 45).
morada(4, ['Rua','Camões'], 46).
morada(5, ['Rua','da','Nossa','Senhora'], 47).
morada(6, ['Avenida', 'do', 'Estudante'], 48).
morada(7, ['Rua','dos','Ladrões'], 49).
morada(8, ['Avenida', 'Joao', 'Borges', 'da', 'Cunha'], 50).
morada(9, ['Avenue','de','la','Jonchere'], 22).
morada(10, ['Les','Fauvettes'], 22).
morada(11, ['Betaniankatu'], 21).
morada(12, ['Anklamer', 'Street'], 4).
morada(13, ['Rue','du','Houyoux'], 9).

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

% tem_quarto(IDHotel, IDQuarto, Preço, [Propriedades]).
tem_quarto(1, 1, 100, [2,3,4]).
tem_quarto(1, 1, 120, [1,2,3,4]).
tem_quarto(1, 2, 40, [2,3]).
tem_quarto(1, 2, 50, [2,3,4]).
tem_quarto(1, 3, 150, [2,3,4]).
tem_quarto(1, 3, 170, [1,2,3,4]).
tem_quarto(1, 4, 200, [1,2,3,4,6]).
tem_quarto(1, 5, 260, [1,2,3,4,5,6]).

tem_quarto(2, 1, 100, [2,3,4]).
tem_quarto(2, 1, 120, [1,2,3,4]).
tem_quarto(2, 2, 40, [2,3]).
tem_quarto(2, 2, 50, [2,3,4]).
tem_quarto(2, 3, 150, [2,3,4]).
tem_quarto(2, 3, 170, [1,2,3,4]).
tem_quarto(2, 4, 200, [1,2,3,4,6]).
tem_quarto(2, 5, 260, [1,2,3,4,5,6]).

tem_quarto(3, 1, 90, [2,3,4]).
tem_quarto(3, 2, 30, [2,3]).
tem_quarto(3, 2, 35, [2,3,4]).
tem_quarto(3, 3, 120, [2,3,4]).
tem_quarto(3, 4, 200, [2,3,4,6]).
tem_quarto(3, 5, 230, [2,3,4,5,6]).

tem_quarto(4, 1, 120, [2,3,4]).
tem_quarto(4, 1, 140, [1,2,3,4]).
tem_quarto(4, 2, 60, [2,3]).
tem_quarto(4, 2, 70, [2,3,4]).
tem_quarto(4, 3, 170, [2,3,4]).
tem_quarto(4, 3, 190, [1,2,3,4]).
tem_quarto(4, 4, 220, [1,2,3,4,6]).
tem_quarto(4, 5, 280, [1,2,3,4,5,6]).

tem_quarto(5, 1, 120, [2,3,4]).
tem_quarto(5, 1, 140, [1,2,3,4]).
tem_quarto(5, 2, 60, [2,3]).
tem_quarto(5, 2, 70, [2,3,4]).
tem_quarto(5, 3, 170, [2,3,4]).
tem_quarto(5, 3, 190, [1,2,3,4]).
tem_quarto(5, 4, 220, [1,2,3,4,6]).
tem_quarto(5, 5, 280, [1,2,3,4,5,6]).

tem_quarto(6, 1, 120, [2,3,4]).
tem_quarto(6, 1, 140, [1,2,3,4]).
tem_quarto(6, 2, 60, [2,3]).
tem_quarto(6, 2, 70, [2,3,4]).
tem_quarto(6, 3, 170, [2,3,4]).
tem_quarto(6, 3, 190, [1,2,3,4]).
tem_quarto(6, 4, 220, [1,2,3,4,6]).
tem_quarto(6, 5, 280, [1,2,3,4,5,6]).

tem_quarto(7, 1, 120, [2,3,4]).
tem_quarto(7, 1, 140, [1,2,3,4]).
tem_quarto(7, 2, 60, [2,3]).
tem_quarto(7, 2, 70, [2,3,4]).
tem_quarto(7, 3, 170, [2,3,4]).
tem_quarto(7, 3, 190, [1,2,3,4]).
tem_quarto(7, 4, 220, [1,2,3,4,6]).
tem_quarto(7, 5, 280, [1,2,3,4,5,6]).

tem_quarto(8, 1, 120, [2,3,4]).
tem_quarto(8, 1, 140, [1,2,3,4]).
tem_quarto(8, 2, 60, [2,3]).
tem_quarto(8, 2, 70, [2,3,4]).
tem_quarto(8, 3, 170, [2,3,4]).
tem_quarto(8, 3, 190, [1,2,3,4]).
tem_quarto(8, 4, 220, [1,2,3,4,6]).
tem_quarto(8, 5, 280, [1,2,3,4,5,6]).

tem_quarto(3, 1, 40, [2,3,4]).
tem_quarto(3, 2, 18, [2,3]).
tem_quarto(3, 3, 70, [2,3,4]).
tem_quarto(3, 4, 120, [2,3,4,5,6]).

tem_quarto(10, 1, 120, [2,3,4]).
tem_quarto(10, 1, 140, [1,2,3,4]).
tem_quarto(10, 2, 60, [2,3]).
tem_quarto(10, 2, 70, [2,3,4]).
tem_quarto(10, 3, 170, [2,3,4]).
tem_quarto(10, 3, 190, [1,2,3,4]).
tem_quarto(10, 4, 220, [1,2,3,4,6]).
tem_quarto(10, 5, 280, [1,2,3,4,5,6]).
tem_quarto(10, 6, 350, [1,2,3,4,5,6]).

tem_quarto(11, 1, 120, [2,3,4]).
tem_quarto(11, 1, 140, [1,2,3,4]).
tem_quarto(11, 2, 60, [2,3]).
tem_quarto(11, 2, 70, [2,3,4]).
tem_quarto(11, 3, 170, [2,3,4]).
tem_quarto(11, 3, 190, [1,2,3,4]).
tem_quarto(11, 4, 220, [1,2,3,4,6]).
tem_quarto(11, 5, 280, [1,2,3,4,5,6]).
tem_quarto(11, 6, 350, [1,2,3,4,5,6]).

tem_quarto(12, 1, 120, [2,3,4]).
tem_quarto(12, 1, 140, [1,2,3,4]).
tem_quarto(12, 2, 60, [2,3]).
tem_quarto(12, 2, 70, [2,3,4]).
tem_quarto(12, 3, 170, [2,3,4]).
tem_quarto(12, 3, 190, [1,2,3,4]).
tem_quarto(12, 4, 220, [1,2,3,4,6]).
tem_quarto(12, 5, 280, [1,2,3,4,5,6]).
tem_quarto(12, 6, 350, [1,2,3,4,5,6]).

tem_quarto(13, 1, 190, [2,3,4]).
tem_quarto(13, 1, 210, [1,2,3,4]).
tem_quarto(13, 2, 130, [2,3]).
tem_quarto(13, 2, 140, [2,3,4]).
tem_quarto(13, 3, 240, [2,3,4]).
tem_quarto(13, 3, 260, [1,2,3,4]).
tem_quarto(13, 4, 290, [1,2,3,4,6]).
tem_quarto(13, 5, 350, [1,2,3,4,5,6]).
tem_quarto(13, 6, 420, [1,2,3,4,5,6]).

/*------------------------*/
/*       TEM SERVIÇO      */
/*------------------------*/

% tem_servico(IDHotel, IDServico).
tem_servico(1,1).
tem_servico(1,2).
tem_servico(1,4).
tem_servico(1,5).

tem_servico(2,2).
tem_servico(2,4).
tem_servico(2,5).

tem_servico(3,1).
tem_servico(3,2).
tem_servico(3,4).
tem_servico(3,5).

tem_servico(4,1).
tem_servico(4,2).
tem_servico(4,3).
tem_servico(4,4).
tem_servico(4,5).
tem_servico(4,9).

tem_servico(5,1).
tem_servico(5,2).
tem_servico(5,3).
tem_servico(5,4).
tem_servico(5,7).

tem_servico(6,1).
tem_servico(6,2).
tem_servico(6,3).
tem_servico(6,4).
tem_servico(6,7).

tem_servico(7,1).
tem_servico(7,2).
tem_servico(7,3).
tem_servico(7,4).
tem_servico(7,7).

tem_servico(8,2).
tem_servico(8,3).
tem_servico(8,4).
tem_servico(8,6).
tem_servico(8,9).

tem_servico(9,2).
tem_servico(9,4).
tem_servico(9,5).

tem_servico(10,2).
tem_servico(10,3).
tem_servico(10,4).
tem_servico(10,6).
tem_servico(10,9).

tem_servico(11,2).
tem_servico(11,3).
tem_servico(11,4).
tem_servico(11,6).
tem_servico(11,8).

tem_servico(12,1).
tem_servico(12,2).
tem_servico(12,3).
tem_servico(12,4).
tem_servico(12,6).
tem_servico(12,9).

tem_servico(13,1).
tem_servico(13,2).
tem_servico(13,3).
tem_servico(13,4).
tem_servico(13,5).
tem_servico(13,6).
tem_servico(13,7).
tem_servico(13,8).
tem_servico(13,9).