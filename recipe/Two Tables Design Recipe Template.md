# Two Tables Design Recipe Template


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
```

## 2. Infer the Table Name and Columns

Put the different nouns in this table. Replace the example with your own nouns.

| Record                | Properties          |
| --------------------- | ------------------------------------  |
| users                 | id, username, password,
| posts                 | id, message, date/time, 

1. Name of the first table (always plural): `users` 

    Column names: `id, username, password,`

2. Name of the second table (always plural): `posts` 

    Column names: `id, user_id, message, date/time,` 

## 3. Decide the column types.

```
# EXAMPLE:

Table: users
id: SERIAL
username: text
password: text

Table: posts
id: SERIAL
message: text
datetime = datetime
```

## 4. Decide on The Tables Relationship

1. Can one user have many post? YES
2. Can one post have many users? NO

-> Therefore, the foreign key is on the posts table.

## 4. Write the SQL.

```sql
-- EXAMPLE
-- file: albums_table.sql

-- Replace the table name, columm names and types.

-- Create the table without the foreign key first.
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  username text,
  password text,
);

-- Then the table with the foreign key first.
CREATE TABLE posts (
  id SERIAL PRIMARY KEY,
  message text,
  datetime timestamp,
-- The foreign key name is always {other_table_singular}_id
  user_id int,
  constraint fk_user foreign key(user_id)
    references users(id)
    on delete cascade
);

```

## 5. Create the tables.

psql -h 127.0.0.1 chitter < posts_table.sql
```