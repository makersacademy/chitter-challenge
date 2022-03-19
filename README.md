# #Chitter Challenge

## ##User Stories:

```
As a Maker
So that I can let people know what I am doing
I want to post a message (peep) to chitter
```

```
As a maker
So that I can see what others are saying
I want to see all peeps in reverse chronological order
```

```
As a Maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made
```

```
As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter
```

```
As a Maker
So that only I can post messages on Chitter as me
I want to log in to Chitter
```

```
As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter
```

## Domain Model

## How to use

### To set up the project

Clone this repository and then run:

```
bundle
```

### To set up the database

Connect to `psql` and create the `chitter` and `chitter_test` databases:

```
CREATE DATABASE chitter;
CREATE DATABASE chitter_test;
```

To set up the appropriate tables, connect to each database in `psql` and run the SQL scripts in the `db/migrations` folder in the given order.

### To run the Chitter app:

```
rackup
```

To view bookmarks, navigate to `localhost:9292/peeps`

### To run tests:

```
rspec
```

### To run linting:

```
rubocop
```

## Notes on functionality:

- You don't have to be logged in to see the peeps.
- Makers sign up to chitter with their email, password, name and a username (e.g. samm@makersacademy.com, password123, Sam Morgan, sjmog).
- The username and email are unique.
- Peeps (posts to chitter) have the name of the maker and their user handle.
- Your README should indicate the technologies used, and give instructions on how to install and run the tests.
