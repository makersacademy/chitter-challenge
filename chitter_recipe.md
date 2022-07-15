## 1. Extract nouns from the user stories or specification

```
# EXAMPLE USER STORIES:
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
I want to sign up for Chitter.
```

```
Nouns:

username, post_content, post_time, post_user
```

## 2. Infer the Table Name and Columns

Put the different nouns in this table. Replace the example with your own nouns.

| Record                | Properties          |
| --------------------- | ------------------  |
| users                 | user_id, username, post_content
| posts             | post_id, username(tied to uder-id?), post_time


1. Name of the first table (always plural): `users` 

    Column names: `username`, `post_content`

2. Name of the second table (always plural): `posts` 

    Column names: `post_user`, `post_time`

## 3. Decide the column types.

[Here's a full documentation of PostgreSQL data types](https://www.postgresql.org/docs/current/datatype.html).

Most of the time, you'll need either `text`, `int`, `bigint`, `numeric`, or `boolean`. If you're in doubt, do some research or ask your peers.

Remember to **always** have the primary key `id` as a first column. Its type will always be `SERIAL`.

```
# EXAMPLE:

Table: users
id: SERIAL
username: text
post_content: text

Table: posts
id: SERIAL
content: text
post_author?: text
post_author_id: id
post_time: time(?)
```

## 4. Design the Many-to-Many relationship

Make sure you can answer YES to these two questions:

1. Can one [TABLE ONE] have many [TABLE TWO]? (Yes)
2. Can one [TABLE TWO] have many [TABLE ONE]? (Yes)

```
# EXAMPLE

1. Can one tag have many posts? YES
2. Can one post have many tags? YES
```

_If you would answer "No" to one of these questions, you'll probably have to implement a One-to-Many relationship, which is simpler. Use the relevant design recipe in that case._

## 5. Design the Join Table

The join table usually contains two columns, which are two foreign keys, each one linking to a record in the two other tables.

The naming convention is `table1_table2`.

```
# EXAMPLE

Join table for tables: posts and tags
Join table name: posts_tags
Columns: post_id, tag_id
```

## 4. Write the SQL.

```sql
-- EXAMPLE
-- file: posts_tags.sql

-- Replace the table name, columm names and types.

-- Create the first table.
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  username text
);

-- Create the second table.
CREATE TABLE posts (
  id SERIAL PRIMARY KEY,
  post_content text,
  author_id int,
  time_posted dateTime
);

-- Create the join table.
CREATE TABLE users_posts (
  author_id int
  constraint fk_user foreign key(author_id) references users(id)
  PRIMARY KEY (author_id)
);

```

## 5. Create the tables.

```bash
psql -h 127.0.0.1 database_name < posts_tags.sql
```