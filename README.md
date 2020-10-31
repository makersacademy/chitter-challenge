Setting up Testing Environment Database:

(1) run psql postgres.
(2) run: # CREATE DATABASE my_peeps_test;
(3) exit psql via: \q.
(4) In the terminal, run: psql my_peeps_test -f ./db/migrations/02_create_test_table.sql 

Setting up Development Environment Database:

(1) run psql postgres.
(2) run: # CREATE DATABASE my_peeps;
(3) exit psql via: \q.
(4) In the terminal, run: psql my_peeps -f ./db/migrations/01_create_peeps_table.sql
