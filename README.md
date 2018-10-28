# Chitter

## Description

This app is a simple Twitter clone created for Makers Academy using Sinatra and PostgreSQL and tested using RSpec and Capybara. The main focus of this project was to consolidate my learning about working with databases in a web application, and using RESTful routes to set-up CRUD functionality in a web app.

## How to Use

### Setup
* Fork and clone the repo.
* Run `bundle install`
* Run `rake setup`
* Run `rackup`
* Visit localhost:6789

### Use
* Click 'Sign Up' and enter your details to create an account.
* Click 'Sign Out' to sign out; click 'Sign In' and enter your details to sign back in again.
* Click 'View Profile' to see a profile page for the current user, with name and email address.
* Click 'New Peep' and 'Submit' to create a post.
  - Currently, it is not currently possible to create a peep with an apostrophe (''), as this causes an error when converted to an SQL string.
* On the home page (/peeps), you will see a list of posts ('peeps') in reverse chronological order, with the corresponding username and time.
* Click 'Edit' or 'Delete' beneath a peep to edit or delete it. These buttons will not appear unless you are signed in as the author of the peep.
* Tag another user in a peep by typing '@user' (where 'user' is their username). This text will show up on the main page as a hyperlink to that user's profile page.


## My Approach

* I maintained a separation of concerns via a Model-View-Controller structure in a modular Sinatra app.
  - complex logic is offloaded to the model
  - display statements and logic are handled in the views
  - routing is handled in the controller
* I used RESTful routing conventions, designing the routes of my app around key resources (peeps, users, sessions) and CRUD operations upon these.
* I aimed to follow principles of object oriented design in the model layer, limiting separate responsibilities to separate entities.
  - I recognise however that given more time, the model could no doubt be split into a greater number of more specialised classes and methods. This week, my focus was on database integration.
* I followed a test-driven development process throughout, first writing minimal feature tests before making them pass, and refactoring. Where the refactoring required the creation of classes and methods in the model, I first wrote unit tests for the different behaviours and then made these pass.

## Limitations

* If I had had more time, I would have gone on to
  - ensure a better adherence to the single responsibility principle in the model
  - refactored the controller into multiple controllers for different sets of routes
  - added the ability to comment on and reply to peeps
  - added a feature where users would receive an email notification upon being tagged in a peep
  - taught myself sufficient CSS to give the web app a more professional appearance
