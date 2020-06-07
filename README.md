### Progress summary

* I think  the first three user stories are covered reasonably well, even if the HTML/CSS is pretty rubbish!
* I made a rough diagram model for the fourth user story but didn't have time to implement it. I would have liked to create a new class (User) in the model section, and a second database table for users. My Peeps database already has a "username" column, which defaults to anon, and which is displayed as part of the view_peeps.erb file. I had planned to join the two tables on "username" when presenting the peeps.
* I certainly didn't have time for the 'harder' user stories
* I couldn't find ways to test for a timestamp, so that test is very flimsy.
* I also couldn't find a way to use capybara to test the order in which things appear, so that feature is covered by another flimsy unit test


### Early domain model used as a base for the first two user stories:
<p align="center">
<img src=/images/Domain_model_for_early_user_stories.png width=80%>
</p>

### Domain model for the fourth user story, which I didn't have time to implement:
<p align="center">
<img src=/images/Domain_model_for_fourth_user_story.png width=80%>
</p>

### SQL Instructions used to create 'chitter' database and 'peeps' table

1. Connect to psql
2. Create the database : `CREATE DATABASE chitter;`
3. Connect to the database: `\c chitter`
4. Create Table: Run the query saved in 01_create_peeps_table.sql

### SQL Instructions used to create 'chitter_test' database for rspec testing purposes

1. Connect to psql
2. Create the database : `CREATE DATABASE chitter_test;`
3. Connect to the database: `\c chitter`
4. Create Table: Run the query saved in 01_create_peeps_table.sql

### Additional notes on set-up:

1. IN order to interact with the databases the 'pg' gem will need to be installed by adding it to the gemfile and running bundle

### Example 'peeps' table layout:

| id | peep                 | peeped_at                     | peeped_by |
|----|----------------------|-------------------------------|-----------|
| 1  | My first peep!       | 2020-06-07 17:41:26.161455+01 | Anon      |
| 2  | I have some thoughts | 2020-06-07 17:46:41.201732+01 | Anon      |
| 3  | I have more thoughts | 2020-06-07 17:49:13.228644+01 | Anon      |

### Additional notes on set-up:

1. In order to interact with the databases the 'pg' gem will need to be installed by adding it to the gemfile and running bundle.

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
