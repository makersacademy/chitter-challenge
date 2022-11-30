## 1. Extract nouns from the user stories or specification

# EXAMPLE USER STORY:
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

nouns and verbs:
post a peep, view peeps in chronological order, view time it was made, sign up to post a peep


## 2. Infer the Table Name and Columns
Put the different nouns in this table. Replace the example with your own nouns.

Record  |  Properties
-------------------------------------------------------------
peep    | name, username, context, time/date
user    | email, password, name, username 


1. Name of the first table (always plural): peeps
    Column names: context, time/date, user ID

2. Name of the second table (always plural): users
    Column names: email, password, name, username 

## 3. Decide the column types.
Here's a full documentation of PostgreSQL data types : https://www.postgresql.org/docs/current/datatype.html 

Most of the time, you'll need either text, int, bigint, numeric, or boolean. If you're in doubt, do some research or ask your peers.

Remember to always have the primary key id as a first column. Its type will always be SERIAL.

# EXAMPLE:

    Table: peeps
    id: SERIAL
    context: text
    time&date: timestamp ('2022-10-06 08:20:50')
    user_id: int

    Table: users
    id: SERIAL
    name: text
    username: text
    email: text
    password: text
  


## 4. Decide on The Tables Relationship
Most of the time, you'll be using a one-to-many relationship, and will need a foreign key on one of the two tables.

To decide on which one, answer these two questions:

1. Can one [TABLE ONE] have many [TABLE TWO]? (Yes/No)

2. Can one [TABLE TWO] have many [TABLE ONE]? (Yes/No)
You'll then be able to say that:

[A] has many [B]
And on the other side, [B] belongs to [A]
In that case, the foreign key is in the table [B]
Replace the relevant bits in this example with your own:

# EXAMPLE
item =user
peeps = order

1. Can one user have many peeps? YES
2. Can one peep have many users? NO

-> Therefore,
-> A user HAS MANY peeps
-> A peep BELONGS TO a user

-> Therefore, the foreign key is on the peep table.

## 4. Write the SQL.
item =user
peeps = order


```sql
-- EXAMPLE
-- file: chitter_table.sql

-- Replace the table name, columm names and types.

-- Create the table without the foreign key first.


CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name text,
  username text,
  email text,
  password text,
  
);

-- Then the table with the foreign key first.
CREATE TABLE peeps (
  id SERIAL PRIMARY KEY,
  context text,
  time_and_date timestamp,

-- The foreign key name is always {other_table_singular}_id
  user_id int,
  constraint fk_user foreign key(user_id)
    references users(id)
    on delete cascade
);
```

## 5. Create the tables.
psql -h 127.0.0.1 chitter < chitter_database.sql