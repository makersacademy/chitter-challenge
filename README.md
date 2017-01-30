Chitter Challenge
=================

How to set up the application:

```
$ git clone https://github.com/kateloschinina/chitter-challenge
$ bundle
$ createdb chitter_development
$ rake auto_migrate
$ rspec
$ rackup
```


User Stories:
-------

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

About application:
-------
The application is rather self-explanatory.

At the landing page you should see the options either to log in, if you already have a Chitter account, or to sign up, or potentially you can see peeps without registration, but in this case you won't be able to post other teets.
For your information please see below couple of screenshots:

Landing page:

![Imgur](http://i.imgur.com/j4OCRr6.png)

Sign up page:

![Imgur](http://i.imgur.com/agX9cwg.png)

Peeps feed when user is logged in:

![Imgur](http://i.imgur.com/fGV3LcS.png)

Peeps feed when user is not logged in:

![Imgur](http://i.imgur.com/fAvrwwy.png)

Please note, that each user has been assigned random, but its own unique user picture, that belongs only to them!

![Imgur](http://i.imgur.com/PVUbWHf.png)

You can also enjoy it for free [online](https://chitter-by-kateloschinina.herokuapp.com/).

Badges
------------------

[![Build Status](https://travis-ci.org/makersacademy/chitter-challenge.svg?branch=master)](https://travis-ci.org/makersacademy/chitter-challenge)

[![Coverage Status](https://coveralls.io/repos/github/kateloschinina/chitter-challenge/badge.svg)](https://coveralls.io/github/kateloschinina/chitter-challenge)
