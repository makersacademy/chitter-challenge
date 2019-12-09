## How to use

### To set up the project

Clone this repository and then run:

```
bundle
```

### To set up the database

Connect to `psql` and create the `chitter_db` and `chitter_db_test` databases:

```
CREATE DATABASE chitter_db;
CREATE DATABASE chitter_db_test;
```

To set up the appropriate tables, connect to each databases in `psql` and run the SQL scripts in the `db/migrations` folder in the given order.

### To run the Chitter app:

```
rackup
```

To view the welcoming message, navigate to `localhost:9292`.


# User Story:

As a Maker
So that I can see my posts at once
I want to see a list of my peeps

As a Maker
So that I can let people know what I am doing  
I want to post a peep to chitter

As a Maker
So that I can add context to my existing message
I want to edit the peep in Chitter

As a Maker
So that I can remove an old message
I want to delete the peep in Chitter

As a Maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order

As a Maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made