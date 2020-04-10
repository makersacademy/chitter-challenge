Chitter Challenge
=================

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

Notes on functionality:
------

* You don't have to be logged in to see the peeps.
* Makers sign up to chitter with their email, password, name and a username (e.g. samm@makersacademy.com, password123, Sam Morgan, sjmog).
* The username and email are unique.
* Peeps (posts to chitter) have the name of the maker and their user handle.
* Your README should indicate the technologies used, and give instructions on how to install and run the tests.

Bonus:
-----

If you have time you can implement the following:

* In order to start a conversation as a maker I want to reply to a peep from another maker.

And/Or:

* Work on the CSS to make it look good.

Good luck and let the chitter begin!

Automated Tests:
-----

Opening a pull request against this repository will will trigger Travis CI to perform a build of your application and run your full suite of RSpec tests. If any of your tests rely on a connection with your database - and they should - this is likely to cause a problem. The build of your application created by has no connection to the local database you will have created on your machine, so when your tests try to interact with it they'll be unable to do so and will fail.

If you want a green tick against your pull request you'll need to configure Travis' build process by adding the necessary steps for creating your database to the `.travis.yml` file.

- [Travis Basics](https://docs.travis-ci.com/user/tutorial/)
- [Travis - Setting up Databases](https://docs.travis-ci.com/user/database-setup/)

Approach
--------

### 1st user story

```
As a maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order
```
Steps:
- write feature test
- pass feature test in simplest way using route and view
- refactor code to Peep class
- create databases
done

### 2nd user story

```
As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter
```
Steps:
- write feature test - done
- create maker table in db - done
- create sign up page - done
- link signup details to what is stored in db - done
- store current user id in session - done
- encrypt passwords in the db - done

### 3rd user story

```
As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter
```
Steps:
- write feature test
- create add-peep form page
- link form to correct route
- use Peep.create to put new peep in database
- reload peeps list


- add link between maker and peep tables
- amend peep creation so they store the maker id 
- show the maker details on the peeps list