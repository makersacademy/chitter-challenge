Chitter Challenge
=================

Features:
-------

```
STRAIGHT UP

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

ADVANCED

As a Maker
So that I can stay constantly tapped in to the shouty box of Chitter
I want to receive an email if I am tagged in a Peep
```


SETUP DATABASE
==============

1. Open psql on command line
2. Create the database for Chitter using this command - CREATE DATABASE chitter;
3. Connect to the Chitter database - \c chitter;
4. Run the query from the file 01_create_peeps_table.sql
5. Run the query from the file 02_add_username_to_peeps.sql

SETUP TEST DATABASE
===================

1. Open psql on command line
2. Create the database for Chitter using this command - CREATE DATABASE chitter_test;
3. Connect to the Chitter database - \c chitter_test;
4. Run the query from the file 01_create_peeps_table.sql
5. Run the query from the file 02_add_username_to_peeps.sql
