Chitter Challenge
=================
[![Build Status](https://travis-ci.org/Danielandro/chitter-challenge.svg?branch=master)](https://travis-ci.org/Danielandro/chitter-challenge)

Makers week 4 challenge

Write a small Twitter clone that will allow the users to post messages to a public stream.

Instructions
------------

Fork the repo 

Run `bundle` to install dependencies

**Setup database:**
1. Connect to psql
2. Create the database using the psql command `CREATE DATABASE chitter;`
3. Connect to the database using the command `\c chitter;`
4. Run the query saved in `01_create_peep_table.sql`
5. Run query saved in `02_add_created_at_to_peeps.sql`

**Setup test database:**
1. Connect to psql
2. Create the database using the psql command `CREATE DATABASE chitter_test;`
3. Connect to the database using the command `\c chitter_test;`
4. Run the query saved in `01_create_peep_table.sql`
5. Run query saved in `02_add_created_at_to_peeps.sql`

Run `rackup` to start the app at `localhost:9292`

User Stories
------------
**DONE**
```
As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter

As a maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order

```

**TODO**
```
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

#### File Structure
``` 
html

├── Gemfile
├── README.md
├── lib
│    └──  peep.rb
├── app
│    ├── app.rb
│    │
│    └── views
│          └── peeps
│                ├── index.erb
│                │
|                └── new.erb
├── config.ru
│
└── spec    
    ├── features
    ├── units
    └── spec_helper.rb

```
This week you integrated a database into Bookmark Manager using the `PG` gem and `SQL` queries. You can continue to use this approach when building Chitter Challenge.

Progress + Challenges:
-----------------------
I have satisfied the first two user stories - adding new peeps & viewing them in reverse chroinological order. I started to implement the third user story, but realised I need to store the dates using the Ruby Date object rather than postgres's format.

Test coverage is good > 90%
Linting issues to be fixed so CI passes


* Decide if date should be created in database or model (probably in database - more flexibility)

* Fix linting issues (lines too long)

* Implement at least next two user stories

* Understand how to implement user authentication

* Add some styling (public directory)

Resources
----------
[Sinatra MVC File Structure](https://learn.co/lessons/sinatra-mvc-file-structure)

[PostgreSQL Data Types - TutorialsPoint](https://www.tutorialspoint.com/postgresql/postgresql_data_types.htm)

[PostgreSQL Date/Time Types](https://www.postgresql.org/docs/9.5/datatype-datetime.html)

[Automatic Time Stamps](https://x-team.com/blog/automatic-timestamps-with-postgresql/)
