# Chitter Challenge by Zeshan Rasul

This is the Week 3 Chitter Challenge by Zeshan Rasul

## Using the site on Heroku

This application is available to use on Heroku at

## Instalation instructions

To install the application on your local system, run the following commands in your command line.

```
$ git clone https://github.com/ZeshanRasul/chitter-challenge.git
$ cd chitter-challenge
$ createdb chitter_development
$ rake db:auto_migrate
$ bundle
$ rackup
```

You can then visit the localhost at the port given by rackup in the command line and use the site in your browser.

You may need to `$ gem install bundle` if the `$ bundle` does not work.

You may need to also install psql using homebrew, if you are unable to create the database.  Instructions to install homebrew can be found here: http://brew.sh/.

Tests can be run by running `$ rspec` while in the chitter-challenge root directory.  Capybara feature tests have been used to the test the various features of the application and test coverage is currently over 99%.

Screenshots of the application can be found below.

## User Stores

I began this challenge using the following User Stories as direction.

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

I then continued the development by implementing the following bonus features.

## Bonus:

If you have time you can implement the following:

* In order to start a conversation as a maker I want to reply to a peep from another maker.

And/Or:

* Work on the css to make it look good (we all like beautiful things).

## Technologies used

I used numerous gems in order to develop and improve the functionality of this application.  These included
* DataMapper
* Sinatra
* BCrypt
* Sinatra Flash
* Sinatra Partial
* Timecop
* Database Cleaner
* Rspec
* Rake
* Capybara

## Future improvements

Future improvements would mainly revolve around the user interface and improved design of the application.  

I would also plan to implement password and account recovery using email tokens and potentially the Mailgun API.

## Screenshots
