Chitter Challenge
=================

Welcome to Chitter! The only social network created exclusively for Makers students. With this web application you can sign up for an account and post your own updates, or Peeps, for others at Makers to see. A little birdy told me Chitter is the place to be!

Features:
-------

Chitter currently enables its users to fulfill the following user stories:

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

As a Maker
So that only I can post messages on Chitter as me
I want to log in to Chitter

As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter

```
It also incorporates the below functionality:
* You don't have to be logged in to see the peeps.
* Makers sign up to chitter with their email, password, name and a username (e.g. samm@makersacademy.com, password123, Sam Morgan, sjmog).
* The username and email are unique.
* Peeps (posts to chitter) have the name of the maker and their user handle.

Still to come:

```
As a Maker
So that I can stay constantly tapped in to the shouty box of Chitter
I want to receive an email if I am tagged in a Peep
```

Technical Approach:
-----

Chitter has been built using a `Postgres` database which is accesed through the `ActiveRecord` ORM. The Web App is founded on Sinatra.

Installation:
------

- Requirements:

 1. Ruby and RVM, please see https://rvm.io/rvm/install for installation instructions
 2. PostgreSQL, please see http://www.postgresqltutorial.com/install-postgresql/ for installation instructions

- Setup:

Once your system has the above requirements installed, from your command line move to your project directory and run the following commands.

 1. To clone the repo:

```
 $ git clone git@github.com:rednblack99/chitter-challenge.git
 $ cd chitter-challenge
 $ bundle install
```

 2. To set up the databases and database tables:

 ```
 $ psql
 CREATE DATABASE chitter_development;
 CREATE DATABASE chitter_test;
 \q
 $ rake db:migrate
```

 3. Run locally:

```
 $ rackup
```

 4. Visit Chittter on the browser of your choice at localhost:9292
 
 Bonus. To run the tests:
 
 ```
 $ rspec
 ```

Status:
-----

Currently Chitter is fully functional, passing all tests with 100% coverage and no Rubocop offences.

Modelling
-----------

The below screenshot shows the model used to design Chitter's functionality. Built using Draw.io:

![Chitter Model](https://i.imgur.com/rG4ajya.png) 

Reviewers will potentially be using this [code review rubric](docs/review.md).  Referring to this rubric in advance may make the challenge somewhat easier.  You should be the judge of how much challenge you want this weekend.

Screenshots
----------------------

The below screenshots (taken in Ruby) demonstrate how Chitter should display within your browser:

![Chitter Homepage](https://i.imgur.com/eaklB8N.png)
![Chitter Signup](https://i.imgur.com/A5OzqGx.png)
![Chitter Profile](https://i.imgur.com/Ovg2YF6.png)
