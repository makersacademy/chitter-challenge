Chitter Challenge
=================
A twitter clone that allows users to post messages to a public stream

## Set Up

```
$ git clone https://github.com/hvenables/chitter-challenge.git
bundle
rackup
```

### Gems used
Timecop - to help test for the time.
FactoryGirl - to help create dummy users
Sinatra Flash - This enables error messaging
Sinatra Partials - which allows the use of partials in Sinatra
brcypt - to encrypt the passwords stored on the site (It hashes and also adds a salt)
Data Mapper - to interact with the postgres database that was used on this project.

### To run the app
```
$ rackup
```
Go to http://localhost:9292

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
```

Notes on functionality:
------

* The creation of this app was driven using tests - rspec and capybara
* Makers sign up to chitter with their email, password, name and a user name (e.g. sam@makersacademy.com, s3cr3t, Samuel Russell Hampden Joseph, tansaku).
* The username and email are unique.
* Peeps (posts to chitter) have the name of the maker and their user handle.
* Use bcrypt to secure the passwords.
* Use data mapper and postgres to save the data.
* You don't have to be logged in to see the peeps.
* You only can peep if you are logged in.
* In order to start a conversation as a maker I want to reply to a peep from another maker.
