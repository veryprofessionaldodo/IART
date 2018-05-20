/*----------------------*/
/*        NOMES         */
/*----------------------*/

% NOTA IMPORTANTE -> Para fins de consistencia usa se sempre Numero-Genero

% Para maiúsculas é necessário '' porque senão reconhece uma variável.
nome(s-m, ['hotel']-hotel) --> ['hotel'].   
nome(p-_, ['hoteis']-hotel) --> ['hoteis'].
nome(s-m, ['Hotel','Tipton']-hotel) --> ['Hotel','Tipton'].   
nome(s-m, ['Hotel','Vila', 'Gale']-hotel) --> ['Hotel','Vila','Gale'].   
nome(s-m, ['Hotel','Axis']-hotel) --> ['Hotel','Axis'].   
nome(s-m, ['Hotel','Continental']-hotel) --> ['Hotel','Continental'].   
nome(s-m, ['Hotel','Ibis']-hotel) --> ['Hotel','Ibis'].   
nome(s-m, ['Hotel','Village']-hotel) --> ['Hotel','Village'].   
nome(s-m, ['Hotel','Lusitano']-hotel) --> ['Hotel','Lusitano'].   

nome(s-m, ['servico']-servico) --> ['servico'].
nome(p-m, ['servicos']-servico) --> ['servicos'].
nome(s-m, ['spa']-servico) --> ['spa'].
nome(s-m, ['ginasio']-servico) --> ['ginasio'].
nome(s-m, ['casino']-servico) --> ['casino'].
nome(s-m, ['wifi']-servico) --> ['wifi'].
nome(s-m, ['piscina']-servico) --> ['piscina'].
nome(s-m, ['babysitting']-servico) --> ['babysitting'].
nome(s-f, ['limpeza','de','quartos']-servico) --> ['limpeza','de','quartos'].
nome(s-f, ['garagem','privativa']-servico) --> ['garagem','privativa'].
nome(s-m, ['pequeno','almoco']-servico) --> ['pequeno','almoco'].

nome(s-m, ['casal']-quarto) --> ['quarto','de','casal'].
nome(p-m, ['casal']-quarto) --> ['quartos','de','casal'].
nome(s-m, ['solteiro']-quarto) --> ['quarto','de','solteiro'].
nome(p-m, ['solteiro']-quarto) --> ['quartos','de','solteiro'].
nome(s-m, ['familia']-quarto) --> ['quarto','de','familia'].
nome(p-m, ['familia']-quarto) --> ['quartos','de','familia'].
nome(s-m, ['suite']-quarto) --> ['suite'].
nome(p-m, ['suite']-quarto) --> ['suites'].

nome(s-m, ['pais']-pais) --> ['pais'].
nome(s-f, ['Albania']-pais) --> ['Albania'].
nome(s-f, ['Alemanha']-pais) --> ['Alemanha'].
nome(s-_, ['Portugal']-pais) --> ['Portugal'].
nome(s-f, ['Belgica']-pais) --> ['Belgica'].
nome(s-f, ['Croacia']-pais) --> ['Croacia'].
nome(s-f, ['Dinamarca']-pais) --> ['Dinamarca'].
nome(s-f, ['Estonia']-pais) --> ['Estonia'].
nome(s-f, ['Finlandia']-pais) --> ['Finlandia'].
nome(s-_, ['Franca']-pais) --> ['Franca'].
/*nome(s-f, ['Grecia']-pais) --> ['na','Grecia'].
nome(s-f, ['Islandia']-pais) --> ['na','Islandia'].
nome(s-f, ['Lituania']-pais) --> ['na','Lituania'].
nome(s-f, ['Macedonia']-pais) --> ['na','Macedonia'].
nome(s-f, ['Holanda']-pais) --> ['na','Holanda'].
nome(s-f, ['Russia']-pais) --> ['na','Russia'].
nome(s-f, ['Ucrania']-pais) --> ['na','Ucrania'].
nome(s-f, ['Espanha']-pais) --> ['na','Espanha'].
nome(p-f, ['Estados', 'Unidos', 'da', 'America']-pais) --> ['nos','Estados', 'Unidos', 'da', 'America'].
*/

nome(s-m, ['continente']-continente) --> [continente].
nome(s-f, ['Europa']-continente) --> ['Europa'].
nome(s-_, ['Africa']-continente) --> ['Africa'].
nome(s-f, ['America','do','Norte']-continente) --> ['America', 'do', 'Norte'].
nome(s-f, ['America', 'do', 'Sul']-continente) --> ['America', 'do', 'Sul'].
nome(s-f, ['Oceania']-continente) --> ['Oceania'].
nome(s-f, ['Asia']-cidade) --> ['Asia'].
nome(s-_, ['Tirana']-cidade) --> ['Tirana'].
nome(s-f, ['Antuerpia']-cidade) --> ['Antuerpia'].
nome(s-_, ['Paris']-cidade) --> ['Paris'].

nome(s-_, ['Durres']-cidade) --> ['Durres'].
nome(s-_, ['Vlore']-cidade) --> ['Vlore'].
nome(s-_, ['Berlim']-cidade) --> ['Berlim'].
nome(s-_, ['Hamburgo']-cidade) --> ['Hamburgo'].
nome(s-_, ['Munique']-cidade) --> ['Munique'].
nome(s-f, ['Antuerpia']-cidade) --> ['Antuerpia'].
nome(s-_, ['Bruges']-cidade) --> ['Bruges'].
nome(s-_, ['Bruxelas']-cidade) --> ['Bruxelas'].
nome(s-_, ['Zagreb']-cidade) --> ['Zagreb'].
nome(s-_, ['Rijeka']-cidade) --> ['Rijeka'].
nome(s-_, ['Split']-cidade) --> ['Split'].
nome(s-_, ['Copenhaga']-cidade) --> ['Copenhaga'].
nome(s-_, ['Aarhus']-cidade) --> ['Aarhus'].
nome(s-_, ['Odense']-cidade) --> ['Odense'].
nome(s-_, ['Tallinn']-cidade) --> ['Tallinn'].
nome(s-_, ['Tartu']-cidade) --> ['Tartu'].
nome(s-_, ['Narva']-cidade) --> ['Narva'].
nome(s-_, ['Helsinquia']-cidade) --> ['Helsinquia'].
nome(s-_, ['Tampere']-cidade) --> ['Tampere'].
nome(s-_, ['Turku']-cidade) --> ['Turku'].
nome(s-_, ['Paris']-cidade) --> ['Paris'].
nome(s-_, ['Bordeus']-cidade) --> ['Bordeus'].
nome(s-_, ['Lyon']-cidade) --> ['Lyon'].
nome(s-_, ['Atenas']-cidade) --> ['Atenas'].
nome(s-_, ['Fira']-cidade) --> ['Fira'].
nome(s-_, ['Rodes']-cidade) --> ['Rodes'].
nome(s-_, ['Reikiavik']-cidade) --> ['Reikiavik'].
nome(s-_, ['Keflavik']-cidade) --> ['Keflavik'].
nome(s-_, ['Seyoisfjorour']-cidade) --> ['Seyoisfjorour'].
nome(s-_, ['Vilnius']-cidade) --> ['Vilnius'].
nome(s-_, ['Kaunas']-cidade) --> ['Kaunas'].
nome(s-_, ['Klaipeda']-cidade) --> ['Klaipeda'].
nome(s-_, ['Skopje']-cidade) --> ['Skopje'].
nome(s-_, ['Ohrid']-cidade) --> ['Ohrid'].
nome(s-_, ['Amesterdao']-cidade) --> ['Amesterdao'].
nome(s-_, ['Roterdao']-cidade) --> ['Roterdao'].
nome(s-_, ['Kinderdijk']-cidade) --> ['Kinderdijk'].
nome(s-_, ['Haia']-cidade) --> ['Haia'].
nome(s-_, ['Delft']-cidade) --> ['Delft'].
nome(s-_, ['Lisboa']-cidade) --> ['Lisboa'].
nome(s-_, ['Porto']-cidade) --> ['Porto'].
nome(s-_, ['Guimaraes']-cidade) --> ['Guimaraes'].
nome(s-_, ['Evora']-cidade) --> ['Evora'].
nome(s-_, ['Fatima']-cidade) --> ['Fatima'].
nome(s-_, ['Coimbra']-cidade) --> ['Coimbra'].
nome(s-_, ['Albufeira']-cidade) --> ['Albufeira'].
nome(s-_, ['Portimao']-cidade) --> ['Portimao'].
nome(s-_, ['Murmansk']-cidade) --> ['Murmansk'].
nome(s-_, ['Moscovo']-cidade) --> ['Moscovo'].
nome(s-_, ['Sao','Petersburgo']-cidade) --> ['Sao','Petersburgo'].
nome(s-_, ['Kiev']-cidade) --> ['Kiev']. 

nome(_, 1-estrelas) --> ['1','estrela'].
nome(_, 2-estrelas) --> ['2','estrelas'].
nome(_, 3-estrelas) --> ['3','estrelas'].
nome(_, 4-estrelas) --> ['4','estrelas'].
nome(_, 5-estrelas) --> ['5','estrelas'].

nome(_, 1-estrelas) --> ['categoria','1','estrela'].
nome(_, 2-estrelas) --> ['categoria','2','estrelas'].
nome(_, 3-estrelas) --> ['categoria','3','estrelas'].
nome(_, 4-estrelas) --> ['categoria','4','estrelas'].
nome(_, 5-estrelas) --> ['categoria','5','estrelas'].

nome(_, 1-estrelas) --> ['categoria','1'].
nome(_, 2-estrelas) --> ['categoria','2'].
nome(_, 3-estrelas) --> ['categoria','3'].
nome(_, 4-estrelas) --> ['categoria','4'].
nome(_, 5-estrelas) --> ['categoria','5'].

nome(_, 1-maisestrelas) --> ['mais','que','1', 'estrela'].
nome(_, 2-maisestrelas) --> ['mais','que','2', 'estrelas'].
nome(_, 3-maisestrelas) --> ['mais','que','3', 'estrelas'].
nome(_, 4-maisestrelas) --> ['mais','que','4', 'estrelas'].

nome(_, 1-maisestrelas) --> ['categoria','superior','a', '1','estrela'].
nome(_, 2-maisestrelas) --> ['categoria','superior','a', '2','estrelas'].
nome(_, 3-maisestrelas) --> ['categoria','superior','a', '3','estrelas'].
nome(_, 4-maisestrelas) --> ['categoria','superior','a', '4','estrelas'].

nome(_, 1-maisestrelas) --> ['categoria','superior','a', '1'].
nome(_, 2-maisestrelas) --> ['categoria','superior','a', '2'].
nome(_, 3-maisestrelas) --> ['categoria','superior','a', '3'].
nome(_, 4-maisestrelas) --> ['categoria','superior','a', '4'].

nome(_, 2-menosestrelas) --> ['menos','que','2', 'estrela'].
nome(_, 3-menosestrelas) --> ['menos','que','3', 'estrelas'].
nome(_, 4-menosestrelas) --> ['menos','que','4', 'estrelas'].
nome(_, 5-menosestrelas) --> ['menos','que','5', 'estrelas'].

nome(_, 2-menosestrelas) --> ['categoria','inferior','a','2','estrelas'].
nome(_, 3-menosestrelas) --> ['categoria','inferior','a','3','estrelas'].
nome(_, 4-menosestrelas) --> ['categoria','inferior','a','4','estrelas'].
nome(_, 5-menosestrelas) --> ['categoria','inferior','a','5','estrelas'].

nome(_, 2-menosestrelas) --> ['categoria','inferior','a','2'].
nome(_, 3-menosestrelas) --> ['categoria','inferior','a','3'].
nome(_, 4-menosestrelas) --> ['categoria','inferior','a','4'].
nome(_, 5-menosestrelas) --> ['categoria','inferior','a','5'].

/*----------------------*/
/*     DETERMINANTES    */
/*----------------------*/

%detereminante(num-gen) --> [det].
determinante(s-f) --> [a].
determinante(s-m) --> [o].
determinante(p-f) --> [as].
determinante(p-m) --> [os].

determinante(s-f) --> ['A'].
determinante(s-m) --> ['O'].
determinante(p-f) --> ['As'].
determinante(p-m) --> ['Os'].


/*----------------------*/
/*      ADJETIVOS       */
/*----------------------*/

adjetivo(s-_, ['Paris']-cidade, ficar) --> [parisiense].
adjetivo(p-_, ['Paris']-cidade, ficar) --> [parisienses].
adjetivo(s-_, ['Porto']-cidade, ficar) --> [portuense].
adjetivo(p-_, ['Porto']-cidade, ficar) --> [portuenses].
adjetivo(p-_, ['Porto']-cidade, ficar) --> [portuenses].

/*----------------------*/
/*        VERBOS        */
/*----------------------*/

verbo(ter).
verbo(custar).
verbo(haver).
verbo(existir).
verbo(ficar).
verbo(conter).
verbo(possuir).
verbo(disponibilizar).
verbo(ser).

/*----------------------*/
/*     FORMA VERBAL     */
/*----------------------*/

%forma_verbal(num, verbo-forma) --> [verbo_conjugado].
forma_verbal(s, ficar-s) --> [fica].
forma_verbal(p, ficar-s) --> [ficam].

forma_verbal(s, ficar-n) --> [nao,fica].
forma_verbal(p, ficar-n) --> [nao,ficam].

forma_verbal(_, ter-s) --> [tem].

forma_verbal(_, ter-n) --> [nao,tem].

forma_verbal(s, custar-s) --> [custa].
forma_verbal(p, custar-s) --> [custam].

forma_verbal(s, custar-n) --> [nao,custa].
forma_verbal(p, custar-n) --> [nao,custam].

% Como são sinonimos a ter, facilita numero de predicados
forma_verbal(s, ter-s) --> [possui].
forma_verbal(p, ter-s) --> [possuem].

forma_verbal(s, ter-n) --> [nao,possui].
forma_verbal(p, ter-n) --> [nao,possuem].

forma_verbal(s, ter-s) --> [disponibiliza].
forma_verbal(p, ter-s) --> [disponibilizam].

forma_verbal(s, ter-n) --> [nao,disponibiliza].
forma_verbal(p, ter-n) --> [nao,disponibilizam].

forma_verbal(_, ter-s) --> [e].
forma_verbal(_, ter-s) --> [sao].

forma_verbal(_, ter-n) --> [nao,e].
forma_verbal(_, ter-n) --> [nao,sao].

forma_verbal(_, haver-s) --> [ha].
forma_verbal(_, haver-n) --> [nao,ha].

forma_verbal(s, existir-s) --> [existe].
forma_verbal(p, existir-s) --> [existem].

forma_verbal(s, existir-n) --> [nao,existe].
forma_verbal(p, existir-n) --> [nao,existem].

/*----------------------*/
/*   QUANTIFICADORES    */  
/*----------------------*/
% Utilizado para perguntas, mistura de advérbios e pronomes

%quantificador(num-gen, tipo) --> [quantificador]
quantificador(qual,s-_) --> [qual].
quantificador(qual, p-_) --> [quais].
quantificador(quanto, s-f) --> [quanta].
quantificador(quanto, s-m) --> [quanto].
quantificador(quanto, p-f) --> [quantas].
quantificador(quanto, p-m) --> [quantos].
quantificador(onde,_-_) --> [onde].
quantificador(que,_-_) --> [que].

quantificador(qual, s-_) --> ['Qual'].
quantificador(qual, p-_) --> ['Quais'].
quantificador(quanto, s-f) --> ['Quanta'].
quantificador(quanto, s-m) --> ['Quanto'].
quantificador(quanto, p-f) --> ['Quantas'].
quantificador(quanto, p-m) --> ['Quantos'].
quantificador(onde, _-_) --> ['Onde'].
quantificador(que, _-_) --> ['Que'].

/*----------------------*/
/*      PREPOSIÇÕES     */
/*----------------------*/

%preposição(num-gen) --> [prep].
preposicao(_) --> [em].
preposicao(s-_) --> [num].
preposicao(p-_) --> [nuns].
preposicao(s-m) --> [no].
preposicao(s-f) --> [na].
preposicao(p-m) --> [nos].
preposicao(p-f) --> [nas].
preposicao(_) --> [com].
preposicao(_) --> [sem].
preposicao(_) --> [por].
preposicao(s-_) --> [de].
preposicao(s-m) --> [do].
preposicao(s-f) --> [da].
preposicao(p-m) --> [dos].
preposicao(p-f) --> [das].
preposicao(_) --> [que].

/*----------------------*/
/*      CONJUNÇÃO       */
/*----------------------*/

conjuncao(_) --> [e].
conjuncao(_) --> ['E'].


/*--------------------------*/
/* ASSOCIAÇÃO VERBO-FUNÇÃO  */
/*--------------------------*/

possuir(hotel, servico).
possuir(hotel, estrelas).
possuir(hotel, maisestrelas).
possuir(hotel, menosestrelas).
ter(hotel, servico).
ter(hotel, estrelas).
ter(hotel, maisestrelas).
ter(hotel, menosestrelas).
ter(hotel, quarto).
ficar(hotel, cidade).
ficar(hotel, pais).
ficar(hotel, continente).
existir(hotel, cidade).
existir(hotel, pais).
conter(hotel, servico).
conter(hotel, quarto).
