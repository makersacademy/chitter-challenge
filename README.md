Chitter Challenge
=================

BASIC TASK:
Create a web app that allows users to sign up to a site based on Twitter's model. User can log in and out, post short messages and view them in reverse chronological order.

TO DO:

* displaying post in reverse chronological order
* adding time stamp

TECHNOLOGIES USED:

Ruby 2.2.3
Sinatra
HTML
Rspec-Sinatra, Capybara, Coveralls (for testing)

HOW TO USE:

clone repo
run bundle to install dependencies
run rake db:auto_migrate to set up database
from the chitter-challenge root directory in the command line, start Sinatra using ruby app/app.rb
visit the corresponding localhost in your browser

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
