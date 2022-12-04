CREATE TABLE "public"."peeps" (
    "id" SERIAL,
    "user" text,
    "comment" text,
    "time" timestamp,
    PRIMARY KEY ("id")
);