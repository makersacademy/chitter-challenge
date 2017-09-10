What is this?
-------

The challenge was to make a lightweight Twitter clone, using Sinatra.

![Alt text](/app/public/images/chitter-example.png?raw=true)

To install:
-------

```
$ git clone git@github.com:AlisonWoodman/chitter-challenge.git
$ bundle
$ createdb chitter_development
$ createdb chitter_test
```

To run app:

```
$ rackup
Navigate to http://localhost:9292/ in your browser
```

or

```
visit lets-chitter.herokuapp.com
```

To run tests:

```
$ rspec
```


A few notes:
-------

* Test driven using RSpec
* All user stories implemented and tested with high test coverage using rspec (99%)
* Uses DataMapper and Postgres to save the data.
* Uses bcrypt to secure the passwords.
* Works on Heroku. Visit 'lets-chitter.herokuapp.com'

User stories:
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
