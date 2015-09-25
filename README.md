Chitter Challenge [![Code Climate](https://codeclimate.com/repos/55781a2569568071a002b5c8/badges/62dafddf067c35f409b4/gpa.svg)](https://codeclimate.com/repos/55781a2569568071a002b5c8/feed) [![Build Status](https://travis-ci.org/rjlynch/chitter-challenge.svg?branch=master)](https://travis-ci.org/rjlynch/chitter-challenge)

[visit the site](http://rjl-chitter.herokuapp.com/)<br>
A clone of the micro blogging website twitter, built using Sinatra, Datamapper, BCrypt, PSQL and Ruby.
Tested with RSpec + Capybara.
![site screen shot](http://i.imgur.com/sLIcTp2.png)

####Tests/Documentation
```
adding peeps
  is not possible when logged out
  is possible when logged in
  creates a peep with the users name attached

Logging in
  when we havent logged in
    we are not logged in
    we are presented a log in form
    we are presented a link to sign up
  with correct details
    welcomes us on the homepage
  with incorrect details
    we are prompted to log in again
    and given a warning

Logging out
  while logged in

replying to a peep
  takes us to a reply page
  if we are not logged in we cant reply
  if we are logged in we can reply

Viewing peeps
  on the homepage
  in reverse chronological order

Signing up
  as a new user visiting the site
  with a password that does not match
    doesnt add the user to the database
    redirects the user to the sign up form and displays an error
  is not possible
    with an email that is already taken
    with a username that is already taken

Peep
  can store a peep
  can store a user

Finished in 4.45 seconds (files took 2.58 seconds to load)
22 examples, 0 failures
=======

* Challenge time: Friday afternoon (+ weekend if you need it)
* Feel free to use google, your notes, books, etc but work on your own
* You must submit a pull request to this repo with your code by 9am Monday morning

Challenge:
-------

As usual please start by 

* Filling out your learning plan self review for the week: https://github.com/makersacademy/learning_plan (if you haven't already)
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

As a maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter

As a maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order

As a maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made
>>>>>>> master
```
