CREATE TABLE IF NOT EXISTS public.peep_replies
(
    id         SERIAL,
    content    VARCHAR(144),
    reply_date DATE,
    CONSTRAINT peep_replies_pk
        PRIMARY KEY (id)
);

