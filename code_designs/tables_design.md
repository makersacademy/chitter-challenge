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

ADVANCED

As a Maker
So that I can stay constantly tapped in to the shouty box of Chitter
I want to receive an email if I am tagged in a Peep
```

```
Nouns:

peep, chitter, peep_timestamp, maker, email
```

## 2. Infer the Table Name and Columns

| Record                | Properties                   |
| --------------------- | ---------------------------- |
| maker                 | username, email address      |                   |
| Peep                  | timestamp, content, maker_id  |

1. Name of the first table (always plural): `makers` 

    Column names: `name`, `user_name`, `email_address`

2. Name of the second table (always plural): `peeps` 

    Column names: `timestamp`, `content`, `maker_id`

## 3. Decide the column types.

[Here's a full documentation of PostgreSQL data types](https://www.postgresql.org/docs/current/datatype.html).

Most of the time, you'll need either `text`, `int`, `bigint`, `numeric`, or `boolean`. If you're in doubt, do some research or ask your peers.

Remember to **always** have the primary key `id` as a first column. Its type will always be `SERIAL`.

```
# EXAMPLE:

Table: makers
id: SERIAL
username: text
email_address: text

Table: peeps
id: SERIAL
timestamp: timestamp
content: text
maker_id: int
```

## 4. Decide on The Tables Relationship

1. Can one MAKER have many PEEPS? Yes
2. Can one PEEP have many MAKERS? No

You'll then be able to say that:

1. **[makers] has many [peeps]**
2. And on the other side, **[peeps] belongs to [makers]**
3. In that case, the foreign key is in the table [peeps]

## 4. Write the SQL.

```sql
-- EXAMPLE
-- file: chitter_tables.sql

-- Replace the table name, columm names and types.

-- Create the table without the foreign key first.
CREATE TABLE makers (
  id SERIAL PRIMARY KEY,
  username text,
  email_address text
);

-- Then the table with the foreign key first.
CREATE TABLE peeps (
  id SERIAL PRIMARY KEY,
  timestamp timestamp,
  content text,
-- The foreign key name is always {other_table_singular}_id
  maker_id int,
  constraint fk_maker foreign key(maker_id)
    references makers(id)
    on delete cascade
);

```

## 5. Create the tables.

```bash
psql -h 127.0.0.1 chitter < chitter_tables.sql
```

---