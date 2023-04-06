## 1. Extract nouns from the user stories or specification

```
STRAIGHT UP

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

peep, time
maker
```

## 2. Infer the Table Name and Columns

Put the different nouns in this table. Replace the example with your own nouns.

| Record                | Properties          |
| --------------------- | ------------------  |
| users                 | email_address, username, password
| peeps                 | time, contents, user_id

1. Name of the first table (always plural): `users` 

    Column names: `email_address`, `username`, `password`

2. Name of the second table (always plural): `peeps` 

    Column names: `time`, `contents`, `user_id`

## 3. Decide the column types.

[Here's a full documentation of PostgreSQL data types](https://www.postgresql.org/docs/current/datatype.html).

Most of the time, you'll need either `text`, `int`, `bigint`, `numeric`, or `boolean`. If you're in doubt, do some research or ask your peers.

Remember to **always** have the primary key `id` as a first column. Its type will always be `SERIAL`.

```
# EXAMPLE:

Table: users
id: SERIAL
email_address: varchar
username: varchar
password: varchar

Table: peeps
id: SERIAL
time: DATETIME
contents: text
user_id: user_id
```

## 4. Decide on The Tables Relationship
```

1. Can one user have many posts? YES
2. Can one post have many users? NO

-> Therefore,
-> An user HAS MANY posts
-> An post BELONGS TO an user

-> Therefore, the foreign key is on the peeps table.
```

## 4. Write the SQL.

```sql
-- EXAMPLE
-- file: chitter_table.sql

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  email_address varchar(320),
  username varchar(50) NOT NULL,
  password varchar(60) NOT NULL);

-- Then the table with the foreign key first.
CREATE TABLE peeps (
  id SERIAL PRIMARY KEY,
  time TIMESTAMP,
  contents text,
-- The foreign key name is always {other_table_singular}_id
  user_id int,
  constraint fk_user foreign key(user_id)
    references users(id)
    on delete cascade
);
```

## 5. Create the tables.

```bash
psql -h 127.0.0.1 chitter_database < chitter_table.sql
```

<!-- BEGIN GENERATED SECTION DO NOT EDIT -->
