# Chitter - Two Tables Design Recipe

## 1. User Stories

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

posts, users, message, post date and time, sign up, log in, log out,
```

## 2. Infer the Table Name and Columns

| Record                | Properties                     |
| --------------------- | ------------------------------ |
| users                 | name, username, email,         |
| posts                 | message, timestamp, user_id    |

1. Name of the first table (always plural): `users` 

    Column names: `name`, `username`, `email`

2. Name of the second table (always plural): `posts` 

    Column names: `message`, `timestamp`, `user_id`

## 3. Decide the column types.
```
# EXAMPLE:

Table: users
id: SERIAL
name: text
username: text
email: text

Table: posts
id: SERIAL
message: text
timestamp: timestamp
user_id: int

```

## 4. Write the SQL.
```sql
-- EXAMPLE
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name text,
  username text,
  email text,
  password text
);

-- Then the table with the foreign key first.
CREATE TABLE posts (
  id SERIAL PRIMARY KEY,
  message text,
  timestamp timestamp,
  user_id int,
  constraint fk_user foreign key(user_id) references users(id)
);
```

## 5. Create the tables.
```bash
psql -h 127.0.0.1 chitter_directory < seeds_chitter.sql
```