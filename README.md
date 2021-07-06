Chitter Challenge
=================

* Feel free to use Google, your notes, books, etc. but work on your own
* If you refer to the solution of another coach or student, please put a link to that in your README
* If you have a partial solution, **still check in a partial solution**
* You must submit a pull request to this repo with your code by 9am Monday morning

Planning:
-------
#### Page layout

'/' - Route page - Welcome page, post message text box, submit button. (reroutes to /live)

'/live' - List page - Will contain the list of all peeps in reverse chronological order with time/date stamp.

'/sign_up' - Sign up page - Will contain fields (email, password, submit) for a user to sign up to Chitter. (reroutes to confirmation page)

'/confirmation' - Confirmation sign up page - Will confirm the user has signed up.

#### Step 1:

User Story 1

```
As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter
```

Required Elements:
- Welcome page
- Database to store new peep and time created
- Text form to enter text
- Submit button

Input:      Output:
Peep        New page shows 
Submit

Progress So Far:
-------

1. Gems have been setup. Including Rspec, capybara, sinatra, pg and simplecov.
2. Initial '/' page has been created and tested to run a simple hello world application to test infrastructure.
3. I've written the next test to expect a user to input a peep on a new page and display on the /live page.
4. From here, I worked through the application to create new pages and elements for the page.
5. I then created the chitter.rb file to house the new .all method. This allowed me to use the /live page as the main place to see all new peeps.
6. On the chitter.rb file, I then created the .create method so that a new peep can be made. I also added the testing database connections to the methods at this stage.
7. I then added the connections and inputs from the page to my routing page and connected those to my chitter.rb file.

Tests written so far: 3
Test coverage: 100%

Installation:
-------

### Program installation

1. Fork/Clone this repository.
2. Run bundle install in your terminal
3. Then you want to run psql in your terminal.
4. Here you want to create 2 new tables called, "chitter" and "chitter-test" using "CREATE DATABASE (name)" and "CREATE TABLE peep".
5. Then run 'rackup' in your terminal.
6. On your web browser, go to localhost:9292

### How to run tests

1. Fork/Clone this repository.
2. Run bundle install in your terminal
3. Then run rspec to see tests.


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
* High [Test coverage](https://github.com/makersacademy/course/blob/main/pills/test_coverage.md) (>95% is good)
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
