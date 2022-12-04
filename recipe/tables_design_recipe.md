# Two Tables Design Recipe Template

_Copy this recipe template to design and create two related database tables from a specification._

## 1. Extract nouns from the user stories or specification

```
# EXAMPLE USER STORY:
# (analyse only the relevant part - here the final line).

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

post, title, content, post_time, 
user,  e-mail(uniq), password, name, username(uniq),
```

## 2. Infer the Table Name and Columns

Put the different nouns in this table. Replace the example with your own nouns.

| Record                | Properties          |
| --------------------- | ------------------  |
| post                 | title, content, post_time
| user                | e-mail(uniq), password, name, username(uniq)

1. Name of the first table (always plural): `posts` 

    Column names: `title`, `content`, `post_time`

2. Name of the second table (always plural): `users` 

    Column names: `e-mail(uniq)`,`password`, `name`,`username(uniq)`

## 3. Decide the column types.

[Here's a full documentation of PostgreSQL data types](https://www.postgresql.org/docs/current/datatype.html).

Most of the time, you'll need either `text`, `int`, `bigint`, `numeric`, or `boolean`. If you're in doubt, do some research or ask your peers.

Remember to **always** have the primary key `id` as a first column. Its type will always be `SERIAL`.

```
# EXAMPLE:

Table: posts
id: SERIAL
title: text
content: text
create_at: TIMESTAMPTZ DEFAULT Now() 

Table: users
id: SERIAL
email: text
password: text
name: text
username: text
UNIQUE(email,username)
```

## 4. Decide on The Tables Relationship

Most of the time, you'll be using a **one-to-many** relationship, and will need a **foreign key** on one of the two tables.

To decide on which one, answer these two questions:

1. Can one [TABLE ONE] have many [TABLE TWO]? (Yes/No)
2. Can one [TABLE TWO] have many [TABLE ONE]? (Yes/No)

You'll then be able to say that:

1. **[A] has many [B]**
2. And on the other side, **[B] belongs to [A]**
3. In that case, the foreign key is in the table [B]

Replace the relevant bits in this example with your own:

```
# EXAMPLE

1. Can one post have many users? NO
2. Can one user have many posts? YES

-> Therefore,
-> An user HAS MANY posts
-> An post BELONGS TO an user

-> Therefore, the foreign key is on the posts table.
```

*If you can answer YES to the two questions, you'll probably have to implement a Many-to-Many relationship, which is more complex and needs a third table (called a join table).*

## 4. Write the SQL.

```sql
-- EXAMPLE
-- file: users_posts.sql

-- Replace the table name, columm names and types.

-- Create the table without the foreign key first.
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  email text UNIQUE,
  password text,
  name text,
  username text UNIQUE
);

-- Then the table with the foreign key first.
CREATE TABLE posts (
  id SERIAL PRIMARY KEY,
  title text NOT NULL,
  content text NOT NULL,
  create_at TIMESTAMPTZ DEFAULT Now(), 
-- The foreign key name is always {other_table_singular}_id
  user_id int,
  constraint fk_user foreign key(user_id)
    references users(id)
    on delete cascade
);

```

## 5. Create the tables on database(and database for test)

```bash
psql -h 127.0.0.1 chitter < users_posts.sql
```

```bash
psql -h 127.0.0.1 chitter_test < users_posts.sql
```


