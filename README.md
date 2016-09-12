Chitter Challenge
=================

This weekend challenge is to build a Twitter clone.

User Stories Delivered:
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

Technologies Used
---
* Ruby
* Sinatra (Flash, Partials)
* Rspec / Capybara
* Data Mapper
* BCrypt
* Postgres

Installation Instructions
------
To get it up and running locally:

* Fork & clone the repo
* Run `bundle` (and `gem install bundler` if you don't have bundle)
* Run `psql` and setup a database locally called `chitter_challenge` and another one for your tests called `chitter_test`
* Run `rake db:auto_migrate` and `rake db:auto_migrate RACK_ENV=test` 
* Run `rackup` to launch the app in your browser at `localhost:9292`

Otherwise, check out [here](https://evening-thicket-58147.herokuapp.com/feed) on heroku!
