Chitter Challenge - Sharmine
=================

Installation instructions:
-------
```
$ git clone git@github.com:sharmine-s/chitter-challenge.git
$ bundle install
$ createdb chitter
$ createdb chitter_test
$ psql -h 127.0.0.1 chitter_test < chitter_tables.sql 
$ psql -h 127.0.0.1 chitter_test < spec/seeds_chitter.sql 
$ psql -h 127.0.0.1 chitter < chitter_tables.sql 
$ psql -h 127.0.0.1 chitter < spec/seeds_chitter.sql 
$ rspec
$ rackup
```

Visit the following url after the steps above to use Chitter in your browser

```
http://localhost:9292/
```

You can then view existing peeps. In order to post a peep, you must sign up for an account. Your login session will persist until you press the logout button.

* Features:
  * [x] Sign up
  * [x] Log in
  * [x] Log out
  * [x] Peeping
  * [x] Listing Peeps
  * [x] Display time of peep

* Bonus Features
  * [ ] Replying to peeps
  * [ ] CSS styling