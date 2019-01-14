## Warbler Challenge
---------------------

Makers Academy week 5 weekend challenge: build a twitter clone

## User Stories
---------------

```

As a Maker
So that I can let people know what I am doing
I want to post a message (chirrup) to Warbler

As a maker
So that I can see what others are saying if I'm interested
I don't need to have an account

As a maker
So that I can see when others posted a chirrup
I want to see all peeps in reverse chronological order

As a Maker
So that I can better appreciate the context of a chirrup
I want to see the time at which it was made

As a Maker
So that I can post messages on Warbler as me
I want to sign up for Warbler

As an Admin
So I know an account can't be linked to the same email
Users can only create an account with an email once

As an Admin
To keep the identities of users seperate
Usernames can only be assigned to one account

As a Maker
So that only I can post messages on Warbler as me
I want to log in to Warbler

As a Maker
So that I can avoid others posting messages on Warbler as me
I want to log out of Warbler

As a Maker
So when I don't want to use Warbler anymore
I want to delete my Warbler account
```

## Requirements and Setup
--------

- Requirements:

 1. Ruby and RVM, please see https://rvm.io/rvm/install for installation instructions
 2. PostgreSQL, please see http://www.postgresqltutorial.com/install-postgresql/ for installation instructions

- Setup:

Once your system has the above requirements installed, from your command line move to your project directory and run the following commands.

1. To clone the repo:

```
 git clone git@github.com:CKKH/chitter-challenge.git
 cd chitter-challenge
 bundle
```

2. To set up the databases and database tables:

```
 rake db:create:all
 rake db:auto_migrate RACK_ENV=test
 rake db:auto_upgrade
```

3. Run locally:

```
 rackup
```

4. Visit Warbler on your browser!

## Technologies Used
--------------------
- Ruby
- Active Record
- Sinatra
- Postgresql
- RSpec
- Capybara

## Test Coverage
-------------

17/18 tests passing, the final one passes when ran in isolation. 100% test coverage. 
To run run the tests and see the test coverage input 
```
rspec
```
from the root of the directory in your terminal.
