Chitter-Challenge
==================

Task
-------
We are going to write a small Twitter clone that will allow the users to post messages to a public stream.

* You don't have to be logged in to see the peeps.
* Makers sign up to chitter with their email, password, name and a username (e.g. samm@makersacademy.com, password123, Sam Morgan, sjmog).
* The username and email are unique.
* Peeps (posts to chitter) have the name of the maker and their user handle.
* Your README should indicate the technologies used, and give instructions on how to install and run the tests.

Work on this challenge as conclusion of week 4, to work towards these goals:

* I version-control my projects
* I use a methodical approach to solving problems
* I test-drive my code
* I can work to a specification
* I create effective documentation
* I can design and build user interfaces
* I can write standards-compliant, clean object-oriented code

Instructions to run this at home
-----
```sh
$ git clone git@github.com:fbl11/chitter-challenge.git
$ cd chitter-challenge
$ bundle install
$ shotgun -p 4567
```
go to http://127.0.0.1:4567/ in your browser

STATUS
-----

Controller
includes
- chitter_app.rb
- 
- 

Views
both
- 

Model
includes
- 
- 
- 

Rubocop / test coverage

**Notes**
```
```

**TO DO**

- 

Notes on use
------------------
```
```

User stories
-----
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

* When the user visits the '/peeps' path, their browser sends a request to a controller we built.
* When the controller gets the request, it asks the Peep class to give it all the peeps, i.e. the controller asks for Peep.all.
* The Peep class goes and gets the peeps, and gives back all the peeps in an array? to the controller.
* The controller renders the array? of peeps to a webpage, which it sends as a response to the user
* The user presses 'add peep' to add a new peep
* The user submits their peep through a text form and clicks submit
* The controller gets the post request and stores the peep in the Peep class



Author
-----
Freya Becker [fbl11](https://github.com/fbl11/)
