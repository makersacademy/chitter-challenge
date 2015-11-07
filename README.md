[![Build Status](https://travis-ci.org/Harryandrew/Chitter-Challenge.svg?branch=master)](https://travis-ci.org/Harryandrew/Chitter-Challenge)
[![Coverage Status](https://coveralls.io/repos/Harryandrew/Chitter-Challenge/badge.svg?branch=master&service=github)](https://coveralls.io/github/Harryandrew/Chitter-Challenge?branch=master)
[![Dependency Status](https://gemnasium.com/Harryandrew/Chitter-Challenge.svg)](https://gemnasium.com/Harryandrew/Chitter-Challenge)
[![Code Climate](https://codeclimate.com/github/Harryandrew/Chitter-Challenge/badges/gpa.svg)](https://codeclimate.com/github/Harryandrew/Chitter-Challenge)


**Chitter-Challenge**
=================
Week four Makers Academy - Chitter challenge!
=======
As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter

As a maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order

As a maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made
```

Notes on functionality:
------

* Drive the creation of your app using tests - either cucumber or rspec as you prefer
* Makers sign up to chitter with their email, password, name and a user name (e.g. sam@makersacademy.com, s3cr3t, Samuel Russell Hampden Joseph, tansaku).
* The username and email are unique.
* Peeps (posts to chitter) have the name of the maker and their user handle.
* Use bcrypt to secure the passwords.
* Use data mapper and postgres to save the data.
* You don't have to be logged in to see the peeps.
* You only can peep if you are logged in.
* Please ensure that you update your README to indicate the technologies used, and give instructions on how to install and run the tests
* Finally submit a pull request before Monday at 9am with your solution or partial solution.  However much or little amount of code you wrote please please please submit a pull request before Monday at 9am

Bonus:
-----

If you have time you can implement the following:

* In order to start a conversation as a maker I want to reply to a peep from another maker.

And/Or:

The challenge this week is to write a Twitter clone that will allow users to post messages to a public stream.  

[Click here to sign/up login and get peeping](https://shielded-woodland-1531.herokuapp.com/), or as mentioned below clone this repo and run `bundle install` to download the relevant gems.

Description
------------ 
The application is built on Sinatra 1.4.6 and tested using Rspec 3.3, site data currently is maintained via postgresql remote database. [Click here](https://rubygems.org/gems/pg/versions/0.18.3) for the gem and more information. 

The main feature of the application is the user management system, where users are able to sign up and make posts to the main feed (otherwise known as 'peeps'). Users can sign up and login to post peeps, and request a password reset if needs be. User passwords are salt hashed for added security and saved to the database - Heroku side postgresql [Bcrypt](http://bcrypt.sourceforge.net/). Users must have an account to make posts.

Installation/Dependencies
--------------------------
Running on Ruby version 2.2.3

To preview, `git clone` this repo from the command line, then run `bundle` to install the relevant dependencies.   
Rack up the middleware of your choice and point your browser accordingly. Tested and working with Rackup & Puma.
When running locally you must configure postgresql to handle database functionality.

   
![Chitter](https://github.com/harryandrew/chitter-challenge/blob/master/public/snapshot.png)