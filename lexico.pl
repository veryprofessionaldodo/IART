/*----------------------*/
/*        NOMES         */
/*----------------------*/

% NOTA IMPORTANTE -> Para fins de consistencia usa se sempre Numero-Genero

% Para maiúsculas é necessário '' porque senão reconhece uma variável.
nome(s-m, [hotel]-hotel) --> [hotel].   
nome(s-m, ['Hotel','Tipton']-hotel) --> ['Hotel','Tipton'].   
nome(s-m, [spa]-servico) --> [spa].
nome(s-m, [ginasio]-servico) --> [ginasio].
nome(s-m, [casino]-servico) --> [casino].
nome(s-m, [wifi]-servico) --> [wifi].
nome(s-m, [babysitting]-servico) --> [babysitting].
nome(s-f, [limpeza,de,quartos]-servico) --> [limpeza,de,quartos].
nome(s-f, [garagem,privativa]-servico) --> [garagem,privativa].
nome(s-m, [pequeno,almoco]-servico) --> [pequeno,almoco].
nome(s-f, [cidade]-cidade) --> [cidade].
nome(s-_, ['Tirana']-cidade) --> ['Tirana'].

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
/*        VERBOS        */
/*----------------------*/

verbo(ter).
verbo(custar).
verbo(haver).
verbo(existir).
verbo(ficar).
verbo(conter).

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

forma_verbal(_, haver-s) --> [ha].
forma_verbal(_, haver-n) --> [nao,ha].

forma_verbal(s, existir-s) --> [existe].
forma_verbal(p, existir-s) --> [existem].

forma_verbal(s, existir-n) --> [nao,existe].
forma_verbal(p, existir-n) --> [nao,existem].

/*----------------------*/
/*   QUANTIFICADORES    */  % Utilizado para perguntas, mistura de advérbios e pronomes
/*----------------------*/

%quant(num-gen) --> [quant]
quant(s-_) --> [qual].
quant(p-_) --> [quais].
quant(p-f) --> [quantas].
quant(p-m) --> [quantos].
quant(_) --> [onde].
quant(_) --> [que].

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


/*--------------------------*/
/* ASSOCIAÇÃO VERBO-FUNÇÃO  */
/*--------------------------*/

ter(hotel, servico).
ter(hotel, quarto).
ficar(hotel, cidade).
ficar(hotel, pais).
existir(hotel, cidade).
existir(hotel, pais).
conter(hotel, servico).
conter(hotel, quarto).
