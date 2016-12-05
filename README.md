Chitter Challenge [![Coverage Status](https://coveralls.io/repos/github/makersacademy/chitter-challenge/badge.svg?branch=rjlynch)](https://coveralls.io/github/makersacademy/chitter-challenge?branch=rjlynch) [![Build Status](https://travis-ci.org/GeorgeSeeger/rps-challenge.svg?branch=master)](https://travis-ci.org/GeorgeSeeger/rps-challenge)
=================


** Installation Instructions **

* Clone this repo
```
$ git clone https://github.com/GeorgeSeeger/chitter-challenge.git
```
* Run bundler
```
$ bundler
```
* Create databases ```chitter_test``` and ```chitter_development``` with PostgresQL
```
$ brew install postgresql
$ psql
$ create database chitter_test;
$ create database chitter_development;
```
* _If databases are already created_, erase any tables stored in them
```
$ rake db:auto_migrate
```
* Now you are ready to test ```RSpec``` to run the automated test suite or ```ruby app/app.rb``` for manual testing
