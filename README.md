Chitter Challenge
=================

[Chitter](http://rsk-chitter.herokuapp.com): a simple twitter-like chat app

Functions
---------

* Users can sign up to the service
* Signed up users can sign in/sign out of the app
* Signed in users can post messages(peeps) to the app
* Peeps are time stamped and display the sender
* Users are able to tag other users in their peeps
  e.g 'Hello World **@chitter_user**'

Technology
----------

* App is built in Ruby using the Sinatra gem for web interfacing
* All user, peep, and tags data is stored on a heroku postgreSQL database
* Database interactions are facilitated by the DataMapper gem  
* Rake commands exist for database migration:
```
~ heroku run rake dm:upgrade
```
migrate(no data loss)
```
~ heroku run rake dm:migrate
```
migrate(data will be lost)

* All tests are run with rspec/capybara
* Test coverage: 100%
* User passwords are hashed using the BCrypt gem
* User sign in is also authenticated using bcrypt

Features to add
---------------

* Email notifications for when users are tagged in a peep
* Real time updating of messages

Running RSpec tests
-------------------

* Fork and clone the repo
* Check ruby version is 2.4.0 (if not: )
```
~ rvm use 2.4.0
```
* Then run:
```
~ bundle install
~ rspec
```
