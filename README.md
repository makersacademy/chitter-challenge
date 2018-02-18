# Chitter Challenge

Completed this as fourth weekend challenge at Makers Academy

This program emulates Twitter, allowing users to post messages to a public stream


## How to use

1. Use Ruby 2.5.0. In addition, this program requires you to have PostgreSQL on your machine. To download this with Homebrew, run ```brew install postgresql``` and follow the instructions.
2. Clone this repo
3. Install bundle gem with ```gem install bundler``` in the console (skip this if already installed)
4. Run ```bundle install``` to install the required gems
5. Run ```rake setup``` to setup the required databases
5. Run ```rackup```
6. In a web browser, visit the localhost port displayed in the console. Follow the instructions in the web browser

* When finished, run ```rake teardown``` to delete your own local databases used for this program

### To test code

* Run ```rspec``` in terminal

## Task

We are going to write a little Twitter clone that will allow the users to post messages to a public stream.

Features:

```
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

## My approach

1. First I wrote feature tests which satisfied the user stories. I implemented the features one-by-one, writing the necessary code to pass a feature test before moving on and implementing the next feature. 

2. Having written and failed the initial feature tests, I proceeded to write the least code possible to pass these tests. At first, this mostly involved writing code in the controller and view levels.

3. Once it was clear that the program needed some Ruby objects to keep the views and controller as skinny as possible, I wrote some unit tests for namely for the  Peep and User classes. I then wrote the code to pass these tests.

4. When it was clear that I needed to use a database to store the Peeps, I setup my database environment with the Ruby PG gem, which requires you to communicate with the database with SQL query terms.


## Key learnings

* Test-driving advanced Objects in Ruby, including adapter, wrapper, and service objects, namely ORMs
* Implementing a RESTful routing convention
* Using psql and the PG ruby gem to connect to a local database. Implementing SQL query terms like `SELECT`, `FROM`, `WHERE`, `*`.
* Using Rake to automate tasks (in this case, setting up databases)

## To complete

* Harder user stories are below to complete when there is time
```
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
```
