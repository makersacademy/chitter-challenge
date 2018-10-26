#Chitter Challenge

* Challenge time: rest of the day and weekend, until Monday 9am
* Feel free to use Google, your notes, books, etc. but work on your own
* If you refer to the solution of another coach or student, please put a link to that in your README
* If you have a partial solution, **still check in a partial solution**
* You must submit a pull request to this repo with your code by 9am Monday morning

### Todo
- [ ] Set up App Environment
  - [ ] Hello World test
- [ ] Set up database and test database
- [ ] User story 1
  - [x] OCR Card
  - [ ] Feature Tests
  - [ ] Unit Tests
  - [ ] Tests pass
  - [ ] Tests Refactored
  - [ ] Code Refactored
- [ ] User story 2
  - [ ] OCR Card
  - [ ] Feature Tests
  - [ ] Unit Tests
  - [ ] Tests pass
  - [ ] Tests Refactored
  - [ ] Code Refactored
- [ ] User story 3
  - [ ] OCR Card
  - [ ] Feature Tests
  - [ ] Unit Tests
  - [ ] Tests pass
  - [ ] Tests Refactored
  - [ ] Code Refactored
- [ ] User story 4
  - [ ] OCR Card
  - [ ] Feature Tests
  - [ ] Unit Tests
  - [ ] Tests pass
  - [ ] Tests Refactored
  - [ ] Code Refactored
- [ ] User story 5
  - [ ] OCR Card
  - [ ] Feature Tests
  - [ ] Unit Tests
  - [ ] Tests pass
  - [ ] Tests Refactored
  - [ ] Code Refactored
- [ ] User story 6
  - [ ] OCR Card
  - [ ] Feature Tests
  - [ ] Unit Tests
  - [ ] Tests pass
  - [ ] Tests Refactored
  - [ ] Code Refactored
- [ ] User story 7
  - [ ] OCR Card
  - [ ] Feature Tests
  - [ ] Unit Tests
  - [ ] Tests pass
  - [ ] Tests Refactored
  - [ ] Code Refactored
- [ ] Gem file contains all dependency gems
- [ ] Edge cases
- [ ] README
  - [ ] Explain your approach to the challenge
  - [ ] how to set up
  - [ ] show the full story of how your app is used (from a user's perspective)

### Considerations
- [ ] Rake file
- [ ] All test related gems are in a test group
- [ ] Make sure that your spec_helper:
  - [ ] requires in a single app file that requires all the other dependencies required by the app.
  - [ ] Connects your feature testing framework (probably Capybara) with your application.
  - [ ] Cleans the database between each test.

Form validation - https://github.com/makersacademy/course/blob/master/bookmark_manager/walkthroughs/15.md

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
