# Chitter Two Tables Design Recipe

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

ADVANCED

As a Maker
So that I can stay constantly tapped in to the shouty box of Chitter
I want to receive an email if I am tagged in a Peep


Notes on functionality:
You don't have to be logged in to see the peeps.
Makers sign up to chitter with their email, password, name and a username (e.g. samm@makersacademy.com, password123, Sam Morgan, sjmog).
The username and email are unique.
Peeps (posts to chitter) have the name of the maker and their user handle.

```

```
Nouns:

message (peep) - will consist of content, name and user handle , time - may include date too if possible 
email, password, name, username
```

## 2. Infer the Table Name and Columns


| Record                | Properties          |
| --------------------- | ------------------  |
| peep                  | content, datetime, user_id
| user                  | email, password, name, username

1. Name of the first table (always plural): `peeps` 

    Column names: `content`, `datetime`, `user_id`

2. Name of the second table (always plural): `users` 

    Column names: `email`, `password`, `name`, `username`

## 3. Decide the column types.

[Here's a full documentation of PostgreSQL data types](https://www.postgresql.org/docs/current/datatype.html).

Most of the time, you'll need either `text`, `int`, `bigint`, `numeric`, or `boolean`. If you're in doubt, do some research or ask your peers.

Remember to **always** have the primary key `id` as a first column. Its type will always be `SERIAL`.

```
# EXAMPLE:

Table: peeps
id: SERIAL
content: text
datetime: timestamp [ (p) ] [ without time zone ]
user_id: int (foreign_key)

Table: users
id: SERIAL
email: text
password: text
name: text
username: text
```

## 4. Decide on The Tables Relationship


```

1. Can one peep have many users? NO
2. Can one user have many peeps? YES

-> Therefore,
-> A user HAS MANY peeps
-> A peep BELONGS TO a user

-> Therefore, the foreign key is on the peeps table.
```

## 4. Write the SQL.

```sql
-- EXAMPLE
-- file: schema/chitter_tables.sql

-- Replace the table name, columm names and types.

-- Create the table without the foreign key first.
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  email text,
  password text,
  name text,
  username text
);

-- Then the table with the foreign key first.
CREATE TABLE peeps (
  id SERIAL PRIMARY KEY,
  content text,
  datetime timestamp DEFAULT now()::timestamp(0),
-- The foreign key name is always {other_table_singular}_id
  user_id int,
  constraint fk_user foreign key(user_id)
    references users(id)
    on delete cascade
);

```

## 5. Create the tables.

```bash
psql -h 127.0.0.1 chitter < schema/peeps_users_tables.sql