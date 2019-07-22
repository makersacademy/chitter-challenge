Chitter Challenge
=================

Makers Challenge Week 4:

We are going to write a small Twitter clone that will allow the users to post messages to a public stream.

The following app allows you to sign up by entering username, email and password.
The app has a full functionality to post a peep and able to show date and time in reversed order chronological.

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

Creating two Postgresql Databases, one for production and one for test (chitter, chitter_test).
Creating two tables in each Database: accounts and messages.

Two classes Peeps and Accounts.

Peeps class methods:

.connection
.all
.create
#id
#peep
#time

Accounts class methods:

.connection
.create
#id
#username
#email
#password


![GitHub Logo](/images/Screenshot 2019-07-22 at 10.37.12)
