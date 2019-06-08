\i ./db/migrations/02_create_chitter_database.sql;
\c chitter;
\i ./db/migrations/03_create_peeps_table.sql;
\i ./db/migrations/04_create_userdetails_table.sql;
\c chitter_test;
\i ./db/migrations/03_create_peeps_table.sql;
\i ./db/migrations/04_create_userdetails_table.sql;