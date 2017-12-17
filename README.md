# Chitter Challenge

## Installation:

Clone the repo Bundle install Gemfile and dependencies

```
$ gem install bundler
$ bundle
$ bundle update
```

Ruby version 2.4.0

```
$ rvm install ruby 2.4.0
$ rvm use 2.4.0
```

## Creating the database

```
$ psql
$ createdb chitter_development
$ createdb chitter_test
```

## Testing

```
$ rspec
```

## Running the app

```
$ rackup
visit: http://localhost:9292/
```

## Task

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

## Screenshots

--------------------------------------------------------------------------------

## ![Home Page](https://i.imgur.com/UxSbi3x.png)

## ![Sign_up page](https://i.imgur.com/YGOfd8c.png)

## ![Sign_in page](https://i.imgur.com/oAF8m9B.png)

## ![Post page](https://i.imgur.com/2c1orzs.png)

## ![Peeps page](https://i.imgur.com/IQomR8b.png)

![Sign_out page](https://i.imgur.com/Huv0Edj.png)

## Bonus

--------------------------------------------------------------------------------

If you have time you can implement the following:

- In order to start a conversation as a maker I want to reply to a peep from another maker.

And/Or:

- Work on the css to make it look good (we all like beautiful things).

Good luck and let the chitter begin!
