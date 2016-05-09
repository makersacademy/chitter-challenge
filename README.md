Chitter Challenge
=================

Partial Solution

There appears to be come issues with my code as in the browser when running sinatra you are able to access peeps, add peeps, new user sign up form. But there is an issue with my User in the controller as I get the error undefined method `include?' for nil:NilClass.

There also appears to be an issue with my database as I get the errors:
ERROR:  null value in column "user_id" violates not-null constraint
DETAIL:  Failing row contains (1, peep, 2016-05-09 08:45:03, null).

Currently I am unsure how to correct the error but I will revisit after code review.

Tech used

Ruby, Sinatra, Postgreql, DataMapper, Rspec/Capybara, CSS(or atleast will be once finished), Heroku(or atleast will be once finished), Travis CI

Challenge:
-------

We are going to write a little Twitter clone that will allow the users to post messages to a public stream.

Features:
-------
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




