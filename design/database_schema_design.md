# Chitter Database Design Recipe
_Copy this recipe template to design and create two related database tables from a specification._

## 1. Extract nouns from the user stories or specification

```
# USER STORIES:


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

As a Maker
So that only I can post messages on Chitter as me
I want to log in to Chitter

As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter
```

```
Nouns:

Messages, content, time_posted, user_id

(Signup) User, username, email, password
```

## 2. Infer the Table Name and Columns

Put the different nouns in this table. Replace the example with your own nouns.

| Record                | Properties                    |
| --------------------- | ----------------------------- |
| message               | content, time_posted, user_id
| user                  | username, email, password

1. Name of the first table (always plural): `messages` 

    Column names: `content`, `time_posted` `user_id`

2. Name of the second table (always plural): `users` 

    Column names: `username`, `email`, `password`,

## 3. Column types.


```

Table: messages
id: SERIAL
title: content
time_posted: timestamp

Table: users
id: SERIAL
username: text
email_address: text
password: text
<!-- Password will need to be encrypted -->
```

## 4. Decide on The Tables Relationship

1. Can one [message] have many [users]? NO
2. Can one [user] have many [messages]? YES

Therefore:

1. **[user] has many [message]**
2. And on the other side, **[message] belongs to [user]**
3. In that case, the foreign key is in the table [message]



## 5. The SQL.

```sql

-- file: chitter_datbase_table.sql
-
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  username text,
  email_address text,
  password text
  name text
);

CREATE TABLE messages (
  id SERIAL PRIMARY KEY,
  content text,
  time_posted timestamp,
-- The foreign key name is always {other_table_singular}_id
  user_id int,
  constraint fk_user foreign key(user_id)
    references users(id)
    on delete cascade
);

```

## 5. Create the tables.

```bash
psql -h 127.0.0.1 database_name < albums_table.sql
```