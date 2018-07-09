# Chitter Challange

___

## Summary

Week 4 Makers Academy weekend project to develop a Twitter clone, called Chitter.</br>
[Full instructions and user stories here.](https://github.com/makersacademy/chitter-challenge)
___

## Credits

Developed solo by Elishka Flint, with feedback from Daniel Jones during the Monday morning code review.
___

## Learning Outcomes

### Topics Covered

* Web applications using databases (including one-to-many and many-to-many relationships)
* RESTful routes
* The MVC model
* Test-Driven Development using Rspec and Capybara
* Object-Oriented Programming
  - classes, methods, scope, instance variables
  - ensuring code is DRY
  - using Single Responsibility Principle

### Personal Reflection

This project was useful to consolidate everything learnt during a busy week 4 at Makers. I progressed through the user stories relatively comfortably and feel more confident with the MVC model than I did at the end of the week.

___

## State of Completion

### Implemented Functionality

#### Front-end
* Sign up, log in (with authentication), password encryption, stream of tweets with time stamp and username
* Flash messages (confirmations and errors) eg. on successful log in or attempting to sign up with an email which is already registered
* Formatted using CSS
* 91% test coverage (excluding rakefile and database connection module)

#### Back-end
* Databases to hold users and tweets
* Classes to wrap data extracted from each database
* Module for database connection in test and development environment
* Rakefile to automate database tasks (set up, reset, teardown)

### What I would do next

* Move some of the longer if statements in the controller to the model
* Guard against blank inputs when signing up
* Ensure user submits a valid email address (check formatting using regex)
* Full test isolation between classes
* Add hashtag functionality using a many-to-many database relationship
* Move database connection functions from module to full class
* Tidy up CSS styling!!

___

## Technical

### Tech/Frameworks Used

Ruby, Sinatra, HTML, CSS, RSpec, Rubocop, Capybara, Rackup, PostgreSQL, Rake

### Launching the Application

```
$ git clone https://github.com/elishkaflint/chitter-challenge.git
$ bundle
$ rake dev_database_reset
$ rackup config.ru
```
____
