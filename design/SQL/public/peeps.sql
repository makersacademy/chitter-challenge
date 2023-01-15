CREATE TABLE IF NOT EXISTS public.peeps
(
    id            SERIAL,
    content       VARCHAR(288),
    user_id       INTEGER,
    peep_reply_fk INTEGER,
    peep_tags_fk  INTEGER,
    post_date     DATE,
    CONSTRAINT peeps_pk
        PRIMARY KEY (id),
    CONSTRAINT peeps_peep_replies_id_fk
        FOREIGN KEY (peep_reply_fk) REFERENCES public.peep_replies,
    CONSTRAINT peeps_tags_id_fk
        FOREIGN KEY (peep_tags_fk) REFERENCES public.peep_tags
);

