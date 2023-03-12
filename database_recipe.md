Two Tables Design Recipe Template
Copy this recipe template to design and create two related database tables from a specification.

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

> Nouns: 
peep, peeps, time, maker

2. Infer the Table Name and Columns
Put the different nouns in this table. Replace the example with your own nouns.

peep, peeps, time, maker
Name of the first table (always plural): peeps

Column names: content, time, maker_id

Name of the second table (always plural): makers

Column names: email, password, name, username

3. Decide the column types.
Here's a full documentation of PostgreSQL data types.

Most of the time, you'll need either text, int, bigint, numeric, or boolean. If you're in doubt, do some research or ask your peers.

Remember to always have the primary key id as a first column. Its type will always be SERIAL.

# EXAMPLE:

Table: peeps
id: SERIAL
content: text
time: date
maker_id: foreign_key

Table: makers
id: SERIAL
email: varchar(100) unique
password: char(32)
name: text
username: varchar(15) unique

4. Decide on The Tables Relationship
Most of the time, you'll be using a one-to-many relationship, and will need a foreign key on one of the two tables.

To decide on which one, answer these two questions:

Can one [peeps] have many [makers]? (No)
Can one [maker] have many [peeps]? (Yes/)
You'll then be able to say that:

[maker] has many [peeps]
And on the other side, [peeep] belongs to [maker]
In that case, the foreign key is in the table [peeps]
Replace the relevant bits in this example with your own:

# EXAMPLE

1. Can one artist have many albums? YES
2. Can one album have many artists? NO

-> Therefore,
-> An artist HAS MANY albums
-> An album BELONGS TO an artist

-> Therefore, the foreign key is on the albums table.
If you can answer YES to the two questions, you'll probably have to implement a Many-to-Many relationship, which is more complex and needs a third table (called a join table).

4. Write the SQL.
-- EXAMPLE
-- file: albums_table.sql

-- Replace the table name, columm names and types.

-- Create the table without the foreign key first.
CREATE TABLE makers (
  id SERIAL PRIMARY KEY,
  email citext not null UNIQUE,
  password varchar(32),
  name text,
  username varchar(15) UNIQUE
);

-- Then the table with the foreign key.
CREATE TABLE peeps (
  id SERIAL PRIMARY KEY,
  content text,
  time timestamp without time zone,
  maker_id int,
  constraint fk_maker foreign key(maker_id)
    references makers(id)
    on delete cascade
);
5. Create the tables.

psql -h 127.0.0.1 chitter_challenge_db < spec/seeds/makers_table.sql
psql -h 127.0.0.1 chitter_challenge_db_test < makers_table.sql
psql -h 127.0.0.1 chitter_challenge_db < spec/seeds/peeps_table.sql
psql -h 127.0.0.1 chitter_challenge_db_test < peeps_table.sql