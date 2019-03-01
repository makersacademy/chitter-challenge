psql
CREATE DATABASE chitter;
\c chitter;
CREATE TABLE "chats" ("id" SERIAL PRIMARY KEY, "time" TIMESTAMP, "nickname" VARCHAR(60), "msg" VARCHAR(60));

INSERT INTO chitter(id, nickname, msg)
VALUES
(1,'Esmeralda', 'Envio un mensaje'),
(2,'Carlitos', 'No se que escribir'),
(3,'Esmeralda', 'Envio mi segundo mensaje');
