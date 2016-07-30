![Sh*tter](https://github.com/twilliams1988/chitter-challenge/blob/master/sh-tter_logo.jpg =250x "Sh*tter")

Sh*tter
=================

Like Twitter, but Sh*tter.

This is my attempt to write a little Twitter clone that will allow the users to post messages to a public stream.

Features:
-------

```
As a Maker
So that I can post messages on Sh*tter as me
I want to sign up for Sh*tter

As a Maker
So that I can post messages on Sh*tter as me
I want to log in to Sh*tter

As a Maker
So that I can avoid others posting messages on Sh*tter as me
I want to log out of Sh*tter

As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to Sh*tter

As a maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order

As a maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made
```

Notes on functionality:
------

* Drive the creation of your app using tests - either cucumber or rspec as you prefer
* Makers sign up to Sh*tter with their email, password, name and a user name (e.g. sam@makersacademy.com, s3cr3t, Samuel Russell Hampden Joseph, tansaku).
* The username and email are unique.
* Peeps (posts to Sh*tter) have the name of the maker and their user handle.
* Use bcrypt to secure the passwords.
* Use data mapper and postgres to save the data.
* You don't have to be logged in to see the peeps.
* You only can peep if you are logged in.
* Please ensure that you update your README to indicate the technologies used, and give instructions on how to install and run the tests
* Finally submit a pull request before Monday at 9am with your solution or partial solution.  However much or little amount of code you wrote please please please submit a pull request before Monday at 9am

Bonus:
-----


* In order to start a conversation as a maker I want to reply to a peep from another maker.

* Work on the css to make it look good (we all like beautiful things).
