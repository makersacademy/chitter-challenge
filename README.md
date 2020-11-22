Chitter Challenge
=================

Makers Academy - Week 4 Weekend Challenge

The Project
-------

A small Twitter clone that will allow users to post messages to a public stream.

The app will have the following specification:

* Add new peeps
* Show a list of peeps
* Sign up feature
* Log in feature
* Log out feature
* Tag tweets
* Send email if tagged

User Stories:
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
-------

Integrating a database into Chitter using the `PG` gem and `SQL` queries.

To Set Up and Run the App:
-------

### To Set Up the Database:

1. Connect to `psql`
2. Create the database using the `psql` command `CREATE DATABASE chitter;`
3. Connect to the database using the `psql` command `\c chitter;`
4. Run the SQL queries saved in the `db/migrations` folder in the given order

### To Run the Chitter app:

```
rackup -p 3000
```
To view peeps navigate to 'localhost:3000/peeps'

### To Run Tests:

```
rspec
```

### To Run Linting:

```
rubocop
```