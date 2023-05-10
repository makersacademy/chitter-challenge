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

```
Nouns:
user
message(peep), content, time
```

## 2. Infer the Table Name and Columns

Put the different nouns in this table. Replace the example with your own nouns.

| Record | Properties                      |
| ------ | ------------------------------- |
| users  | name, username, email, password |
| peeps  | content, time, user_id          |

1. Name of the first table (always plural): `users`

   Column names: `name`, `username`, `email`, `password`

2. Name of the second table (always plural): `peeps `

   Column names: `content`, `time`, `user_id`

## 3. Decide the column types.

```
Table: users
id: SERIAL
name: text
username: text
email: text
password: text

Table: peeps
id: SERIAL
content: text
time: timestamp
user_id: int
```

## 4. Decide on The Tables Relationship

```
1. Can one user have many peeps? YES
2. Can one peep have many users? NO

-> Therefore,
-> A user HAS MANY peeps
-> A peep BELONGS TO a user

-> Therefore, the foreign key is on the peeps table.
```

## 4. Write the SQL.

```sql

-- file: seeds.sql

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name text,
  username text,
  email text,
  password text,

);

-- Then the table with the foreign key first.
CREATE TABLE peeps (
  id SERIAL PRIMARY KEY,
  content text,
  time timestamp,
-- The foreign key name is always {other_table_singular}_id
  auser_id int,
  constraint fk_user foreign key(user_id)
    references users(id)
    on delete cascade
);

```

## 5. Create the tables.

```bash
psql -h 127.0.0.1 chitter < spec/seeds.sql
psql -h 127.0.0.1 chitter_test < spec/seeds.sql
```
