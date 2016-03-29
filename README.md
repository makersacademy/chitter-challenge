[![Coverage Status](https://coveralls.io/repos/github/ccfz/chitter-challenge/badge.svg?branch=master)](https://coveralls.io/github/ccfz/chitter-challenge?branch=master)
[![Build Status](https://travis-ci.org/ccfz/chitter-challenge.svg?branch=master)](https://travis-ci.org/ccfz/chitter-challenge)

# Chitter
## A simple social network

### Overview

  The objective of this project was to create a social media network, on which people can post to a public news feed. The challenges covered were:

  * Database creation & structure
  * Password hashing and storing
  * User validation
  * Project deployment
  * Test-driven with RSPEC

### Technology

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

### Installation

```
* Fork repo
* Rund bundle
* Initalize databases chitter_test & chitter_development
* run rake db:migrate RACK_ENV=test && RACK_ENV=development
```
### App
#### Live Version: 
https://chittercaspar.herokuapp.com/feed
#### Screenshots
![screenshots](https://github.com/ccfz/chitter-challenge/blob/master/screenshots/1.png?raw=true)
![screenshots](https://github.com/ccfz/chitter-challenge/blob/master/screenshots/2.png?raw=true)
![screenshots](https://github.com/ccfz/chitter-challenge/blob/master/screenshots/3.png?raw=true)
