# Two Tables Design Recipe Template


## 1. Extract nouns from the user stories or specification

```
# EXAMPLE USER STORY:
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
peeps, message, time, user, password
```

## 2. Infer the Table Name and Columns

Put the different nouns in this table. Replace the example with your own nouns.

| Record                | Properties          |
| --------------------- | ------------------  |
| peeps                 | id, message, time, user_id
| users                 | id, username, password

1. Name of the first table (always plural): `peeps` 

    Column names: `id`, `message`, `time`, `user_id`

2. Name of the second table (always plural): `users` 

    Column names: `id`, `username`, `password`

## 3. Decide the column types.


Most of the time, you'll need either `text`, `int`, `bigint`, `numeric`, or `boolean`. If you're in doubt, do some research or ask your peers.

Remember to **always** have the primary key `id` as a first column. Its type will always be `SERIAL`.

```
# EXAMPLE:
Table: peeps
id: SERIAL
message: text
time: date
user_id: int

Table: users
id: SERIAL
username: text
password: text
```

## 4. Decide on The Tables Relationship

Most of the time, you'll be using a **one-to-many** relationship, and will need a **foreign key** on one of the two tables.

To decide on which one, answer these two questions:

1. Can one peeps have many users? No
2. Can one user have many peeps? Yes

You'll then be able to say that:

1. users has many peeps
2. And on the other side, peeps belongs to users
3. In that case, the foreign key is in the table peeps

```
# EXAMPLE
1. Can one user have many peeps? YES
2. Can one peep have many users? YES
-> Therefore,
-> A user HAS MANY peeps
-> A peep BELONGS TO a user
-> Therefore, the foreign key is on the peeps table.
```


## 4. Write the SQL.
Table: peeps
id: SERIAL
message: text
time: date
user_id: int

Table: users
id: SERIAL
username: text
password: text

```sql
-- EXAMPLE
-- Replace the table name, columm names and types.
-- Create the table without the foreign key first.

-- Then the table with the foreign key first.
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  username text,
  password text
);

CREATE TABLE peeps (
  id SERIAL PRIMARY KEY,
  message text,
  time date,
  user_id int,
  constraint fk_user foreign key(user_id)
    references users(id)
    on delete cascade
);
```

## 5. Create the tables.

```bash
```