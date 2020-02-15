### [Makers Academy](http://www.makersacademy.com) - Week 4 Weekend programming challenge 

# Chitter challenge 🐦

[Task](#Task) | [Installation Instructions](#Installation) | [Database setup](#Database) | [Functional Description](#Functional_Description) | [User Stories](#User_Stories) | [Domain Model](#Domain_Model) | [Objects & Methods](#Objects_&_Methods) | [Testing](#Testing) | [Further improvements](#Further_Improvements) |

![chitter](chitter.jpg)

## <a name="Task">The Task</a>

Write a small Twitter clone that will allow users to post messages to a public stream.

This challenge is the fourth weekend programming challenge at [Makers Academy](https://github.com/makersacademy).

## <a name="Installation">Installation Instructions</a>


1. Fork this repository, clone to your local machine then change into the directory:
```
$ git clone git@github.com:davmcgregor/chitter-challenge.git
$ cd chitter-challenge
```
2. Load dependencies with bundle:
```
$ gem install bundle
$ bundle
```
3. Run Rspec for tests and coverage, then rubocop for linting
```
$ rspec
$ rubocop
```
4. Run the app on a local server and use on the broswer: http://localhost:9292/

```Shell
$ rackup
```

## <a name="Database">Database setup</a>

1. Connect to psql
2. Create databases using the psql command CREATE DATABASE for ###### and ######;
3. Connect to the databases using the pqsl command \c #######;
4. Run the SQL scripts saved in the ####### folder in the given order;

Note: To set up the testing environment, create a test database and run the psql commands for both databases.

## <a name="Functional_Description">Functional Description</a>

The app will have the following specification:

* You don't have to be logged in to see the peeps.
* Makers sign up to chitter with their email, password, name and a username (e.g. samm@makersacademy.com, password123, Sam Morgan, sjmog).
* The username and email are unique.
* Peeps (posts to chitter) have the name of the maker and their user handle.
* The README should indicate the technologies used, and give instructions on how to install and run the tests.

## <a name="User_Stories">User Stories</a>

### STRAIGHT UP
```
As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter
```
```
As a maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order
```
```
As a Maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made
```
```
As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter
```

### HARDER
```
As a Maker
So that only I can post messages on Chitter as me
I want to log in to Chitter
```
```
As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter
```

### ADVANCED
```
As a Maker
So that I can stay constantly tapped in to the shouty box of Chitter
I want to receive an email if I am tagged in a Peep
```

## <a name="Domain_Model">Domain Model</a>

## <a name="Objects_&_Methods">Objects & Methods</a>

## <a name="Testing">Testing</a>

Tests were written with RSpec and Capybara. To run the tests in terminal: 

```bash
$ cd bookmarks-manager
$ rspec
```

## <a name="Further_Improvements">Further Improvements</a>

Implement the following: 
* In order to start a conversation as a maker I want to reply to a peep from another maker.
* Work on the CSS to make it look good.
