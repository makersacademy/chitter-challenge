Chitter Challenge
=================

Makers Academy weekend challenge to build a light-weight clone of Twitter in Ruby, using the Sinatra framework.

## User stories ##

```
As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter

As a Maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order

As a Maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made

As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter

As a Maker
So that only I can post messages on Chitter as me
I want to log in to Chitter

As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter

```

After overcoming some technical difficulties with my laptop setup, this was a fun challenge to complete. I managed to build functionality for all user stories listed above using technologies listed below. I enjoyed experimenting with bootstrap for the first time to add basic styling to my app. With more time I would like to refactor my controller into separate folders, improve styling and add some extra functionality such as the ability to tag users in posts. 

## Tech used ##

* Ruby (2.4.0)
* Sinatra
* Postgresql
* Datamapper
* Bcrypt
* Rspec
* Capybara
* Bootstrap
* Heroku

## How to use ## 

1. Fork & clone this repo
2. Run bundle
3. Run rackup -p 9292
4. Using a browser navigate to: localhost:9292
5. Create a new account and get 'peeping'
