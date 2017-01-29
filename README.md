Chitter Challenge
=================

The week four challenge at Makers Academy, to build a 'Twitter' clone.

Here is a link to the live version on [heroku](https://i-peep-freely.herokuapp.com)

Installation
------------


* Clone from github
```
$ git clone https://github.com/BenJohnCarson/chitter-challenge.git
```

* Switch to ruby 2.3.3
```
$ rvm use 2.3.3
```

* Install gems
```
$ gem install bundler
$ bundle
```

* Setup postgres databases
```
$ createdb chitter_development
$ createdb chitter_test
$ rake db:auto_migrate
```

* Running tests
```
$ rspec
```

Technologies used
-----------------

*DataMapper ORM
*Sinatra DSL
*PostgreSQL Database

User Stories
-------

```
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
