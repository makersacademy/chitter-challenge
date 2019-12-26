# Chitter Challenge

This is a repository containing a Twitter clone application, Chitter.  
The app uses the MVC(Model, View, Controller) pattern as it's structure. 

The technologies used to create and run the application are:

- Sinatra to run the application on a web domain
- Capybara for testing the website features
- SQL to run and manipulate it's databases, and the pg gem to connect to the databases
- The bcrypt gem in order to encrypt the user's password
- The rspec gem to test the application

## Install
```
$ cd path/CHITTER-CHALLENGE  
$ bundle
```
## Run the app
```
$ cd path/CHITTER-CHALLENGE  
$ rackup  
$ open http://localhost:9292
```
## Run the tests
```
$ cd path/CHITTER-CHALLENGE  
$ rspec
```
## User stories

As a Maker  
So that I can let people know what I am doing  
I want to post a message (peep) to chitter

As a maker  
So that I can see what others are saying  
I want to see all peeps in reverse chronological order

As a Maker  
So that I can better appreciate the context of a peep  
I want to see the time at which it was made

As a Maker  
So that I can post messages on Chitter as me  
I want to sign up for Chitter

As a Maker  
So that only I can post messages on Chitter as me  
I want to log in to Chitter

As a Maker  
So that I can avoid others posting messages on Chitter as me  
I want to log out of Chitter
