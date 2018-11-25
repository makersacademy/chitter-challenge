CREATE TABLE "public"."users" (
    "id" int4 NOT NULL DEFAULT nextval('users_id_seq'::regclass),
    "username" varchar NOT NULL,
    "password" varchar NOT NULL,
    PRIMARY KEY ("id")
);
