Chitter Challenge
=================

* Challenge time: rest of the day and weekend, until Monday 9am
* Feel free to use google, your notes, books, etc. but work on your own
* If you refer to the solution of another coach or student, please put a link to that in your README
* If you have a partial solution, **still check in a partial solution**
* You must submit a pull request to this repo with your code by 9am Monday morning

Challenge:
-------

As usual please start by forking this repo.

We are going to write a little Twitter clone that will allow the users to post messages to a public stream.

Features:
-------

```
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

How to install
----------------------

1. Fork and/or Clone this repository to your local machine `git clone https://github.com/herecomesjaycee/chitter-challenge.git`
2. Navigate to the Chitter Challenge folder `cd chitter-challenge`
3. Run `gem install bundler` if bundler is not installed, then run `bundle`
4. To set up a corresponding database on your local machine, `brew install pqsl` if psql is not installed in your machine
5. Run command `psql` and command `createdb chitter_development;` to complete setting up the database
6. Run `rspec` to view the tests written for this application
7. To deploy the app on your local machine, run `rackup` and navigate to `localhost: 9292` on any web broswer. 
8. If you don't wish to deploy the app on your local machine, there is a live production of chitter challenge on [Heroku]( https://chitter-jaycee.herokuapp.com/)

Screenshot
----------------------
Home page
![screen shot 2017-01-30 at 09 14 05](https://cloud.githubusercontent.com/assets/13175171/22417522/95587010-e6cc-11e6-904a-7237f759591d.png)
Sign Up page
![screen shot 2017-01-30 at 09 14 18](https://cloud.githubusercontent.com/assets/13175171/22417519/95515bcc-e6cc-11e6-9517-e55f321dd8e1.png)
Log In page
![screen shot 2017-01-30 at 09 14 29](https://cloud.githubusercontent.com/assets/13175171/22417517/9550d472-e6cc-11e6-9051-e759b9bb97f5.png)
Write a peep page
![screen shot 2017-01-30 at 09 14 39](https://cloud.githubusercontent.com/assets/13175171/22417518/9551316a-e6cc-11e6-95ea-4ef55fb61942.png)
Peeps page
![screen shot 2017-01-30 at 09 14 50](https://cloud.githubusercontent.com/assets/13175171/22417520/9554ca00-e6cc-11e6-8025-8728ce43bb5b.png)





