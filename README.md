Chitter Challenge
=================

Chitter
-----
 * Users sign up to Chitter with email address, username and password
 * Users can make a peep (message) when they are logged in
 * Users don't have to be logged in to see the peeps.
 * The username and email are unique.
 * Peeps (posts to chitter) have the name of the maker.


Challenge:
-------

As usual please start by forking this repo.

We are going to write a small Twitter clone that will allow the users to post messages to a public stream.

Technical Approach:
-----
* Ruby
* Psql and Activerecord 
* Sinatra
* Bcrypt
* Rspec 
* TDD


User Story:
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

```

How to run 
-----
```
git clone https://github.com/Nameo91/chitter-challenge.git 
bundle install
rake db:create chitter
rake db:migrate

rackup
```

Now you can see the localhost:9292 to explore the chitter.





