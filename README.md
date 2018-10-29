

```


As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter -- POST MESSAGES AND SEE THEM APPEAR ON HOME PAGE (NO EMOJIS- YOU CAN OD IT)

As a maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order -- READ THE PEEPS ON FRONT PAGE

As a Maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made --- WORK IN PROGRESS, NOT YET IMPLEMENTED

As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter -- PROVIDE ALL REQUIRED INFO AND PRESS SIGN UP

HARDER

As a Maker
So that only I can post messages on Chitter as me
I want to log in to Chitter -- PRESS LOG IN WITH CORRECT CREDENTIALS

As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter -- PRESS LOG OUT BUTTON

```

## Setting up the environment
SET up this postsql database- copy and paste:

CREATE DATABASE chitter; (also create a chitter_test database replica using the same commands)

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  username VARCHAR (80) UNIQUE NOT NULL,
  password VARCHAR (140) NOT NULL,
  name VARCHAR (100) NOT NULL,
  email VARCHAR (355) UNIQUE NOT NULL
);

CREATE TABLE peeps (
  id SERIAL PRIMARY KEY,
  user_id INTEGER REFERENCES users(id),
  text VARCHAR (280) NOT NULL,
  timestamp TIMESTAMP
);
