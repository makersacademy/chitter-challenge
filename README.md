Chitter Challenge
=================

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

Technical Approach:
-----

My first steps were to extract the verbs and nouns from the user story, then diagram the requirements and responsibilties for each class and method. I listed which SQL tables would be required, how they would interact with my application. 

I started with the following -


Class 
Chitter -
setup_user
find_user
authenticate_user
create_peep
all_peeps

User - 
Initialize
@ID
@Email


Peep
@ID
@Message
@Time

Using a BDD approach I built my application, first writing the feature tests, adding the integration tests and then working through a red, green, refactor technique to build out my application. Initially I was going to have the responsibilities across user and peep and then decided that by applying the spearation of concerns principle it would be best practice to split their methods into the Chitter.rb, thus keeping the peep and user classes specific to storing the attributed information. 

Motivation --
-----

To create a web application in the form of a popular social media application. The application allows users to sign-up, sign-in and sing out. Further functionality includes the ability to send 'peeps' (messages) with a timestamp to track exactly when it was sent. The application includes database persistence and sends data directly into two PSQL tables, one for the peeps and another for user details. The application also includes BCRPYT password encryption to add a layer of security for users to keep their details secure. 


Notes on functionality:
------

* You don't have to be logged in to see the peeps.
* Validation to stop users from signing up with an invalid email address, or password.

Code Review
-----------

* All tests passing
* High [Test coverage](https://github.com/makersacademy/course/blob/master/pills/test_coverage.md) (>95% is good)
* The code is elegant: every class has a clear responsibility, methods are short etc.

Automated Tests:
-----

Opening a pull request against this repository will will trigger Travis CI to perform a build of your application and run your full suite of RSpec tests. If any of your tests rely on a connection with your database - and they should - this is likely to cause a problem. The build of your application created by has no connection to the local database you will have created on your machine, so when your tests try to interact with it they'll be unable to do so and will fail.

If you want a green tick against your pull request you'll need to configure Travis' build process by adding the necessary steps for creating your database to the `.travis.yml` file.

- [Travis Basics](https://docs.travis-ci.com/user/tutorial/)
- [Travis - Setting up Databases](https://docs.travis-ci.com/user/database-setup/)

How to use notes -
----------------------

```
CREATE DATABASE chitter_challenge_test;
```

```
CREATE TEST DATABASE chitter_challenge;
```

To set up the appropriate tables, connect to the database in `psql` and run the SQL scripts in the `db/migrations` folder in the given order.
