Chitter Challenge
=================

# SQL Queries
### Create Peep_Manager Database and Peeps Table
1. Connect to `psql`
2. Create the database using the `psql` command `CREATE DATABASE peep_manager;`
3. Connect to the database using the `psql` command `\c peep_manager`
4. Run the query I have saved in the file `01_create_peeps_table.sql`

### Create Peep_Manager_Test Database and Peeps Table
1. Connect to `psql`
2. Create the database using the `psql` command `CREATE DATABASE peep_manager_test;`
3. Connect to the database using the `psql` command `\c peep_manager_test`
4. Run the query I have saved in the file `01_create_peeps_table.sql`

# User Story 1
As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter

- Create peep_manager database and peep_manager_test database
- Create peeps table within both databases which has ID, message, name and handle columns.
- Create Peep class in peep.rb file and Peeps class in app.rb file

Domain Mapping:
- self.create method
- | peep | <-- create -->
- | peeps | <-- all -->

| Component   | Responsibility                                | Refactor                                |
|------------ |---------------------------------------------  |---------------------------------------- |
| Model       | Encapsulate logic with relevant data          | Encapsulate peep data in a class    |
| View        | Display the result to a user                  | Show the peep data in a chronological list  |
| Controller  | Get data from the model and put in the view   | Render peep data into to the view   |


User Flow:
1. Visit page /peeps/new
2. Type out peep (include max. character count of 280 characters), name and Chitter handle
3. Submit the peep
4. See the new peep on the /peeps page, with the writer's name and Chitter handle attached


# User Story 2
As a maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order

- use self.all method created in US1
- add timestamp to get peeps to print in chronological order

User Flow:
1. Visit page /peeps
2. See peeps in chronological order

# User Story 3
As a Maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made

- use timestamp feature created in US2 to view the timestamp next to each peep

User Flow:
1. Visit page /peeps
2. See peeps in chronological order with timestamp printed alongside peep

# User Story 4
As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter

- Create chitter_manager database and chitter_manager_test database
- Create chitter table within both databases, which includes the following columns: user ID, email, password, name and a username
- Add user_id to peeps table

User Flow:
1. Visit page '/'
2. Click sign up button
3. Visit page /chitter/register
4. Fill out sign up form
5. Click submit
6. Taken to page /chitter where you can see the peeps
7. When you go to create a peep, your name and handle field are auto-populated


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

* Challenge time: rest of the day and weekend, until Monday 9am
* Feel free to use Google, your notes, books, etc. but work on your own
* If you refer to the solution of another coach or student, please put a link to that in your README
* If you have a partial solution, **still check in a partial solution**
* You must submit a pull request to this repo with your code by 9am Monday morning

Challenge:
-------

As usual please start by forking this repo.

We are going to write a small Twitter clone that will allow the users to post messages to a public stream.

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
