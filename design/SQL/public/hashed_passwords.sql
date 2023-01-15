CREATE TABLE IF NOT EXISTS public.hashed_passwords
(
    id      INTEGER DEFAULT NEXTVAL('table_name_id_seq'::regclass) NOT NULL,
    user_fk INTEGER,
    hash    VARCHAR(30),
    salt    VARCHAR(20),
    CONSTRAINT table_name_pk
        PRIMARY KEY (id)
);

