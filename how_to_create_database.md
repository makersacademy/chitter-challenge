CREATE DATABASE chitter_peeps;

\c chitter_peeps;

CREATE TABLE peeps (
    id SERIAL,
    text VARCHAR(280)
);

INSERT INTO peeps(text)
VALUES('Hello and welcome to Chitter, made by Jules');

ALTER TABLE peeps
ADD datetime varchar(30);
