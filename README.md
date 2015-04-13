#Chitter Challenge#

[![Coverage Status](https://coveralls.io/repos/RBGeomaticsRob/chitter-challenge/badge.svg?branch=master)](https://coveralls.io/r/RBGeomaticsRob/chitter-challenge?branch=master) [![Build Status](https://travis-ci.org/RBGeomaticsRob/chitter-challenge.svg?branch=master)](https://travis-ci.org/RBGeomaticsRob/chitter-challenge)

This is the challenge from the end of the 4th week at Makers Academy. The challenge is to make a 'chitter' application, allowing makers to post short messages to a message board.

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

As a maker
So that I can let people know what I am doing
I want to post a message (peep) to chitter

As a maker
So that I can see what others are saying
I want to see all peeps in reverse chronological order
```
##MVP Roadmap##

MVp1(a) - Local host app that a maker can sign up to, sign in, post a peep and sign out.

MVp1(b) - MVp1 + anyone regardless of sign-in status can see messages in reverse order.

MVP1 - Fully functioning chitter web app, allowing sign-up, sign-in, peep posting and sign out. Minimal Structure and no styling implemented.

MVP2 - MVP1 + Styling and structure addressed.

##Design##
This project is being developed in a BDD style using Cucumber to drive feature tests and RSpec for unit testing of the models.

##Technologies##

Testing - Cucumber / Rspec / Capybara
Server - Sinatra
Interface Structure - HTML templated with ERB
Interface Styling - CSS
Password Security - BCrypt
Database - Postgres / Datamapper as ORM
Programming Language - Ruby

##Setup##

The app runs on a Postgres database, you will need to create two databases `chitter_test` & `chitter_development`.

You will also need to `bundle install` to obtain all the necessary gems.

##Contribution##

This is a challenge set to identify progress in Wk3 at Makers Academy, therefore is designed to be tackled individually.

However comment on the quality of the code and it's implementation would be very welcome.
