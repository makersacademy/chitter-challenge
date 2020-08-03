Chitter Challenge
=================

We are going to write a small Twitter clone that will allow the users to post messages to a public stream.

Features (Checklist):
-------

```
STRAIGHT UP

[X] 1. As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter

[X] 2. As a Maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order

[X] 3. As a Maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made

[X] 4. As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter

HARDER

[X] 5. As a Maker
So that only I can post messages on Chitter as me
I want to log in to Chitter

[X] So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter

ADVANCED

[ ] 6. As a Maker
So that I can stay constantly tapped in to the shouty box of Chitter
I want to receive an email if I am tagged in a Peep
```

Setting up database:
------
* Set up databases, using 01_database_creation.sql
* Add tables to both the test and the actual database using 02_setup_user_table.sql and 03_setup_peep_table.sql
* Interact with the databases via PG in the Database Connection class.


Notes on functionality:
------

* [X] You don't have to be logged in to see the peeps.
* [X] Makers sign up to chitter with their email, password, name and a username (e.g. dill@makersacademy.com, password123, Dillon Barker, dilfyg).
* [X] The username and email are unique.
* [ ] Peeps (posts to chitter) have the name of the maker and their user handle.
* [X] Your README should indicate the technologies used, and give instructions on how to install and run the tests.
