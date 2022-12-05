Chitter Two Tables Design Recipe

### 1. Extract nouns from the user stories or specification
# Chitter User Story 

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

As a Maker
So that only I can post messages on Chitter as me
I want to log in to Chitter

As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter

Nouns:

message(peep)(ordered in reverse chronological order), time, 


## 2. Infer the Table Name and Columns
Put the different nouns in this table. Replace the example with your own nouns.

Record	      Properties
peeps	        message, created_at, user_id
users         user_name, password

Name of the first table (always plural): users

Column names: user_name, password

Name of the second table (always plural): peeps

Column names: message, time_posted, user_id

## 3. Decide the column types.

Here's a full documentation of PostgreSQL data types.

Most of the time, you'll need either text, int, bigint, numeric, or boolean. If you're in doubt, do some research or ask your peers.

Remember to always have the primary key id as a first column. Its type will always be SERIAL.

# EXAMPLE:

Table: peeps
id: SERIAL
message: text
time_posted: timestamp
user_id: int

Table: users
id: SERIAL
user_name: text
password: text

4. Decide on The Tables Relationship
Most of the time, you'll be using a one-to-many relationship, and will need a foreign key on one of the two tables.

To decide on which one, answer these two questions:

Can one [peep] have many [users]? (No)
Can one [user] have many [peeps]? (Yes)
You'll then be able to say that:

[users] has many [peeps]
And on the other side, [peeps] belongs to [users]
In that case, the foreign key is in the table [peeps]

## 4. Write the SQL.

-- EXAMPLE
-- file: seeds_users.sql

-- Replace the table name, columm names and types.

-- Create the table without the foreign key first.
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  email_address text,
  password text
);

-- Then the table with the foreign key first.

file: seeds_peeps.sql

CREATE TABLE peeps (
  id SERIAL PRIMARY KEY,
  message text,
  created_at timestamp,
  user_id int,
  constraint fk_user foreign key(user_id)
    references users(id)
    on delete cascade
);

5. Create the tables.
psql -h 127.0.0.1 chitter_database < seeds_peeps.sql
psql -h 127.0.0.1 chitter_database < seeds_users.sql