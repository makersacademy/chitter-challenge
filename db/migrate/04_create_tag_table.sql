CREATE TABLE "public"."tag" (
    "id" SERIAL PRIMARY KEY,
    "message_id" int4,
    "user_id" int4,
    CONSTRAINT "tag_message_id_fkey1" FOREIGN KEY ("message_id") REFERENCES "public"."messages"("id") ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT "tag_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "public"."users"("id") ON DELETE CASCADE ON UPDATE CASCADE
);