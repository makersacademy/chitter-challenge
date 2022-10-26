-- peeps

DROP TABLE IF EXISTS public.peeps;

CREATE SEQUENCE IF NOT EXISTS peeps_id_seq;

CREATE TABLE public.peeps (
    "id" SERIAL,
    "message" text,
    "author" int,
    "time" text,
    PRIMARY KEY ("id")
);

INSERT INTO public.peeps ("message", "author", "time") VALUES
(
    'My first peep!',
    1,
    '1666705922'
),(
    'Another peep',
    2,
    '1666706922'
);

-- accounts

DROP TABLE IF EXISTS public.accounts;

CREATE SEQUENCE IF NOT EXISTS accounts_id_seq;

CREATE TABLE public.accounts (
    "id" SERIAL,
    "email" text,
    "password" text,
    "name" text,
    "username" text,
    PRIMARY KEY (id)
);

INSERT INTO public.accounts ("email", "password", "name", "username") VALUES
(
    'samm@makersacademy.com',
    '$2a$12$KOS94zwuzuH6qnOkj.cmzuooSE.dO7J.f8BIVwCiwqTsl6EwO/ECm',
    'Sam Morgan',
    'sjmog'
),(
    'john@example.com',
    '$2a$12$KOS94zwuzuH6qnOkj.cmzuooSE.dO7J.f8BIVwCiwqTsl6EwO/ECm',
    'John Doe',
    'joedoe'
);