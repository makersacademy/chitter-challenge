# Chitter Challenge

## Installation instructions
* Fork and/or clone this repository
* Run bundle install
* Follow the **Setting up the databases** instructions below to set up the live and test databases

### Setting up the databases
1. Connect to psql
2. Create the database using the psql command `CREATE DATABASE chitter;`
3. Connect to the database using the pqsl command `\c chitter;`
4. Run the query we have saved in the file `01_create_users_table.sql`
5. Create a test database using the psql command `CREATE DATABASE chitter_test;`
6. Run the query we have saved in the file `01_create_users_table.sql`
