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

peep, time, user, username, email, password


2. Infer the Table Name and Columns



Record	       Properties
peeps	       content, time, user_id
users	       username, email_address, password



Name of the first table (always plural): peeps

Column names: content, time, user_id

Name of the second table (always plural): users

Column names: username, email address, password

3. Decide the column types.

Table: peeps
id: SERIAL
content: text
time: timestamp
user_id: int

Table: users
id: SERIAL
username: text
email_address: text
password: text

4. Decide on The Tables Relationship

Can one peep have many users? No
Can one user have many peeps? Yes

-> Therefore, the foreign key is on the peeps table.

4. Write the SQL.

-- file: chitter_table.sql

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  username text,
  email_address text,
  password text
);

CREATE TABLE peeps (
  id SERIAL PRIMARY KEY,
  content text,
  time timestamp,
  user_id int,
  constraint fk_user foreign key(user_id)
    references users(id)
    on delete cascade
);

5. Create the tables.

psql -h 127.0.0.1 chitter_test < chitter_table.sql

psql -h 127.0.0.1 chitter < chitter_table.sql