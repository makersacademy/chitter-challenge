# in migrations/04_create_test_peeps_table.sql
CREATE TABLE peeps(id SERIAL PRIMARY KEY, message VARCHAR(1000), author VARCHAR(20), time VARCHAR(30));