# Two Tables Design

## Table Name and Columns

| Record                | Properties          |
| --------------------- | ------------------  |
| user                  | email, password, name, username
| peep                  | content, creation time, link to, user id

1. Name of the first table (always plural): `users` 

    Column names: `email`, `password`, `name`, `username`

2. Name of the second table (always plural): `peeps` 

    Column names: `content`, `creation_time`, `link_to`, `user_id`

## Column types.

```
Table: users
id: SERIAL, int
email: text
password: text
name: text
username: text

Table: peeps
id: SERIAL, int
content: text
creation_time: date
link_to: int
user_id: int
```

## Tables Relationship

```
1. Can one users have many peeps? YES
2. Can one peep have many users? NO

-> Therefore,
-> An user HAS MANY peeps
-> A peep BELONGS TO an user

-> Therefore, the foreign key is on the peeps table.
```


## The SQL.

```sql
-- file: chitter.sql

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  email text,
  password text,
  name text,
  username text,
);

CREATE TABLE peeps (
  id SERIAL PRIMARY KEY,
  content text,
  creation_time date,
  link_to int,
  user_id int,
  constraint fk_user foreign key(user_id)
    references users(id)
    on delete cascade
);

```

## Create the tables.

```bash
psql -h <ip_address> chitter_[production/development] < chitter.sql
```
