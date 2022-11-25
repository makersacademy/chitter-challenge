# Two Tables Design Recipe Template

## 1. Extract nouns from the user stories or specification

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

Abstractions:

- post message to communal page 
    . show all messages from newest to oldest
    . show time of when message was posted

- sign up for chitter 
  . create an account 
- login to chitter 
  . posts show who it was created by 
- log out of chitter 
  . return to home page 

```

```
Nouns:

user
  -email
  -username 
  -password

posts
  - date_created
  - content 
  - user_id



```

## 2. Infer the Table Name and Columns

Put the different nouns in this table. Replace the example with your own nouns.

| Record                | Properties          |
| --------------------- | ------------------  |
| users                 | id, username, email, password
| posts                   id, date_created, content, user_id


## 3. Decide the column types.

```
# EXAMPLE:

Table: users
id: SERIAL
username: text
email: text
password: text

Table: posts
id: SERIAL
content: text
date_created: int
content: text
user_id: foreign-key
```

## 4. Decide on The Tables Relationship

```

1. Can one user have many posts? YES
2. Can one post have many users? NO

-> Therefore,
-> An user HAS MANY posts
-> An posts BELONGS TO a user

-> Therefore, the foreign key is on the 'posts' table.
```
## 4. Write the SQL.

```sql
-- EXAMPLE
-- file: items_table.sql

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
 username text,
 email text,
 password
);

-- Then the table with the foreign key first.
CREATE TABLE posts (
  id SERIAL PRIMARY KEY,
  content text,
  date_created text,
  user_id int,
  constraint fk_user foreign key(user_id)
    references users(id)
    on delete cascade
);

```

## 5. Create the tables.

```bash
psql -h 127.0.0.1 chitter < users_posts_table.sql
```