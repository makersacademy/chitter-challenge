Chitter Challenge
=================

Challenge:
-------

We are going to write a small Twitter clone that will allow the users to post messages to a public stream.

Features:
-------

```
STRAIGHT UP

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
```

Notes on functionality:
------
* You don't have to be logged in to see the peeps.
* Makers sign up to chitter with their email, password, name and a username (e.g. samm@makersacademy.com, password123, Sam Morgan, sjmog).
* The username and email are unique.
* Peeps (posts to chitter) have the name of the maker and their user handle.
* Your README should indicate the technologies used, and give instructions on how to install and run the tests.

Bonus:
-----

If you have time you can implement the following:

* In order to start a conversation as a maker I want to reply to a peep from another maker.

And/Or:

* Work on the CSS to make it look good.

Good luck and let the chitter begin!

## My approach

I have created 3 classes:
- DatabaseConnection - responsible for setting up a connection to database and creating sql queries;
- Peep - responsible for creating and displaying Peeps
- User - responsible for creating and displaying User information

User can sign up and start creating peeps. Peeps are displayed on homepage, in reverse chronological order, with time stamp and username at the bottom of each peep. User can also see peeps created by other users.
This task allowed me to solidify my understanding of how databases can interact with Ruby within a Sinatra application. I have also learnt how about Rakefile, and used it to set my database creation and destroy.

Application has 100% test coverage.

Areas for improvement:
- more styling with css
- proper sign up, log in and log out (currently user can but does not have to fill the sign up page)
- add comments functionality

## Instructions

Run
```
bundle install
```
Set up database
```
rake setup
```
Use rackup to open the app in the web browser
```
rackup config.ru
```
Enter the local-host into your web browser to start the game
```
http://localhost:9292
```
To destroy database
```
rake teardown
```
