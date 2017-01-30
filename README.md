# Chitter Challenge
### Makers Academy Weekend Challenge No.4

[![Build Status](https://travis-ci.org/KatHicks/chitter-challenge.svg?branch=master)](https://travis-ci.org/KatHicks/chitter-challenge) [![Coverage Status](https://coveralls.io/repos/github/KatHicks/chitter-challenge/badge.svg?branch=master)](https://coveralls.io/github/KatHicks/chitter-challenge?branch=master)

### Instructions

As usual, we were given from the end of the day on Friday until 9am on Monday to complete the challenge.

### Task

The task this weekend is to write a little Twitter clone that will allow the users to post messages to a public stream. It was requested that it satisfy the following user stories:

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

* Drive the creation of your app using tests - either cucumber or rspec as you prefer.
* Makers sign up to chitter with their email, password, name and a user name (e.g. sam@makersacademy.com, s3cr3t, Samuel Russell Hampden Joseph, tansaku).
* The username and email are unique.
* Peeps (posts to chitter) have the name of the maker and their user handle.
* Use bcrypt to secure the passwords.
* Use data mapper and postgres to save the data.
* You don't have to be logged in to see the peeps.
* You only can peep if you are logged in.

You can see the full task and instructions given to us in [CONTRIBUTING.md](chitter-challenge/CONTRIBUTING.md).

### Using my application

* You can view my app online here at [https://chitter-exercise.herokuapp.com/](https://chitter-exercise.herokuapp.com/).
* You will need to sign up to access the full functionality of the app

### Dependencies

* Written using **Ruby 2.3.3** and the **Sinatra** web framework
* Testing using **RSpec** and **Capybara**
* Built on a **PostgreSQL** database using **DataMapper** as the ORM
* Used **Timecop** gem to mock time within the tests
* Deployed using **Heroku**

### Steps in my development process

* **Setting up my README.md structure**
  * Started off by setting up the structure of this document so that can note down my steps and dependencies throughout the development process
  * Also a useful way of familiarising myself with the required specifications before starting
* **Setting up initial app structure**
  * Created `app.rb`, `index.erb` and `config.ru` and checked that app runs locally
  * Had an issue with initialising it all automatically in the command line so set it up manually
* **Dealt with user sign up**
  * Wrote feature test first using Capybara
  * Dealt with user sign up by creating a User class
* **Started styling**
  * Loaded in Bootstrap to project and linked it into pages using a layout.erb
  * Created a standard header for all pages with branding and buttons
* **Added sign in functionality**
  * Added sign in form and then inserted account authentication into User model
  * Created a statement in the header that says 'Logged in as <name>' to make it clearer who is signed in and also to facilitate extra tests in Capybara
* **Posting a peep and viewing in reverse chronological order**
  * I'd not been able to get to sign-out functionality in the week's challenge so decided to skip ahead in the user stories and deal with posting peeps first - seemed better psychologically to have more features under my belt before dealing with the new stuff
  * Created a Peep model and added properties - discovered that there is a built in `created_at` property which could be used for timestamps
  * Added in a one-to-many relation with User so that User `has n, :peeps`
  * Discovered that you could use `@peeps = Peep.all.reverse` to view peeps in reverse chronological order
* **Adding log out functionality**
  * Used a hidden input in log out form to allow for a delete route in Sinatra: `<input type='hidden' name='_method' value='delete'>`
* **Developed styling**
  * Used bootstrap templates for the sign up and log in forms
  * Used a Google font for the brand in the header
  * Used bootstrap favicons for the sign up and log in buttons in the header
* **Added preview of peeps on the homepage**
  * Next moved on to dealing with previewing peeps on the homepage
  * The additional notes on functionality note that you should not need to be logged in to view the peeps
  * Decided to filter the peeps so that only the latest four are visible on the homepage (quite a common approach so that signing up still has advantages)
  * Figured out that you can filter by quantity in Datamapper using the following code: `@peeps = Peep.all(limit: 4, order: [ :created_at.desc ])`
* **Deployed on Heroku**
  * Added a Procfile to the project and deployed on Heroku using a hobby-dev database.
  * You can see the project online through the URL above
* **Refactored and extended account validation**
  * Next developed the error messages for account validation in sign up
  * Have five conditions for successful sign up; username must be unique, email must be unique, email must be valid, email is required and password & confirmation password must match
  * Used the built in error object in datamapper and the `full_messages` method to access an array of custom error messages added into the User model
* **Refactored to use RESTful routing**
  * Currently routes are very poorly designed - having essentially prioritised getting the app to work
  * Did some reading into the logic, history and application of RESTful routing and have redesigned my routing and views file structure to be more RESTful in its design

### Ideas for extension

* **Finish styling**
  * Made good progress over the weekend with styling but it is not finished
  * Particularly want to work out how to style flash error messages
* **Refactor logic to create a skinny controller**
  * Currently code is written to just make the code work
  * I'd like to improve the design of the code so that it is more clean
* **Use JQuery to create a character limit countdown**
  * I've limited the textarea field for the peeps to 140 characters so that it is the same as Twitter
  * I'd like to introduce a visible character count down so that the user knows how many characters that they have remaining
  * I've done some initial research and looks that this would require using JQuery
* **Introduce 'tweet and reply' bonus feature**
  * As part of the task, we were given a bonus 'tweet and reply' feature
