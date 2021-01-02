CREATE TABLE "public"."messages" (
    "id" SERIAL PRIMARY KEY,
    "content" varchar(240),
    "created_at" timestamptz NOT NULL DEFAULT now(),
    "user_id" int4,
    CONSTRAINT "messages_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "public"."users"("id"),
);