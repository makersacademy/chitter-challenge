Chitter Challenge
=================

[![Build Status](https://travis-ci.org/lexiht/chitter-challenge.svg?branch=master)](https://travis-ci.org/lexiht/chitter-challenge)
[![Coverage Status](https://coveralls.io/repos/github/makersacademy/chitter-challenge/badge.svg?branch=rjlynch)](https://coveralls.io/github/makersacademy/chitter-challenge?branch=rjlynch)

Try out for yourself :)

https://lexi-chitter-app.herokuapp.com/

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

Technology used:
----------------

* Password encryption by [Bcrypt]( https://github.com/codahale/bcrypt-ruby ). 
* Database is managed by [PostgreSQL]( http://www.postgresql.org/ ). 
* The ORM used is [DataMapper]( http://datamapper.org/ ). 
* Deploy to [Heroku]( https://www.heroku.com/ ).

Installation:
-------------

* run `$ git clone https://github.com/lexiht/chitter-challenge.git`
* `gem install bundler` if you don't already have, else run `bundle`
* run local server with `rackup`, check port number and open `localhost:port number` eg. `localhost:4567`

Approach:
---------

* Sign in to peep
![alt tag](https://github.com/lexiht/chitter-challenge/blob/master/public/images/sign_in.png)
* New user go to sign up page
![alt tag](https://github.com/lexiht/chitter-challenge/blob/master/public/images/sign_up.png)
* View as guest
![alt tag](https://github.com/lexiht/chitter-challenge/blob/master/public/images/guest_view.png)
* Users can peep and comment on other people peeps.
![alt tag](https://github.com/lexiht/chitter-challenge/blob/master/public/images/user_view.png)

To do list:
-------

* Add login option to sign up page
* Add styling to comment section
* Link username with his/her comments


Author:
-------

[Lexi Tran](hazukitran@gmail.com)



