Chitter Challenge
=================

##What is it?

My attempt at Makers Academy's Chitter Challenge, an online app that mimics the basic functionality of Twitter. Users can sign up, sign in and sign out. While signed in, users can post 'cheets' with an automatic time stamp built in. Users can view all previous cheets in reverse chronological order. 

##Technologies and learning objectives

The aim of the challenge was to practice using ORM's with databases, in this case Datamapper with Postresql, and deploying to Heroku. The app is built in Ruby, using Sinatra for the server/controller and Capybara/RSPEC for testing (99% covered). The app also uses a Rakefile for running upgrades and migrations, and Database Cleaner to keep testing clean. 

##My approach
The app is based on two related classes, User and Post, connected through the database. 


##User stories
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
##Installation
```
$ git clone https://github.com/tansaku/chitter_challenge
$ bundle
$ createdb chitter_development
$ rake auto_migrate
$ rspec
$ rackup

```
##Screenshots

###Bad sign up

![alt text]http://i.imgur.com/5dsO2EV.png "Logo Title Text 1")

===================================================================
###Bad sign result

![alt text]http://i.imgur.com/5dsO2EV.png "Logo Title Text 1")


