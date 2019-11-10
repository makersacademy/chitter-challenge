# Chitter Challenge
```
      _...._
    /       \
   /  o _ o
   (    \/  )
  )          (
(    -  -  -  )
(             )
 (            )
  [          ]
---/l\    /l\--------
  ----------------
     (  )
    ( __ _)
    
```
    
Twitter clone that allows posting of 'peeps' into a public timeline. Built using Sinatra and PostgreSQL.

## SETUP

This application uses a PostgreSQL database. Details on how to install can be found [here](https://www.postgresql.org/download/). Once installed run the following commands to set up the database:

```bash
$ psql

# create the database
$ CREATE DATABASE chitter

# connect to the database
$ \c chitter

# run the query saved in db/migrations/01_create_peeps_table.sql
# then 
# run the query saved in db/migrations/02_add_peep_time_to_peeps.sql
```

To run the tests a "test" database will need to be created using the same process as above but using ```$ CREATE DATABASE chitter_test```

**To install and run:**
```bash
$ git clone

$ bundle
```

## User stories covered

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

