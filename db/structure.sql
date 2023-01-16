create table if not exists public.peep_tags
(
    id           serial,
    tagged_users text[],
    peep_id      integer,
    constraint tags_pk
        primary key (id)
);

create table if not exists public.peep_replies
(
    id         serial,
    content    varchar(144),
    reply_date date,
    constraint peep_replies_pk
        primary key (id)
);

create table if not exists public.users
(
    id              serial,
    first_name      varchar(30),
    last_name       varchar(30),
    username        varchar(30),
    email           varchar(30),
    hashed_password varchar(30),
    writer_peep_id  integer,
    peep_reply_id   integer,
    constraint users_pk
        primary key (id),
    constraint users_peeps_id_fk
        foreign key (writer_peep_id) references public.peeps,
    constraint users_peep_replies_id_fk
        foreign key (peep_reply_id) references public.peep_replies
);

create table if not exists public.peeps
(
    id             serial,
    content        varchar(288),
    user_id        integer,
    peep_reply_id  integer,
    peep_tags_id   integer,
    post_timestamp date,
    constraint peeps_pk
        primary key (id),
    constraint peeps_peep_replies_id_fk
        foreign key (peep_reply_id) references public.peep_replies,
    constraint peeps_tags_id_fk
        foreign key (peep_tags_id) references public.peep_tags
);

