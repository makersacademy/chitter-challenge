[![Build Status](https://travis-ci.org/lorenzoturrino/chitter-challenge.svg?branch=master)](https://travis-ci.org/lorenzoturrino/chitter-challenge)
[![Coverage Status](https://coveralls.io/repos/github/lorenzoturrino/chitter-challenge/badge.svg?branch=master)](https://coveralls.io/github/lorenzoturrino/chitter-challenge?branch=master)

Instructions:
------
* This is a clone of twitter
* Download, check ruby version, run $ bundle
* Create a clean database, and set its address to $DATABASE_URL
* Run $ rake migPro once before starting, and again if you want to scrub the DB
* Run $ rackup and connect to localhost:9292
* Instance available at https://frozen-fortress-63985.herokuapp.com/
* If you want to use rspec, you need a localhost/chitter_test db, create one and run $ rake migTest
* For dev enviroment, the database is localhost/chitter_development, use $ rake migDev before starting.

Description:
------
* This program uses Sinatra to handle the webserver and Datamapper on top of a psql database
* All passwords are encrypted with the BCrypt gem, but all info is sent over the web with post methods. So hi man in the middle attacks.
* Testing is done with Capybara(+Orderly) on top of rspec, using DatabaseCleaner and Coveralls

Notes:
------
* Time is never enough
* Many features have been implemented in a...homegrown way (see validation) and need to be refactored
* Similarly, there is a need to extract all the logic from the controller and the views and delegate to the model
* Sinatra Flash is really nice, but I feel like I've abused it too much to be able to keep everything in the same page.
* Testing for the main features is complete, but using capybara makes harder to gauge how solid those tests are (it is extremely easy to get 100% coverage and you don't have 'single functions' to test)
* A layout file is nice, but is it needed when I only have one (displayed) page?
* Security: all info is sent in clear over the web.
* Input validation is not completed (nil user/pwd/mail), mostly because of time and avoiding a even bigger app.rb file
* Several edge cases and possible attacks (see being able to post raw html, or worse.) needs to be examined and tackled.
* Along a general refactoring, a check of the 'require' chain is needed, to make sure there are no extra or unnecessarily complicated relations
* Travis work, but using a env var set in travis.yml to trigger a datamapper automigrate in the dm_models_setup file feels like a bad hack. I tried to run a rake command in the before_script section but it fails on requiring datamapper.
