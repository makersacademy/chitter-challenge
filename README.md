Chitter Challenge
=================

This is a basic Twitter clone that will allow the users to post messages to a public stream.

User stories:
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

Domain Model & structures
-----

Here is a domain model for the first user story:

![Screenshot](https://i.imgur.com/09Ag5BV.png)

Here is the database structure plan for the first user story:

![Screenshot](https://i.imgur.com/J0yxklY.png)

To set up the bookmark manager database
-----

Connect to `psql` and create the `chitter` database:

```
CREATE DATABASE chitter;
```

To set up the appropriate tables, connect to the database in `psql` and run the SQL scripts in the `db/migrations` folder in the given order.

To set up the test database
-----

Connect to `psql` and create the `chitter_test` database:

```
CREATE DATABASE chitter_test;
```

To set up the appropriate tables, connect to the database in `psql` and run the SQL scripts in the `db/migrations` folder in the given order.

Viewing chitter
-----

To view the webpage, run `rackup` and navigate to `localhost:2929`.
