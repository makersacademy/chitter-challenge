Chitter Challenge
=================

Features:
-------

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
```
How to peep:
-------
1. Clone this repository
2. `cd` into the cloned directory
3. Run `bundle` to install dependencies
4. Run `rackup`
5. Navigate to http://localhost:9292/ in your browser

Database setup:
-------
1. Connect to `psql`
2. Create the database using the `psql` command `CREATE DATABASE chitter;`
3. Connect to the database using the `pqsl` command `\c chitter;`
4. Run the query I have saved in the file `01_create_peeps_table.sql`
5. Run the query saved in `02_add_time_created.sql` to add the timestamp column to database

Testing database setup:
-------
1. Connect to `psql`
2. Create the database using the `psql` command `CREATE DATABASE chitter_test;`
3. Connect to the database using the `pqsl` command `\c chitter_test;`
4. Run the query I have saved in the file `01_create_peeps_table.sql`
5. Run the query saved in `02_add_time_created.sql` to add the timestamp column to database

Technologies used and notes on functionality:
-------
* The peep data is stored on a PostgreSQL database
* Using a Sinatra web framework 
* RSpec/Capybara feature testing
-------
* Did not manage to finish off fourth user story allowing a user to sign in - hit some tricky blockers which I hope to resolve
* Time is now displaying how I want it to look, extracted from the database

![webapp 1](https://github.com/kerrimcm/chitter-challenge/blob/master/images/Screenshot%202021-04-26%20at%2009.27.32.png)
![webapp 2]()
