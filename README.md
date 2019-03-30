# Project title

'Chitter' is the weekend challenge after the fourth week at Makers Academy Bootcamp. It is a small Twitter clone that will allow the users to post messages to a public stream.

### Motivation

This project was a stretch challenge to develop on my software development skills. It implements pretty much all the skills intensively taught so far, including the construction of a web app, with attached database via TDD methodology. It will be a significant challenge to complete, and will hopefully provide a signifcant learning experience.

### Build status

The project is currently under construction, it may not be completed as this is a practice exercise to build on my skills. 

 
### Screenshots

XXXXXXXXXXXXXXXXX I maybe want to include photos of the class diagrams and system diagrams here? Or a screenshot of the landing page?

### User Stories

1) As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter

2) As a maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order

3) As a Maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made

4) As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter

HARDER

As a Maker
So that only I can post messages on Chitter as me
I want to log in to Chitter

As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter

ADVANCED

As a Maker
So that I can stay constantly tapped in to the shouty box of Chitter
I want to receive an email if I am tagged in a Peep

Bonus: if i get time.

As a Maker
In order to start a conversation as a maker 
I want to reply to a peep from another maker.


## Tech / framework used

An apple macbook was used to write code using VSCode as an editor and; 

* Ruby was used as the main language. =
* RSpec used for testing.
* PG gem was used to integrate SQL database with Ruby.
* Capybara was used for testing. 
* HTML and CSS. 

An [Object Relational Mapper](https://en.wikipedia.org/wiki/Object-relational_mapping) will be used as the database interface if I get time to implement. 


### Code style

Rubocop 0.65.0 was used for linting and stylying the Ruby code. 

### Tests

A TDD process was used in the development of this project, please see the attached RSpec files for details of the testing that was carried out. 

## Installation

Ruby v 2.5.0 was used in the construction of the project, if gems were used, please find attached a gem file listing those gems for installation. 

## API Reference

No API used in this project. 

## How to use?

You should be able to run the code via irb. 

## Notes

Some useful resources:
**DataMapper**
- [DataMapper ORM](https://datamapper.org/)
- [Sinatra, PostgreSQL & DataMapper recipe](http://recipes.sinatrarb.com/p/databases/postgresql-datamapper)

**ActiveRecord**
- [ActiveRecord ORM](https://guides.rubyonrails.org/active_record_basics.html)
- [Sinatra, PostgreSQL & ActiveRecord recipe](http://recipes.sinatrarb.com/p/databases/postgresql-activerecord?#article)

Notes
------
* You don't have to be logged in to see the peeps.
* Makers sign up to chitter with their email, password, name and a username (e.g. samm@makersacademy.com, password123, Sam Morgan, sjmog).
* The username and email are unique.
* Peeps (posts to chitter) have the name of the maker and their user handle.
* Your README should indicate the technologies used, and give instructions on how to install and run the tests.

Opening a pull request against this repository will will trigger Travis CI to perform a build of your application and run your full suite of RSpec tests. If any of your tests rely on a connection with your database - and they should - this is likely to cause a problem. The build of your application created by has no connection to the local database you will have created on your machine, so when your tests try to interact with it they'll be unable to do so and will fail.

If you want a green tick against your pull request you'll need to configure Travis' build process by adding the necessary steps for creating your database to the `.travis.yml` file.

- [Travis Basics](https://docs.travis-ci.com/user/tutorial/)
- [Travis - Setting up Databases](https://docs.travis-ci.com/user/database-setup/)

## Credits

Full credit given to Makers Academy who suggested the project. 

No contributions are required at this time, as this is a training exercise.