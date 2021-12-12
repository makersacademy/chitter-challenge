# Chitter Challenge

- Feel free to use Google, your notes, books, etc. but work on your own
- If you refer to the solution of another coach or student, please put a link to that in your README
- If you have a partial solution, **still check in a partial solution**
- You must submit a pull request to this repo with your code by 9am Monday morning

## Challenge:

As usual please start by forking this repo.

We are going to write a small Twitter clone that will allow the users to post messages to a public stream.

## Features:

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

## Technical Approach:

In this unit, you integrated a database into Bookmark Manager using the `PG` gem and `SQL` queries. You can continue to use this approach when building Chitter Challenge.

If you'd like more technical challenge now, try using an [Object Relational Mapper](https://en.wikipedia.org/wiki/Object-relational_mapping) as the database interface.

Some useful resources:
**Ruby Object Mapper**

- [ROM](https://rom-rb.org/)

**ActiveRecord**

- [ActiveRecord ORM](https://guides.rubyonrails.org/active_record_basics.html)
- [Sinatra & ActiveRecord setup](https://learn.co/lessons/sinatra-activerecord-setup)

## Notes on functionality:

- You don't have to be logged in to see the peeps.
- Makers sign up to chitter with their email, password, name and a username (e.g. samm@makersacademy.com, password123, Sam Morgan, sjmog).
- The username and email are unique.
- Peeps (posts to chitter) have the name of the maker and their user handle.
- Your README should indicate the technologies used, and give instructions on how to install and run the tests.

## Bonus:

If you have time you can implement the following:

- In order to start a conversation as a maker I want to reply to a peep from another maker.

And/Or:

- Work on the CSS to make it look good.

Good luck and let the chitter begin!

## Code Review

In code review we'll be hoping to see:

- All tests passing
- High [Test coverage](https://github.com/makersacademy/course/blob/main/pills/test_coverage.md) (>95% is good)
- The code is elegant: every class has a clear responsibility, methods are short etc.

Reviewers will potentially be using this [code review rubric](docs/review.md). Referring to this rubric in advance may make the challenge somewhat easier. You should be the judge of how much challenge you want at this moment.

## Automated Tests:

Opening a pull request against this repository will will trigger Travis CI to perform a build of your application and run your full suite of RSpec tests. If any of your tests rely on a connection with your database - and they should - this is likely to cause a problem. The build of your application created by has no connection to the local database you will have created on your machine, so when your tests try to interact with it they'll be unable to do so and will fail.

If you want a green tick against your pull request you'll need to configure Travis' build process by adding the necessary steps for creating your database to the `.travis.yml` file.

- [Travis Basics](https://docs.travis-ci.com/user/tutorial/)
- [Travis - Setting up Databases](https://docs.travis-ci.com/user/database-setup/)

## Notes on test coverage

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

# THOUGHT PROCESS

this week about Databases has been very challenging for me, so I do baby steps a bit like the Bookmark_Manager challenge (https://github.com/s-dousse/bookmark_manager2)
let's see how far I can go...

## specifications

- create Peep (message)
- see Peeps in revers chronological order (newest first)
- see the time a Peep was created
- sign up for Chitter
- (extra I : - log in to Chitter - log out of Chitter)
- (extra II: - receive email notification when tagged in a Peep)

## Domain Model

![Domain Model](https://github.com/s-dousse/chitter-challenge/blob/main/screenshots/Screenshot%202021-12-10%20at%2023.47.31.png)

## setting up the database

- Travis CI for automated test for future pull request

* connect to sql
* create a db called chitter_challenge
* connect to the db
* refer to 01_create_peep_table.sql and run query

! I am unsure on how to use a 'time' category for the data entry corresponding to the date of creation of the Peep. Now that I think of it maybe I can use the id? as it is unique and sort it in a descending order ...
! just looked at how to store time with PostgreSQL, I might have to use the timestamp when I create a post and store some time data as a create_at attribute of Peep instances , or similar?

## first feature : create a peep

```
As a Maker
So that I can let people know what I am doing
I want to post a message (peep) to chitter
```

1. write failing feature test
2. update Controller and Views
3. Rspec configure : connection to test db (truncate db)
4. TDD update the Model + select the right db depending it we are testing or not

## extracting database setup object

I haven't done this for my bookmark_manager project, so I will try do it for the chitter app as it's better (SRP, TDD)
I believe this will help me as you could see from previous commits, I didn't connect properly to the right database when testing, as I didn't use TDD when I set it up...

- our sinatra app can read/ write from the database (MVC structure + test and development environements)
- Peep class is responsible for connecting to the db on top of manipulating date in that db.
  this means we create a new connection using `PG.connect` each time we want to 'talk' to the db
- we get a visual confirmation we used the right database when running tests by checking TablePlus, but it would be better to write some test for this.

=> let's extract an object which we will use to: - set up a connection to the db - separate application behaviour from database behaviour - wrap an adaptor object
1) Extract the db logic to an object
