Chitter Challenge
=================

Full instructions can be seen in [INSTRUCTIONS.md](INSTRUCTIONS.md)

A Twitter clone that will allow the users to post messages to a public stream.

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

As a Maker
So that I can contribute to a conversation
I want to reply to a peep from another maker.

As a Maker
So that I can appreciate the look of Chitter
I want Chitter to have nice CSS and style
```
Technologies used:
----

* Test frameworks: Rspec, Capybara
* Programming language: Ruby
* Sinatra web app
* HTML, CSS, Bootstrap, Javascript
* Hosted on Heroku at: ADD IN HERE LINK
* Used data mapper and postgres to save the data in databases.
-----
Functionality
------
* You don't have to be logged in to see the peeps.
* Makers sign up to chitter with their email, password, name and a user name (e.g. sam@makersacademy.com, s3cr3t, Samuel Russell Hampden Joseph, tansaku).
* The username and email are unique.
* Peeps (posts to chitter) have the name of the maker and their user handle.
* Use bcrypt to secure the passwords. - TEST FOR THIS???
* You only can peep if you are logged in.


Instructions
---
View app online at: XXXXXXXXX

To Install:
install postgres?

```
$ git clone https://github.com/ryandav/chitter_challenge
$ bundle
$ createdb chitter_development
$ rake auto_migrate
$ rspec
$ rackup
```

To run the tests:
```tests
rspec
```

 and give instructions on how to install
 and run the tests

ENV for email
Profile to switch off email notifications

How to use chitter:
screenshots

![Screenshot](https://path_to_your_image)

Homepage
You can view the peeps, login or signup

View peeps:
You can see all peeps in reverse chronological order
you can search the peeps via tag or username
You cannot post a peep unless you are logged in

Sign up
Enter email, username, full name, password, and password confirmation

Log in / Log out
Click on the log out button in the nav bar at the top right of the screen

Once logged in
You can then post peeps
You can delete peeps you posted if logged in
COMMENT ON OTHERS PEEPS!!!
View your profile by clicking on "Welcome, <Username>"
PUT IN DROPDOWN??

Design of Program
----
Models

Views

Controllers

UNIT TESTS???

Code Review
-----------

In code review we'll be hoping to see:

* The code is elegant: every class has a clear responsibility, methods are short etc.

Reviewers will potentially be using this [code review rubric](docs/review.md).  Referring to this rubric in advance may make the challenge somewhat easier.  You should be the judge of how much challenge you want this weekend.

References:
To see how to sructure the folders in my project
