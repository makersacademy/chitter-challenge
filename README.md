Chitter Challenge
=================

Installation
-------

```
$ git clone https://github.com/Hyan18/chitter-challenge
$ bundle
$ rake setup
$ rspec
$ rackup
```

Functionality
-------

Makers sign up to chitter with their email, password, name and a username and then can make Peeps (post messages). Anyone can see all peeps, even those that are signed out.

User Stories
-------

```
As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter

As a Maker
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

Areas of improvement
-----

If I had more time I would have:

* Implemented an ORM
* Work on the CSS to make it look good
* Implemented the below additional user stories

```
As a Maker
So that I can stay constantly tapped in to the shouty box of Chitter
I want to receive an email if I am tagged in a Peep

As a Maker
In order to start a conversation
I want to reply to a peep from another maker
```
