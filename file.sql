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