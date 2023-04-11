# Chitter Design Recipe Template

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
```

```
Nouns:

peep, content, time
```

## 2. Infer the Table Name and Columns

Put the different nouns in this table. Replace the example with your own nouns.

| Record                | Properties          |
| --------------------- | ------------------  |
| peeps                 | content, time
| users                 | name, email_address, password

1. Name of the first table (always plural): `peeps` 

    Column names: `content`, `date_of_posting`, `time_of_posting`

2. Name of the second table (always plural): `users` 

    Column names: `name`,`email_address`, `password`

## 3. Decide the column types.

```
Table: peeps
id: SERIAL
content: text
date_of_posting: date
time_of_posting: time

Table: users
id: SERIAL
name: text
email_address: text
password: text
```

## 4. Decide on The Tables Relationship
```
# EXAMPLE

1. Can one user have many peeps? YES
2. Can one peep have many ueser? NO

-> Therefore, the foreign key is on the peeps table.
```

## 4. Write the SQL.

```sql
-- EXAMPLE
-- Create the table without the foreign key first.
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name text,
  email_address text,
  password text
);

-- Then the table with the foreign key first.
CREATE TABLE peeps (
  id SERIAL PRIMARY KEY,
  content text,
  date_of_posting date,
  time_of_posting time,
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