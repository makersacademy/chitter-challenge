![Build Status](https://travis-ci.org/tcpickard94/chitter-challenge.svg?branch=master)
![Coverage Status]((https://coveralls.io/github/makersacademy/chitter-challenge?branch=rjlynch)

Chitter
=======

Our task us to build a functional MVP 'clone' of twitter. Users will be able to sign-up, log in and out and  post a message viewing the time it was created.

Project Overview
---------------
The project is built using Sinatra and tested via rspec and capybara.
Users have the ability to create an account login and logout
When logged in users can create a peep which are displayed on the home page
Users can reply to peeps from others as well as there own

Installation
------------
To install and run the project locally:
```
$ git clone https://github.com/tcpickard94/chitter-challenge.git
$ cd chitter-challenge
$ bundle
$ createdb chitter_development
$ rake db:migrate
$ rackup
```

Live site
---------
The site is live and deployed via heroku
https://chiitter.herokuapp.com/



