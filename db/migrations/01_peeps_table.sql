CREATE TABLE "public"."peeps" (
    "id" int4 NOT NULL DEFAULT nextval('peeps_id_seq'::regclass),
    "content" varchar(60),
    "created_on" timestamp NOT NULL DEFAULT now(),
    PRIMARY KEY ("id")
);
