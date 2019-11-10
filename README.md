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
7. Connect to both the chitter and chitter_test databases and run the queries saved in `02_create_peeps_table.sql`, `03_update_foreign_keys.sql`, `04_update_peeps_table_add_name_column.sql`, `05_add_timestamp_column.sql`

## Building the app

User story 1:
```
As a Maker
So I can post as me
I want to sign up for Chitter.
```

User story 2:
```
As a Maker
So I can let people know what I'm doing
I want to post a message (peep) to Chitter.
```

User story 3:
```
As a Maker
For better context
I want to see the time at which a Peep was made.
```
