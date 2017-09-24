Chitter - partial
=================

A Twitter clone that allows the users to post messages to a public stream.

Installation
-------

```
$ git clone git@github.com:mengchenwang/chitter-challenge.git
$ bundle
$ create chitter_development and chitter_test database with PSQL
$ rake db:auto_migrate
$ rake db:auto_migrate RACK_ENV=test
$ rspec
$ rackup
```

Technologies
-------

* Database was created with postgres, DataMapper + ruby
* Program was created with ruby + sinatra
* Tests created with Rspec + Capybara
* User passwords are encrypted with bcrypt

Features
-------

Deployed version on heroku:
https://chitter-mc.herokuapp.com/

* Users can see peeps without logging in.
* Users can sign up to chitter with their email, password, name and a user name.
* The username and email are unique.
* Peeps show the names and user names of posters, and the posting time.
* Peeps are shown in reverse chronological order.
* Users only can peep if they are logged in.
* Users can login and logout.

Known issues
------

* Email function has not been added.
* Comment function has not been added.
