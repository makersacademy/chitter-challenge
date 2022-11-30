# Chitter db

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
In order to start a conversation as a maker I want to reply to a peep from another maker.

As a Maker
So that I can stay constantly tapped in to the shouty box of Chitter
I want to receive an email if I am tagged in a Peep
```

```
Nouns:

USER username, email, password
PEEP content, time_posted, user_id
COMMENT content, time_posted, user_id (of the commenter), peep_id
```

## 2. Infer the Table Name and Columns

Put the different nouns in this table. Replace the example with your own nouns.

| Record                | Properties          |
| --------------------- | ------------------  |
| album                 | title, release year
| artist                | name

1. Name of the first table (always plural): `users` 

    Column names: `username`, `email`, `password`

2. Name of the second table (always plural): `peeps` 

    Column names: `content`, `time_posted`, `user_id`

3. Name of the third table (always plural): `comments` 

    Column names: `content`, `time_posted`, , `user_id`, `peep_id`

## 3. Decide the column types.

[Here's a full documentation of PostgreSQL data types](https://www.postgresql.org/docs/current/datatype.html).

```
Table: users
id: SERIAL
username: text
email: text
password: text

Table: peeps
id: SERIAL
content: text
time_posted: time
user_id: int

Table: comments
id: SERIAL
content: text
time_posted: time
user_id: int
peep_id: int
```

## 4. Write the SQL.

```sql
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  username text,
  email text,
  password text
);

CREATE TABLE peeps (
  id SERIAL PRIMARY KEY,
  content text,
  time_posted TIMESTAMP,
  user_id int,
  constraint fk_user foreign key(user_id)
    references users(id)
    on delete cascade
);

CREATE TABLE comments (
  id SERIAL PRIMARY KEY,
  content text,
  time_posted TIMESTAMP,
  user_id int,
  peep_id int,
  constraint fk_user foreign key(user_id) references users(id) on delete cascade,
  constraint fk_peep foreign key(peep_id) references peeps(id) on delete cascade
);
```

## 5. Create the tables.


