Two Tables Design Recipe Template
Copy this recipe template to design and create two related database tables from a specification.

1. Extract nouns from the user stories or specification


#  USER STORY:
# (analyse only the relevant part).

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

message(peep), time of post, sign-up, email, password, name, username 


2. Infer the Table Name and Columns

Put the different nouns in this table. Replace the example with your own nouns.


Record  |	 Properties
---------------------
peep    |	 contents, time, user_id 
user    |  name, email, username, password


Name of the first table (always plural): peeps

Column names: contents, time, user_id

Name of the second table (always plural): users

Column names: name, email, username, password

3. Decide the column types.

Here's a full documentation of PostgreSQL data types.

Most of the time, you'll need either text, int, bigint, numeric, or boolean. If you're in doubt, do some research or ask your peers.

Remember to always have the primary key id as a first column. Its type will always be SERIAL.

# EXAMPLE:

Table: peeps
id: SERIAL
contents: text
time: timestamp
user_id: int


Table: users
id: SERIAL
name: text
email: text
username: text
password: text

4. Decide on The Tables Relationship
Most of the time, you'll be using a one-to-many relationship, and will need a foreign key on one of the two tables.

To decide on which one, answer these two questions:

Can one user have many peeps? (Yes)
Can one peep have many students? (No)
You'll then be able to say that:

[User] has many [peeps]
And on the other side, [peeps] belongs to [users]
In that case, the foreign key is in the table [B]


-> Therefore,
-> A user HAS MANY peeps
-> A peep BELONGS TO a user

-> Therefore, the foreign key is on the peep table.

Foreign key (peeps) - 'user_id'


5. Write the SQL.

-- file: chitter_app.sql

-- Replace the table name, columm names and types.

-- Create the table without the foreign key first.
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name text,
  email text, 
  username text, 
  password text
);

-- Then the table with the foreign key first.
CREATE TABLE peeps (
  id SERIAL PRIMARY KEY,
  contents text,
  time timestamp,
  user_id int,
  constraint fk_user foreign key(user_id)
    references users(id)
    on delete cascade
);

-- The foreign key name is always user_id


6. Create the tables.
psql -h 127.0.0.1 database_name < albums_table.sql