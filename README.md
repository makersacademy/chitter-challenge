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



## Design
This is the design I drew up before starting, and I updated as I completed the routes. The yellow squares are the core routes, while the grey ones were optional bits. A green tag means I've completed that route.
![Design](https://i.imgur.com/FL5xT5x.jpeg)

## Learnings
* The login was the biggest challenge for me, especially persisting the login session throughout the web app. Thankfully with some help of other students, I realized I had to use the find(id) method to assign the session to the right user id.
* Through some digging of my own, I also realized that after sign up, I needed to retrieve an updated repo as I couldn't use the one I instantiated before the new user was created, as the user user wouldn't be present in it in order to use the find(id) method.
* Encrypting passwords was also a learning curve, especially having to refactor previous tests to create a new user to that their passwords would be encrypted, instead of relying on seed data with unencrypted passwords for tests.
* I really see the value in TDD as when I built new things, some old tests would break, and either the tests needed refactoring, or the routes themselves. As a product manager who has worked with deploying features that would break old ones, it's nice to see TDD catching these issues before they'd become available on production.


## Shortcomings
* Sadly, I didn't have time to work on the bonus features. I might attempt implementing some CSS at a later date.
* I attempted to use Travis CI but encountered the following error. I didn't dig too much into it so I've left it out.
```
The command "bundle install --jobs=3 --retry=3 --deployment" failed
```