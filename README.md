Chitter Challenge
=================

Features:
-------
```sh
As a user
So that I can post messages on Chitter as me
I want to sign up for Chitter

As a user
So that I can post messages on Chitter as me
I want to log in to Chitter

As a user
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter

As a user
So that I can let people know what I am doing  
I want to post a message (peep) to chitter

As a user
So that I can see what others are saying  
I want to see all peeps in reverse chronological order

As a user
So that I can better appreciate the context of a peep
I want to see the time at which it was made

As a user
So that I can start a conversation with other users
I want to reply to a peep
```

Notes on functionality:
------

* Please ensure that you update your README to indicate the technologies used, and give instructions on how to install and run the tests

Bonus:
------

If you have time you can implement the following:

* In order to start a conversation as a user I want to reply to a peep from another user.

And/Or:

* Work on the css to make it look good (we all like beautiful things).

Installation:
------
```
git clone https://github.com/hibreez/chitter_challenge
bundle
createdb chitter_development
rake db:auto_migrate
rspec
rackup
```
