TABLE DESIGN Recipe

# Two Tables Design Recipe Template

_Copy this recipe template to design and create two related database tables from a specification._

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
```

```
Nouns:

maker/user, peep/message, time, sign up
```

## 2. Infer the Table Name and Columns

Given the additional requirements provided in the README.md, I have decided to implement the following table structure.

| Record                | Properties          |
| --------------------- | ------------------  |
| user                  | name, username, email, password
| peep                  | content, time/date, user_id

1. Name of the first table (always plural): `users`

    Column names: `name`, `username`, `email`, `password`

2. Name of the second table (always plural): `peeps`

    Column names: `content`, `time/date`, `user_id`

## 3. Decide the column types.

[Here's a full documentation of PostgreSQL data types](https://www.postgresql.org/docs/current/datatype.html).

Most of the time, you'll need either `text`, `int`, `bigint`, `numeric`, or `boolean`. If you're in doubt, do some research or ask your peers.

Remember to **always** have the primary key `id` as a first column. Its type will always be `SERIAL`.

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

Most of the time, you'll be using a **one-to-many** relationship, and will need a **foreign key** on one of the two tables.

To decide on which one, answer these two questions:

1. Can one [user] have many [peeps]? (Yes)
2. Can one [peep] have many [users]? (No)

You'll then be able to say that:

1. **[users] has many [peeps]**
2. And on the other side, **[peeps] belongs to [users]**
3. In that case, the foreign key is in the table [peeps]

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
  time timestamp,
-- The foreign key name is always {other_table_singular}_id
  user_id int,
  constraint fk_user foreign key(user_id)
    references users(id)
    on delete cascade
);

```

## 5. Create the tables.
