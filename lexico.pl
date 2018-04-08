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

%verbo(num, verbo-forma) --> [verbo_conjugado].
verbo(s, [ter]-s) --> [fica].
verbo(p, [ter]-s) --> [ficam].

verbo(s, [ter]-n) --> [não,fica].
verbo(p, [ter]-n) --> [não,ficam].

verbo(s, [custar]-s) --> [custa].
verbo(p, [custar]-s) --> [custam].

verbo(s, [custar]-n) --> [não,custa].
verbo(p, [custar]-n) --> [não,custam].

verbo(_, [haver]-s) --> [há].
verbo(_, [haver]-n) --> [não,há].

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



