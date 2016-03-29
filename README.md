[![Coverage Status](https://coveralls.io/repos/github/ccfz/chitter-challenge/badge.svg?branch=master)](https://coveralls.io/github/ccfz/chitter-challenge?branch=master)
[![Build Status](https://travis-ci.org/ccfz/chitter-challenge.svg?branch=master)](https://travis-ci.org/ccfz/chitter-challenge)

H1 Chitter
H2 A simple social network

H3 Overview

  The objective of this project was to create a social media network, on which people can post to a public news feed. The challenges covered were:

  * Database creation & structure
  * Password hashing and storing
  * User validation
  * Project deployment
  * Test-driven with RSPEC

H3 Technology

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

H3 Installation

* Fork repo
* Rund bundle
* Initalize databases chitter_test & chitter_development
* run rake db:migrate RACK_ENV=test && RACK_ENV=development

H3 Screenshots

![screenshots](https://www.dropbox.com/s/xo2ntk8te93alw2/1.png?dl=0)
![screenshots](https://www.dropbox.com/s/dyrdxg7s6852dj4/2.png?dl=0)
![screenshots](https://www.dropbox.com/s/8fv7e45q5d5x0e7/3.png?dl=0)
