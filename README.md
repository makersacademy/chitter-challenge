Chitter Weekend Challenge
=================

I've written a little Twitter clone that will allow the users to post messages to a public stream. Users can sign-up and login (with a plain-text password) to add a 'peep' to Chitter.

It is Ruby based, with a Sinatra. PostgreSQL for the database and DataMapper for the data model mapping. RSpec and Capybara for the testing. Lastly, Semantic UI has been used for the design.

The unit tests are not properly isolated as I focused this weekend on getting a more generally well rounded three-tier web app going so focused my learning on a basic login/out system.

User stories implemented:
-------

```
STRAIGHT UP

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

HARDER

As a Maker
So that only I can post messages on Chitter as me
I want to log in to Chitter

As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter

```

Installation and set-up
-----
0. Have PostgreSQL installed and set-up

1. Clone the repo:
```
git clone https://github.com/benfurber/chitter-challenge
```
2. Open the directory:
```
cd chitter-challenge
```
3. Install/switch to Ruby 2.4.0:
```
rvm install 2.4.0
rvm use 'ruby-2.4.0'
```
4. Install bundle (if required) and run it:
```
gem install bundle
bundle
```
5. Set-up the databases:
```
Read the full steps here: https://github.com/benfurber/chitter-challenge/docs/full_db_steps.md
```
6. Check that the tests are still running and valid:
```
rspec
```
7. Run the server:
```
rackup
```
