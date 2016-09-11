Chitter Challenge
=================

Introduction
------------

The fourth weekend challenge at Makers Academy was called Chitter and the task was basically to build a twitter clone with the following user stories implemented.

```
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
Currently, all of the user stories have been implemented except the last two.

Instructions
------------

The instructions below guide you on how to clone repo to run the program.
I did try deploying to heroku, but had a few errors and am looking to rectify
this soon, as for now to view the program in action follow the instructions
below. This guide does assume you have psql installed, if you don't head over
[here.](http://exponential.io/blog/2015/02/21/install-postgresql-on-mac-os-x-via-brew/)

```
$ #We first need a local database for both test and development.
$ create database chitter_development
$ create database chitter_test

$ git clone https://github.com/jameshamann/chitter-challenge.git
$ cd chitter-challenge
$ bundle
$ # once all gems are installed, launch the application:
$ rackup #navigate to localhost9292
$ coveralls report #to view all test coverage information
```

When using the site, there are no direct link buttons to take you to different
pages, therefore if you wish to visit certain pages refer to the list below and
add the snippet to your URL.

- '/peeps' - Shows all peeps as well as the authors and corresponding timestamp
- '/peeps/new' - Add new peeps
- '/users/new' - Adding new users
- 'sessions/new' - Logging in as an existing user

Technologies used
-----------------

- Ruby
- RSpec
- Capybara
- Sinatra
- PostgreSQL
- Coveralls

Test Coverage
-------------

The screenshot below displays the test coverage.

![Imgur](http://i.imgur.com/ornS6bZ.png)


Example
-------

The screenshot below highlights the '/peeps' page with a few users having
added peeps, to show what the main page would look like. The current logged in
user is "Test".

![Imgur](http://i.imgur.com/OP7aE0l.png)


Future Considerations
---------------------

Given more time I would look to work on the style of the site and improve this
using some CSS to make the appearance more appealing. I would also look to make
site navigation easier, by adding either a navigation bar or navigation
buttons to allow users to easily explore the site without having to hard type
the URL.

Author
------

James Hamann - https://github.com/jameshamann
