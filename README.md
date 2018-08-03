Chitter Challenge
=================
This app is a small Twitter clone that allows users to post messages to a public stream. It satisfies the following user stories:

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

Installation:
-------------

Download the files in the repo, `bundle install` the required Gems and run the server with `rackup`. You will also need to have PostgreSQL installed on your machine, and to create and initialise the database before you run the app. Navigate to http://localhost:9292/ in your browser to use.

To clone the repo on your machine:

```
$ git clone git@github.com:n-ckr-ch-rds-n/chitter-challenge.git
```

Technologies Used:
-----------------
* Ruby
* PostgreSQL
* HTML
* TDD (Rspec & Capybara)
* Sinatra
* Bcrypt

Testing:
-------

RSpec tests can be run from the root directory by running:

```
rspec
```
