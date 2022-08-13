# Two Tables Design Recipe Template

_Copy this recipe template to design and create two related database tables from a specification._

## 1. Noun extraction from the user stories or specification

```
USER STORY:

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

peeps, content, timestamp, name, username
user, name, email, password, username
```
## 2. Infer the Table Name and Columns

Put the different nouns in this table. Replace the example with your own nouns.

| Record               | Properties                         |
| ---------------------| -----------------------------------|
| peep                 | content, timestamp, name, username |
| user                 | name, email, password, username    |

1. Name of the first table (always plural): `peeps` 

    Column names: `content`, `timestamp`, `name`, `username`

2. Name of the second table (always plural): `users` 

    Column names: `name`, `email`, `password`, `username`

## 3. Decide the column types.

```
Table: peeps
id: SERIAL
content: text
timestamp: timestamp
name: text
username: text

Table: users
id: SERIAL
name: text
email: text
password: text
username: text
```

## 4. Decide on The Tables Relationship

1. Can one user have many peeps? YES
2. Can one peep have many users? NO

-> Therefore,
-> A user HAS MANY peeps
-> A peep BELONGS TO a user

-> Therefore, the foreign key is on the peeps table.
```

## 4. Write the SQL.

```sql

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name text,
  email text,
  password text,
  username text
);

CREATE TABLE peeps (
  id SERIAL PRIMARY KEY,
  content text,
  timestamp timestamp
-- The foreign key name is always {other_table_singular}_id
  user_id int,
  constraint fk_user foreign key(user_id)
    references users(id)
    on delete cascade
);

```

## 5. Create the tables.

```bash
psql -h 127.0.0.1 chitter < peeps_table.sql
psql -h 127.0.0.1 chitter < users_table.sql
```