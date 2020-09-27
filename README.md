# Chitter Challenge

The User stories:

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

HARDER

As a Maker
So that only I can post messages on Chitter as me
I want to log in to Chitter

As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter

```

## SETUP

Create a `chitter` and `chitter_test` db in psql.
`$ psql`

`$ CREATE DATABASE chitter`
`$ CREATE DATABASE chitter_test`

Connect the databases with the tables used by:
`$ \c chitter`
Copy and past contents of `./db/migrations/create_message_table.sql`
and `./db/migrations/create_create_user_table.sql`

The do the same for `chitter_test`

## Notes on functionality:

- You don't have to be logged in to see the peeps.
- Users sign up to chitter with their email, password, name and a username (e.g. samm@makersacademy.com, password123, Sam Morgan, sjmog).
- The username and email are unique.
- Peeps (posts to chitter) have the name of the maker and their user handle.
