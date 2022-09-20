# peeps_users (Many-to-Many) Design Recipe Template

Version: 1

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

Notes on functionality:
- You don't have to be logged in to see the peeps.
- Makers sign up to chitter with their email, password, name and a username (e.g. samm@makersacademy.com, password123, Sam Morgan, sjmog).
- The username and email are unique.
- Peeps (posts to chitter) have the name of the maker and their user handle.
```

```
Nouns
-----
- Peep (message) 
  - content (message body)
  - time (posted)
  - user name (first name)
  - user username

- User
  - email
  - password
  - first name
  - handle (username)

Verbs
-----
- post (a peep)
- see (all peeps, reverse time order, time posted)
- sign up (for a user account)
```

## 2. Infer the Table Name and Columns

| Record                | Properties                                       |
| --------------------- | -------------------------------------------------|
| peeps                 | id, content, date_time, user_f_name, user_handle |
| user                  | id, email, password, f_name, handle              |

1. Name of the first table (always plural): `peeps` 

    Column names: `id`, `content`, `date_time`, `user_f_name`, `user_handle`

2. Name of the second table (always plural): `users` 

    Column names: `id`, `email`, `password`, `f_name`, `handle`

## 3. Decide the column types

```
See section 6 'Write the SQL'
```

## 4. Design the Many-to-Many relationship

```
1. Can one user have many peeps? YES
2. Can one peep have many users? YES
```

## 5. Design the Join Table

```
Join table for tables: peeps and users
Join table name: peeps_users
Columns: peep_id, user_id
```

## 6. Write the SQL

```sql
-- file: peeps_users.sql

CREATE TABLE peeps (
  id SERIAL PRIMARY KEY,
  content text,
  date_time timestamp,
  user_f_name text,
  user_handle text
);

CREATE TABLE users (
  id SERIAL UNIQUE NOT NULL,
  email text UNIQUE NOT NULL,
  password text,
  f_name text,
  handle text UNIQUE NOT NULL,
  PRIMARY KEY (id, email, handle)
);

CREATE TABLE peeps_users (
  peep_id int,
  user_id int,
  constraint fk_peep foreign key(peep_id) references peeps(id) on delete cascade,
  constraint fk_user foreign key(user_id) references users(id) on delete cascade,
  PRIMARY KEY (peep_id, user_id)
);

-- file: seeds_tests.sql


```

## 7. Create the tables

```bash
psql -h 127.0.0.1 database_name < peeps_users.sql
```