[![Coverage Status](https://coveralls.io/repos/github/ccfz/chitter-challenge/badge.svg?branch=master)](https://coveralls.io/github/ccfz/chitter-challenge?branch=master)
[![Build Status](https://travis-ci.org/ccfz/chitter-challenge.svg?branch=master)](https://travis-ci.org/ccfz/chitter-challenge)

h1 Chitter
h2 A simple social network

h3 Overview

  The objective of this project was to create a social media network, on which people can post to a public news feed. The challenges covered were:

  * Database creation & structure
  * Password hashing and storing
  * User validation
  * Project deployment
  * Test-driven with RSPEC

h3 Technology

* BCrypt
  * Password hashing
* Sinatra 
  * -partial
  * -flash
* Data_mapper
  * DM postgres adapter
* Database_cleaner
* Rspec
* Rake

h3 Installation

* Fork repo
* Rund bundle
* Initalize databases chitter_test & chitter_development
* run rake db:migrate RACK_ENV=test && RACK_ENV=development

h3 Screenshots

![screenshots](/screenshots/1.png?raw=true "One")
![screenshots](/screenshots/2.png?raw=true "Two")
![screenshots](/screenshots/3.png?raw=true "Three")
