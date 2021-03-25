CREATE DATABASE "chitter_test";

\c chitter_test;

CREATE SEQUENCE public.users_user_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

CREATE TABLE public.users
(
    user_id integer NOT NULL DEFAULT nextval('users_user_id_seq'::regclass),
    username character varying(20) COLLATE pg_catalog."default",
    password character varying(20) COLLATE pg_catalog."default",
    email character varying(30) COLLATE pg_catalog."default",
    CONSTRAINT users_pkey PRIMARY KEY (user_id)
);

CREATE SEQUENCE public.peeps_peep_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

CREATE TABLE public.peeps
(
    peep_id integer NOT NULL DEFAULT nextval('peeps_peep_id_seq'::regclass),
    message character varying(512) COLLATE pg_catalog."default",
    user_id integer,
    create_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT peeps_pkey PRIMARY KEY (peep_id),
    CONSTRAINT peeps_one_author FOREIGN KEY (user_id)
        REFERENCES public.users (user_id) MATCH SIMPLE
);

CREATE SEQUENCE public.tags_tag_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

CREATE TABLE public.tags
(
    tag_id integer NOT NULL DEFAULT nextval('tags_tag_id_seq'::regclass),
    tag character varying(15) COLLATE pg_catalog."default",
    CONSTRAINT tags_pkey PRIMARY KEY (tag_id)
);

CREATE TABLE public.peep_tag_relation
(
    peep_id integer,
    tag_id integer,
    CONSTRAINT peep_id FOREIGN KEY (peep_id)
        REFERENCES public.peeps (peep_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT tag_id FOREIGN KEY (peep_id)
        REFERENCES public.tags (tag_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);