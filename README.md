# Chitter [![Build Status](https://travis-ci.org/bannastre/chitter-challenge.svg?branch=master)](https://travis-ci.org/bannastre/chitter-challenge)

## A messaging application that allows users to post messages to a public stream ##

### User Stories ###

 Check user_stories.md for an overview of the project requirements.

### Getting Started#

run ```$ rackup``` and navigate to ```localhost:9292``` in your browser

### Prerequisites

All prerequisites are available by running the command ```$ bundle```.

You will need to run the command ```$ gem install bundle``` if you don't have bundle already installed.  


You will also need to create a psql database called chitter_development to run the app.  
```$ psql postgres```  
```postgres#  CREATE DATABASE chitter_development;```

The database chitter_test is required for running the tests.


## Creating your first message ##

Start by singing up to Chitter
- You'll land on the message board (which will be blank when first opened)
- Click Sign up!
- Enter a user-name, email and password
- Click 'Peep Something!' and get your first message out there!

### Structure ###
    .
    ├── CONTRIBUTING.md
    ├── Gemfile
    ├── Gemfile.lock
    ├── Instructions.md
    ├── Procfile
    ├── README.md
    ├── Rakefile
    ├── app
    │   ├── app.rb
    │   ├── datamapper_config.rb
    │   ├── models
    │   │   ├── message.rb
    │   │   └── user.rb
    │   └── views
    │       ├── index.erb
    │       ├── layout.erb
    │       ├── messages.erb
    │       ├── new_message.erb
    │       ├── new_user.erb
    │       └── sessions
    │           └── new_session.erb
    ├── config.ru
    ├── coverage
    ├── docs
    │   └── review.md
    ├── layout.erb
    ├── mkdir
    ├── spec
    │   ├── features
    │   │   ├── post_message_spec.rb
    │   │   ├── sign_in_spec.rb
    │   │   ├── sign_out_spec.rb
    │   │   ├── sign_up_spec.rb
    │   │   └── view_messages_spec.rb
    │   ├── spec_helper.rb
    │   ├── user_spec.rb
    │   └── web_helper.rb
    └── user_stories.md

### Development Methodology

This program was built and tested using Test Driven Development

* [Ruby](https://www.ruby-lang.org) - The language used to develop this program - v2.4.0p0 (2016-12-24 revision 57164)
* [Rspec](http://rspec.info) - The testing framework used to drive development - v3.5.4
* [Capybara](http://teamcapybara.github.io/capybara/) - The library used to test & simulate interactions with the web-app.
* [Sinatra](http://www.sinatrarb.com/) - The DSL used to create this web-app.
* [BCrypt](https://github.com/codahale/bcrypt-ruby) - The password-hashing encryption manager
* [DataMapper](http://datamapper.org/) - The ORM  
