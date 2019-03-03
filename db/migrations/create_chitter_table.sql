psql
CREATE DATABASE chitter;
\c chitter;
CREATE TABLE "chats" ("id" SERIAL PRIMARY KEY, "time" TIMESTAMP, "nickname" VARCHAR(60), "msg" VARCHAR(60));

INSERT INTO chitter(id, time, nickname, msg)
VALUES
(1,'2019-03-03 13:03:30.782394', 'Esmeralda', 'Envio un mensaje'),
(2,'2019-03-03 13:00:09.30805', 'Carlitos', 'No se que escribir'),
(3,'2019-03-03 12:32:37.015157', 'Esmeralda', 'Envio mi segundo mensaje');
