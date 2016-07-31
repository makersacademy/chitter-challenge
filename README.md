README.md

Chitter Challenge
=================

Features/Use Stories
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
# Instructions for running the app

In order to run the app on a local server the following gems are required:

```
gem 'data_mapper'
gem 'dm-postgres-adapter'
```

You can either add the gems to your Gem file and run bundler (if you dont have bundler already installed you can install from command line using `gem install bundler`) or you can install them separately by typing `gem install` followed by the name of the gem individually.

You will also require postgresql. This can be installed using homebrew by typing `brew install postgresql` in the command line. If you don't have homebrew installed see <a href="http://brew.sh/">here</a> for instructions.

Once all gems and postgresql are installed you can visit localhost by running `rackup` in the command line and visiting http://localhost:9292/.

To run the app via Heroku you can visit https://acsauk-chitter.herokuapp.com/.

# Technologies used in the app

As hinted at in the gem installs above, the Chatter app utilises the following technologies:

```
postgresql - Open Source SQL based object-relational database system used for persisting app data
DataMapper - Object-Relational Map used as an interface between between Ruby and postgresql
BCrypt - used to hash passwords to maintain user security
```

# Using the app

Anyone can see peeps that have been made on the peep app but in order to post your own you will need to sign up via the link found on the landing site. Once signed up you can create your own peeps by clicking the Peep button. Peeps will be shown in reverse chronological order and you can see who has posted the peep by checking the username.
