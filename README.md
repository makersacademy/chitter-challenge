# Chitter [![Build Status](https://travis-ci.com/emilyalice2708/chitter-challenge.svg?branch=master)](https://travis-ci.com/emilyalice2708/chitter-challenge)

## Goal
- Use Sinatra, Capybara and Ruby to create 'chitter', a website where users create accounts and post and view 'peeps'.
- Test-drive each new feature, focusing on one user story at a time.

### How to use

1. Clone this repository:
```
git clone
```
2. Run bundle install:
```
bundle install
```
3. Run configuration file:
```
rackup config.ru
```
4. Visit localhost in browser:
```
http://localhost:9292/chitter
```
### The Website

The homepage displays any peeps currently saved in the database (tables truncated for demonstration purposes!), and allows users to either sign up, sign in or out or post anonymously:

![Homepage](https://i.imgur.com/EWeEftC.png)

Users can sign up with a display name, a username/handle and an email and password:

![Sign in](https://i.imgur.com/HtDuaRZ.png)

Users are greeted by name upon signing up or signing in:

![User greetings](https://i.imgur.com/Vx82POn.png)

And are able to post as themselves with their names and usernames displayed next to the time they posted:

![User peeps](https://i.imgur.com/Sukrppr.png)

Users can sign out and new users can sign up and post to the same page, which is updated with peeps in reverse chronological order:

![New user peep](https://i.imgur.com/SBmKUAg.png)

If a user attempts to sign in without signing out, they will receive 'Already signed in' notice:

![Sign in warning](https://i.imgur.com/WpdRybI.png)

After logging out, a 'Logged out' notice is displayed:

![Logged out notice](https://i.imgur.com/fxBitql.png)

If a peep is posted without a user signing up or signing in, it is displayed anonymously:

![Anonymous peep](https://i.imgur.com/tXcIRFZ.png)

### Database Set Up

1. Connect to psql:
```
psql
```
2. Create a database:
```
CREATE DATABASE chitter_manager;
```
3. Create a peeps table using query from file 01_create_peeps_table.sql:
```
CREATE TABLE peeps(id SERIAL PRIMARY KEY, content VARCHAR(200));
```
4. Add a time column to peeps table using query from file 02_add_time_column_to_peeps.sql:
```
ALTER TABLE peeps ADD COLUMN time VARCHAR(20);
```
5. Create a users table using query from file 03_create_users_table.sql:
```
CREATE TABLE users(id SERIAL PRIMARY KEY, name VARCHAR(100), username VARCHAR(30), email VARCHAR(60), password VARCHAR(140)); 
```
6. Add a user_id column referencing user id in peeps table using query from file 04_add_user_id_column_to_peeps_table.sql:
```
ALTER TABLE peeps ADD COLUMN user_id INTEGER REFERENCES users (id);
```
7. Repeat above steps for test database, chitter_manager_test.

## Planning

### User Story Analysis

```
As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter
``` 
Thoughts: 
- User class with ability to post a peep.
- Peep class with a content instance variable.

```
As a maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order
```
Thoughts:
- Peep class method .all which returns all peeps
- Displayed in reverse order using reverse_each

```
As a Maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made
```
Thoughts:
- Peep objects must have a time instance variable in addition to content.
- Peep table will require additional time column.

```
As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter
```
Thoughts:
- User class with a sign_up method
- Sign_up method generates a new user 
- User must have name, email, username and password

```
As a Maker
So that only I can post messages on Chitter as me
I want to log in to Chitter
```
Thoughts:
- Use stored user data within an authentication method on the User class to verify user email and password
- Encrypt passwords

```
As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter
```
Thoughts:
- Upon sign out user should no longer be reachable from /chitter route

### Modelling

#### Class: User
|Responsibilities|Collaborators|
|----------|-----------|
|Post messages (.peep)|Peep|
|Knows name||
|Knows username||
|Knows email||
|Knows password||
|Can find specific user (.find)||
|Knows whether there is a current user (.current_user)||
|Can authenticate a user (.authenticate)||

#### Class: Peep
|Responsibilities|Collaborators|
|----------|-----------|
|Knows content||
|Knows time posted||
|Can return all peeps (.all)||
|Can create peeps (.create)||
|Knows whether user is logged on when peep is created|User|


## Makers Instructions:

Chitter Challenge
=================

* Feel free to use Google, your notes, books, etc. but work on your own
* If you refer to the solution of another coach or student, please put a link to that in your README
* If you have a partial solution, **still check in a partial solution**
* You must submit a pull request to this repo with your code by 9am Monday morning

Challenge:
-------

As usual please start by forking this repo.

We are going to write a small Twitter clone that will allow the users to post messages to a public stream.

Features:
-------

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

HARDER

As a Maker
So that only I can post messages on Chitter as me
I want to log in to Chitter

As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter

ADVANCED

As a Maker
So that I can stay constantly tapped in to the shouty box of Chitter
I want to receive an email if I am tagged in a Peep
```

Technical Approach:
-----

In this unit, you integrated a database into Bookmark Manager using the `PG` gem and `SQL` queries. You can continue to use this approach when building Chitter Challenge.

If you'd like more technical challenge now, try using an [Object Relational Mapper](https://en.wikipedia.org/wiki/Object-relational_mapping) as the database interface.

Some useful resources:
**DataMapper**
- [Datamapper wiki](https://en.wikipedia.org/wiki/DataMapper)
- [Sinatra, PostgreSQL & DataMapper recipe](https://github.com/sinatra/sinatra-recipes/blob/master/databases/postgresql-datamapper.md)

**Ruby Object Mapper**
- [ROM](https://rom-rb.org/)

**ActiveRecord**
- [ActiveRecord ORM](https://guides.rubyonrails.org/active_record_basics.html)
- [Sinatra, PostgreSQL & ActiveRecord recipe](http://recipes.sinatrarb.com/p/databases/postgresql-activerecord?#article)

Notes on functionality:
------

* You don't have to be logged in to see the peeps.
* Makers sign up to chitter with their email, password, name and a username (e.g. samm@makersacademy.com, password123, Sam Morgan, sjmog).
* The username and email are unique.
* Peeps (posts to chitter) have the name of the maker and their user handle.
* Your README should indicate the technologies used, and give instructions on how to install and run the tests.

Bonus:
-----

If you have time you can implement the following:

* In order to start a conversation as a maker I want to reply to a peep from another maker.

And/Or:

* Work on the CSS to make it look good.

Good luck and let the chitter begin!

Code Review
-----------

In code review we'll be hoping to see:

* All tests passing
* High [Test coverage](https://github.com/makersacademy/course/blob/master/pills/test_coverage.md) (>95% is good)
* The code is elegant: every class has a clear responsibility, methods are short etc.

Reviewers will potentially be using this [code review rubric](docs/review.md).  Referring to this rubric in advance may make the challenge somewhat easier.  You should be the judge of how much challenge you want at this moment.

Automated Tests:
-----

Opening a pull request against this repository will will trigger Travis CI to perform a build of your application and run your full suite of RSpec tests. If any of your tests rely on a connection with your database - and they should - this is likely to cause a problem. The build of your application created by has no connection to the local database you will have created on your machine, so when your tests try to interact with it they'll be unable to do so and will fail.

If you want a green tick against your pull request you'll need to configure Travis' build process by adding the necessary steps for creating your database to the `.travis.yml` file.

- [Travis Basics](https://docs.travis-ci.com/user/tutorial/)
- [Travis - Setting up Databases](https://docs.travis-ci.com/user/database-setup/)

Notes on test coverage
----------------------

Please ensure you have the following **AT THE TOP** of your spec_helper.rb in order to have test coverage stats generated
on your pull request:

```ruby
require 'simplecov'
require 'simplecov-console'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start
```

You can see your test coverage when you run your tests. If you want this in a graphical form, uncomment the `HTMLFormatter` line and see what happens!
