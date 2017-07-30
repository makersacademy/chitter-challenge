Chitter
=======

A small-scale Twitter clone built as an exercise in working with databases.

Features
-------
* Users can sign up and set a username and password
* Users can post 'peeps' to a public feed
* Users can tag other users in their peeps
* A notification email will be sent to a user when they are tagged

Instructions
--------
1. Visit on Heroku at https://totally-not-twitter.herokuapp.com/

2. To run locally:
```
$ git clone https://github.com/i-hardy/chitter-challenge
$ bundle
$ createdb chitter_development
$ rake auto_migrate
$ rspec
$ rackup
```
