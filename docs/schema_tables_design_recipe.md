# Two Tables Design Recipe Template

_recipe template to design and create two related database tables from a specification._

## 1. Extract nouns from the user stories or specification

```
As a Maker
So that I can let people know what I am doing
I want to post a message (peep) to chitter

As a maker
So that I can see what others are saying
I want to see all peeps in reverse chronological order

As a Maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made

As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter

HARDER
As a Maker
So that only I can post messages on Chitter as me
I want to log in to Chitter

As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter
```

```
Nouns:

messages/peeps, post a message, see(reverse chronological order) messages,  time, see time post was made, sign-up, "me"
```

## 2. Infer the Table Name and Columns

| Record                | Properties          |
| --------------------- | ------------------  |
| peep                  | message, time, user_id
| user                  | name, email(unique), username(unique), password

1. Name of the first table (always plural): `peeps` 

    Column names: `message`, `time`, `user_id`

2. Name of the second table (always plural): `users` 

    Column names: `name`, `email`, `username`, `password`

## 3. Decide the column types.

[Here's a full documentation of PostgreSQL data types](https://www.postgresql.org/docs/current/datatype.html).

```
Table: peeps
id: SERIAL
message: varchar
time: TIMESTAMP

Table: users
id: SERIAL
name: text
email: varchar
username: varchar
password: varchar
```

## 4. Decide on The Tables Relationship

```
1. Can one post have many users? NO
2. Can one user have many peeps? YES

-> Therefore,
-> A user HAS MANY peeps
-> A peep BELONGS TO a user

-> Therefore, the foreign key is on the peeps table.
```

## 4. Write the SQL.

```sql
-- EXAMPLE
-- file: chitter_tables.sql

-- Create the table without the foreign key first.
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name text,
  email varchar(50),
  username varchar(50) NOT NULL,
  password varchar(50) NOT NULL
);

-- Then the table with the foreign key
CREATE TABLE peeps (
  id SERIAL PRIMARY KEY,
  message varchar,
  time TIMESTAMP,
-- The foreign key name is always {other_table_singular}_id
  user_id int,
  constraint fk_user foreign key(user_id)
    references users(id)
    on delete cascade
);

```

## 5. Create the tables.

```bash
psql -h 127.0.0.1 database_name < chitter_tables.sql
```