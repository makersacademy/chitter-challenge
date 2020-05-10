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

Notes on functionality:

* You don't have to be logged in to see the peeps.
* Makers sign up to chitter with their email, password, name and a username (e.g. samm@makersacademy.com, password123, Sam Morgan, sjmog).
* The username and email are unique.
* Peeps (posts to chitter) have the name of the maker and their user handle.
* Your README should indicate the technologies used, and give instructions on how to install and run the tests.:



```

Domain Model (RESTFUL Approach)::

GET /                      |-Sign in button 

GET /chitter               |-Shows peeps

GET /chitter/post_message  |-Form that POST's 
                              > Text input named 'peep'
                              > Submit button

POST /chitter/post_message |- Saves the peep as a param  
                            - redirects to /chitter


Databases:
--------

Users 
      ID
      Email 
      Password

Peep_record 
            ID 
            Forgein Key (user ID)
            Peep Text 
            Time posted 

Tags? 


Database Instructions:
------

Chitter Database:
1. Create database with psql command CREATE DATABASE 'chitter'
2. Run the query we have saved in the file 01_create_chitter_user_table.sql
3. Run the query we have saved in the file 02_create_peep_record_table.sql

Chitter_test database:
1. Create database with psql command CREATE DATABASE 'chitter_test'
2. Run the query we have saved in the file 01_create_chitter_user_table.sql
3. Run the query we have saved in the file 02_create_peep_record_table.sql

*


Technical Approach:
-------

Using PG/ SQL to intergrate a database withing a Object Relational Mapper.


Code Review
-----------

In code review we'll be hoping to see:

* All tests passing
* High [Test coverage](https://github.com/makersacademy/course/blob/master/pills/test_coverage.md) (>95% is good)
* The code is elegant: every class has a clear responsibility, methods are short etc.

Reviewers will potentially be using this [code review rubric](docs/review.md).  Referring to this rubric in advance may make the challenge somewhat easier.  You should be the judge of how much challenge you want this weekend.

Automated Tests:
-----

Opening a pull request against this repository will will trigger Travis CI to perform a build of your application and run your full suite of RSpec tests. If any of your tests rely on a connection with your database - and they should - this is likely to cause a problem. The build of your application created by has no connection to the local database you will have created on your machine, so when your tests try to interact with it they'll be unable to do so and will fail.

If you want a green tick against your pull request you'll need to configure Travis' build process by adding the necessary steps for creating your database to the `.travis.yml` file.

- [Travis Basics](https://docs.travis-ci.com/user/tutorial/)
- [Travis - Setting up Databases](https://docs.travis-ci.com/user/database-setup/)

Notes on test coverage
----------------------

Extra Features: 

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

Bonus:
-----

If you have time you can implement the following:

* In order to start a conversation as a maker I want to reply to a peep from another maker.

And/Or:

* Work on the CSS to make it look good.

Good luck and let the chitter begin!