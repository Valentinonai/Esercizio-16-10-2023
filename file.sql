-----------ESERCIZIO 1----------------

CREATE TABLE public."Clienti"
(
    numero_cliente serial NOT NULL,
    nome character varying(255) NOT NULL,
    cognome character varying(255) NOT NULL,
    data_di_nascita date NOT NULL,
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
    data_fattura date NOT NULL,
    numero_fornitore serial NOT NULL,
    PRIMARY KEY (numero_fattura)
);

ALTER TABLE IF EXISTS public."Fatture"
    OWNER to postgres;