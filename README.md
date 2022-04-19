Chitter Challenge
=================

I have created a small Twitter clone that allows the users to post messages to a public stream.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

What things do you need to install the software and how to install them
Clone this repository to your desired location, run the command `gem install bundler` then run `bundle`.\

### Installing

A step by step series of examples that tell you how to get a development env running

Say what the step will be

```
gem install bundler
```

And run

```
bundle
```
Set up `chitter` database and `chitter_test` databases using the queries located at `db/migrations`. Use all queries for the main `chitter` database .\

Features/user stories:
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

```

Technical Approach:
-----



Notes on functionality:
------

* You don't have to be logged in to see the peeps.
* Makers sign up to chitter with their email, password, name and a username (e.g. samm@makersacademy.com, password123, Sam Morgan, sjmog).
* The username and email are unique.
* Peeps (posts to chitter) have the name of the maker and their user handle.
* Your README should indicate the technologies used, and give instructions on how to install and run the tests.

