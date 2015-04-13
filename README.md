Fridgedoor
==========

Fridgedoor is an online messaging site which allows users to post messages for others to see - just how you would use your fridge door in the real world.

[![Build Status](https://travis-ci.org/james-miller/chitter-challenge.svg)](https://travis-ci.org/james-miller/chitter-challenge)

Url for this site: [https://fridgedoor.herokuapp.com](https://fridgedoor.herokuapp.com)

User stories - base requirements
--------------------------------

```sh
As a user
So that I can post messages on Fridgedoor as me
I want to sign up for Fridgedoor

As a user
So that I can post messages on Fridgedoor as me
I want to log in to Fridgedoor

As a user
So that I can avoid others posting messages on Fridgedoor as me
I want to log out of Fridgedoor

As a user
So that I can let people know what I am doing  
I want to post a message (note) to Fridgedoor

As a user
So that I can see what others are saying  
I want to see all notes in reverse chronological order
```

User stories - desirable objectives
-----------------------------------

```sh
As a user
So that I can have conversations with people
I want to be able to reply to a note from someone else

As a user
So that I can add my voice to a certain topic
I want to be able to add tags to my notes
```

Further spec
------------

* Users can sign up once with their email
* Users have a unique handle
* Notes include their author's name and handle
* Notes can be seen when not logged in
* You cannot post a note if not logged in
* Site should look awesome

Technologies to implement
-------------------------

Testing
* RSpec, Capybara

User accounts
* BCrypt

Data management
* DataMapper
