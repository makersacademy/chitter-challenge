Neighborhood Cat Chitter Chatter
=================
Installation
-----
1. Fork this repository
2. Run ```bundle install``` to acquire all needed gems.
3. Database Setup: <br/>
     - connect to ```psql```
     - in psql, create a database bookmark-manager as follows: ```CREATE DATABASE chitter;```
     - ensure you are in the correct database by running ```\c chitter;```
     - run the query saved in db/migrations - ```01_create_chitter_tables.sql``` - this will create the required tables. **NOTE: The two lines must be run separately, as the second table is dependent on the existence of the first.**
     - if you want to run tests (RSpec/Capybara), you will need to create a test database ```chitter-test``` as per the instructions above. Also run the ```01_create_chitter_tables``` queries for ```chitter-test``` to create the required tables.
4. Start the Chitter server by running ```rackup config.ru```
5. Navigate your browser to http://localhost:9292
6. Register for a username by clicking the link or at http://localhost:9292/Register
7. Post your peeps!

Notes:
----
- Passwords are currently not encrypted or hashed as there is no SSL. The other consideration is that the passwords are not hashed. I know this is a no-no, but this is more of a proof of concept anyway.

- Initially, I simply displayed the messages with user_id rather than the user name. I have a query to implement showing the username ```SELECT users.username, peep_content, to_char(posted_at, 'HH24:MI:SS, DD/MM/YYYY') FROM peeps JOIN users ON users.id = peeps.poster_id ORDER BY posted_at DESC``` but ran out of time for implementing it.

- There are two tables, 'users' and 'peeps'. The peeps table has a dependent key to make sure that each peep is attributed to an existing user.

- While there is a facility to register for a username, I unfortunately ran out of time for having the user ID stored in Session to allow for it to be reflected in the peeps properly.



Chitter Challenge
=================

* Challenge time: rest of the day and weekend, until Monday 9am
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

This week you integrated a database into Bookmark Manager using the `PG` gem and `SQL` queries. You can continue to use this approach when building Chitter Challenge.

If you'd like more technical challenge this weekend, try using an [Object Relational Mapper](https://en.wikipedia.org/wiki/Object-relational_mapping) as the database interface.

Some useful resources:
**DataMapper**
- [DataMapper ORM](https://datamapper.org/)
- [Sinatra, PostgreSQL & DataMapper recipe](http://recipes.sinatrarb.com/p/databases/postgresql-datamapper)

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

Reviewers will potentially be using this [code review rubric](docs/review.md).  Referring to this rubric in advance may make the challenge somewhat easier.  You should be the judge of how much challenge you want this weekend.

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
