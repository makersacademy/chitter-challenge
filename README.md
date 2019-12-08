```
bundle
```

### To set up the database

Connect to `psql` and create the `chitter_db` and `chitter_db_test` databases

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
So that I can let people know what I am doing  
I want to post a message (peep) to chitter