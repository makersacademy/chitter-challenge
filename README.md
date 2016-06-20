[![Build Status](https://travis-ci.org/andreamazza89/chitter-challenge.svg?branch=master)](https://travis-ci.org/andreamazza89/chitter-challenge.svg?branch=master)
[![Coverage Status](https://coveralls.io/repos/github/andreamazza89/chitter-challenge/badge.svg?branch=master)](https://coveralls.io/github/andreamazza89/chitter-challenge?branch=master)

#Chitter challenge

This is the fourth weekend challenge here at [Makers Academy] (http://www.makersacademy.com/)

##The brief

Can be found [here] (https://github.com/makersacademy/chitter-challenge).

The requirement is for a simple twitter clone, to allow a user to sign up/in/out, post messages and see all messages.

##The technology
This app is written in Ruby using Sinatra as a framework. DataMapper is used to interface Sinatra with a postgreSQL database and BCrypt to securely store passwords. RSpec is used for testing, with Capybara as an extension for web interactions. Please refer to the Gemfile for a list of all dependencies.

##Installation
Install [bundler] (http://bundler.io/)

From bash, clone this repo to your computer using `git clone`.

Run bundler (`bundle`).

Create two postgresql databases, `chitter_test` and `chitter_development`.

Navigate to the project directory (`cd chitter-challenge`).

Run the local server (`rackup`)

Open a web browser and navigate to the path shown on the console (something like `localhost:9292`)

##Domain Modelling
The initial domain model can be found [here] (https://github.com/andreamazza89/chitter-challenge/blob/master/docs/domain_model.md), whereas the user stories can be found in the [original brief] (https://github.com/makersacademy/chitter-challenge).
