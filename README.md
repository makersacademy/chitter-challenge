[![Build Status](https://travis-ci.com/scass91/chitter-challenge.svg?branch=master)](https://travis-ci.com/scass91/chitter-challenge)

Chitter Challenge
=================

Approach
-----------------

I considered the user stories provided below to make a bare-bones diagram of the product MVP.

![Imgur](https://i.imgur.com/XV1YY2p.png)

Utilising my learnings from my work undertaken previously in these two repos

* [MakersBnB Group challenge](https://github.com/Sindex42/MakersBnB)
* [Messenger App challenge](https://github.com/scass91/MessageApp)

I began the weekend work. I really enjoyed this challenge as I am an avid fan of Twitter, so making a simple working version of my most used social media platform was very appealing to me.

## Getting started

1. Clone this repo `git clone git@github.com:scass91/chitter-challenge.git`
2. Change directory `cd chitter-challenge`
3. Run bundle to install dependencies `bundle`
4. Install postgresql `brew install postgres`

### Running tests

1. Create the test database `createdb chitter_test;`
2. Set up the test environment tables `rake db:auto_migrate RACK_ENV=test`
3. Run the tests with `rspec` in the project root folder

## Usage

1. Create the development database `createdb chitter_development;`
2. Set up the development environment tables `rake db:auto_migrate`
3. Run rackup to start the server `rackup`
4. Open up a browser and navigate to the following page [http://localhost:9292](http://localhost:9292)

### Signing up

1. Navigate to the index page
2. Click on the 'Sign Up' link
3. Fill in your details and hit 'Submit'
4. Using these details previously entered - then submit these on the sign in page

### Submitting a Peep

1. Navigate to your profile page once logged in
2. Enter your message in the prompted field and click 'Submit'
3. Repeat as neccessary

Test Coverage
-----------------

I utilised a rigorous TDD approach to this challenge, my commit history shows a methodical approach which involved failing tests, passing tests & then refactoring afterwards. The below screenshot shows the current coverage achieved at time of MVP:

![Imgur](https://i.imgur.com/KF4H2rW.png)

Lessons learned
-----------------
1. Stick to TDD, even if it's frustrating being blocked it's better than flailing around looking for bugs.
2. Simple CSS/HTML can look good too!
3. It's okay to reference my older work when working on a new project - As mentioned earlier in this README, I relied fairly heavily on my learnings from older projects.

Future direction
-----------------
1. Implement the advanced user stories
2. Implement the ability to reply to Peeps
3. Add in Re-peeping/favouriting of Peeps
2. Make the app fully cat based (I was planning on calling it 'Kitter'!)

Screenshots
----------------

![Imgur](https://i.imgur.com/LGiax0J.png)
* The functionality of users logging in/out here can be seen as users old peeps aren't deleted when a new user posts a peep
![Imgur](https://i.imgur.com/EFUQ6p7.png)
* A user will be prompted to try again if they enter incorrect information at the sign in stage

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
