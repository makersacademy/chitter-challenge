Chitter Challenge
=================

Instructions
---

```
$ git clone https://github.com/aballal/chitter-challenge.git
$ cd chitter-challenge
$ bundle
$ createdb chitter_test
$ createdb chitter_development
$ rake db:auto_migrate RACK_ENV=test
$ rake db:auto_migrate
```

- `$ rackup` then visit http://localhost:9292/ for Chitter
- `$ rspec` for a summary of tests, checking that all tests are passing and test coverage (100%)
- `$ rubocop` for code style check (no offenses)
- See the app in action on https://chitter-aballal.herokuapp.com/

Features:
-------

The following features were implemented in the order below  

```
As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter

As a Maker
So that only I can post messages on Chitter as me
I want to log in to Chitter

As a maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order

As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter

As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter

As a Maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made
```

The following additional requirements were implemented along with the feature they belong    

* Feature 1 - Sign Up
  * Makers sign up to chitter with their email, password, name and a user name
  * The username and email are unique.
  * Use bcrypt to secure the passwords.
* Feature 3 - Listing peeps
  * You don't have to be logged in to see the peeps.
  * Peeps (posts to chitter) have the name of the maker and their user handle.
* Feature 5 - Peeping
  * You only can peep if you are logged in.

The following bonus feature was implemented  

* Work on the css to make it look good (we all like beautiful things).

Screenshots
---

chitter-challenge-localhost   https://www.dropbox.com/s/8ikbw566db3cc2n/chitter-challenge-localhost.png?dl=0  
chitter-challenge-heroku https://www.dropbox.com/s/hkgyivypr13bs3k/chitter-challenge-heroku.png?dl=0  
chitter-challenge-heroku-signup  https://www.dropbox.com/s/o7nlxpw9iwbnsh1/chitter-challenge-heroku-signup.png?dl=0  
chitter-challenge-heroku-signup-error  https://www.dropbox.com/s/sj9q239r5kllqh2/chitter-challenge-heroku-signup-error.png?dl=0  
chitter-challenge-heroku-login  https://www.dropbox.com/s/hujcqpgpv513j2j/chitter-challenge-heroku-login.png?dl=0  
chitter-challenge-heroku-login-error  https://www.dropbox.com/s/p274o1rz1lwy08t/chitter-challenge-heroku-login-error.png?dl=0  

Design
---

| Controller                           | Models                                                             | Views                                                                                               |
|--------------------------------------|--------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------|
| get users/new<br>post users              | User<br>- id<br>- name<br>- email (unique)<br>- username (unique)<br>- password_digest | users/new.erb<br>- input name<br>- input email<br>- input username<br>- input password<br>- input password confirmation |
| get sessions/new<br>post sessions        | User<br>- self.authenticate                                            | sessions/new.erb<br>- input email / username<br>- input password                                            |
| get peeps<br>Peep.all.reverse before erb | Peep<br>- id<br>- text<br>- belongs to User                                    | peeps/index.erb<br>- display sorted list of peeps                                                       |
| delete sessions                      |                                                                    | layout.erb<br>- button signout                                                                          |
| post peeps                           |                                                                    | peeps/index.erb<br>- input text                                                                         |
| Save Time.now                        | Peep<br>- timestamp                                                    | peeps/index.erb<br>- add timestamp to list of peeps                                                     |
