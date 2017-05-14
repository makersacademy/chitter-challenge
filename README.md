[![Build Status](https://travis-ci.org/makersacademy/chitter-challenge.svg?branch=master)](https://travis-ci.org/makersacademy/chitter-challenge)

https://travis-ci.org/makersacademy/chitter-challenge.svg?branch=master

#Message in a Bottle

Overview
-----

A Sinatra-based web application that allows users to view a stream of messages, placed by
lonely souls into digital bottles and set adrift on the virtual seascape.

They seem to mainly send naughty words, but who are we to judge?

Setup
------

Open the project directory on your local machine and run `bundle install.`

Then run `rackup -p 4567`, open a web browser, visit `localhost:4567` and start putting your messages in bottles.

When you've finished with your session, make sure to close the rackup session by using the Ctrl+C command.


Features:
-------

```
As a Maker
So that I can post messages on Message in a Bottle (MiaB) as me
I want to sign up for MIAB

As a Maker
So that I can post messages on MiaB as me
I want to log in to MiaB

As a Maker
So that I can avoid others posting messages on MiaB as me
I want to log out of MiaB

As a Maker
So that I can let people know what I am doing  
I want to post a message (bottle) to MiaB

As a maker
So that I can see what others are saying  
I want to see all messages in reverse chronological order

As a maker
So that I can better appreciate the context of a bottle
I want to see the time at which it was made
```