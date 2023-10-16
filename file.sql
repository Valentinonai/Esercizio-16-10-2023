-----------ESERCIZIO 1----------------

CREATE TABLE public."Clienti"
(
    numero_cliente serial NOT NULL,
    nome character varying(255) NOT NULL,
    cognome character varying(255) NOT NULL,
    data_di_nascita character varying(255) NOT NULL,
    regione_residenza character varying(255) NOT NULL,
    PRIMARY KEY (numero_cliente)
);

ALTER TABLE IF EXISTS public."Clienti"
    OWNER to postgres;


-----------ESERCIZIO 2-----------------


CREATE TABLE public."Fatture"
(
    numero_fattura serial NOT NULL,
    tipologia character varying(255) NOT NULL,
    importo double precision NOT NULL,
    iva character varying(255) NOT NULL,
    id_cliente serial NOT NULL,
    data_fattura character varying(255) NOT NULL,
    numero_fornitore serial NOT NULL,
    PRIMARY KEY (numero_fattura)
);

ALTER TABLE IF EXISTS public."Fatture"
    OWNER to postgres;

-------ESERCIZIO 3------------------

CREATE TABLE public."Prodotti"
(
    id_prodotto serial NOT NULL,
    descrizione character varying(255) NOT NULL,
    in_produzione boolean NOT NULL,
    in_commercio boolean NOT NULL,
    data_attivazione character varying(255) NOT NULL,
    data_disattivazione character varying(255),
    PRIMARY KEY (id_prodotto)
);

ALTER TABLE IF EXISTS public."Prodotti"
    OWNER to postgres;


----------ESERCIZIO 4---------------
CREATE TABLE public."Fornitori"
(
    numero_fornitore serial NOT NULL,
    denominazione character varying(255) NOT NULL,
    regione_residenza character varying(255) NOT NULL,
    PRIMARY KEY (numero_fornitore)
);

ALTER TABLE IF EXISTS public."Fornitori"
    OWNER to postgres;


-----------ESERCIZIO 5----------------
SELECT nome,cognome 
FROM clienti 
WHERE data_di_nascita 
LIKE '1982-%'

------------ESERCIZIO 6------------------
SELECT COUNT(*)
FROM fatture
WHERE iva='20%'


-----------ESERCIZIO 7------------------
SELECT COUNT(*),SUM (importo) ,EXTRACT (YEAR FROM data_fattura)
FROM fatture
GROUP BY EXTRACT (YEAR FROM data_fattura)


------------ESERCIZIO 8----------------
SELECT * 
FROM prodotti 
WHERE data_attivazione 
LIKE '2017-%' 
AND (in_produzione=true OR in_commercio=true)

---------ESERCIZIO 9------------------
SELECT COUNT(*),EXTRACT(YEAR FROM data_fattura) AS year
FROM fatture
WHERE iva='20%'
GROUP BY year 

---------ESERCIZIO 10-----------------------
SELECT EXTRACT(YEAR FROM data_fattura),COUNT(*)
FROM fatture
WHERE tipologia='A'
GROUP BY EXTRACT(YEAR FROM data_fattura)
HAVING COUNT(*)>1


--------------ESERCIZIO 11------------------
SELECT numero_fattura,importo,iva,data_fattura,denominazione
FROM fatture
LEFT OUTER JOIN fornitori USING(numero_fornitore)

-------------ESERCIZIO 12--------------------
SELECT SUM(importo),regione_residenza
FROM fatture
JOIN clienti ON id_cliente=numero_cliente
GROUP BY regione_residenza

-------------ESERCIZIO 13----------------------
SELECT COUNT(DISTINCT numero_cliente)
FROM clienti
JOIN fatture ON numero_cliente=id_cliente
WHERE EXTRACT(YEAR FROM data_di_nascita)=1980 AND importo>50

------------------ESERCIZIO 14-------------------
SELECT nome||'-'||cognome AS denominazione
FROM clienti
WHERE regione_residenza='italia'