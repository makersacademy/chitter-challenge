CREATE TABLE IF NOT EXISTS public.users
(
    id                 SERIAL,
    full_name          VARCHAR(30),
    username           VARCHAR(30),
    email              VARCHAR(30),
    hashed_password_id INTEGER,
    writer_peep_id     INTEGER,
    peep_reply_ids     INTEGER,
    CONSTRAINT users_pk
        PRIMARY KEY (id),
    CONSTRAINT "users_encrpyted passwords_id_fk"
        FOREIGN KEY (hashed_password_id) REFERENCES public.hashed_passwords,
    CONSTRAINT users_peeps_id_fk
        FOREIGN KEY (writer_peep_id) REFERENCES public.peeps,
    CONSTRAINT users_peep_replies_id_fk
        FOREIGN KEY (peep_reply_ids) REFERENCES public.peep_replies
);

