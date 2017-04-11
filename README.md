Chitter Challenge
=================
![Bitter-Chitter](http://i.imgur.com/d92OuCr.png)

A Twitter clone that allows registered users to post messages to a public stream.

Technologies used
---

Ruby, Sinatra, Postgreql, DataMapper, Rspec/Capybara, CSS, Heroku

Key concepts
-------
This challenge was the first real introduction I had to the MVC pattern, and to databases within a web development context. An additional feature that I would like to implement at a later date is the ability for users to reply to one another's posts, which would be done by creating a 'comment has many replies' association.

View and interact with the web application [on heroku here](insert link)

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

Notes on functionality:
------
* Users sign up to chitter with their email, password, name and a user name (e.g. sam@makersacademy.com, s3cr3t, Samuel Russell Hampden Joseph, tansaku).
* The username and email are unique.
* Peeps (posts to chitter) have the name of the maker and their user handle.
* Use bcrypt to secure the passwords.
* Use data mapper and postgres to save the data.
* You don't have to be logged in to see the peeps.
* You only can peep if you are logged in.

![Sign Up](http://i.imgur.com/V4ygfDg.png)

To run...
-------

Firstly, you will need to clone this repository onto your own machine. To do this open your terminal and run the following commands:
```
$ git clone https://github.com/Simba14/chitter-challenge.git
$ bundle
```
The command 'bundle' will install the required gems as specified in the gem file. This includes Postgresql, which can be run by entering 'psql'. Then enter the following command:
```
$ create database chitter_development
```
Run the following commands:
```
$ rake auto_migrate
$ rspec
$ rackup
```
