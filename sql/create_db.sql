CREATE DATABASE db_bookstore
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'Portuguese_Brazil.1252'
    LC_CTYPE = 'Portuguese_Brazil.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;


CREATE TABLE public.users_conf
(
    id serial NOT NULL,
    name character varying(50)[] COLLATE pg_catalog."default" NOT NULL,
    username character varying(16)[] COLLATE pg_catalog."default" NOT NULL,
    password character varying(16)[] COLLATE pg_catalog."default" NOT NULL,
    profile integer COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT users_conf_pkey PRIMARY KEY (id),
	CONSTRAINT users_conf_unique UNIQUE (username, password)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.users_conf
    OWNER to postgres;

	
	
CREATE TABLE public.books_conf
(
    id serial NOT NULL,
    name character varying(50)[] COLLATE pg_catalog."default" NOT NULL,
    autor character varying(50)[] COLLATE pg_catalog."default" NOT NULL,
    price numeric NOT NULL,
    user_id integer NOT NULL,
    CONSTRAINT books_conf_pkey PRIMARY KEY (id),
    CONSTRAINT books_conf_unique UNIQUE (name, autor, price, user_id),
    CONSTRAINT books_conf_fkey FOREIGN KEY (user_id)
        REFERENCES public.users_conf (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.books_conf
    OWNER to postgres;
	
	

CREATE TABLE public.users_purchases
(
    id serial NOT NULL,
    user_id integer NOT NULL,
    book_id integer NOT NULL,
    num_itens integer NOT NULL,
    final_price integer NOT NULL,
    CONSTRAINT users_purchases_pkey PRIMARY KEY (id),
    CONSTRAINT users_purchase_unique UNIQUE (user_id, book_id),
    CONSTRAINT books_conf_fkey FOREIGN KEY (book_id)
        REFERENCES public.books_conf (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT users_conf_fkey FOREIGN KEY (user_id)
        REFERENCES public.users_conf (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.users_purchases
    OWNER to postgres;