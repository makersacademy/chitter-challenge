# Table Design Recipe Template

## 1. Extract nouns from the user stories or specification

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

## 2. Infer the Table Name and Columns

Put the different nouns in this table. Replace the example with your own nouns.

| Record                | Properties          |
| --------------------- | ------------------  |
| peep                  | id, content, date_created
| user                  | id, email, password, name, username, peep_id

1. Name of the first table (always plural): `peeps` 

    Column names: `id`, `content`, `date_created`


2. Name of the second table (always plural): `users` 

    Column names: `id`, `name`, `username`, `email`, `password`

## 3. Decide the column types.

[Here's a full documentation of PostgreSQL data types](https://www.postgresql.org/docs/current/datatype.html).

Most of the time, you'll need either `text`, `int`, `bigint`, `numeric`, or `boolean`. If you're in doubt, do some research or ask your peers.

Remember to **always** have the primary key `id` as a first column. Its type will always be `SERIAL`.

```
# EXAMPLE:
Table: peeps
id: SERIAL
content: text
date: date

Table: artists
id: SERIAL
name: text
username: text
email: text
password: text
```

## 4. Decide on The Tables Relationship

Most of the time, you'll be using a **one-to-many** relationship, and will need a **foreign key** on one of the two tables.

To decide on which one, answer these two questions:

1. Can one [peep] have many [users]? (No)
2. Can one [user] have many [peeps]? (Yes)

You'll then be able to say that:
A = users
B = peeps
1. **[users] has many [peeps]**
2. And on the other side, **[peeps] belongs to [users]**
3. In that case, the foreign key is in the table [peeps]


## 4. Write the SQL.

```sql
-- EXAMPLE
-- file: albums_table.sql
-- Replace the table name, columm names and types.
-- Create the table without the foreign key first.
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name text,
  username text,
  email text,
  password text
);
-- Then the table with the foreign key first.
CREATE TABLE peeps (
  id SERIAL PRIMARY KEY,
  content text,
  date int,
-- The foreign key name is always {other_table_singular}_id
  user_id int,
  constraint fk_user foreign key(user_id) references users(id)
);
```

## 5. Create the tables.

```bash
psql -h 127.0.0.1 database_name < albums_table.sql
```
