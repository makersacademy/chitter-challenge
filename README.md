A small Twitter clone that will allow the users to post messages to a public stream.

This program completes user story 1 below. User story 4 - registration is not completed. Other user stories have not been attempted.
- It uses a Model View Controller Database structure
- Tests are performed in a separate database
- Peep class allows create new and view all
- Creating a peep is wrapped in a method
- DatabaseConnection is extracted to a separate class

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

## How to set up database
- follow commands in db/migrations
- set up 'test' database using the same steps

## How to test in irb
require './lib/peep.rb'
require './db_connection_setup.rb'
require './lib/user.rb'

## To clear the peeps database in irb
connection = PG.connect(dbname: 'chitter')
connection.exec("TRUNCATE peeps;")
