Chitter Challenge
=================

A small Twitter clone that will allow the users to post messages to a public stream. Users must log in (or sign up, when users are automatically logged in) to post 'Peeps', and can log out when they are done. Users are welcomed with their name, and names, user handles and times appear along with posted Peeps. The most recent Peeps are shown at the top of the page.

Fork this repo, then run bundle install. No user or content data is included, so creating test and regular databases will be necessary, as well as adding some data, in order to appreciate the full functionality. Run tests using 'rspec', check for linting issues using 'rubocop', and launch the app locally on a broswer using 'rackup'.

Features:
-------

```
As a Maker
So that I can let people know what I am doing  
I want to post a message (Peep) to Chitter

As a Maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order

As a Maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made

As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter

As a Maker
So that only I can post messages on Chitter as me
I want to log in to Chitter

As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter

TBC

As a Maker
So that I can stay constantly tapped in to the shouty box of Chitter
I want to receive an email if I am tagged in a Peep

As a Maker
So that I can start a conversation
I want to reply to a Peep from another Maker
```

CRC (Class-Responsibility-Collaborations) Planning:
-----

https://docs.google.com/spreadsheets/d/1atyx1TRpeNsPnwf3tTABDROlOtcoptVrIU2CBwAtexA/edit?usp=sharing

Database Setup
-----

1. Connect to `psql`
2. Create the database using the `psql` command `CREATE DATABASE chitter;`
3. Connect to the database using the `pqsl` command `\c chitter;`
4. Run the query we have saved in the file from the root directory by running `\i ./db/migrations/01_create_messages_table.sql`
5. Run the query we have saved in the file from the root directory by running `\i ./db/migrations/02_add_posted_time_to_messages.sql`
6. Run the query we have saved in the file from the root directory by running `\i ./db/migrations/03_create_users_table.sql`
7. Run the query we have saved in the file from the root directory by running `\i ./db/migrations/04_add_username_and_name_to_messages.sql`


Database Setup for Testing
-----

1. Connect to `psql`
2. Create the database using the `psql` command `CREATE DATABASE chitter_test;`
3. Connect to the database using the `pqsl` command `\c chitter_test;`
4. Run the query we have saved in the file from the root directory by running `\i ./db/migrations/01_create_messages_table.sql`
5. Run the query we have saved in the file from the root directory by running `\i ./db/migrations/02_add_posted_time_to_messages.sql`
6. Run the query we have saved in the file from the root directory by running `\i ./db/migrations/03_create_users_table.sql`
7. Run the query we have saved in the file from the root directory by running `\i ./db/migrations/04_add_username_and_name_to_messages.sql`



Technical Approach:
-----

The app is built on Ruby, and the pages are based on HTML and CSS. Sinatra is used to run the app locally on a browser. Capybara handles the features tests, and Rspec the feature tests. The database is built using the PG gem and SQL queries. Passwords are encypted using the Bcrypt gem. Text input fields are protected using exec_params (securing the database), and all fields are required in the HTML. Apart from login and sign-up (and edge cases of incorrect login details or duplicate sign up details) the core functionality occurs on the index page. I opted to use separate pages for the edge cases in order to avoid using Flash, which I believe may soon become obselete. The core functionality happens on the home page, as on Twitter. I attempted to use the 'orderly' gem, but I wasn't able to get it working properly. However I believe that the reverse order of the Peeps is covered using the peep_spec file.

Notes on functionality:
------

* You don't have to be logged in to see the peeps.
* Makers sign up to chitter with their email, password, name and a username (e.g. samm@makersacademy.com, password123, Sam Morgan, sjmog).
* The username and email are unique.
* Peeps (posts to Chitter) have the name of the Maker and their user handle.
* Your README should indicate the technologies used, and give instructions on how to install and run the tests.


Code Review
-----------

In code review we'll be hoping to see:

* All tests passing
* High [Test coverage](https://github.com/makersacademy/course/blob/main/pills/test_coverage.md) (>95% is good)
* The code is elegant: every class has a clear responsibility, methods are short etc.

Reviewers will potentially be using this [code review rubric](docs/review.md).  Referring to this rubric in advance may make the challenge somewhat easier.  You should be the judge of how much challenge you want at this moment.

Automated Tests:
-----

Opening a pull request against this repository will trigger Travis CI to perform a build of your application and run your full suite of RSpec tests. If any of your tests rely on a connection with your database - and they should - this is likely to cause a problem. The build of your application created by has no connection to the local database you will have created on your machine, so when your tests try to interact with it they'll be unable to do so and will fail.

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
