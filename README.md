Chitter Challenge
=================

<ins>USER STORIES

As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter

As a maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order

========================================================

<ins> Database Setup:

Connect to psql
CREATE DATABASE chitter;
\c chitter;
CREATE TABLE peeps(id SERIAL PRIMARY KEY, text VARCHAR(60));

<ins>Test Database Setup:

psql
CREATE DATABASE chitter_test;
\c chitter_test;
CREATE TABLE peeps(id SERIAL PRIMARY KEY, text VARCHAR(60));


========================================================

This program is designed to allow users to post short messages (in the style of 'tweets'
from Twitter) which we call Peeps!

Enter a Peep and see it displayed in chronological order
