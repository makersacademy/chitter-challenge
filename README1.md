## Chitter Challenge ##
Challenge to build a full stack 'chitter' app, for Makers' peeps :sunglasses:
### Getting started ###
`git clone git@github.com:Benjamaker/chitter-challenge.git`

Then run `bundle`
### Technologies used ###
- Ruby
- Sinatra
- PostgreSQL (relational database)
- Rspec
- Capybara

### To set up the databases ###

#### database ####
Connect to `psql` and create the `chitter` database:

```
CREATE DATABASE chitter;
```

#### Test database ####
Connect to `psql` and create the `chitter_test` database:

```
CREATE DATABASE chitter_test;
```

To set up the appropriate tables, connect to the datatbase in `psql` and run the SQL scripts in the `db/migrations` directory in the given folder.

### To run tests ###
`rspec` from the parent directory

### User Stories ###
```
As a Maker
So I can let people know what I'm doing
I want to post a message (peep) on chitter

```
```
As a Maker
```
