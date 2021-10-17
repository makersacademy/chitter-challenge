Anthony's Chitter Challenge
=================
[Readme adapted from here](https://github.com/makersacademy/chitter-challenge)

* Feel free to use Google, your notes, books, etc. but work on your own
* If you refer to the solution of another coach or student, please put a link to that in your README
* If you have a partial solution, **still check in a partial solution**
* You must submit a pull request to this repo with your code by 9am Monday morning

Introduction
-------

My solution to the Makers Academy Week 4 Chitter Challenge.


Setting up  
-----  

* To create the databases necessary, please create a database named `peeps` and `peeps_test`.  
* Then run the SQL found in:  

```
./db/01_create_peep_table.sql
./db/02_add_times.sql
./db/03_create_user_db.sql

```

* run `bundle install`  
* run `rspec` to run tests, `rubocop` to check code quality  
* run `rackup` to start server

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

```
The above were completed in this attempt for the project.  

<img src="./model_user_1.png" width="600" height="250">

```

As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter

ADVANCED

As a Maker
So that I can stay constantly tapped in to the shouty box of Chitter
I want to receive an email if I am tagged in a Peep
```

The above I would have liked to attempt had I had more time - plus, I would have liked to implement a lot of the features that were specified in the 'notes on functionality, including:

* sign up with name and email
* username and email are unique
* peeps have the name of the maker alongside their handle

Code Review
-----------

In code review we'll be hoping to see:

* All tests passing
* High [Test coverage](https://github.com/makersacademy/course/blob/main/pills/test_coverage.md) (>95% is good)
* The code is elegant: every class has a clear responsibility, methods are short etc.
