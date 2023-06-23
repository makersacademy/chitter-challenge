# Chitter Challenge by Pablo Joyce
=================

* This project is a solo Ruby project completed at the end of the web applications module of the Makers Academy bootcamp.
* The application is built with the Sinatra web framework, rendering view files using ERB
* The application uses a PostgresSQL database
* The database connection is established in `lib/database_connection.rb` using the `pg` gem
* Seed data for tests is included in `spec/seeds.sql`

The Brief:
-------
To create a basic Twitter clone that will allow the users to post messages.
We were given the following user stories as a starting point:

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

We were given the following notes on functionality:

* You don't have to be logged in to see the peeps.
* Makers sign up to chitter with their email, password, name and a username (e.g. samm@makersacademy.com, password123, Sam Morgan, sjmog).
* The username and email are unique.
* Peeps (posts to chitter) have the name of the maker and their user handle.

## Getting Started

At time of writing, this project has a version deployed on Render at [https://chitter-7pam.onrender.com/](https://chitter-7pam.onrender.com/). Please note that this may take 30 seconds or longer to 'spin up' as it is deployed on a free tier of Render.
At some point in the future, this version may be taken down as Render only allows a single database instance on the free tier.

For the local version, clone this repository to your local machine:
`git clone https://github.com/pablisch/chitter-challenge.git`

Switch to the `local-server` branch:
`git switch local-server`

cd to the project and install dependencies:
`bundle install`

Ensure that your postgres server is accessable at the IP address 127.0.0.1.
Create the postgreSQL databases for running and testing the project:
```bash
createdb chitter
createdb chitter_test
```
Create the tables in the databases:
```bash 
psql -h 127.0.0.1 chitter < spec/tables.sql
psql -h 127.0.0.1 chitter_test < spec/tables.sql
```
Populate the test database with seed data:
```bash
psql -h 127.0.0.1 chitter < spec/seeds.sql
psql -h 127.0.0.1 chitter_test < spec/seeds.sql
```
Start the development server:

`rackup`

Access the website in your browser at [localhost:9292](http://localhost:9292/).

## Using the application

Be default uses can see all messages posted by all users, but cannot post messages.

Follow the link to register as a user, you will then be prompted to redirect to login.

After login, you will be redirected to the home page where you can post a new message. messages posted by all users will appear here in reverse chronological order.

Running the tests:
----------------------

`rspec`

All tests should pass with a total code coverage of 98.60%

A  TDD process was employed throughout developing this application. I tried to work with the 'testing pyramid' in mind - starting with a user experience based integration test, and then writing and passing additional, more granular unit tests that led to the integration test finally passing.

Design and Architecture:
----------------------

* This application follows a model, view, controller design pattern.
* In the directory [./lib](./lib), each table in the DB has a corresponding Ruby class defined with a singular version of the name of the table.
* Each table has an additional 'TABLENAME_repository' class with methods that allow for CRUD operations on the DB.
* Route handling occurs in the `Application` class defined in [./app.rb](./app.rb). [./config.ru](./config.ru) executes the code inside of `Application` when `rackup` is run at the command line.
* The database tables have the following relationships: `users` has a one-to-many relationship to `peeps` (synonymous with 'messages' - a further iteration would be to rename these uniformly), users and peeps have a many-to-many relationsip with respect to tags, so these are stored in the `tags` join table.
* Given the brief, I began the planning process with an intial digram of how the application could be structured:
  ![initial diagram](./chitter-initial-diagram.png)
* The [route recipe](./route_recipe.md) and [schema recipe](./schema_recipe) files were created to aid in design.
* The flow of execution for detecting tags in a message and storing these in the DB was conceptualised in this diagram:
  ![chitter tags diagram](./chitter-tags-diagram.png)
* Passwords are hashed using the [BCrypt](https://rubygems.org/gems/bcrypt/versions/3.1.12) gem.
* User input to messages is santized with basic measures to defend against cross-site scripting injection. In a real-world application I would consider instead using a dedicated and maintained library to provide a more robust defence here and would consider whether the use of the `pg` gem, and existing architecture, is enough to guard against a SQL injection attack.

This project uses:
* Ruby
* PostgreSQL
* ERB
* Rackup
* Sinatra
* Webrick
* Git
* GitHub
* Bcrypt

In development, I employed:
* Postman
* TablePlus
* RSpec




Chitter Challenge
=================

* Feel free to use Google, your notes, books, etc. but work on your own
* If you refer to the solution of another coach or student, please put a link to that in your README
* If you have a partial solution, **still check in a partial solution**
* You must submit a pull request to this repo with your code by 10am Monday morning

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

In the last two weeks, you integrated a database using the `pg` gem and Repository classes. You also implemented small web applications using Sinatra, RSpec, HTML and ERB views to make dynamic webpages. You can continue to use this approach when building Chitter Challenge.

You can refer to the [guidance on Modelling and Planning a web application](https://github.com/makersacademy/web-applications/blob/main/pills/modelling_and_planning_web_application.md), to help you in planning the different web pages you will need to implement this challenge. If you'd like to deploy your app to Heroku so other people can use it, [you can follow this guidance](https://github.com/makersacademy/web-applications/blob/main/html_challenges/07_deploying.md).

If you'd like more technical challenge now, try using an [Object Relational Mapper](https://en.wikipedia.org/wiki/Object-relational_mapping) as the database interface, instead of implementing your own Repository classes.

Some useful resources:
**Ruby Object Mapper**
- [ROM](https://rom-rb.org/)

**ActiveRecord**
- [ActiveRecord ORM](https://guides.rubyonrails.org/active_record_basics.html)
- [Sinatra & ActiveRecord setup](https://learn.co/lessons/sinatra-activerecord-setup)

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
