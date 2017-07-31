Chitter Challenge
=================
## Description

Peeper allows you to let people know about your are doing at a given time. Send a peep and it will appear on your Peep board.

## Technologies

Ruby-Sinatra
Capybara testing
DataMapper

### Instructions

```

$ git clone https://github.com/adoolaeghe/chitter-challenge.git
$ bundle
$ createdb chitter_development
$ rake auto_migrate
$ rspec
$ rackup
```

### User stories

```

As a User
So that I can let people know what I am doing  
I want to post a message (peep) to chitter

As a User
So that I can see what others are saying  
I want to see all peeps in reverse chronological order

As a User
So that I can better appreciate the context of a peep
I want to see the time at which it was made

As a User
So that I can post messages on Chitter as me
I want to sign up for Chitter

As a User
So that only I can post messages on Chitter as me
I want to log in to Chitter

As a User
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter

```
