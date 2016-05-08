Chitter Challenge
=================

Author: Rahul Ramakrishna

Challenge:
---------
Week 4

To create a Twitter clone that will allow the users to post messages to a public stream.

User Stories:
------------

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

Notes on functionality:
----------------------

* Makers sign up to chitter with their email, password, name and a user name (e.g. sam@makersacademy.com, s3cr3t, Samuel Russell Hampden Joseph, tansaku).
* The username and email are unique.
* Peeps (posts to chitter) have the name of the maker and their user handle.
* Bcrypt is used to secure the passwords.
* Data mapper and postgres are used to save the data.
* You don't have to be logged in to see the peeps.
* You only can peep if you are logged in.

To use:
------

If you don't already have a local database set up in postgres, please use the steps described here:
https://github.com/makersacademy/course/blob/master/bookmark_manager/03_setting_up_a_database.md

Please type the following commands in a terminal window:

$ git clone https://github.com/rahulrama/chitter-challenge
$ cd chitter-challenge
$ bundle
$ createdb chitter_development
$ rake db:auto_migrate
$ rspec
$ rackup -p 4567

Open up a browser and go to http://localhost:4567/

If you have any complaints, please do not feel free to contact the author.
