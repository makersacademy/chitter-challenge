[![Build Status](https://travis-ci.org/harrietc52/chitter-challenge.svg)](https://travis-ci.org/harrietc52/chitter-challenge)

Chitter Challenge
=================

This is a simple Twitter clone, allowing users to post messages (peeps) on their profile page and for users and non logged-in users to view everyone's peeps by going to their user page. This is built using Sinatra and Postgres. Tests are written in Rspec and Capybara. Used bcrypt to secure the passwords and data mapper to save the data to the Postgres database.

Features:

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

As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter

As a maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order

As a maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made
```

Technologies Used:

Sinatra
Postgres Database
DataMapper ORM
Ruby


Testing

Tests are run using RSpec, Capybara, Factory Girl and Database Cleaner


Note that you can replace `Coveralls.wear!` with  `SimpleCov.start` to get coverage stats locally
Then run `open coverage/index.html` from the command line to view details.

Created on 27/09/15 by Harriet Craven
