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

nome(s-m, [servico]-servico) --> [servico].
nome(p-m, [servicos]-servico) --> [servicos].
nome(s-m, [spa]-servico) --> [spa].
nome(s-m, [ginasio]-servico) --> [ginasio].
nome(s-m, [casino]-servico) --> [casino].
nome(s-m, [wifi]-servico) --> [wifi].
nome(s-m, [babysitting]-servico) --> [babysitting].
nome(s-f, [limpeza,de,quartos]-servico) --> [limpeza,de,quartos].
nome(s-f, [garagem,privativa]-servico) --> [garagem,privativa].
nome(s-m, [pequeno,almoco]-servico) --> [pequeno,almoco].

nome(s-m, [pais]-pais) --> [pais].
nome(s-f, ['Albania']-pais) --> ['na','Albania'].
nome(s-f, ['Alemanha']-pais) --> ['na','Alemanha'].
nome(s-_, ['Portugal']-pais) --> ['em','Portugal'].
nome(s-f, ['Belgica']-pais) --> ['na','Belgica'].
nome(s-f, ['Croacia']-pais) --> ['na','Croacia'].
nome(s-f, ['Dinamarca']-pais) --> ['na','Dinamarca'].
nome(s-f, ['Estonia']-pais) --> ['na','Estonia'].
nome(s-f, ['Finlandia']-pais) --> ['na','Finlandia'].
nome(s-_, ['Franca']-pais) --> ['na','Franca'].
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

nome(s-m, [continente]-continente) --> [continente].
nome(s-f, ['Europa']-continente) --> ['Europa'].
nome(s-_, ['Africa']-continente) --> ['Africa'].
nome(s-f, ['America do Norte']-continente) --> ['America', 'do', 'Norte'].
nome(s-f, ['America do Sul']-continente) --> ['America', 'do', 'Sul'].
nome(s-f, ['Oceania']-continente) --> ['Oceania'].
nome(s-f, ['Asia']-cidade) --> ['Asia'].
nome(s-_, ['Tirana']-cidade) --> ['Tirana'].
nome(s-f, ['Antuerpia']-cidade) --> ['Antuerpia'].
nome(s-_, ['Paris']-cidade) --> ['Paris'].

/*nome(s-_, ['Durres']-cidade) --> ['em','Durres'].
nome(s-_, ['Vlore']-cidade) --> ['em','Vlore'].
nome(s-_, ['Berlim']-cidade) --> ['em','Berlim'].
nome(s-_, ['Hamburgo']-cidade) --> ['em','Hamburgo'].
nome(s-_, ['Munique']-cidade) --> ['em','Munique'].
nome(s-f, ['Antuerpia']-cidade) --> ['na', 'Antuerpia'].
nome(s-_, ['Bruges']-cidade) --> ['em','Bruges'].
nome(s-_, ['Bruxelas']-cidade) --> ['em','Bruxelas'].
nome(s-_, ['Zagreb']-cidade) --> ['em','Zagreb'].
nome(s-_, ['Rijeka']-cidade) --> ['em','Rijeka'].
nome(s-_, ['Split']-cidade) --> ['em','Split'].
nome(s-_, ['Copenhaga']-cidade) --> ['em','Copenhaga'].
nome(s-_, ['Aarhus']-cidade) --> ['em','Aarhus'].
nome(s-_, ['Odense']-cidade) --> ['em','Odense'].
nome(s-_, ['Tallinn']-cidade) --> ['em','Tallinn'].
nome(s-_, ['Tartu']-cidade) --> ['em','Tartu'].
nome(s-_, ['Narva']-cidade) --> ['em','Narva'].
nome(s-_, ['Helsinquia']-cidade) --> ['em','Helsinquia'].
nome(s-_, ['Tampere']-cidade) --> ['em','Tampere'].
nome(s-_, ['Turku']-cidade) --> ['em','Turku'].
nome(s-_, ['Paris']-cidade) --> ['em','Paris'].
nome(s-_, ['Bordeus']-cidade) --> ['em','Bordeus'].
nome(s-_, ['Lyon']-cidade) --> ['em','Lyon'].
nome(s-_, ['Atenas']-cidade) --> ['em','Atenas'].
nome(s-_, ['Fira']-cidade) --> ['em','Fira'].
nome(s-_, ['Rodes']-cidade) --> ['em','Rodes'].
nome(s-_, ['Reikiavik']-cidade) --> ['em','Reikiavik'].
nome(s-_, ['Keflavik']-cidade) --> ['em','Keflavik'].
nome(s-_, ['Seyoisfjorour']-cidade) --> ['em','Seyoisfjorour'].
nome(s-_, ['Vilnius']-cidade) --> ['em','Vilnius'].
nome(s-_, ['Kaunas']-cidade) --> ['em','Kaunas'].
nome(s-_, ['Klaipeda']-cidade) --> ['em','Klaipeda'].
nome(s-_, ['Skopje']-cidade) --> ['em','Skopje'].
nome(s-_, ['Ohrid']-cidade) --> ['em','Ohrid'].
nome(s-_, ['Amesterdao']-cidade) --> ['em','Amesterdao'].
nome(s-_, ['Roterdao']-cidade) --> ['em','Roterdao'].
nome(s-_, ['Kinderdijk']-cidade) --> ['em','Kinderdijk'].
nome(s-_, ['Haia']-cidade) --> ['em','Haia'].
nome(s-_, ['Delft']-cidade) --> ['em','Delft'].
nome(s-_, ['Lisboa']-cidade) --> ['em','Lisboa'].
nome(s-_, ['Porto']-cidade) --> ['no','Porto'].
nome(s-_, ['Guimaraes']-cidade) --> ['em','Guimaraes'].
nome(s-_, ['Evora']-cidade) --> ['em','Evora'].
nome(s-_, ['Fatima']-cidade) --> ['em','Fatima'].
nome(s-_, ['Coimbra']-cidade) --> ['em','Coimbra'].
nome(s-_, ['Albufeira']-cidade) --> ['na','Albufeira'].
nome(s-_, ['Portimao']-cidade) --> ['em','Portimao'].
nome(s-_, ['Murmansk']-cidade) --> ['em','Murmansk'].
nome(s-_, ['Moscovo']-cidade) --> ['em','Moscovo'].
nome(s-_, ['Sao Petersburgo']-cidade) --> ['em','Sao Petersburgo'].
nome(s-_, ['Kiev']-cidade) --> ['em','Kiev']. */

nome(_, 1-estrelas) --> ['1','estrela'].
nome(_, 2-estrelas) --> ['2','estrelas'].
nome(_, 3-estrelas) --> ['3','estrelas'].
nome(_, 4-estrelas) --> ['4','estrelas'].
nome(_, 5-estrelas) --> ['5','estrelas'].

nome(_, 1-estrelas) --> ['categoria','1'].
nome(_, 2-estrelas) --> ['categoria','2'].
nome(_, 3-estrelas) --> ['categoria','3'].
nome(_, 4-estrelas) --> ['categoria','4'].
nome(_, 5-estrelas) --> ['categoria','5'].

nome(_, 1-maisestrelas) --> ['mais','que','1', 'estrela'].
nome(_, 2-maisestrelas) --> ['mais','que','2', 'estrelas'].
nome(_, 3-maisestrelas) --> ['mais','que','3', 'estrelas'].
nome(_, 4-maisestrelas) --> ['mais','que','4', 'estrelas'].

nome(_, 1-maisestrelas) --> ['categoria','superior','a', '1'].
nome(_, 2-maisestrelas) --> ['categoria','superior','a', '2'].
nome(_, 3-maisestrelas) --> ['categoria','superior','a', '3'].
nome(_, 4-maisestrelas) --> ['categoria','superior','a', '4'].

nome(_, 2-menosestrelas) --> ['menos','que','2', 'estrela'].
nome(_, 3-menosestrelas) --> ['menos','que','3', 'estrelas'].
nome(_, 4-menosestrelas) --> ['menos','que','4', 'estrelas'].
nome(_, 5-menosestrelas) --> ['menos','que','5', 'estrelas'].

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
/*     ADJETIVOS	    */
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
possuir(hotel, servico).
possuir(hotel, quarto).
