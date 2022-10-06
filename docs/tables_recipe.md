Two Tables Design Recipe Template
Copy this recipe template to design and create two related database tables from a specification.

1. Extract nouns from the user stories or specification
# EXAMPLE USER STORY:
# (analyse only the relevant part - here the final line).
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

Nouns

peep, user, time

2. Infer the Table Name and Columns
Put the different nouns in this table. Replace the example with your own nouns.

Record	Properties
peeps	user_id, content, date_time
users	name, user, email, password



3. Decide the column types.
Here's a full documentation of PostgreSQL data types.

Most of the time, you'll need either text, int, bigint, numeric, or boolean. If you're in doubt, do some research or ask your peers.

Remember to always have the primary key id as a first column. Its type will always be SERIAL.

# EXAMPLE:

Table: peeps
id: SERIAL
title: text
release_year: int

Table: artists
id: SERIAL
name: text


FOREIGN KEY IS IN PEEPS



4. Write the SQL.

-- file: users_table.sql

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name text,
  username text,
  email varchar(319),
  password text
);

-- Then the table with the foreign key first.
CREATE TABLE peeps (
  id SERIAL PRIMARY KEY,
  content text,
  user_id,
  date_time DATETIME,
  user_id int,
  constraint fk_user foreign key(user_id)
    references users(id)
    on delete cascade
);

5. Create the tables.
psql -h 127.0.0.1 database_name < albums_table.sql