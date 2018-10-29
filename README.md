Chitter Challenge
=================

We are going to write a small Twitter clone that will allow the users to post messages to a public stream.

* [Features:](#features-)
* [Notes on functionality:](#notes-on-functionality-)
* [My approach](#my-approach)
* [Test Results](#test-results)
* [Setup instructions](#setup-instructions)
  + [Database setup](#database-setup)
  + [To run the Chitter app:](#to-run-the-chitter-app-)
  + [To run tests:](#to-run-tests-)
  + [To run linting:](#to-run-linting-)

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

BONUS

As a Maker
SO that I can start a conversation
I want to reply to a peep from another maker.

```

Notes on functionality:
------

* You don't have to be logged in to see the peeps.
* Makers sign up to chitter with their email, password, name and a username.
* The username and email are unique.
* Peeps (posts to chitter) have the name of the maker and their user handle.

## My approach

I was able to get through all the user stories including the harder, advanced and bonus.

I also did my best to use css to style the page and while it's not perfect it's a good start.

For the replying user story I would have preferred to have done something that would thread the messages but I settled for adding a link that will take you to the message it was replying too.

Also, escaping apostrophe's in the database I wasn't sure on - I know you can usually replace them with '' but I think there is a better way that I didn't have time to get working so I will live with it as it is - just don't use apostrophes :-)

I am using the Pony gem for emails - I tested this and it worked and checked for tagged users.  You can tag users with an @ symbol in front of their username.

## Test Results
`100% coverage`

`100% Rubocop pass`

## Setup instructions

### Database setup

Connect to `psql` and create the `chitter_test` and `chitter_test` databases:
 ```
CREATE DATABASE chitter;
CREATE DATABASE chitter_test;
```
To set up the appropriate tables, connect to each database in `psql` and run the SQL scripts in the `db/migrations` folder in the given order.

### To run the Chitter app:

  ```
 rackup -p 3000
 ```

 To view chitter, navigate to `localhost:3000/`.

### To run tests:

 ```
 rspec
 ```

 ### To run linting:

 ```
 rubocop
 ```
