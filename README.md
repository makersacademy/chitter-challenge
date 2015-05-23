Chitter Challenge
=================

Brief:

To write a Twitter clone, Chitter, that allows registered, signed in users to post messages ('Peeps'). These can be viewed by the public via a web application. The following user stories will be satisfied.

User Stories:
-------

```sh
As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter

As a Maker
So that I can post messages on Chitter as me
I want to log in to Chitter

As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter

As a maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter

As a maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order

As a maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made
```

Technologies used:
----------------

- Written in Ruby, tested with Rspec and Capybara
- DataMapper and Postgresql for DB
- Bcrypt for password encryption
- Served by Sinatra, HTML, CSS, Bootstrap for looks

