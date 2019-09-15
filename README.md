Chitter Challenge
=================

Challenge:
-------

Create a small Twitter clone that will allow the users to post messages to a public stream.

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

HARDER - not yet implemented

As a Maker
So that only I can post messages on Chitter as me
I want to log in to Chitter

As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter

ADVANCED - not yet implemented

As a Maker
So that I can stay constantly tapped in to the shouty box of Chitter
I want to receive an email if I am tagged in a Peep
```

Technical Approach:
-----

This solution uses [ActiveRecord ORM](https://guides.rubyonrails.org/active_record_basics.html) as the database interface.  For more information see the following resources

**ActiveRecord**
- [ActiveRecord ORM](https://guides.rubyonrails.org/active_record_basics.html)
- [Sinatra, PostgreSQL & ActiveRecord recipe](http://recipes.sinatrarb.com/p/databases/postgresql-activerecord?#article)

Notes on functionality (once all user stories are implemented):
------

* You don't have to be logged in to see the peeps.
* Makers sign up to chitter with their email, password, name and a username (e.g. samm@makersacademy.com, password123, Sam Morgan, sjmog).
* The username and email are unique.
* Peeps (posts to chitter) have the name of the maker and their user handle.
* Your README should indicate the technologies used, and give instructions on how to install and run the tests.

Bonus - not implemented:
-----

If you have time you can implement the following:

* In order to start a conversation as a maker I want to reply to a peep from another maker.

And/Or:

* Work on the CSS to make it look good.

## Domain model


**Access Main Page and show Peeps**
```sequence {theme="hand"}
user->app.rb: Type url to send http Get '/peeps' route
app.rb->peeps.rb: peeps.list
peeps.rb->app.rb: peeps
app.rb->index.erb: peeps
index.erb->app.rb: page html
app.rb->user: http response displaying peeps in descending chronological order
```

**Sign Up to Chitter**
```sequence {theme="hand"}
user->app.rb: click to Get '/peeps/sign_in' route
sign_in.erb->app.rb: sign in page html
app.rb->user: http response displaying sign in fields
user->app.rb: click to Post '/peeps/sign_in' route
app.rb->users.rb: user.update
app.rb->app.rb: redirect to http Get '/peeps' route
app.rb->user: http response displaying peeps with user name

```
## Terminal instructions for downloading and running the app

* git clone git@github.com:mariacuffaro/bookmark_manager.git
* bundle install
* rackup

## Setting up the database

**Enter postgresql and create the database**
* $>psql
* =# CREATE DATABASE "chitter";
* =# CREATE DATABASE "chitter_test";

**In irb run the following commands to create the tables**
* $>irb
require './database_connection_setup.rb'
setup_test_connection
setup_prod_connection
drop_tables
create_tables
