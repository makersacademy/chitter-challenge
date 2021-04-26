Chitter Challenge
=================

[description]


WIP README:

## User Stories
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

## Domain Model
'image'

## How to use
### To set up the project
```
git clone git@github.com:fwill22/chitter-challenge.git

bundle
```

### To set up the database

Connect to `psql` and create the `chitter` and `test_chitter` databases:

```
CREATE DATABASE chitter;
CREATE DATABASE test_chitter;
```

To set up the appropriate tables, connect to the database in `psql` and run the SQL scripts in the `db/migrations` folder in the given order.

### To run the Bookmark Manager app:

```
rackup
```
**or** 
```
ruby app.rb
```

To view peeps, navigate to `localhost:9292/peeps/timeline`

### To run tests:

```
rspec
```
### To run linting:
```
rubocop
```

### Routes
`localhost:9292/peeps/timeline`

`localhost:9292/peeps/new`

<!-- `localhost:9292/peeps/sign-up`

`localhost:9292/peeps/login` -->

## Technologies Used:
* PostgreSQL database
* Sinatra web framework
* RSpec/Capybara

## Goals
* I intend to continue working on this project to add CSS styling and complete the features from user stories 4 5 and 6. 
* Improve formatting of given time - add timestamp as a hover feature using CSS