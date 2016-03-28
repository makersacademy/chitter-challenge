Chitter Challenge
=================

Challenge:
----------

To write a little Twitter clone (aka Chitter) that will allow the users to post messages to a public stream.

Features:
-------

```

User Story 1 (US1)
As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter

User Story 2 (US2)
As a Maker
So that I can post messages on Chitter as me
I want to log in to Chitter

User Story 3 (US3)
As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter

User Story 4 (US4)
As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter

User Story 5 (US5)
As a maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order

User Story 6 (US6)
As a maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made
```


Installation and use
----------------------

Technologies
------------



Notes on functionality:
------

* Drive the creation of your app using tests - either cucumber or rspec as you prefer
* Makers sign up to chitter with their email, password, name and a user name (e.g. sam@makersacademy.com, s3cr3t, Samuel Russell Hampden Joseph, tansaku).
* The username and email are unique.
* Peeps (posts to chitter) have the name of the maker and their user handle.
* Use bcrypt to secure the passwords.
* Use data mapper and postgres to save the data.
* You don't have to be logged in to see the peeps.
* You only can peep if you are logged in.
* Please ensure that you update your README to indicate the technologies used, and give instructions on how to install and run the tests

Future Features
-------
* Max character length of each peep is 140

Author
------

Hanif Fakira
