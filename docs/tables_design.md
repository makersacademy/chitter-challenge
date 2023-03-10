# Chitter Tables Design Recipe 

## 1. User stories 

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


## 2. Table Names and Columns

Put the different nouns in this table. Replace the example with your own nouns.

| Table_name            | Column name         |
| --------------------- | ------------------  |
| peeps                 | content, timestamp, tags
| users                 | name, username, password, email


## 3. Column types.

```
Table: peeps
id: SERIAL
content: TEXT
timestamp: TIMESTAMP
tags: TEXT

Table: users
id: SERIAL
name: TEXT
username: TEXT
password: TEXT
email: TEXT

```

## 4. Tables Relationship


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
-- file: chitter_table.sql

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name text,
  username TEXT,
  password TEXT,
  email TEXT
);

CREATE TABLE peeps (
  id SERIAL PRIMARY KEY,
  content TEXT,
  timestamp TIMESTAMP,
  tags TEXT,
  user_id int,
  constraint fk_user foreign key(user_id)
    references users(id)
    on delete cascade
);

```

```bash
psql -h 127.0.0.1 chitter < chitter_tables.sql
```