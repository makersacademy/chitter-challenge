Chitter Challenge
=================

The Chitter challenge is a web app that functions in a similar way to twitter. I developed it as part of Makers Academy, a 12 week coding bootcamp in London.

Set up
-------
* Type bundle into the terminal to install dependencies
* Instructions on how to set up the database and test database can be found in the db/migrations
* rackup to start the Sinatra web app
* Access it at http://localhost:9292

Notes on functionality and technologies
---------------------------------------
* Chitter is a database driven web app
* Information about peeps/users/tags are selected from the database and wrapped in classes for easy reference
* The web app follows an MVC (Model View Controller) structure.
* The controller is stored in the app.rb file in the root folder, the views in /views and the model in /lib.
* Sessions are used to enable logging in and out
* Capybara is used to feature test the app
* PSQL is used to access the databases
* TablePlus was used to update and maintain the databases


Instructions from Makers and user stories
-----------------------------------------


* Challenge time: rest of the day and weekend, until Monday 9am
* Feel free to use Google, your notes, books, etc. but work on your own
* If you refer to the solution of another coach or student, please put a link to that in your README
* If you have a partial solution, **still check in a partial solution**
* You must submit a pull request to this repo with your code by 9am Monday morning

Challenge:
-------

As usual please start by forking this repo.

We are going to write a small Twitter clone that will allow the users to post messages to a public stream.

Features:
-------

```
STRAIGHT UP

As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter

As a maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order

As a Maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made

As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter

HARDER

As a Maker
So that only I can post messages on Chitter as me
I want to log in to Chitter

As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter

ADVANCED

As a Maker
So that I can stay constantly tapped in to the shouty box of Chitter
I want to receive an email if I am tagged in a Peep
```

Notes on functionality:
------

* You don't have to be logged in to see the peeps.
* Makers sign up to chitter with their email, password, name and a username (e.g. samm@makersacademy.com, password123, Sam Morgan, sjmog).
* The username and email are unique.
* Peeps (posts to chitter) have the name of the maker and their user handle.
* Your README should indicate the technologies used, and give instructions on how to install and run the tests.

Bonus:
-----

If you have time you can implement the following:

* In order to start a conversation as a maker I want to reply to a peep from another maker.

And/Or:

* Work on the CSS to make it look good.

Good luck and let the chitter begin!
