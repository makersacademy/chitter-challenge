User Stories:
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
```

Notes on functionality:
------

* You don't have to be logged in to see the peeps.
* The username and email are unique.
* Peeps (posts to chitter) have the name of the maker and their user handle.

How to set up the application:
------
```
$ Clone the repository

git clone https://github.com/tansaku/chitter_challenge

$ Install bundle

bundle

$ Use the Rakefile to setup the databases by using the following commands in the terminal.

rake setup
rake test_database_setup
rake migrate

$ Install rspec and run test suite.

rspec

$ Start the server up.

rackup

$ Navigate in your browser to the following webpage.

http://localhost:9292/
```

Resetting the databases
------

To reset the databases use the below commands:
```
$ Connect to psql by typing it into the terminal.

psql

$ Run the following commands in psql.

SELECT pg_terminate_backend(pg_stat_activity.pid) FROM pg_stat_activity WHERE pg_stat_activity.datname = 'chitter_challenge' AND pid <> pg_backend_pid();

SELECT pg_terminate_backend(pg_stat_activity.pid) FROM pg_stat_activity WHERE pg_stat_activity.datname = 'chitter_challenge_test' AND pid <> pg_backend_pid();

DROP DATABASE IF EXISTS chitter_challenge;
DROP DATABASE IF EXISTS chitter_challenge_test;


$ Quit out of psql back to the terminal.
\q


$ Use the Rakefile to create the databases again. Enter the following commands in the command line of the terminal.

rake setup
rake test_database_setup
```

