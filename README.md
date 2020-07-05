Chitter Challenge
=================

Database setup:

You will need a database called 'chitter' for live and 'chitter_test' for testing.

Run the following SQL on the databases to setup the tables.

```
CREATE TABLE peeps (id SERIAL PRIMARY KEY, message VARCHAR(240),created timestamp DEFAULT CURRENT_TIMESTAMP);
```

If you get login / password errors when you run rspec then you will need to edit the 'username' and 'password' in the DBWarapper class self.connect_to_db method located in dbwrapper.rb 
