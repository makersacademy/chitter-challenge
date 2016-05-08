Chitter Challenge
=================

**Author:** Omar Alvarez

Task 
----

Build a little Twitter clone that will allow the users to post messages (peeps) to a public stream.

Features:
---------

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

Instructions
------------
These are the instructions for how to download and run the application on a local server:

```sh
$ git clone https://github.com/omajul85/rps-challenge.git
$ cd chitter-challenge
$ createdb chitter_development
$ rake db:auto_migrate
$ bundle
$ rackup 
```
Then, you can open your browser and visit `localhost:9292` (that port is given by rackup). In order to create the postgres database you need to install the `postgresql` package.

Technologies used
-----------------

* Sinatra (including Partials and Flash)
* DataMapper
* Database Cleaner
* RSpec and Capybara
* BCrypt
* Rake

Deployment
----------

The application has been pushed to Heroku using Git. You can use Chitter <a href="https://chitter-omajul85.herokuapp.com/" target="_blank">here</a>.

