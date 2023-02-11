Two Tables (Many-to-Many) Design Recipe Template

_Copy this recipe template to design and create two related database tables having a Many-to-Many relationship._

## 1. Extract nouns from the user stories or specification

```
# STRAIGHT UP

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
```

```
Nouns:
peeps(posts), peep(message) user(maker)
see all, sign up, 

Methods verbs-
view all, 
view timestamp
create post,
sign up(create account) 

posts, title, tags, name
```

## 2. Infer the Table Name and Columns

Put the different nouns in this table. Replace the example with your own nouns.

| peeps(posts)              | Makers(user)       |
| ---------------------     | ------------------  |
| title, content            | private info
| username, name,timestamp  | email, password,
                             ---------------------
                            |  visible user info
                            | username, name


1. Name of the first table (always plural): `Peeps` 

    Column names: `title`, `username`, `content`, `timestamp`TIMESTAMP

2. Name of the second table (always plural): `Makers` 

    Column names: `username`, `name`, `email`, `password`

## 3. Decide the column types.

[Here's a full documentation of PostgreSQL data types](https://www.postgresql.org/docs/current/datatype.html).

Most of the time, you'll need either `text`, `int`, `bigint`, `numeric`, or `boolean`. If you're in doubt, do some research or ask your peers.

Remember to **always** have the primary key `id` as a first column. Its type will always be `SERIAL`.

```Peeps `title`, `username`, `content`, `timestamp`TIMESTAMP
```Makers`username`, `name`, `email`, `password`
# EXAMPLE:

Table: peeps
id: SERIAL
title: text
username: text
content: text
created: TIMESTAMP

Table: makers
id: SERIAL
name: text
username: text
email: CITEXT (or text)
password: varchar
("text" or "varchar". However, it's recommended to use the "bytea" data type to store binary data, such as the result of a bcrypt hash.)
```

## 4. Design the one-to-Many relationship

Make sure you can answer YES to these two questions:

1. Can one [peep/TABLE ONE] have many [makersTABLE TWO]? (No)
2. Can one [MakerTABLE TWO] have many [peepsTABLE ONE]? (Yes)

```
# EXAMPLE

1. Can one maker have many posts? YES
2. Can one post have many makers? no
-> Therefore,
-> An maker HAS MANY peeps
-> A peep BELONGS TO an maker

-> Therefore, the foreign key is on the peeps table.
```

_If you would answer "No" to one of these questions, you'll probably have to implement a One-to-Many relationship, which is simpler. Use the relevant design recipe in that case._


```
# EXAMPLE



## 4. Write the SQL.

```sql
-- EXAMPLE
-- file: makers_seeds.sql

-- Replace the table name, columm names and types.

-- Create the first table.
-- EXAMPLE
-- file: albums_table.sql

-- Replace the table name, columm names and types.

-- Create the table without the foreign key first.

--created: TIMESTAMP

CREATE TABLE makers(
  id SERIAL PRIMARY KEY,
  name text,
  username text,
  email text, ----will be recognised as a string.
  password varchar
);

-- Then the table with the foreign key first.
CREATE TABLE peeps (
  id SERIAL PRIMARY KEY,
  title text,
  username text,
  content text,
  created TIMESTAMP
-- The foreign key name is always maker_id
  maker_id int,
  constraint fk_maker foreign key(maker_id)
    references makers(id)
    on delete cascade
);

```

## 5. Create the tables.

```bash
psql -h 127.0.0.1 database_name < posts_tags.sql