Chitter Challenge
=================

# How to Use SQL Queries
To do:

- Implement the ability to log in/out and show the user handle for peeps.

- Implement one-to-many relationship between users and peeps databases.

- Error messages when users sign up/log in incorrectly.

- Fix test database issues where users are not deleted after tests.


1. Connect to ```psql```
2. Create the database using the ```psql``` command ```CREATE DATABASE chitter_manager;```
3. Connect to the database using the ```psql``` command ```\c chitter_manager;```
4. Run the query we have saved in the file ```create_peeps_table.sql```
5. Exit PSQL
6. Connect to ```psql```
7. Create the database using the ```psql``` command ```CREATE DATABASE chitter_manager_test;```
8. Connect to the database using the ```psql``` command ```\c chitter_manager_test;```
9. Run the query we have saved in the file ```create_peeps_table.sql```
10. Exit PSQL
11. Connect to ```psql```
12. Connect to the database using the ```psql``` command ```\c chitter_manager;```
13. Run the query on line 1 we have saved in the file ```create_users_table.sql```
14. Run the query on line 2 we have saved in the file ```create_users_table.sql```
15. Repeat steps 11-14 except at step 12, connect to the test database using the ```psql``` command ```\c chitter_manager_test;```


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



Notes on functionality:
------

* You don't have to be logged in to see the peeps.
* Makers sign up to chitter with their email, password, name and a username (e.g. samm@makersacademy.com, password123, Sam Morgan, sjmog).
* The username and email are unique.
* Peeps (posts to chitter) have the name of the maker and their user handle.
* Your README should indicate the technologies used, and give instructions on how to install and run the tests.

Bonus:
-----

If you have time you can implement the following:

* In order to start a conversation as a maker I want to reply to a peep from another maker.

And/Or:

* Work on the CSS to make it look good.

Good luck and let the chitter begin!
