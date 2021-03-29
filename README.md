# Chitter #

### functionalisty

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
So I can put each peep in context
I want to be able to see who made the peep

As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter

As a Maker
So that only I can post messages on Chitter as me
I want to log in to Chitter

As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter

As a Maker
So I can interact with other peeps
I want to be able to comment 

As a Maker
So interaction stays clear in the comments
I want to see who commented which comment

As a platform
To make people want to sign up
You can only peep when logged in
```

# how to use me

in psql : 

```
CREATE DATABASE twitter;
```

run the code found in db/migrations to create the right tables 

```
bundle install

rackup -p 9292
```

open in browser as localhost:9292/ 

Sign up

Start peeping! 
