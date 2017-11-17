Chitter Challenge
=================

Challenge:
-------
This weekend's challenge was to create a  Twitter clone that will allow the users to post messages to a public stream.

How To Use:
-------

Approach
-------



Domain Models
-------

Creating a Domain Model allows me to specify what the focus of every test should be. It also tells me what functions needs to be included in the challenge along with it's outcomes for when I'm testing it. Writing a Domain Model helps to list out what is needed for a program accordingly and
also helps to see what the order of the pages needs to be in.

| Objects       | Messages      | Test outcomes                            |
| ------------- |:-------------:| ----------------------------------------:|
| Message(peep) | message       | Post a peep to chitter                   |
| Order(peep)   | See all       | Peeps are in reverse chronological order |
| time          | made          | See the time which the peep was made     |
| Chitter       | sign up       | Register username(2x), password and name |
| Chitter       | log in        | Log in to post chitter as user's chitter |
| Chitter       | log out       | To avoid posting messages under user     |
| Chitter, email| receive       | Receives email if tagged by a peep       |


Resources
-------



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
