# Chitter #
[![Build Status](https://travis-ci.org/bannastre/chitter-challenge.svg?branch=master)](https://travis-ci.org/bannastre/chitter-challenge)
## A messaging application that allows users to post messages to a public stream ##

### User Stories ###

 Check user_stories.md for an overview of the project requirements.

### Getting Started#

run ```$ rackup``` and navigate to ```localhost:9292``` in your browser

### Prerequisites

All prerequisites are available by running the command ```$ bundle```.

You will need to run the command ```$ gem install bundle``` if you don't have bundle already installed.

## Creating your first message ##

-- Add some info here about how to get up and running with Chitter  

### Structure ###
    .
    ├── CONTRIBUTING.md
    ├── Gemfile
    ├── Gemfile.lock
    ├── Instructions.md
    ├── README.md
    ├── Rakefile
    ├── coverage
    ├── docs
    │   └── review.md
    └── spec
    └── spec_helper.rb

### Development Methodology

This program was built and tested using Test Driven Development

* [Ruby](https://www.ruby-lang.org) - The language used to develop this program - v2.4.0p0 (2016-12-24 revision 57164)
* [Rspec](http://rspec.info) - The testing framework used to drive development - v3.5.4
* [Capybara](http://teamcapybara.github.io/capybara/) - The library used to test & simulate interactions with the web-app.
* [Sinatra](http://www.sinatrarb.com/) - The DSL used to create this web-app.
* [BCrypt](https://github.com/codahale/bcrypt-ruby) - The password-hashing encryption manager
* [DataMapper](http://datamapper.org/) - The ORM
* [Mail](https://github.com/mikel/mail) - The libarary that handle emails generation, parsing and sending in a simple, rubyesque manner.
* [Sendgrid](https://github.com/sendgrid/sendgrid-ruby#usage) - The API for sending mail over SMTP
