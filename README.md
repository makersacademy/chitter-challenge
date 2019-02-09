Chitter Challenge [![Build Status](https://travis-ci.org/AlinaGoaga/Chitter_TwitterClone.svg?branch=master)](https://travis-ci.org/AlinaGoaga/chitter-challenge)
=================

A few snapshots of how the app looks like:
-------

**Home page**

![Image-of-application](https://github.com/AlinaGoaga/Chitter_TwitterClone/blob/master/app/assets/images/Home%20page%20Chitter.jpeg)

**Individual peep page and comments**

![Image-of-application](https://github.com/AlinaGoaga/Chitter_TwitterClone/blob/master/app/assets/images/Show%20page%20Chitter.jpeg)

**Adding a new peep**

![Image-of-application](https://github.com/AlinaGoaga/Chitter_TwitterClone/blob/master/app/assets/images/Screen%20Shot%202019-01-13%20at%2022.46.25.png)

User stories:
-------

```
As a user
So that I can let people know what I am doing  
I want to post a message (peep) to chitter
```
```
As a user
So that I can see what others are saying  
I want to see all peeps in reverse chronological order
```
```
As a user
So that I can better appreciate the context of a peep
I want to see the time at which it was made
```
```
As a user
So that I can post messages on Chitter as me
I want to sign up for Chitter
```
```
As a user
So that only I can post messages on Chitter as me
I want to log in to Chitter
```
```
As a user
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter
```
```
As a user
So that I can start a conversation
I want to comment on other user's peeps
```
To run this app:
-----

1. clone the repository and cd into the project
2. create the databases in psql:
* CREATE DATABASE chitter_development
* CREATE DATABASE chitter_test
3. run rake db:migrate to create the tables
4. run rails s to start the server
5. visit http://localhost:3000 to view the application in the browser

Technical approach
-----

* This application is built in Rails and uses Active Record to interact with the database. Rails includes sqlite by default - the app has been updated to use postgreSQL.
* Devise was implemented to handle user management (sign up, in, out).
* Bootstrap has been used for styling.

Notes on test coverage and continuous integration
-------------------------------------------------
* Capybara and Rspec have been used to build feature tests. All tests are passing.
* Test coverage is 98.95%.
* Travis CI has also been set up and is passing.
