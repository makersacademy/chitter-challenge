Chitter Challenge
=================

## Synopsis

Project involves creating our own version of Twitter. Our version is called Chitter and will allow users to post messages to a public stream.



User stories:
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


## Technologies Used
- Ruby
- Rspec
- Capybara
- Sinatra
- Postgres
- DataMapper


To run:

In order to run tests, fork/clone this repo and run rspec in the command line. Ensure that the capybara gem is added to your Gemfile. To run the app fork the repo and in the command line: run rackup in your local directory or run it directly (ruby chitter.rb)


## Job List
* Test drive creation of app using rspec (kid of did this anyways)
* Create list of posts/peeps that can be viewed in chronological order - most recent first
* Create sign up form requesting user to sign up by entering their email address, name, a username, password and password confirmation in the sign up form (username and email must be unique)
* Create a log in form for those users that have already signed up - containing just username and password input fields
* Use bcrypt to secure the passwords
* Once you log in you can post a message to/on Chitter



## Still to complete/refactor
* Fix configuration issue/database issue - no data is being added to databases anymore - datamapper / postgres config issue?
* Add posts to /post page
* Show who has posted the message and at what time
* Add additional styling
* Peeps (posts to chitter) have the name of the maker and their user handle, as well as time peep was posted
* If you have time you can implement the following:

Extras to add
* In order to start a conversation as a maker I want to reply to a peep from another maker.
