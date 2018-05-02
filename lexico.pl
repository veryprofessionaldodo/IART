/*----------------------*/
/*        NOMES         */
/*----------------------*/

nome(m-s, [tipton]-hotel) --> [tipton].
nome(f-s, [cidade]-cidade) --> [cidade].
nome(m-s, [spa]-servico) --> [spa].


/*----------------------*/
/*     DETERMINANTES    */
/*----------------------*/

%detereminante(num-gen) --> [det].
determinante(s-f) --> [a].
determinante(s-m) --> [o].
determinante(p-f) --> [as].
determinante(p-m) --> [os].

/*----------------------*/
/*        VERBOS        */
/*----------------------*/

verbo(ter).
verbo(custar).
verbo(haver).
verbo(existir).
verbo(ficar).

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

/* 
\item Quantos (são) os hotéis do Porto?
\item Quais (são) os hotéis de categoria superior a 3 estrelas em Lisboa?
\item E em Coimbra?
\item Que/Quais serviços disponibiliza o Hotel X?
\item Quais os hotéis parisienses que possuem serviço de babysitting?
\item Quais os hotéis de Faro que possuem categoria inferior a 4 e quartos com vista de mar? 
\item O Hotel X fica em Faro e possui 4 estrelas.
*/


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
preposicao(_-s) --> [num].
preposicao(_-p) --> [nuns].
preposicao(m-s) --> [no].
preposicao(f-s) --> [na].
preposicao(m-p) --> [nos].
preposicao(f-p) --> [nas].z
preposicao(_) --> [com].
preposicao(_) --> [sem].
preposicao(_) --> [por].
preposicao(_-s) --> [de].
preposicao(m-s) --> [do].
preposicao(f-s) --> [da].
preposicao(m-p) --> [dos].
preposicao(f-p) --> [das].



