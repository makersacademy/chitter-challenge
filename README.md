Chitter Challenge
=================

USER STORIES

As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter

As a maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order

========================================================

Database Setup

Connect to psql
CREATE DATABASE peeps;
\c peeps;
CREATE TABLE peeps(id SERIAL PRIMARY KEY, text VARCHAR(60));


========================================================

This program is designed to allow users to post short messages (in the style of 'tweets'
from Twitter) which we call Peeps!

Enter a Peep and see it displayed in chronological order
