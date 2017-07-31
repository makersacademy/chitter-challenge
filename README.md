Chitter Challenge
=================

## Technologies

## Install

Clone the repo
```
$ git clone git@github.com:funmia/chitter-challenge.git
```

Bundle install Gemfile and dependencies

```
$ gem install bundler
$ bundle
$ bundle update
```

- Ruby version 2.4.0
```
$ rvm install ruby 2.4.0
$ rvm use 2.4.0
```

The app uses a postgreSQL database, install it first; https://www.postgresql.org/download/

## Create the databases:
```
$ psql
$ createdb chitter_test
$ createdb chitter_development
```

## Tests
```
$ rspec
```


## Run
To view in browser:
```
$ rackup
```

```
Then visit: http://localhost:9292/

Challenge:
-------

We are going to write a little Twitter clone that will allow the users to post messages to a public stream.

Features:
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

ADVANCED

As a Maker
So that I can stay constantly tapped in to the shouty box of Chitter
I want to receive an email if I am tagged in a Peep
```

Bonus:
-----

If you have time you can implement the following:

* In order to start a conversation as a maker I want to reply to a peep from another maker.

And/Or:

* Work on the css to make it look good (we all like beautiful things).

 ## Screenshots

![Imgur](http://i.imgur.com/kOKqlFo.png)

![Imgur](http://i.imgur.com/93onmWT.png)

![Imgur](http://i.imgur.com/WLS5IcS.png)

![Imgur](http://i.imgur.com/b18fqkH.png)

![Imgur](http://i.imgur.com/jnoYJzj.png)
