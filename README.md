# Chitter

Chitter is a Twitter clone. Users can register, log in, post peeps and log out.

This is a work in progress that currently does address many edge cases, but does demostrate a full stack project using vanilla Ruby.

How to use:
-----------

**Set up database**

1. Connect to psql
2. Create the database using the psql command 
````console
psql=# CREATE DATABASE chitter;
````
3. Connect to the database using the pqsl command 
````console
psql=# \c chitter
````
4. Run the query we have saved in the file 01_create_users_table.sql in migrations
5. Run the query we have saved in the file 02_create_peeps_table.sql in migrations
6. Exit the database
````console
psql=# \q
````
7. Create the test database
````console
psql=# CREATE DATABASE chitter_test;
psql=# \c chitter_test;
````
8. Repeat steps  4 & 5 for the test database

**Install gems**

````console
% bundle install
````

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

Class Responsibility Collaborators:
-----------------------------------

![CRC cards](./docs/chitter_crc_cards.png?raw=true "Model mapping")

Table mapping:
-----------------------------------

USERS
| id | first_name | last_name | email  | handle   | password_encrypted |
|----|------------|-----------|--------|----------|--------------------|
| 1 | Sophie | Gilder | test@test.com | sophieg | hjfkd-6bdfgd-yhfg |
| 2 | Joe | Bloggs | joe@bloggs.net | joeb | jgfdsl-543-gfd |

PEEPS

| id | content | time_created | user_id *foreign key* |
|----|------------|-----------|--------|
| 1 | I've had a great day | 2022-06-12 09:45:00 | 1 | 
| 2 | Why are cats green? | 2022-06-12 09:56:05 | 2 | 
| 3 | OMG!!!! | 2022-06-13 10:45:32 | 1 | 

REPLIES

| id | content | time_created | user_id *foreign key* | peep_id *foreign key* |
|----|------------|-----------|--------|----------|
| 1 | Me too! | 2022-06-12 09:46:00 | 2 | 1 |
| 2 | Why not? | 2022-06-12 10:00:05 | 1 | 2 |


Chitter Challenge - original instructions
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
