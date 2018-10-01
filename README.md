Chitter-Challenge
==================

Task
-------
We are going to write a small Twitter clone that will allow the users to post messages to a public stream.

* You don't have to be logged in to see the peeps.
* Makers sign up to chitter with their email, password, name and a username (e.g. samm@makersacademy.com, password123, Sam Morgan, sjmog).
* The username and email are unique.
* Peeps (posts to chitter) have the name of the maker and their user handle.
* Your README should indicate the technologies used, and give instructions on how to install and run the tests.

Work on this challenge as conclusion of week 4, to work towards these goals:

* I version-control my projects
* I use a methodical approach to solving problems
* I test-drive my code
* I can work to a specification
* I create effective documentation
* I can design and build user interfaces
* I can write standards-compliant, clean object-oriented code

Instructions to run this at home
-----
```sh
$ git clone git@github.com:fbl11/chitter-challenge.git
$ cd chitter-challenge
$ bundle install
$ rake setup
$ rackup -p 4567
```
go to http://127.0.0.1:4567/ in your browser

Notes on use
------------------
* Sign up requires email address, user name and password.
* Feature tests for 'Registration' warn that constant Fixnum is deprecated.  This is caused by the use of gem 'sinatra-formkeeper'.

STATUS
-----

**Notes**
```
Gemfile
- 'bcrypt' to encrypt passwords
- 'pg' to connect to psql database
- 'sinatra-formkeeper' to validate user input
```

**TO DO**

- extract 'Database Setup' object
- log in feature
- log out feature
- post under user name
  - Foreign Key (to link peeps and users tables)
- consider 'timecop' to test timestamps

Controller
includes
- chitter_app.rb

Views
- index.erb
- new.erb

Model
includes
- peep.rb
- user.rb

Rubocop / test coverage

Unit tests
- peep_spec.rb
- user_spec.rb
Feature tests
- signing_up_spec.rb
- posting_peeps_spec.rb
- viewing_peeps_spec.rb
- visiting_website_spec.rb

Coverage: 100%

User stories
-----
```
STRAIGHT UP

As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter

As a maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order

As a Maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made

As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter
```

Domain Model

* When the user visits the '/' path, their browser sends a request to the controller.
* When the controller gets the request, it asks the Peep class to give it all the peeps, i.e. the controller asks for Peep.all.
* The Peep class goes and gets the peeps, and gives back all the peeps in an array to the controller.
* The controller renders the array of peeps to a webpage, which it sends as a response to the user.
* When the user presses 'Submit' to post a new peep, their web browser sends a requst to the controller.
* When the controller gets the request, it sends it too the Peep class to store the new peep in the database, i.e. the controller queries the database to Peep.create.
* The controller then redirects the user to the '/' path.
* When the user visits the 'users/new' path, their browser sends a request to the controller.
* The controller reders the webpage with the user signup details.
* When the user provides valid username, email address and password and presses 'Submit', their browser sends a request to the cotnroller.
* When the controller gets the request, it sends it to the User class to store the user details in the database, i.e. the controller queries the database to User.create.

Author
-----
Freya Becker [fbl11](https://github.com/fbl11/)
