-- ./db/migrations/01_create_peeps_table.sql

CREATE TABLE peeps(id SERIAL PRIMARY KEY, content VARCHAR(60), peeper VARCHAR(20), post_time timestamp);
