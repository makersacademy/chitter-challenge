# Chippers Design Recipe

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

users, email, password, name, username
posts, content, created_time
comments, content, created_time

```

## 2. Infer the Table Name and Columns

Put the different nouns in this table. Replace the example with your own nouns.

| Record   | Properties                      |
| -------- | ------------------------------- |
| users    | email, password, name, username |
| posts    | content, created_time           |
| comments | content, created_time           |

## 3. Decide the column types.

[Here's a full documentation of PostgreSQL data types](https://www.postgresql.org/docs/current/datatype.html).

Most of the time, you'll need either `text`, `int`, `bigint`, `numeric`, or `boolean`. If you're in doubt, do some research or ask your peers.

Remember to **always** have the primary key `id` as a first column. Its type will always be `SERIAL`.

```
# EXAMPLE:

Table: users
id: SERIAL
email: text
password: text
name: text
username: text

Table: posts
id: SERIAL
content: text
created_date: date
created_time: time

Table: comments
id: SERIAL
content: text
created_date: date
created_time: time
```

## 4. Design the Many-to-Many relationship

Make sure you can answer YES to these two questions:

1. Can one [TABLE ONE] have many [TABLE TWO]? (Yes/No)
2. Can one [TABLE TWO] have many [TABLE ONE]? (Yes/No)

```
A user has MANY posts => fk on posts table
A user has MANY comments => fk on comments table
A post has MANY comments => fk on comments table
```

## 4. Write the SQL.

```sql
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  email text,
  password text,
  name: text,
  username: text
);

-- Create the second table.
CREATE TABLE posts (
  id SERIAL PRIMARY KEY,
  content text,
  ts timestamp,
  user_id int,
  constraint fk_user foreign key(user_id) references users(id) on delete cascade
);

-- Create the thrid table.
CREATE TABLE comments (
  id SERIAL PRIMARY KEY,
  content text,
  ts timestamp,
  user_id int,
  post_id int,
  constraint fk_user foreign key(user_id) references users(id) on delete cascade,
  constraint fk_post foreign key(post_id) references posts(id) on delete cascade
);

```
