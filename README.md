Chitter Challenge
=================
[![Build Status](https://travis-ci.org/shaneoston72/chitter-challenge.svg?branch=master)](https://travis-ci.org/shaneoston72/chitter-challenge)
 --------		 
 [![Coverage Status](https://coveralls.io/repos/github/shaneoston72/chitter-challenge/badge.svg?branch=master)](https://coveralls.io/github/shaneoston72/chitter-challenge?branch=master)
## Instructions to use and run tests
1. Fork repository.
2. Clone repository to your local machine.
3. Run bundle (note this may require changing your Ruby version).
4. Create two Postgresql databases called 'chitter_test' and 'chitter_development'.
5. Have fun!

## Note on databases
The app uses two databases; 'chitter_test' is for testing and 'chitter_development' is used to local development. Rspec will remove all data each time it is run through Datamapper config in spec_helper.

The Rakefile has two tasks for maintenance of the DB schema  -- db:auto_migrate and db:auto_upgrade. You should know the difference between the two and when it is appropriate to use each. Any changes to the model(s) will require one of these.

## Enhancements
* Contextual 'flash' messages
* Eliminate password confirmation
* Add the ability to log in with either email or username.
* add or change Rack::Session::Cookie to prevent session from staying up if user does not click "Log out" (see [http://fonicmonkey.net/2013/08/12/banish-your-session-has-expired/])

## Testing
* Test error messages for properties that do not have explicit messages.

## Bugs
* How to handle someone logging out, hitting back and getting an error.

Features:
-------

```sh
As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter

As a Maker
So that I can post messages on Chitter as me
I want to log in to Chitter

As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter

As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter

As a maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order

As a maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made
```

Notes on functionality:
------

* Drive the creation of your app using tests - either cucumber or rspec as you prefer
* Makers sign up to chitter with their email, password, name and a user name (e.g. sam@makersacademy.com, s3cr3t, Samuel Russell Hampden Joseph, tansaku).
* The username and email are unique.
* Peeps (posts to chitter) have the name of the maker and their user handle.
* Use bcrypt to secure the passwords.
* Use data mapper and postgres to save the data.
* You don't have to be logged in to see the peeps.
* You only can peep if you are logged in.
* Please ensure that you update your README to indicate the technologies used, and give instructions on how to install and run the tests
* Finally submit a pull request before Monday at 9am with your solution or partial solution.  However much or little amount of code you wrote please please please submit a pull request before Monday at 9am

Bonus:
-----

If you have time you can implement the following:

* In order to start a conversation as a maker I want to reply to a peep from another maker.

And/Or:

* Work on the css to make it look good (we all like beautiful things).

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
require 'coveralls'
require 'simplecov'

SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
Coveralls.wear!
```

You can see your [test coverage](https://github.com/makersacademy/course/blob/master/pills/test_coverage.md) when you submit a pull request, and you can also get a summary locally by running:

```
$ coveralls report
```

This repo works with [Coveralls](https://coveralls.io/) to calculate test coverage statistics on each pull request.
