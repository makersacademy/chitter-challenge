## Database setup

### Set up chitter manager database
Connect to psql
Create the database using the psql command CREATE DATABASE chitter_manager;
Connect to the database using the pqsl command \c chitter_manager;
Run the queries saved in db/migrations in order:
 - 01_create_users_table.sql
 - 02_create_peeps_table.sql
 - 03_drop_tagged_users_col_from_peeps_table.sql
 - 04_create_junction_tagged_users_table.sql
Exit psql using the psql command \q

### Set up chitter manager test database
Connect to psql
Create the database using the psql command CREATE DATABASE chitter_manager_test;
Connect to the database using the pqsl command \c chitter_manager_test;
Run the queries saved in db/migrations in order:
 - 01_create_users_table.sql
 - 02_create_peeps_table.sql
 - 03_drop_tagged_users_col_from_peeps_table.sql
 - 04_create_junction_tagged_users_table.sql
Exit psql using the psql command \q