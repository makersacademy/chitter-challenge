Two Tables Design Recipe Template

Copy this recipe template to design and create two related database tables from a specification.
1. Extract nouns from the user stories or specification

# EXAMPLE USER STORY:
# (analyse only the relevant part - here the final line).

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

You don't have to be logged in to see the peeps.
Makers sign up to chitter with their email, password, name and a username (e.g. samm@makersacademy.com, password123, Sam Morgan, sjmog).
The username and email are unique.
Peeps (posts to chitter) have the name of the maker and their user handle.

Nouns:

message time_date user email password name username logged_in?

2. Infer the Table Name and Columns

Put the different nouns in this table. Replace the example with your own nouns.
Record 	    Properties
message     content, time_date, user_id
user        email, password, name, username, logged_in?

    Name of the first table (always plural): messagess

    Column names: content, time_date, user_id

    Name of the second table (always plural): users

    Column names: email, password, name, username, logged_in?

3. Decide the column types.

Here's a full documentation of PostgreSQL data types.

Most of the time, you'll need either text, int, bigint, numeric, or boolean. If you're in doubt, do some research or ask your peers.

Remember to always have the primary key id as a first column. Its type will always be SERIAL.

# EXAMPLE:

Table: messages
id: SERIAL
content: text
time_date: timestamp
user_id: int

Table: users
id: SERIAL
email: text
password: text
name: text
username: text
logged_in?: boolean

4. Decide on The Tables Relationship


4. Write the SQL.

-- EXAMPLE
-- file: chitter.sql

-- Replace the table name, columm names and types.

-- Create the table without the foreign key first.
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  email text,
  password text,
  name text,
  username text,
  logged_in boolean
);

-- Then the table with the foreign key first.
CREATE TABLE messages (
  id SERIAL PRIMARY KEY,
  content text,
  time_date timestamp,
-- The foreign key name is always {other_table_singular}_id
  user_id int,
  constraint fk_user foreign key(user_id)
    references users(id)
    on delete cascade
);

5. Create the tables.

psql -h 127.0.0.1 database_name < albums_table.sql