Chitter challenge
=================
[![Screen-Shot-2019-02-03-at-22-14-23.png](https://i.postimg.cc/XJxFfxvC/Screen-Shot-2019-02-03-at-22-14-23.png)](https://postimg.cc/hzzfgLTD)

Introduction
-------
This repo is part of the Maker's week 4 weekend challenge to build a CRUD app that is a Twitter clone (loosely speaking) built over a weekend. 

**Technologies used**:

- Sinatra (MVC framework)
- PostgreSQL (database)
- HTML / CSS (view)

Database setup:
-------
- Connect to psql
- Create the database using the psql command `CREATE DATABASE chitter;`
- Connect to the database using the pqsl command `\c chitter;`
- Run the query saved in './db/migrations/create_chitter_table.sql' in order to set up the `peeps` and `users` tables


User Stories:
-------

I ran out of time, and was only able to complete the `STRAIGHT UP` and `HARDER` sections mentioned below. 

The `ADVANCED` challenge is a good instance of implementing the `Many <=> Many` relationship that I'd like to explore in future projects. 

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

