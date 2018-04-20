/*----------------------*/
/*        NOMES         */
/*----------------------*/

    

/*----------------------*/
/*     DETERMINANTES    */
/*----------------------*/

%detereminante(num-gen) --> [det].
detereminante(s-f) --> [a].
detereminante(s-m) --> [o].
detereminante(p-f) --> [as].
detereminante(p-m) --> [os].

/*----------------------*/
/*        VERBOS        */
/*----------------------*/

verbo(ter).
verbo(custar).
verbo(haver).
verbo(existir).

/*----------------------*/
/*     FORMA VERBAL     */
/*----------------------*/

%forma_verbal(num, verbo-forma) --> [verbo_conjugado].
forma_verbal(s, ter-s) --> [fica].
forma_verbal(p, ter-s) --> [ficam].

forma_verbal(s, ter-n) --> [não,fica].
forma_verbal(p, ter-n) --> [não,ficam].

forma_verbal(s, custar-s) --> [custa].
forma_verbal(p, custar-s) --> [custam].

forma_verbal(s, custar-n) --> [não,custa].
forma_verbal(p, custar-n) --> [não,custam].

forma_verbal(_, haver-s) --> [há].
forma_verbal(_, haver-n) --> [não,há].

forma_verbal(s, existir-s) --> [existe].
forma_verbal(p, existir-s) --> [existem].

forma_verbal(s, existir-n) --> [não,existe].
forma_verbal(p, existir-n) --> [não,existem].

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
/*      PROPOSIÇÕES     */
/*----------------------*/

%preposição(num-gen) --> [prep].
preposicao(_) --> [em].
preposicao(_-s) --> [num].
preposicao(_-p) --> [nuns].
preposicao(m-s) --> [no].
preposicao(f-s) --> [na].
preposicao(m-p) --> [nos].
preposicao(f-p) --> [nas].
preposicao(_) --> [com].
preposicao(_) --> [sem].
preposicao(_) --> [por].
preposicao(_-s) --> [de].
preposicao(m-s) --> [do].
preposicao(f-s) --> [da].
preposicao(m-p) --> [dos].
preposicao(f-p) --> [das].

verbo

