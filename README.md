Chitter Challenge
=================

Description:
-------

Chitter is a small Twitter clone that will allow the users to post messages to a public stream.

User Stories
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
Instructions:
-----
- Clone this repo git clone git@github.com:hotblack86/chitter-challenge.git
- Run bundle install
- Install postgresql if not already installed. $ brew install postgres

Testing:
- Create test database  $ createdb Chitter_test;
- Create tables in test databse  $ rake db:auto_migrate RACK_ENV=test
- Run $ rspec

As a user:
- Create development database  $ createdb Chitter_development;
- Create tables in test databse  $ rake db:auto_migrate RACK_ENV=development
- Run $ rackup
- Open a browser and go to http://localhost:9292
- Sign up, Sign in, then start peeping!


Technologies used:
-----
- DataMapper
- Sinatra
- Capybara
- Postgres

Functionality Implemented:
------
* You don't have to be logged in to see the peeps.
* Makers sign up to chitter with their email, password, name and a username.
* The username and email are unique.
* Peeps (posts to chitter) have the name of the maker and their user handle.

Functionality Ideas to be implemented in the future:
------
* Improved CSS.
* Edit and Delete peep functionality
* A text-to-speech funtion that provides audio output for each tweet.




