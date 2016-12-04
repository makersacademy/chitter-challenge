Chitter Challenge
=================

The challenge is to write a little Twitter clone that will allow the users to post messages to a public stream.

User stories:
-------

```
As a user of Chitter
So that I can post messages on Chitter as me
I want to sign up for Chitter

As a user of Chitter
So that I can post messages on Chitter as me
I want to log in to Chitter

As a user of Chitter
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter

As a user of Chitter
So that I can let people know what I am doing  
I want to post a message (peep) to chitter

As a user of Chitter
So that I can see what others are saying  
I want to see all peeps in reverse chronological order

As a user of Chitter
So that I can better appreciate the context of a peep
I want to see the time at which it was made
```

Notes on functionality:
------

* Drive the creation of your app using tests - either cucumber or rspec as you prefer
* Users sign up to chitter with their email, password, name and a user name.
* The username and email are unique.
* Peeps (posts to chitter) have the name of the user and their user handle.
* Bcrypt is used to secure passwords.
* DataMapper and PostgreSQL are used to save data.
* Users don't have to be logged in to see the peeps.
* Users only can peep if you are logged in.

Bonus user stories:
-----

```
In order to start a conversation as a user I want to reply to a peep from another user.

Work on the css to make it look good (we all like beautiful things).
```
