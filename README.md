```
bundle
```

### To set up the database

Connect to `psql` and create the `Chitter` database:

```
CREATE DATABASE Chitter;
```

To set up the appropriate tables, connect to the database in `psql` and run the SQL scripts in the `db/migrations` folder in the given order.

### To run the Chitter app:

```
rackup
```

To view the welcoming message, navigate to `localhost:9292`.


# User Story:

As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter