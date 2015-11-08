A demo of this site can be found at:

https://enigmatic-fortress-2942.herokuapp.com/peeps/index

My Approach to the challenge
============================

I started of by getting the first two user stories working. This separated out the User class which was implemnted with DataMapper. Once the User class was complete, I started on the Peep class which encapsulates a message. The dates that the peep was created was implemented using the automatic timestamps ```created_on``` and ```created_at```supplied by Datamapper. A Has many and belongs to relation was established between User and Peep. A user has many peeps. A peep belongs to one user. This is a one to many relationship.

I refactored all the User, Peep and Session routes into their own controllers. Partials have been created and used from within the layout.rb. Simple styling was carried out using Twitter Bootstrap.

Instructions
============

To run the app, follow the instructions below:

```
$ git clone git@github.com:DeathRay1977/chitter-challenge.git
$ bundle
$ createdb chitter_development
$ rake db:auto_migrate RACK_ENV=development
$ rspec
$ rackup
```

Screenshots
===========

![Peeps](https://www.dropbox.com/s/wp45lynzvwsvw1q/home.tiff?dl=0)
![Log in](https://www.dropbox.com/s/oe3yon6xyndd3qd/log%20in.tiff?dl=0)
![Register](https://www.dropbox.com/s/hhblgyvg8hhd3rj/register.tiff?dl=0)






Chitter Challenge
=================

* Challenge time: The weekend and up to 9am Monday morning
* Feel free to use google, your notes, books, etc but work on your own
* You must submit a pull request to this repo with your code by 9am Monday morning
* Please feel free to submit pull requests early at any time during the weekend to get automated feedback from Hound and test coverage stats from Coveralls

Challenge:
-------

As usual please start by 

* Filling out your learning plan self review for the week: https://github.com/makersacademy/learning_plan_september2015 (if you haven't already)
* Forking this repo

We are going to write a little Twitter clone that will allow the users to post messages to a public stream.

Features:
-------

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

* Work on the css to make it look good (we all like beautiful things).

Good luck and let the chitter begin!

Notes on test coverage
----------------------

Please ensure you have the following **AT THE TOP** of your spec_helper.rb in order to have test coverage stats generated
on your pull request:

```ruby
require 'coveralls'
require 'simplecov'

SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
Coveralls.wear! 
```

Note that you can replace `Coveralls.wear!` with  `SimpleCov.start` to get coverage stats locally
Then run `open coverage/index.html` from the command line to view details
