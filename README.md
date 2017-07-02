Chitter Challenge
=================

Challenge:
-------

Write a little Twitter clone that will allow the users to post messages to a public stream.

Implemented features:
-------

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
```


Instructions
-----------
```
$ git clone https://github.com/MarySalemme/chitter-challenge.git
$ bundle
$ createdb chitter_development
$ rspec
$ rackup
```

Usage
-----------
https://chitter-ms.herokuapp.com/users/new
* Sign up
<img src="http://i.imgur.com/OTEwjHm.png" alt="New user">

* Sign in
<img src="http://i.imgur.com/LYEvwoG.png" alt="Existing user">

* Post a new peep
<img src="http://i.imgur.com/CeMl08R.png" alt="New peep">

* See new peeps first and at what time they've been created
<img src="http://i.imgur.com/Tvx1W5Z.png" alt="See peeps">


Running tests
----
Type `rspec` in the command line

**Overall test coverage: 100%**

Technologies used
----

Ruby, Sinatra, Rspec, Capybara, HTML

Next steps
----
- Implementing the remaining user stories:  

```
As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter  

As a Maker
So that I can stay constantly tapped in to the shouty box of Chitter
I want to receive an email if I am tagged in a Peep
```

- Work on the CSS
