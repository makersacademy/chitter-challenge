Chitter Challenge
=================
Features:
-------
The challenge aims to address the following user stories:

```sh
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
Usage:
------
0. ```git clone git@github.com:thisdotrob/chitter-challenge.git```
0. ```bundle```
0. ```createdb chitter_development```
0. ```rake db:auto_migrate```
0. ```rackup```
0. visit http://localhost:9292

To run tests:
------
0. ```createdb chitter_test```
0. ```rake db:auto_migrate RACK_ENV=test```
0. ```rspec```


Technologies used:
-------
* Sinatra
* Postgresql
* DataMapper
* Sinatra flash
* Sinatra partial
* Rspec Sinatra
* Database Cleaner
* Capybara
