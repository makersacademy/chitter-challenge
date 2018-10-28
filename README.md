# Chitter!

This is a small Sinatra twitter clone application that uses PostgresQL and PG for database management. Testing is done using RSpec and Capybara.

There are currently 31 feature and unit tests with 100% coverage.

### Example screen

Here is an image of the home screen with an example username and password entered into the required fields.
![image](./example.png)

### Features

- Signing up with email, password, name, and username
- Logging in with email and password, and signing out
- Posting peeps as a user
- Viewing peeps (whether logged in or not) with the user who posted them and the time they were posted
- Password encryption with BCrypt

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

To run the app:
- `rackup config.ru`!

# :)
