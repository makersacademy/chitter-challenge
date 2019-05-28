Chitter
--------------------
--------------------

A small Twitter-like clone that allows users to post messages as 'peeps'

Features
--------

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
```


Setting up a database
----------------------

* Connect to psql
* Create the database using the psql command CREATE DATABASE chit;
* Connect to the database using the pqsl command \c chit;
* Run all the queries saved in the sql files 01_create_peeps_table.sql to 05 add_name.sql

Features not yet implemented
-----------------------------

Only one user can currently use this version of Chitter at any one time. I will need to implement log in and log out functionality to allow multiple users to post their own peeps to Chitter and allow these peeps to belong only to those who posted them. To tackle this, I will need to set up some method of authentication that will allow the user to log in only if the username/email and password are correct.

COVERAGE:  95.45%

2 Unit Test failures due to underfined method, however the method appears to be functioning as expected by showing user handles on the web app. This could be because I have returned nil in line 28 of user.rb (if no ID is given). I have checked the database and the User ID is present following a new sign-up to Chitter. I will need to investigate this error further!

```
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
