# Chitter - Two Tables Design Recipe Template

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

```
Nouns:

peep, time, sign up, log in, log out, tagged, email
```

## 2. Infer the Table Name and Columns

Put the different nouns in this table. Replace the example with your own nouns.

| Record                | Properties              |
| --------------------- | ----------------------  |
| peep                  | content, time, user_id
| user                  | name, email, username


1. Name of the first table (always plural): `peeps` 

    Column names: `content`, `time`, `user_id`

2. Name of the second table (always plural): `users` 

    Column names: `name`, `email` , `username` 

## 3. Decide the column types.

[Here's a full documentation of PostgreSQL data types](https://www.postgresql.org/docs/current/datatype.html).

Most of the time, you'll need either `text`, `int`, `bigint`, `numeric`, or `boolean`. If you're in doubt, do some research or ask your peers.

Remember to **always** have the primary key `id` as a first column. Its type will always be `SERIAL`.

```
# EXAMPLE:

Table: peeps
id: SERIAL
content: text
time: datetime
user_id: int

Table: users
id: SERIAL
name: text
email: text
username: text
```

## 4. Design the Many-to-Many relationship

Make sure you can answer YES to these two questions:

1. Can one [TABLE ONE] have many [TABLE TWO]? (Yes/No)
2. Can one [TABLE TWO] have many [TABLE ONE]? (Yes/No)

```
1. Can one peep have many users? NO
2. Can one user have many peeps? YES
```

_If you would answer "No" to one of these questions, you'll probably have to implement a One-to-Many relationship, which is simpler. Use the relevant design recipe in that case._


## 4. Write the SQL.

```sql
-- file: peeps_users.sql

DROP TABLE peeps;
DROP TABLE users;


-- Create the first table.
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name text,
  email text,
  username text
);

-- Create the second table.
CREATE TABLE peeps (
  id SERIAL PRIMARY KEY,
  content text,
  time timestamp,
  user_id int,
  constraint fk_user foreign key(user_id) references users(id) on delete cascade
);


```

## 5. Create the tables.

```bash
psql -h 127.0.0.1 chitter < spec/peeps_users.sql
psql -h 127.0.0.1 chitter_test < spec/peeps_users.sql
```