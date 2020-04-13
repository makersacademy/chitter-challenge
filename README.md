Chitter Challenge
=================
A simple version of something that rhymes with Chitter.
Includes database for 'peeps' and users.

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
Notes on desired functionality:
------

* You don't have to be logged in to see the peeps.
* Makers sign up to chitter with their email, password, name and a username (e.g. samm@makersacademy.com, password123, Sam Morgan, sjmog).
* The username and email are unique.
* Peeps (posts to chitter) have the name of the maker and their user handle.

Bonus:
-----
If you have time you can implement the following:
* In order to start a conversation as a maker I want to reply to a peep from another maker.
And/Or:
* Work on the CSS to make it look good.
Good luck and let the chitter begin!

##Further Work
- Work on CSS and HTML for better user experience
- Amend so that once a user has signed up, they no longer have to enter their handle when they peep.
- Implement 'Harder' and 'Advanced' features.

- Also note that the database that stores users' data is not secure in any way.
- Ensure that the username and email address for each user are unique.

##Rackup setup
- Add config.ru for rackup

## Database Setup Instructions
Dev/Production Setup - Peeps Table
1 - Connect to psql
2 - Create the database using the psql command CREATE DATABASE chitter_peeps;
3 - Connect to the database using the pqsl command \c chitter_peeps;
4 - Run the query we have saved in the file 01_create_bookmarks_table.sql

Test Database Setup - Peeps table
1 - Connect to psql
2 - Create the database using the psql command CREATE DATABASE chitter_peeps_test;
3 - Connect to the database using the pqsl command \c chitter_peeps;
4 - Run the query we have saved in the file 01_create_bookmarks_table.sql

Repeat above steps for a chitter_users & chitter_users_test
