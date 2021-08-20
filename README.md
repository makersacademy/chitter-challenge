Chitter Challenge
=================
A small Twitter clone that will allow the users to post messages to a public stream. 

Design
-------
* Peeps (posts to chitter) have the name of the maker and their user handle.

Features:
-------


To Do:
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
I want to sign up for Chitter (name, unq username, unq email, password)

As a Maker
So that only I can post messages on Chitter as me
I want to log in to Chitter

As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter

As a Maker
So that I can stay constantly tapped in to the shouty box of Chitter
I want to receive an email if I am tagged in a Peep
```

* Your README should indicate the technologies used, and give instructions on how to install and run the tests.

You can continue to use `PG` gem and `SQL` queries approach DB integration, or if you'd like more technical challenge now, try using an [Object Relational Mapper](https://en.wikipedia.org/wiki/Object-relational_mapping) as the database interface.
Some useful resources:
**Ruby Object Mapper**
- [ROM](https://rom-rb.org/)
**ActiveRecord**
- [ActiveRecord ORM](https://guides.rubyonrails.org/active_record_basics.html)
- [Sinatra & ActiveRecord setup](https://learn.co/lessons/sinatra-activerecord-setup)

Automated Tests:
-----
Opening a PR will trigger Travis CI to perform a build of your application and run your full suite of RSpec tests.
To pass, configure Travis' build process by adding the necessary steps for creating your database to the `.travis.yml` file.
- [Travis Basics](https://docs.travis-ci.com/user/tutorial/)
- [Travis - Setting up Databases](https://docs.travis-ci.com/user/database-setup/)

NTH:
-----
* In order to start a conversation as a maker I want to reply to a peep from another maker.
* Work on the CSS to make it look good.

Personal notes
-----
- user_fk is integer type, is that ok?

DB Setup
-----
CREATE DATABASE chitter;
\c chitter;
CREATE TABLE users (user_id SERIAL PRIMARY KEY, name VARCHAR(60) NOT NULL, username VARCHAR(60) NOT NULL, email VARCHAR(255) NOT NULL, password VARCHAR(60) NOT NULL);
CREATE TABLE peeps (peep_id SERIAL PRIMARY KEY, peep VARCHAR(280) NOT NULL, user_fk integer);

CREATE DATABASE chitter_test;
\c chitter_test;
CREATE TABLE users (user_id SERIAL PRIMARY KEY, name VARCHAR(60) NOT NULL, username VARCHAR(60) NOT NULL, email VARCHAR(255) NOT NULL, password VARCHAR(60) NOT NULL);
CREATE TABLE peeps (peep_id SERIAL PRIMARY KEY, peep VARCHAR(280) NOT NULL, user_fk integer);
