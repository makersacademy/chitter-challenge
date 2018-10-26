# Chitter!

### Setup instructions

In terminal:
- Run `bundle init`.
- Install `postgres` if you haven't already, then connect to `psql`.

For development:
- Enter the following command to create the `chitter` database: `CREATE DATABASE chitter;`.
- Connect to this database using `\c chitter;`.
- Enter the command found in `./db/migrations/01_create_peeps_table.sql`.
- Enter the command found in `./db/migrations/02_create_users_table.sql`

For testing:
- Enter the following command to create the `chitter_test` database: `CREATE DATABASE chitter_test;`.
- Connect to this database using `\c chitter_test;`.
- Enter the command found in `./db/migrations/01_create_peeps_table.sql`.
- Enter the command found in `./db/migrations/02_create_users_table.sql`
