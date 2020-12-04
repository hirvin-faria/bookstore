--
-- PostgreSQL database dump
--

-- Dumped from database version 10.15
-- Dumped by pg_dump version 10.15

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: books_conf; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.books_conf (
    id integer NOT NULL,
    preco numeric NOT NULL,
    user_id integer,
    nome character varying NOT NULL,
    autor character varying
);


ALTER TABLE public.books_conf OWNER TO postgres;

--
-- Name: books_conf_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.books_conf_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.books_conf_id_seq OWNER TO postgres;

--
-- Name: books_conf_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.books_conf_id_seq OWNED BY public.books_conf.id;


--
-- Name: users_conf; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users_conf (
    id integer NOT NULL,
    profile integer NOT NULL,
    username character varying NOT NULL,
    password character varying NOT NULL
);


ALTER TABLE public.users_conf OWNER TO postgres;

--
-- Name: users_conf_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_conf_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_conf_id_seq OWNER TO postgres;

--
-- Name: users_conf_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_conf_id_seq OWNED BY public.users_conf.id;


--
-- Name: users_purchases; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users_purchases (
    id integer NOT NULL,
    user_id integer NOT NULL,
    book_id integer NOT NULL,
    num_itens integer NOT NULL,
    preco_final integer
);


ALTER TABLE public.users_purchases OWNER TO postgres;

--
-- Name: users_purchases_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_purchases_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_purchases_id_seq OWNER TO postgres;

--
-- Name: users_purchases_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_purchases_id_seq OWNED BY public.users_purchases.id;


--
-- Name: books_conf id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.books_conf ALTER COLUMN id SET DEFAULT nextval('public.books_conf_id_seq'::regclass);


--
-- Name: users_conf id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_conf ALTER COLUMN id SET DEFAULT nextval('public.users_conf_id_seq'::regclass);


--
-- Name: users_purchases id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_purchases ALTER COLUMN id SET DEFAULT nextval('public.users_purchases_id_seq'::regclass);


--
-- Name: books_conf books_conf_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.books_conf
    ADD CONSTRAINT books_conf_pkey PRIMARY KEY (id);


--
-- Name: books_conf books_conf_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.books_conf
    ADD CONSTRAINT books_conf_unique UNIQUE (nome, autor, user_id);


--
-- Name: users_conf users_conf_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_conf
    ADD CONSTRAINT users_conf_pkey PRIMARY KEY (id);


--
-- Name: users_conf users_conf_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_conf
    ADD CONSTRAINT users_conf_unique UNIQUE (username, password);


--
-- Name: users_purchases users_purchases_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_purchases
    ADD CONSTRAINT users_purchases_pkey PRIMARY KEY (id);


--
-- Name: books_conf books_conf_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.books_conf
    ADD CONSTRAINT books_conf_fkey FOREIGN KEY (id) REFERENCES public.users_conf(id);


--
-- Name: users_purchases purchase_books_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_purchases
    ADD CONSTRAINT purchase_books_fkey FOREIGN KEY (book_id) REFERENCES public.books_conf(id);


--
-- Name: users_purchases purchase_users_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_purchases
    ADD CONSTRAINT purchase_users_fkey FOREIGN KEY (user_id) REFERENCES public.users_conf(id);


--
-- PostgreSQL database dump complete
--

