Chitter Challenge
=================

Write a little Twitter clone that will allow the users to post messages to a public stream.

Features:
-------

```

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

As a Maker
So that only I can post messages on Chitter as me
I want to log in to Chitter

As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter

```

To run:
-------

- Clone this repository
- run bundle install
- in psql run create database "chitter_development";
- run rake database:migrate
- rspec
- rackup
- or https://enigmatic-forest-49781.herokuapp.com/

To add:

- One day i'll learn some css i promise
- Password recovery
- replying to a thread
- tagging other registered users in a thread
- email notifications
- set up the many to one database relationship between peeps and users
