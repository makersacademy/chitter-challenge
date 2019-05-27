<h2>**Chitter**</h2>

A small Twitter-like clone that allows users to post messages as 'peeps'

<h5>Features<h5>
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


Setting up a database:

* Connect to psql
* Create the database using the psql command CREATE DATABASE chit;
* Connect to the database using the pqsl command \c chit;
* Run the query saved in the file 01_create_peeps_table.sql
* Run the query saved in the file 02_add_timestamp.sql