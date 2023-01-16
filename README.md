Chitter Challenge
=================

Solo weekend challenge assignment delivered for the conclusion of my fourth week at Makers Academy. 

We were assigned the below design request and were asked to code this Twitter clone using Ruby on the Sinatra web framework. 

I loved getting stuck into this challenge and achieved all of the below features apart from automated emails for users tagged in posts. I added functionality that meant valid usernames tagged in posts would become hyperlinked. Also added password encryption and user profile pages which display all Peeps by the user.

If I were given the opportunity to code this project again,  rather than using repository classes that interact directly with PostgreSQL I would instead use an ORM like ActiveRecord.

## How to use

1. Clone the repository to your machine
2. Create 2 postgresql databases:

   - `chitter_challenge`
   - `chitter_challenge_test`
     [If psql is installed this can be done with `createdb chitter_challenge`]

3. Setup your tables with:

```sql
psql -h 127.0.0.1 chitter_challenge < spec/chitter_tables.sql
psql -h 127.0.0.1 chitter_challenge_test < spec/chitter_tables.sql

```

4. Seed your tables with:

```sql
psql -h 127.0.0.1 chitter_challenge < spec/chitter_seeds.sql

psql -h 127.0.0.1 chitter_challenge_test < spec/chitter_seeds.sql
```

5. install gems

```bash
bundle install
```

6. To test

```bash
rpsec
```

6. To use in the browser

```bash
rackup
```

Then head to the browser with

```bash
http://localhost:9292/
```

Features requested:
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

Bonus:
-----

If you have time you can implement the following:

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
