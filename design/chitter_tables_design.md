# STRAIGHT UP

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

# HARDER

As a Maker
So that only I can post messages on Chitter as me
I want to log in to Chitter

As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter

# ADVANCED

As a Maker
So that I can stay constantly tapped in to the shouty box of Chitter
I want to receive an email if I am tagged in a Peep

nouns: peep, time, sign up

Record	      | Properties
- - - - - - - - - - - - - - - - 
users         | name, username, email, password
peeps         | content, time, like, user_id

# table: users
id: SERIAL
name: text
username: text
email: text
password: text

# table: peeps
id: SERIAL
content: text
time: timestamp
like: int
user_id: int

# file: chitter_tables.sql

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name text,
  username text,
  email text,
  password text
);

CREATE TABLE peeps (
  id SERIAL PRIMARY KEY,
  content text,
  time timestamp,
  likes int,
  user_id int,
  constraint fk_users foreign key(user_id)
    references users(id)
    on delete cascade
);
