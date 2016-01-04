Chitter Challenge
=================

A Twitter Clone using Ruby's [Sinatra](http://www.sinatrarb.com/), `erb`, DataMapper, Postgres and BCrypt; tested with [Rspec](http://rspec.info/), [Capybara](https://github.com/jnicklas/capybara) and Timecop.  

User Stories / Features:
-------
```
As a user
So that I can post messages on Chitter as me
I want to sign up for Chitter

As a user
So that I can post messages on Chitter as me
I want to log in to Chitter

As a user
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter

As a user
So that I can let people know what I am doing  
I want to post a message (peep) to chitter

As a user
So that I can see what others are saying  
I want to see all peeps in reverse chronological order

As a user
So that I can better appreciate the context of a peep
I want to see the time at which it was made

As a user
So that I can start a conversation with other users
I want to reply to a peep

As a user
So that I can know more about other users
I want to view their name and all of their peeps on a profile page
```

Installation:
------
```
git clone https://github.com/hibreez/chitter_challenge
bundle
createdb chitter_development
rake db:auto_migrate
rspec
rackup
```
