# Chitter Challenge
Welcome to my attempt at the week 4 weekend challenge; Chitter. For current functionality see the gif below. ![GIF](/app.gif?raw=true "Current App")

For SQL tables and relations, see the gif below. ![GIF](/psql.gif?raw=true "Current data & relations")

Task
------

Build a Twitter clone that will allow users to post messages to a public stream.

User Stories:
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
## Functionality to implement:

* Drive the creation of your app using tests - either cucumber or rspec as you prefer
* Use data mapper and postgres to save the data.
* You don't have to be logged in to see the peeps.
* Makers sign up to chitter with their email, password, name and a user name (e.g. sam@makersacademy.com, s3cr3t, Samuel Russell Hampden Joseph, tansaku).
* The username and email must be unique.
* Peeps (posts to chitter) have the name of the maker and their user handle.
* Use bcrypt to secure the passwords.
* You only can peep if you are logged in.
* Please ensure that you update your README to indicate the technologies used, and give instructions on how to install and run the tests
* Finally submit a pull request before Monday at 9am with your solution or partial solution.  However much or little amount of code you wrote please please please submit a pull request before Monday at 9am

Notes on submission
----------------

Completed functionality:
- Maker can sign up
- Maker can Log in
- Maker can Peep
- Listed Peeps

Uncompleted functionality:
- Maker can peep as themselves only
- Maker can Log out
- Maker can see time of peeps
- Replying to peeps
- Comprehensive CSS styling

Additional Notes: EDIT
- No rubocop offenses
- Overall test coverage : 100%
With more time to complete this challenge; EDIT
-------------------------
- I would fix the view errors that initially allowed for unique users peeps
- I would emove redundant data from the users table
- I would improve the sign-up workflow
- I would have finished implementing the Log in & out functionality
- I would have applied some decent styling to the app.

Instructions to download and run the app:
-------
* Fork this repo
```
$ git clone https://github.com/tansaku/chitter_challenge
$ bundle
$bundle update
$ rake auto_migrate
$ rspec
$ rackup
```
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
* To run the app on a local server, open an additional tab on your terminal and run the following:
```
$ rackup
```
Visit

```
http://localhost:9292/chitter

```
Otherwise you can run the app via the deployed version on heroku [here](https://mm-chitter-challenge.herokuapp.com/chitter)
You should now be able to interact with the app.

## Code reviewed against the following:

* All tests passing
* High [Test coverage](https://github.com/makersacademy/course/blob/master/pills/test_coverage.md) (>95% is good)
* The code is elegant: every class has a clear responsibility, methods are short etc.

Reviewers will potentially be using this [code review rubric](docs/review.md).  Referring to this rubric in advance may make the challenge somewhat easier.  You should be the judge of how much challenge you want this weekend.
