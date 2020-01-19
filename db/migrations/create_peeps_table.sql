CREATE TABLE peeps(id SERIAL PRIMARY KEY, message VARCHAR(240), created_on timestamp without time zone NOT NULL DEFAULT(now()));
