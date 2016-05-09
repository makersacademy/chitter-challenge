[![Build Status](https://travis-ci.org/letianw91/chitter-challenge.svg?branch=master)](https://travis-ci.org/letianw91/chitter-challenge)
[![Coverage Status](https://coveralls.io/repos/github/letianw91/chitter-challenge/badge.svg?branch=master)](https://coveralls.io/github/letianw91/chitter-challenge?branch=master)

[original challenge](https://github.com/makersacademy/chitter-challenge)

#Chitter Challenge

The only thing worse than being talked about is not being talked about. But I don't check my Twitter feeds. I can't handle that level of vitriol.

--Oscar Wilde

## Installation
1. Clone the repo from https://github.com/letianw91/chitter-challenge
2. Open the command line in the repo
3. run `bundle install`
4. install and configure postgresql
5. `$ createdb chitter_development`
6. `$ rake auto_migrate RACK_ENV=development`
7. `$ rspec`
8. `$ rackup`
9. Visit the site


##Heroku deployment
https://chitter-letianw.herokuapp.com/


## Features
1. User can sign up, log in, and log out.
2. Anyone can see peeps.
3. User can post peeps.
4. Peeps are displayed in reverse chronological order
5. User can see who post the peeps
6. User can see when peeps are posted
7. User can reply to other users's peep
