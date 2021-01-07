Chitter Challenge
=================

## Task
-------

Writing a small Twitter clone that will allow users to post messages to a public stream.

Functionality:

* Users don't have to be logged in to see the peeps.
* Users sign up to chitter with their email, password, name and a username (e.g. yasminu@makersacademy.com, password123, Yasmin Underdown, yasminu).
* The username and email are unique.
* Peeps (posts to chitter) have the name of the maker and their user handle.

## User Stories
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

```

### To set up the databases

Connect to `psql` and create the `chitter` database:

```
CREATE DATABASE chitter;
```

To set up the appropriate tables, connect to the database in `psql` and run the SQL scripts in the `db/migrations` folder in the given order.

Connect to `psql` and create the `chitter_test` database:

```
CREATE DATABASE chitter_test;
```

To set up the appropriate tables, connect to the database in `psql` and run the SQL scripts in the `db/migrations` folder in the given order.

## Approach
-------
1. Wrote feature test for first user story.
2. Passed this test in simplest way using params.
3. Wrote unit test for Peep class to return messages.
4. Created model and database to pass unit test.
5. Wrote unit test for Peep class to create messages.
6. Passed test and linked Database + Model with Controller + Views to complete first user story.  
7. Created test database.
8. Adding timestamp column to peeps tables.
9. Wrote and passed feature and unit tests for reverse order viewing to complete second user story.
10. Wrote feature and unit tests for timestamp to be shown - intention to pass by wrapping database data in Peep class.
11. Third user story completed by passing these tests.
12. Created 'users' table within databases.
13. Wrote feature test for sign up process.
14. Completed views and controller parts to begin to pass feature test.
15. Wrote unit test for create and find methods in User class.
16. Passed feature and unit tests
17. Encrypt password in database using bcrypt
18. Created DatabaseConnection class to keep code DRY

## Further Improvements
-------

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


## Tech Stack
-------

Ruby<br>Sinatra<br>HTML<br>RSpec<br>Capybara<br>Postgres