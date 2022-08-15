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



Homepage: GET / (done)
Signup for Chitter: GET /signup/new (done)  , POST /signup (done)
Post a message: GET /post/new (done)   , POST /post (done) 
See all the messages:  GET /posts (including time of the post) (done)



CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    email text,
    name text,
);

CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    content text,
    user_id int
);