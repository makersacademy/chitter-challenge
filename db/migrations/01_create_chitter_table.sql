```in psql create the below databases and tables in the below order```

CREATE DATABASE chitter
CREATE TABLE all_users(id SERIAL PRIMARY KEY, email VARCHAR(40), password VARCHAR(25), name VARCHAR(15), username VARCHAR(20));
CREATE TABLE all_peeps(id SERIAL PRIMARY KEY, peep_text VARCHAR(100), time TIMESTAMP, user_id INTEGER REFERENCES all_users (id));

CREATE DATABASE chitter_test
CREATE TABLE all_users(id SERIAL PRIMARY KEY, email VARCHAR(40), password VARCHAR(25), name VARCHAR(15), username VARCHAR(20));
CREATE TABLE all_peeps(id SERIAL PRIMARY KEY, peep_text VARCHAR(100), time TIMESTAMP, user_id INTEGER REFERENCES all_users (id));

```Getting started:

1. Connect to `psql`
2. Create the database using the `psql` command `CREATE DATABASE chitter;`
3. Connect to the database using the `pqsl` command `\c chitter;`
4. Run the query we have saved in the file `01_create_chitter_table.sql`

Setting up test databases:

1. Connect to `psql`
2. Create the test database using the `psql` command `CREATE DATABASE chitter_test;`
3. Connect to the database using the `pqsl` command `\c chitter_test;`
4. Run the query we have saved in the file `01_create_chitter_table.sql
```
