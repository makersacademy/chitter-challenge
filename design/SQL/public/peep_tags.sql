CREATE TABLE IF NOT EXISTS public.peep_tags
(
    id      INTEGER DEFAULT NEXTVAL('tags_id_seq'::regclass) NOT NULL,
    content TEXT[],
    peep_id INTEGER,
    CONSTRAINT tags_pk
        PRIMARY KEY (id)
);

