# Two Tables Design Recipe Template

_Copy this recipe template to design and create two related database tables from a specification._

## 1. Extract nouns from the user stories or specification

```
# USER STORIES:

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


# Notes on functionality

You don't have to be logged in to see the peeps.
Makers sign up to chitter with their email, password, name and a username (e.g. samm@makersacademy.com, password123, Sam Morgan, sjmog).
The username and email are unique.
Peeps (posts to chitter) have the name of the maker and their user handle.
```

```
Nouns:

user (Maker): email_address, password, name, username
peep (post): content, date&time, user_id (as user's name and username will accompany peep)


```




## 2. Infer the Table Name and Columns

Put the different nouns in this table. Replace the example with your own nouns.

| Record                | Properties          |
| --------------------- | ------------------  |
| user                  | email_address, password, name, username
| peep (post)           | content, date&time, user_id (as user's name and username will accompany peep)

1. Name of the first table (always plural): `users`

    Column names: `email_address`, `password`, `name`, `username`

2. Name of the second table (always plural): `peeps`

    Column names: `content`, `date_and_time`, `user_id`

## 3. Decide the column types.

[Here's a full documentation of PostgreSQL data types](https://www.postgresql.org/docs/current/datatype.html).

Most of the time, you'll need either `text`, `int`, `bigint`, `numeric`, or `boolean`. If you're in doubt, do some research or ask your peers.

Remember to **always** have the primary key `id` as a first column. Its type will always be `SERIAL`.

```
# EXAMPLE:

Table: users
id: SERIAL
email_address: text
password: text
name: text
username: text

Table: peeps
id: SERIAL
content: text
date_and_time: timestamp
user_id: int
```

## 4. Decide on The Tables Relationship

Most of the time, you'll be using a **one-to-many** relationship, and will need a **foreign key** on one of the two tables.

1. Can one user have many peeps? YES
2. Can one peep have many users? NO

-> Therefore,
-> A user HAS MANY peeps
-> A peep BELONGS TO a user

-> Therefore, the foreign key is on the peeps table.
```



## 4. Write the SQL.

```sql
-- EXAMPLE
-- file: chitter_tables.sql

-- Replace the table name, columm names and types.

-- Create the table without the foreign key first.
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  email_address text,
  password text,
  name text,
  username text
);

-- Then the table with the foreign key.
CREATE TABLE peeps (
  id SERIAL PRIMARY KEY,
  content text,
  date_and_time timestamp,
-- The foreign key name is always {other_table_singular}_id
  user_id int,
  constraint fk_user foreign key(user_id)
    references users(id)
    on delete cascade
);

```

## 5. Create the tables.

```bash
psql -h 127.0.0.1 chitter < chitter_tables.sql
```
