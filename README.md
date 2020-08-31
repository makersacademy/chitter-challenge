Chitter Challenge
=================

Twitter clone web application. Users are able to sign up for Chitter, log in and out of their account, post 'peeps', view a list of posted peeps and the time that they were posted at.

Tech Stack:
-----

* Ruby
* Sinatra
* PostgreSQL
* Capybara
* Rspec

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

As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter

As a Maker
So that only I can post messages on Chitter as me
I want to log in to Chitter

As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter

```

Demo:
------

![Chitter demo](https://user-images.githubusercontent.com/53195978/91759107-026eef80-ebc9-11ea-81d4-7ebc697f2267.gif)



How to run this app:
------

* Install gems by running bundle in the command line
* Connect to psql in the command line
* Create the database: CREATE DATABASE peeps;
* Connect to the database using the pqsl command: \c peeps;
* Run all the commands in the db/migrations folder in psql
* Run rackup -p 4567 in the command line and visit http://localhost:4567

Setting up the test database:
------

* Connect to psql in the command line
* Create the database: CREATE DATABASE peeps_test;
* Connect to the database using the pqsl command: \c peeps_test;
* Run all the commands in the db/migrations folder in psql

