\i ./db/migrations/01_create_chitter_db.sql;
\c chitter;
\i ./db/migrations/02_create_peeps_table.sql;
\i ./db/migrations/03_create_users_table.sql;
\c chitter_test;
\i ./db/migrations/02_create_peeps_table.sql;
\i ./db/migrations/03_create_users_table.sql;
