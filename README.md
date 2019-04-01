Instructions
=================

- Open terminal do `psql`
- `CREATE DATABASE chitter`
- `\c chitter`
- Run table setup `\i db/migrations/create_chitter.sql`

Repeat for test database `CREATE DATABASE chitter_test`

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

Technical Approach:
-----

CRC Diagram to help map the routes and database

![CRC Diagram](https://github.com/hybridbad/chitter-challenge/blob/master/images/crc.png?raw=true "CRC")