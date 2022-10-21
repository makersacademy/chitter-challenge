Chitter Challenge
=================

To create this app I have used:

* pg gem for the database connection. 
* RSpec to write tests.
* Sinatra, the webrick gem and rack-test in order to set up and write the routes and to be able to run the app locally.
* BCrypt in order to encrypt the passwords so they are hashed and cannot be accessed through the db.
* Mail and Pony gems in order to set up the emails being sent.

Notes on running the app and the tests:

* Right now in the app.rb file the from: email (line 147) is an example email so the tests run, however, it means the emails won’t actually be sent - if you want to send an email change the from: email to a real email address and the email will be sent (ensuring you have signed in and logged in with a working email address).

To run the app: 

```
$ git clone git@github.com:ellaskolnick/chitter-challenge.git
$ createdb chitter_challenge
$ psql -127.0.0.1 chitter_challenge < posts_table.sql
$ psql -127.0.0.1 chitter_challenge < spec/seeds/posts_seeds.sql
$ createdb chitter_challenge_test
$ psql -127.0.0.1 chitter_challenge_test < posts_table.sql
$ psql -127.0.0.1 chitter_challenge_test < spec/seeds/posts_seeds.sql
$ bundle install
$ rspec
$ rackup
```
