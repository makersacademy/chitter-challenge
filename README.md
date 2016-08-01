Chitter Challenge
=================

A work-in-progress

A Makers Academy challenge to create a simple Twitter clone.

The app is basically functional for all of the following User Stories but is not styled.

Features:
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

* Users sign up to Chitter with their email, password, name and a user name (e.g. sam@makersacademy.com, s3cr3t, Samuel Russell Hampden Joseph, tansaku).
* The username and email are unique.
* Peeps (posts to Chitter) show the full name of the user and their preferred user name.
* You don't have to be logged in to see the peeps.
* You only can peep if you are logged in.

* Bcrypt has been used to secure the passwords.
* Datamapper (ORM) and postgres (database) have been used to save the data.
* Sinatra and other necessary gems are included in the Gemfile.
* The app has not yet been deployed to Heroku.

Installation
------------
To download the app:

```sh
$ git clone git@github.com:JulieLev/chitter-challenge.git
$ cd chitter-challenge
$ bundle
```
To run the app:
```sh
$ rackup
```
Then go to localhost:9292/ in your browser and follow the instructions.
