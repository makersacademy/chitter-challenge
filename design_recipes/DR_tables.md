1. Extract nouns from the user stories or specification

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

Nouns:

name, message, time, date

2. Infer the Table Name and Columns
Put the different nouns in this table. Replace the example with your own nouns.

Table 1
Record      Properties
person      name, handle, email, password
Name of the first table: messages

Column names: name, handle, email, password

Table 2
Records	    Properties
message	    message, date, person_id
Name of the second table: messages

Column names: message, date, person_id



3. Decide the column types.
Here's a full documentation of PostgreSQL data types.

Most of the time, you'll need either text, int, bigint, numeric, or boolean. If you're in doubt, do some research or ask your peers.

Remember to always have the primary key id as a first column. Its type will always be SERIAL.

# EXAMPLE:

Table: people
"id" SERIAL PRIMARY KEY,
"name", text,
"handle", text,
"email", text,
"password", text


Table: messages
"id" SERIAL PRIMARY KEY,
"message" text,
"person_id" int,
"time" text

1. Can one user have many posts? YES
2. Can one post have many users? NO

-> Therefore,
-> A user HAS MANY posts
-> A post BELONGS TO a user

-> Therefore, the foreign key is on the posts table.
If you can answer YES to the two questions, you'll probably have to implement a Many-to-Many relationship, which is more complex and needs a third table (called a join table).

4. Write the SQL.
-- EXAMPLE
-- file: people_table.sql

-- Replace the table name, columm names and types.

-- Create the table without the foreign key first.
CREATE TABLE people (
  "id" SERIAL PRIMARY KEY,
  "name" text UNIQUE,
  "handle" text UNIQUE,
  "email" text,
  "passowrd", text
);

-- Then the table with the foreign key.
CREATE TABLE posts (
  "id" SERIAL PRIMARY KEY,
  "message" text,
  "date" date,
  "time" time,
  "person_id" int,
  constraint fk_person foreign key(person_id)
    references people(id)
    on delete cascade
);

5. Create the tables.
psql -h 127.0.0.1 database_name < seeds.sql