[![Build Status](https://travis-ci.org/kevinpmcc/chitter-challenge.svg?branch=master)](https://travis-ci.org/kevinpmcc/chitter-challenge)
[![Coverage Status](https://coveralls.io/repos/github/kevinpmcc/chitter-challenge/badge.svg?branch=master)](https://coveralls.io/github/kevinpmcc/chitter-challenge?branch=master)

[![Imgur](http://i.imgur.com/DU5Vd1y.png?3)](http://i.imgur.com/DU5Vd1y.png?3)
Shitter
=================
Shitter is a very basic Twitter rip-off.  
Instead of tweeting you can poop.  
You can see the live website https://like-twitter-but-shitter.herokuapp.com/  

Installation Instructions
-------
    git clone https://github.com/kevinpmcc/chitter-challenge.git  

    cd chitter-challenge  

    bundle

    psql

    CREATE DATABASE chitter_test;
    CREATE DATABASE chitter_development;
    \q

To run tests 

    rspec

To see code coverage  
    coveralls report  
    
To run on local server

    rackup


then go to **localhost:9292** in your browser


Technologies Used
-------
Ruby (basis of most of it)
Sinatra (good for making micro-apps, including sinatra-flash, rspec-sinatra, sinatra-partial)
Postgresql (to create the databases)
Datamapper (to talk to the databases)
Heroku (to host)
HTML (to do the basic website content)
Bcrypt (for encrypting the passwords)
DatabaseCleaner (for testing)
Rspec (for testing)
Capybara (for acceptance testing)
Coveralls (test code coverage)
Sketchbook (for touching up the pictures)
Imgur (for hosting images)

Author
-------
Kevin McCarthy  
kevinpatrickmccarthy@gmail.com  
https://github.com/kevinpmcc



