Chitter Challenge
=================

Instructions:
-------

### DB Set up instructions

* Start PostgreSQL:
```
psql
```
* Create a database using the psql command:
```
CREATE DATABASE chitter;
```
* Connect to the database using the pqsl command
```
\c chitter;
```
* Run the queries in:
- 02_create_user_table.sql
- 03_create_peeps_table.sql

### Launch Instructions

```
git clone git@github.com:s-palmer/chitter-challenge.git
```

In the program directory:
```
install bundler
bundle install
```

```
rackup
```

Browse to:
```
localhost:9292
```

Stack:
-------

|  | Tool | Use? | Where can I see it? |
|------------------|------------------|------------------|------------------|
| <img src="public/images/rspec.png" height="40" width="auto"> | [RSpec](https://rspec.info/) | Testing tool for Ruby.| ./spec/ folder |
| <img src="public/images/capybara.png" height="40" width="auto"> | [Capybara](https://github.com/teamcapybara/capybara) | Acceptance test framework for Ruby. | In ./spec/features |
| <img src="public/images/ruby.png" height="40" width="auto"> | [Ruby](https://www.ruby-lang.org/en/) | Programming language. | Everywhere! |
| <img src="public/images/sinatra.jpg" height="40" width="auto">  | [Sinatra](http://sinatrarb.com/)  | Sinatra is a DSL for quickly creating web applications in Ruby. | In the file structure for the project - it is built on Sinatra. |
| <img src="public/images/psql.png" height="40" width="auto">  | [PostgreSQL](https://www.postgresql.org/)  | An object-relational database system | /db/migration for DB setup |

My Learning Objectives:
-------

1) Practice turning user stories into feature requirements ✔️
2) Practice domain modelling ✔️
3) Improve planning prior to starting ✔️
4) Improve unit test writing ✔️
5) Practice database manipulation ✔️
6) Learn how to use <layout.erb> files with <yield> ✔️

Learning Objective Progress:
-------

1) From the user stories, I created a simple list of initial 7 feature requirements to make it easier to plan my project.
2) Created database entity relationship diagram & CRC cards
3) Completing step 2 allowed me to think about what views and classes I might require for this web app.
4) 
5) 
6) To DRY out my code, I've created a layout.erb file that contains the references to my CSS file as well as custom fonts that are required. I've also included the yield tag within my layout.erb file to render in the page content once the layout has been processed.

Requirements:
-------

Created from the user stories below:

1) Users should be able to view messages
2) Users should be able to post messages
3) Messages should show a timestamp
4) Users should be able to sign up
5) Users should be able to log in
6) Users should be able to log out
7) Users should be able to receive notification emails

App Modelling:
-------

1) Each user can have many Peeps
2) Each feed can have many Peeps
3) Each Peep has one author (user)

As a database entity relationship diagram:
  
* I didn't end up creating a feed table as it wasn't necessary to display Peeps.

![Chitter Entity Relationship Diagram](/public/images/database_entity_model.png)

CRC Cards:
  
* I didn't end up creating a feed table as it wasn't necessary to display Peeps.

![Chitter CRC Cards](/public/images/crc_cards.png)

MVC Request/Response Model:

![Chitter MVC Request Response Cycle](/public/images/mvc_responses.png)

User Stories:
-------

### STRAIGHT UP
```
As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter
```
```
As a maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order
```
```
As a Maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made
```
```
As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter
```

### HARDER
```
As a Maker
So that only I can post messages on Chitter as me
I want to log in to Chitter
```
```
As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter
```
### ADVANCED
```
As a Maker
So that I can stay constantly tapped in to the shouty box of Chitter
I want to receive an email if I am tagged in a Peep
```

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
