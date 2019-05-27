Chitter Challenge
=================


Challenge:
----------

This project is a small Twitter clone that will allow the users to post messages to a public stream.

User stories/Features:
----------------------

```
STRAIGHT UP

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
------------------

Tests passing with Rspec, however on launching the app, it does not allow to post a peep, displaying an error. The error comes from the peeps.erb file.

Further, I had planned to setup up the registration process, bring the list of peeps on the main page, and further add CSS.

To run the app:
---------------
```
$ bundle install
```

Setup databases: chitter and chitter_app:
```
CREATE DATABASE chitter;

CREATE DATABASE chitter_test;
```
 
```
CREATE TABLE peeps (id, content, created_at) VALUES ('id' SERIAL PRIMARY KEY, 'content' TEXT, 'created_at' TIMESTAMP)
``` 
Do this for both the main database, as well as for the test one.




