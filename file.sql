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
    iva int2vector NOT NULL,
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