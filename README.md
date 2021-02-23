# Chitter

Small Twitter clone that allows you to post messages to a public stream.

## How to Use

After cloning the repo, follow the steps below.

### Install dependencies

```sh
bundle
```

### Set up the database

1. Connect to `psql`
2. Create the database using the `psql` command `CREATE DATABASE chitter;`
3. Connect to the database using the `psql` command `\c chitter;`
4. Run the SQL queries saved in the `db/migrations` folder in the given order

### Set up the test database

1. Connect to `psql`
2. Create the database using the `psql` command `CREATE DATABASE chitter_test;`
3. Connect to the database using the `psql` command `\c chitter_test;`
4. Run the SQL queries saved in the `db/migrations` folder in the given order

### Run the app

```sh
bundle exec rackup -p 3000
```

To view peeps navigate to http://localhost:3000/peeps

### Run tests

```sh
bundle exec rspec
```

### Run linting

```sh
bundle exec rubocop
```

## Task

Build a small Twitter clone that will allow users to post messages to a public stream.

Makers Academy week 4 weekend challenge.

See full challenge instructions [here](https://github.com/makersacademy/chitter-challenge).

### Specifications

- Add new peeps
- Show a list of peeps
- Sign up feature
- Log in feature
- Log out feature
- Tag tweets
- Send email if tagged

### User Stories

```
As a user
So that I can let people know what I am doing
I want to post a message (peep) to Chitter

As a user
So that I can see what others are saying
I want to see all peeps in reverse chronological order

As a user
So that I can better appreciate the context of a peep
I want to see the time at which it was made

As a user
So that I can post messages on Chitter as me
I want to sign up for Chitter
```

Further user stories to implement:

```
As a user
So that only I can post messages on Chitter as me
I want to log in to Chitter

As a user
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter

As a user
So that I can stay constantly tapped in to the shouty box of Chitter
I want to receive an email if I am tagged in a peep
```

## Technologies Used

- Sinatra web framework
- PostgreSQL database management system
